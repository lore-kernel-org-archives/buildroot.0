From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 22:34:41 +0200
Subject: [Buildroot] [PATCH v2 3/4] pycompile: fix .pyc original source
 file paths
In-Reply-To: <20200908081026.4701-4-robin.jarry@6wind.com>
References: <20200908081026.4701-1-robin.jarry@6wind.com>
 <20200908081026.4701-4-robin.jarry@6wind.com>
Message-ID: <20200909203441.GR14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robin, All,

On 2020-09-08 10:10 +0200, Robin Jarry spake thusly:
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
> 
> Unfortunately, compileall cannot be forced to use the proper path. It
> was not written with cross-compilation usage in mind.
> 
> Rework the script to call py_compile.compile() with pertinent options:
> 
> - The script is now called with $(TARGET_DIR) as first argument. This is
>   the future runtime /.
> - All other (non-optional) arguments are folders in which all
>   "importable" .py files will be compiled to .pyc.
> - Using the $(TARGET_DIR), the future runtime path of each .py file is
>   computed and encoded into the compiled .pyc.
> 
> No need to change directory before running the script anymore.
> 
> The trickery used to handle error reporting was only applicable with
> compileall. Since we implement our own "compileall", error reporting
> becomes trivial.

Thanks very much for this extended commit log; good for me now.

However, I have now some more feedback to provide, now that I can more
clearly see the delta. ;-)

See below...

> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
> ---
>  package/python/python.mk     |   5 +-
>  package/python3/python3.mk   |   5 +-
>  support/scripts/pycompile.py | 122 ++++++++++++++++++++---------------
>  3 files changed, 76 insertions(+), 56 deletions(-)
> 
> diff --git a/package/python/python.mk b/package/python/python.mk
> index ccaaadd012a5..7000658330e8 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -260,10 +260,11 @@ endif
>  define PYTHON_CREATE_PYC_FILES
>  	$(PYTHON_FIX_TIME)
>  	PYTHONPATH="$(PYTHON_PATH)" \
> -	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
> +	$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
>  		$(TOPDIR)/support/scripts/pycompile.py \
>  		$(if $(BR2_REPRODUCIBLE),--force) \
> -		usr/lib/python$(PYTHON_VERSION_MAJOR)
> +		$(TARGET_DIR) \
> +		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
>  endef
>  
>  ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 31e7ca3d3af3..e8c200b2081e 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -277,10 +277,11 @@ endif
>  define PYTHON3_CREATE_PYC_FILES
>  	$(PYTHON3_FIX_TIME)
>  	PYTHONPATH="$(PYTHON3_PATH)" \
> -	cd $(TARGET_DIR) && $(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
> +	$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR) \
>  		$(TOPDIR)/support/scripts/pycompile.py \
>  		$(if $(BR2_REPRODUCIBLE),--force) \
> -		usr/lib/python$(PYTHON3_VERSION_MAJOR)
> +		$(TARGET_DIR) \
> +		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)

So, when I was trying this script manually, it failed to work:

    $ mkdir -p test-target/foo/bar
    $ cp target/usr/lib/python*/*.py test-target/foo/bar
    $ python support/scripts/pycompile.py $(pwd)/test-target /foo/bar
    pycompile.py: error: PATH: no such directory: '/foo/bar'

That's because the PATH args must be absolute *on the host*, they are
not relatve to TARGET. But this is not very clear from the help text:

    PATH        Folder located inside TARGET to scan and compile

See below for more on this...

>  endef
>  
>  ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PY_PYC),y)
> diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
> index b713fe19323c..c60d4e13f3b4 100644
> --- a/support/scripts/pycompile.py
> +++ b/support/scripts/pycompile.py
> @@ -1,75 +1,93 @@
>  #!/usr/bin/env python
>  
> -'''Wrapper for python2 and python3 around compileall to raise exception
> -when a python byte code generation failed.
> -
> -Inspired from:
> -   http://stackoverflow.com/questions/615632/how-to-detect-errors-from-compileall-compile-dir
> -'''
> +"""
> +Byte compile all .py files from a target dir and encode a proper source runtime
> +path into them.
> +"""
>  
>  from __future__ import print_function
>  
>  import argparse
> -import compileall
> +import importlib
> +import os
>  import py_compile
> +import re
> +import struct
>  import sys
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

I am not python expert, but I tend to be using '{}'.format(..), and
indeed, it seems that python considers the % formatting to be "old":

    https://docs.python.org/3/tutorial/inputoutput.html#old-string-formatting

Do you think you could switch to using str.format() ?

[--SNIP--]
>  def main():
>      parser = argparse.ArgumentParser(description=__doc__)
>      parser.add_argument("target", metavar="TARGET",
> -                        help="Directory to scan")
> +                        help="Path on the build host that will be / at runtime")
> +    parser.add_argument("dirs", metavar="PATH", nargs="+",
> +                        help="Folder located inside TARGET to scan and compile")
>      parser.add_argument("--force", action="store_true",
>                          help="Force compilation even if already compiled")


So, back to this TARGET and PATH arguments. I find it pretty confusing
the way they are described.

First, what TARGET used to be in the previous script is now something
else, so keeping the naming is confusing. Also, 'target/' is a buildroot
naming; I think we could get a better generic name: root

As for PATH, I find it strange that the metavar and variable do not
match.

    parser.add_argument('root', metavar='ROOT',
                        help='Path on the build machine that will be / at runtime')
    parser.add_argument('dirs', metavar='DIR',
                        help='Directory, relative to ROOT, to scan for py-files to compile')

So now, it should be possible to use as thus:

    python support/scripts/pycompile.py \
        $(TARGET_DIR) \
        usr/lib/python$(PYTHON_VERSION_MAJOR)

Or even (which I like better, because the DIR is absolute as seen at
runtime too):

    python support/scripts/pycompile.py \
        $(TARGET_DIR) \
        /usr/lib/python$(PYTHON_VERSION_MAJOR)

But of course, dealing with path concatenation with an intermediate path
that starts with a '/' is always tricky (I don't understand why upstream
went that route...).

    for d in args.dirs:
        abs = os.path.join(args.root, d[(1 if d[0] == '/' else 0):])

Thoughts?

Thanks for the good rework so far. :-)

Regards,
Yann E. MORIN.

>      args = parser.parse_args()
>  
> -    compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
> +    if not os.path.isdir(args.target):
> +        parser.error("TARGET: no such directory: %r" % args.target)
> +
> +    # only work with absolute paths
> +    args.target = os.path.abspath(args.target)
> +
> +    try:
> +        # Make sure that all scanned dirs do exist and that they are located
> +        # *inside* the target dir.
> +        for d in args.dirs:
> +            if not os.path.isdir(d):
> +                parser.error("PATH: no such directory: %r" % d)
> +            d = os.path.abspath(d)
> +            if ".." in os.path.relpath(d, args.target):
> +                parser.error("PATH: not inside TARGET dir: %r" % d)
> +            for parent, _, files in os.walk(d):
> +                for f in files:
> +                    compile_one(os.path.join(parent, f), args.target, args.force)
> +
> +    except Exception as e:
> +        print("error: %s" % e, file=sys.stderr)
> +        return 1
>  
>      return 0
>  
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
