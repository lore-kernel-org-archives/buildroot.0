From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Sep 2020 23:15:43 +0200
Subject: [Buildroot] [PATCH v4 1/2] support/scripts/pycompile: fix .pyc
 original source file paths
In-Reply-To: <20200910083252.7102-2-robin.jarry@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200910083252.7102-1-robin.jarry@6wind.com>
 <20200910083252.7102-2-robin.jarry@6wind.com>
Message-ID: <20200911211543.GB10548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robin, All,

On 2020-09-10 10:32 +0200, Robin Jarry spake thusly:
> When generating a .pyc file, the original .py source file path is
> encoded in it. It is used for various purposes: traceback generation,
> .pyc file comparison with its .py source, and code inspection.
[--SNIP--]
> +if sys.version_info < (3, 4):
> +    import imp  # import here to avoid deprecation warning when >=3.4
> +    PYC_HEADER_ARGS = (imp.get_magic(),)
> +else:
> +    import importlib
> +    PYC_HEADER_ARGS = (importlib.util.MAGIC_NUMBER,)
> +if sys.version_info < (3, 7):
> +    PYC_HEADER_LEN = 8
> +    PYC_HEADER_FMT = "<4sl"
> +else:
> +    PYC_HEADER_LEN = 12
> +    PYC_HEADER_FMT = "<4sll"
> +    PYC_HEADER_ARGS += (0,)  # zero hash, we use timestamp invalidation

This...

> +def compile_one(host_path, strip_root=None, force=False):
[--SNIP--]
> +    if not force:
> +        # inspired from compileall.compile_file in the standard library
> +        try:
> +            with open(host_path + "c", "rb") as f:
> +                header = f.read(PYC_HEADER_LEN)
> +            header_args = PYC_HEADER_ARGS + (int(os.stat(host_path).st_mtime),)
> +            expect = struct.pack(PYC_HEADER_FMT, *header_args)
> +            if header == expect:
> +                return  # .pyc file already up to date.
> +        except OSError:
> +            pass  # .pyc file does not exist

... and this is scary to me... :-(

I understand the reasoning: no need to re-compile a file that was
already compiled and has not changed. This is an understandable
optimisation, and one that was already present in the previous script.

Still, having to poke into the internals sounds a bit too invasive to
me, especially as those internals are version-specific (as your
coditional code demonstrates).

Can't we instead use ctime or mtime to detect whether a file needs
updating?

Alternatively, how much time do we actually shave off the build with
this optimisation? I've done a simple build with this defconfig:

    BR2_arm=y
    BR2_cortex_a7=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_INIT_NONE=y
    BR2_SYSTEM_BIN_SH_NONE=y
    # BR2_PACKAGE_BUSYBOX is not set
    BR2_PACKAGE_PYTHON3=y
    # BR2_PACKAGE_PYTHON3_UNICODEDATA is not set

That is, basically, only python3 and its dependencies are built.
I also applied this little patch on top of this one:

    diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
    index 04193f4a02..f563eff027 100644
    --- a/support/scripts/pycompile.py
    +++ b/support/scripts/pycompile.py
    @@ -14,6 +14,7 @@ import py_compile
     import re
     import struct
     import sys
    +import time
     
     
     if sys.version_info < (3, 4):
    @@ -100,12 +101,14 @@ def main():
     
         try:
             for d in args.dirs:
    +            t0 = time.time()
                 if args.strip_root and ".." in os.path.relpath(d, args.strip_root):
                     parser.error("DIR: not inside ROOT dir: {!r}".format(d))
                 for parent, _, files in os.walk(d):
                     for f in files:
                         compile_one(os.path.join(parent, f), args.strip_root,
                                     args.force)
    +            print('Duration {} {}'.format(time.time()-t0, d))
     
         except Exception as e:
             print("error: {}".format(e))

The build takes 3min 40s, and the pre-compilation takes less than a
second. Of course, adding more python module will only increase the
pre-compile duration.

I think the duration gain is negligible, while the intricacies of the
code to detect whether pre-compilation should occur is probably too much
of a burden, maintenance-wise.

So, it is my opinion we should rop this.

Of course, no need to reend for now: I'd like the opinion from the other
maitnainers,, and maybe we can leave the topic open for others to review
as well. Also, if we decide to drop it, I can do that pretty easily when
applying...

Thanks for the itetrations on this series! :-)

Regards,
Yann E. MORIN.

> +    if strip_root is not None:
> +        # determine the runtime path of the file (i.e.: relative path to root
> +        # dir prepended with "/").
> +        runtime_path = os.path.join("/", os.path.relpath(host_path, strip_root))
> +    else:
> +        runtime_path = host_path
> +
> +    # will raise an error if the file cannot be compiled
> +    py_compile.compile(host_path, cfile=host_path + "c",
> +                       dfile=runtime_path, doraise=True)
> +
> +
> +def existing_dir_abs(arg):
> +    """
> +    argparse type callback that checks that argument is a directory and returns
> +    its absolute path.
> +    """
> +    if not os.path.isdir(arg):
> +        raise argparse.ArgumentTypeError('no such directory: {!r}'.format(arg))
> +    return os.path.abspath(arg)
>  
>  
>  def main():
>      parser = argparse.ArgumentParser(description=__doc__)
> -    parser.add_argument("target", metavar="TARGET",
> -                        help="Directory to scan")
> +    parser.add_argument("dirs", metavar="DIR", nargs="+", type=existing_dir_abs,
> +                        help="Directory to recursively scan and compile")
> +    parser.add_argument("--strip-root", metavar="ROOT", type=existing_dir_abs,
> +                        help="""
> +                        Prefix to remove from the original source paths encoded
> +                        in compiled files
> +                        """)
>      parser.add_argument("--force", action="store_true",
>                          help="Force compilation even if already compiled")
>  
>      args = parser.parse_args()
>  
> -    compileall.compile_dir(args.target, force=args.force, quiet=ReportProblem())
> +    try:
> +        for d in args.dirs:
> +            if args.strip_root and ".." in os.path.relpath(d, args.strip_root):
> +                parser.error("DIR: not inside ROOT dir: {!r}".format(d))
> +            for parent, _, files in os.walk(d):
> +                for f in files:
> +                    compile_one(os.path.join(parent, f), args.strip_root,
> +                                args.force)
> +
> +    except Exception as e:
> +        print("error: {}".format(e))
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
