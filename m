From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Sep 2020 23:26:10 +0200
Subject: [Buildroot] [PATCH] pycompile: fix .pyc original source file
 paths
In-Reply-To: <20200904112908.21686-1-julien.floret@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
Message-ID: <20200904212610.GP14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2020-09-04 13:29 +0200, Julien Floret spake thusly:
> When generating a .pyc file, the original .py source file path is
> encoded in it. It is used for various purposes: traceback generation,
> .pyc file comparison with its .py source, and code inspection.
> 
> By default, the source path used when invoking compileall is encoded in
> the .pyc file. Since we use paths relative to TARGET_DIR, we end up with
> paths that are only valid when relative to '/' encoded in the installed
> .pyc files on the target.
> 
> This breaks code inspection at runtime since the original source path
> will be invalid unless the code is executed from '/'.

Thanks for the good description of the problem, I think I mostly understood
it, so let me rephrase just in case:

  - we have e.g.: /path/to/Buildroot/output/target/usr/lib/python3.5/foo.py

  - when pre-compiled it generates foo.pyc, which contains a reference
    to 'usr/lib/python3.5/foo.py' verbatim.

Right? Or did I forget a leading '/' missing in the verbatim?

> Rework the script to call py_compile.compile() with pertinent options.

You did provide a good description of the problem, so you should not
stop there. It would have been even btter if you had also provided a
good explanations of how you are fixing it! ;-)

Do not just _describe_ the patch, _explain_ it. For example:

    The issues stems from the fact that py_compile.compile() will default
    to store the path as we pass it, so we override that by explicitly
    passing the path at it is on the target.

    We can't do that with compileall.compile_dir(), so instead we
    do the recursion and call py_compile.compile() on fitting files
    ourselves.

(this is a mostly made up explanations; adapt or rewrite appropriately)

Also, see some comments in-line below.

> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
[--SNIP--]
> diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
> index 9192a7016a78..bfb82eac2750 100644
> --- a/support/scripts/pycompile.py
> +++ b/support/scripts/pycompile.py
> @@ -9,61 +9,45 @@ Inspired from:
>  from __future__ import print_function
>  import sys
>  import py_compile
> -import compileall
>  import argparse
> +import os
> +import re
>  
>  
> -def check_for_errors(comparison):
> -    '''Wrap comparison operator with code checking for PyCompileError.
> -    If PyCompileError was raised, re-raise it again to abort execution,
> -    otherwise perform comparison as expected.
> -    '''
> -    def operator(self, other):
> -        exc_type, value, traceback = sys.exc_info()
> -        if exc_type is not None and issubclass(exc_type,
> -                                               py_compile.PyCompileError):
> -            print("Cannot compile %s" % value.file)
> -            raise value
> -
> -        return comparison(self, other)
> -
> -    return operator
> +def is_importable_py_file(fpath):
> +    if not fpath.endswith('.py'):
> +        return False
> +    if not (fpath.startswith('/usr/lib') or fpath.startswith('/usr/share')):

Actually, some people are building out of /usr/share/buildroot for
example, so this would effectively ignore all .py files that were
installed, and none would be compiled.

However, you know that the CWD is $(TARGET_DIR) because that's were we
cd into before running the script. So maybe you want to change this
condition to (to be tested):

    if not fpath.startswith(os.getcwd()):
        return False

> +        return False
> +    return re.match(r'^[_A-Za-z][_A-Za-z0-9]+\.py$', os.path.basename(fpath))
>  
>  
> -class ReportProblem(int):
> -    '''Class that pretends to be an int() object but implements all of its
> -    comparison operators such that it'd detect being called in
> -    PyCompileError handling context and abort execution
> -    '''
> -    VALUE = 1

You should also explain why you get rid of the ReportProblem class, and
all the error handling that is currently in place.

> +def main():

I like that you introduce a main(), thanks! :-)

However, this is mixing code-style reformatting and actual code fixups,
which makes it a bit more difficult to analyse and review.

Could you please split it into two patches;

  - code cleanups to introduce main()

  - code fixups to properly store the .py path

Otherwise, I think this looks nice, thanks!

Regards,
Yann E. MORIN.

> +    parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
> +    parser.add_argument("target", metavar='DIRECTORY',
> +                        help='Directory to scan')
>  
> -    def __new__(cls, *args, **kwargs):
> -        return int.__new__(cls, ReportProblem.VALUE, **kwargs)
> +    args = parser.parse_args()
>  
> -    @check_for_errors
> -    def __lt__(self, other):
> -        return ReportProblem.VALUE < other
> +    try:
>  
> -    @check_for_errors
> -    def __eq__(self, other):
> -        return ReportProblem.VALUE == other
> +        for root, _, files in os.walk(args.target):
> +            for f in files:
> +                f = os.path.join(root, f)
> +                if os.path.islink(f) or os.access(f, os.X_OK):
> +                    continue
> +                target = os.path.join('/', os.path.relpath(f, args.target))
> +                if not is_importable_py_file(target):
> +                    continue
>  
> -    def __ge__(self, other):
> -        return not self < other
> +                py_compile.compile(f, cfile=f + 'c', dfile=target, doraise=True)
>  
> -    def __gt__(self, other):
> -        return not self < other and not self == other
> +    except Exception as e:
> +        print('error: %s' % e, file=sys.stderr)
> +        return 1
>  
> -    def __ne__(self, other):
> -        return not self == other
> +    return 0
>  
>  
> -parser = argparse.ArgumentParser(description='Compile Python source files in a directory tree.')
> -parser.add_argument("target", metavar='DIRECTORY',
> -                    help='Directory to scan')
> -parser.add_argument("--force", action='store_true',
> -                    help="Force compilation even if alread compiled")
> -
> -args = parser.parse_args()
> -
> -compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
> +if __name__ == '__main__':
> +    sys.exit(main())
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
