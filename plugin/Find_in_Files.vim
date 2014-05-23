" Last Change: 2014-05-23  Friday: 12:03:38 PM
" -----------------------Implementation of a simple feature
" -----------------------"Find in Files and Directories"
" -----------------------like Notepad++ -----------------
" -----------------------Created & Edited by Pinaki Sekhar Gupta <appugupta007@gmail.com>------------------------
" -----------------------Licence: No licence is better than everything-------------------------------------------



:menu Edit.Find\ in\ Files  :<Esc>:<Esc>:call Find_in_Files() <Cr>

function Find_in_Files()

" -----------------------raw method-----------------
" :vimgrep /GNU/ C:\CodeBlocks\TDM-GCC-64\include\*.txt
" :cw
" --------------------------------------------------

	let what2find = inputdialog("search term", "", "cancel pressed")
	let	directory	= browsedir("Browse the directory","")
	let filetype = inputdialog("filetype", "", "cancel pressed")
	let forwardslash = "/"
	let space = " "

	if has("win32") || has("win16") || has("win64")
	" ==========  MS Windows  ===========
	    let wildcard = "\\*."
	elseif has("macunix") || has("unix") || has("mac") || has("os2") || has("beos")
	" ==========  Linux/OS-X/Unix  ===========
	  	let wildcard = "\/*."
	endif

    if what2find != "" && what2find != "cancel pressed" && directory !=  "" && filetype !=  ""

                    "          port to test whether the nested strings are working or not
                    " http://vim.1045645.n5.nabble.com/How-can-I-pass-user-input-value-to-vimgrep-td5721661.html
                    " :echom "Hello, " . "world"
                    " Hello, world " http://learnvimscriptthehardway.stevelosh.com/chapters/26.html
                    " echo forwardslash . what2find . forwardslash . space . directory . wildcard . filetype

        :execute "vimgrep /" . what2find . forwardslash . space . fnameescape(directory) . wildcard . filetype
        :cw

    else
        " process if user press okay
        if what2find != "cancel pressed" && directory !=  "cancel pressed" && filetype !=  "cancel pressed"

            :execute "vimgrep /" . what2find . forwardslash . space . fnameescape(directory) . wildcard . filetype
            :cw

        endif
    endif
endfunction


