" Language:    Swift<https://developer.apple.com/swift/>
" Maintainer:  toyama satoshi <toyamarinyon@gmail.com>
" URL:         http://github.com/toyamarinyon/vim-swift
" License:     GPL

" Bail if our syntax is already loaded.
if exists('b:current_syntax') && b:current_syntax == 'swift'
  finish
endif

" {{{ Whitespace and Comments
syntax region swiftComment start=#\/\*# end=#\*\/#
syntax match swiftComment /\/\/.*/
highlight link swiftComment Comment
" }}}

" {{{ Identifiers
syntax match swiftIdentifer /[a-zA-Z_][a-zA-Z_0-9]*/
highlight link swiftIdentifer Identifier
" }}}

" {{{ Keywords
" Keywords used in declarations:
syntax keyword swiftDeclarationKeywords class deinit enum extension func import init let protocol static struct subscript typealias var
highlight link swiftDeclarationKeywords Keyword
" Keywords used in statements:
syntax keyword swiftStatementKeywords break case continue default do else fallthrough if in for return switch where while
highlight link swiftStatementKeywords Keyword
" Keywords used in expressions and types:
syntax keyword swiftExpressionTypeKeywords as dynamicType is new super self Self Type __COLUMN__ __FILE__ __FUNCTION__ __LINE__
highlight link swiftExpressionTypeKeywords Keyword
" Keywords reserved in particular contexts:
syntax keyword swiftReserveKeywords associativity didSet get infix inout left mutating none nonmutating operator override postfix precedence prefix right set unowned unowned(safe) unowned(unsafe) weak willSet
highlight link swiftReserveKeywords Keyword
" }}}

" {{{ Literals
" Integer literal
syntax match swiftIntegerLiteral /\<\d\+\%(_\d\+\)*\%(\.\d\+\%(_\d\+\)*\)\=\>/
syntax match swiftIntegerLiteral /\<\d\+\%(_\d\+\)*\%(\.\d\+\%(_\d\+\)*\)\=\%([eE][-+]\=\d\+\%(_\d\+\)*\)\>/
syntax match swiftIntegerLiteral /\<0x\x\+\%(_\x\+\)*\>/
syntax match swiftIntegerLiteral /\<0o\o\+\%(_\o\+\)*\>/
syntax match swiftIntegerLiteral /\<0b[01]\+\%(_[01]\+\)*\>/
highlight link swiftIntegerLiteral Number
" String literal
syntax region swiftStringLiteral start=/"/ skip=/\\"/ end=/"/
highlight link swiftStringLiteral String
" }}}

" {{{ Operators
syntax keyword swiftOperatorKeywords / = - + ! * % < > & \| ^ ~ .
highlight link swiftOperatorKeywords Operator
" }}}

" {{{ Type
syntax match swiftTypeIdentifier /[a-zA-Z_][a-zA-Z_0-9\.]*/ contained
syntax match swiftType /: .*/ contains=swiftTypeIdentifier
highlight link swiftType Operator
highlight link swiftTypeIdentifier Type
" }}}

if !exists('b:current_syntax')
  let b:current_syntax = 'swift'
endif
