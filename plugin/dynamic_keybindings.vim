" 定义全局快捷键表（初始静态定义）
let g:custom_keybindings = [
\   {'keys': 'Nerdtree <Leader>n', 'desc': 'Move the focus to nerdtree window'},
\   {'keys': 'Nerdtree <C-n>', 'desc': 'Open or reload the nerdtree window'},
\   {'keys': 'Nerdtree <C-t>', 'desc': 'Toggle the nerdtree window'},
\   {'keys': 'Nerdtree <C-j>', 'desc': 'Jump the current opening file in the nerdtree window'},
\   {'keys': 'Tagbar nmap <F1>', 'desc': 'Jump the current opening file in the nerdtree window'},
\   {'keys': '<C-F>', 'desc': 'Search the content in current project'},
\   {'keys': '<C-H>', 'desc': 'Search the content in current project and display another 3 line/title/filename'},
\   {'keys': '<Leaderf>a', 'desc': 'Search the content in all .h and .cpp files'},
\   {'keys': '<Leaderf>sa', 'desc': 'Search all files with ag command'},
\   {'keys': '<Leaderf>fu', 'desc': 'Search the function in current cursor'},
\   {'keys': '<Leaderf>fr', 'desc': 'Search the function reference in gtags'},
\   {'keys': '<Leaderf>fd', 'desc': 'Search the function define in gtags'},
\   {'keys': '<Leaderf>fn', 'desc': 'display the next search'},
\   {'keys': '<Leaderf>fp', 'desc': 'display the previous the search'},
\   {'keys': '<Leaderf>be', 'desc': 'normal open to show all files'},
\   {'keys': '<Leaderf>bt', 'desc': 'toggle open / close to show all files'},
\   {'keys': '<Leaderf>bs', 'desc': 'force horizontal split open to show all files'},
\   {'keys': '<Leaderf>bv', 'desc': ' force vertical split open to show all files'},
\   {'keys': '<ALT-up>', 'desc': 'res-1'},
\   {'keys': '<ALT-down>', 'desc': 'res+1'},
\   {'keys': '<ALT-left>', 'desc': 'vertical resize-1'},
\   {'keys': '<ALT-right>', 'desc': 'vertical resize+1'},
\   {'keys': '<C-s>', 'desc': 'Save current file'},
\   {'keys': '<Leader>q', 'desc': 'Quit Vim'},
\]

" 显示快捷键函数
function! ShowKeybindings() abort
    " 打开新窗口显示快捷键
    new
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal nobuflisted
    call setline(1, 'Custom Keybindings:')
    call append(1, repeat('-', 30))

    " 遍历快捷键表并显示
    for binding in g:custom_keybindings
        call append('$', printf('%-15s : %s', binding.keys, binding.desc))
    endfor

    " 设置只读，防止误操作
    setlocal readonly

    " 在当前窗口绑定 ESC 键关闭窗口
    nnoremap <buffer> <ESC> :close<CR>
endfunction

" 动态添加快捷键函数
function! AddKeybinding(keys, desc) abort
    " 添加到全局快捷键表
    call add(g:custom_keybindings, {'keys': a:keys, 'desc': a:desc})

    " 创建快捷键映射
    execute 'nnoremap ' . a:keys . ' :echo "Command for '.a:keys.'"<CR>'

    " 提示添加成功
    echo 'Added keybinding: ' . a:keys . ' -> ' . a:desc
endfunction

" 定义命令 :ShowKeys 显示快捷键
command! ShowKeys call ShowKeybindings()

" 定义命令 :AddKey <keys> <desc>
command! -nargs=+ AddKey call AddKeybinding(<f-args>)

" 定义快捷键绑定到 :ShowKeys
nnoremap <Leader>sk :ShowKeys<CR>

