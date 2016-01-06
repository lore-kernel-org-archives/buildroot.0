From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Jan 2016 18:35:41 +0100
Subject: [Buildroot] [v5,1/5] support/scripts: add fix_rpaths
In-Reply-To: <568D4C3E.9060903@codethink.co.uk>
References: <1436824511-1601-1-git-send-email-s.martin49@gmail.com>
 <568D4C3E.9060903@codethink.co.uk>
Message-ID: <20160106173541.GB3613@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

On 2016-01-06 17:17 +0000, Sam Thursfield spake thusly:
> Thanks for this patch series, I'm trying it out at the moment.

Be aware that Samuel has been reworking this series quite intensively,
and what you tested may have changed since the original submission.

I guess Samuel will send an updated series when it is ready, but this is
a tricky topic, which needs quite an attentive eye to the details...

Regards,
Yann E. MORIN.

> If it works I will be very happy, as I've implement an artifact caching
> mechanism that uses Buildroot build results, and of course hardcoded paths
> in the host tools are causing things to break! I'm hopeful that relative
> rpaths will solve all my problems :-)
> 
> I had a few problems in the fix_rpaths script, I think it's because I didn't
> have patchelf installed system-wide. Fixes described below:
> 
> On 13/07/15 22:55, Samuel Martin wrote:
> >---
> >  support/scripts/fix_rpaths | 338 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 338 insertions(+)
> >  create mode 100755 support/scripts/fix_rpaths
> >
> >diff --git a/support/scripts/fix_rpaths b/support/scripts/fix_rpaths
> >new file mode 100755
> >index 0000000..86f0d53
> ...
> >+def sanitize_rpath(elf_file, matcher, patchelf_bin=PATCHELF_BIN, verbose=False):
> >+    """ Remove all paths matching patterns in the ELF file's RPATH.
> >+
> >+    :param elf_file: ELF file patch
> >+    :param matcher: Regex objects matching the paths to be removed
> >+    :param patchelf_bin: patchelf program path
> >+    """
> >+    rpath = dump_rpath(elf_file, patchelf_bin=PATCHELF_BIN)
> 
> This should be:
> 
>     rpath = dump_rpath(elf_file, patchelf_bin=patchelf_bin)
> 
> Otherwise it breaks when patchelf is not available in PATH.
> 
> >+    rpath = [path for path in rpath.split(":") if not matcher.match(path)]
> >+    if rpath:
> >+        set_rpath(elf_file, ":".join(rpath), patchelf_bin=patchelf_bin,
> >+                verbose=verbose)
> >+    else:
> >+        clear_rpath(elf_file, patchelf_bin=patchelf_bin, verbose=verbose)
> >+
> 
> ...
> 
> >+def scan_and_apply(root, rpath_func, exclude_dirs=None,
> >+                   patchelf_bin=PATCHELF_BIN, verbose=False):
> >+    """ Scan and update RPATH on ELF files under the root location.
> >+
> >+    The new RPATH value is computed from the binaries's and the libraries
> >+    directories.
> >+
> >+    :param root: Root path to be scan
> >+    :param libdirs: List of library directory paths
> >+    :param patchelf_bin: patchelf program path
> >+    """
> >+    def file_filter(path):
> >+        """ Return True if the path points to a valid ELF file accepting RPATH.
> >+        """
> >+        # check for valid file (discard non-ELF files and broken symlinks)
> >+        if not is_elf_binary(path):
> >+            return False
> >+        return has_rpath(path)
> 
> This needs to pass on the value of patchelf_bin, otherwise it will break
> when patchelf is not available in PATH.
> 
>         return has_rpath(path, patchelf_bin=patchelf_bin)
> 
> >+    exclude_dirs = exclude_dirs if exclude_dirs else list()
> >+    for filepath in find_files(root, file_filter_func=file_filter,
> >+                               exclude_dirs=exclude_dirs):
> >+        rpath_func(filepath, patchelf_bin=patchelf_bin, verbose=verbose)
> >+
> >+
> >+def main():
> >+    """ Main function
> >+    """
> >+    import argparse
> >+    parser = argparse.ArgumentParser(description="""\
> >+            Update the RPATH in all ELF files in ROOT.
> >+
> >+            It can perform 3 types of actions on the ELF files, preserving
> >+            their times:
> >+            1) 'set' the RPATH, with relative paths between ELF files and
> >+              the library directories;
> >+            2) or 'sanitize' the RPATH by removing any path matching some
> >+              given patterns;
> >+            3) or 'clear' the RPATH.
> >+
> >+            """)
> >+    parser.add_argument("action", choices=["set", "clear", "sanitize"],
> >+                        help="""\
> >+            Action processed on RPATH.
> >+            'set' updates the RPATH with relative path between each binary and
> >+                library directories passed via the required --libdirs option.
> >+            'sanitize' strips path matching patterns passed via the required
> >+                --patterns option.
> >+            'clear' empties the RPATH of the binaries.
> >+            """)
> >+    parser.add_argument("rootdir", metavar="ROOT",
> >+                        help="Root path to scan for RPATH fixup")
> >+    parser.add_argument("--libdirs", nargs="+", default=list(),
> >+                        help="""\
> >+            List of library directory paths (must be sub-location of ROOT)""")
> >+    parser.add_argument("--patterns", nargs="+", default=list(),
> >+                        help="""\
> >+            List of path patterns to be remove from RPATH""")
> >+    parser.add_argument("--exclude-dirs", nargs="+", default=list(),
> >+                        help="List of directories skipped for RPATH update")
> >+    parser.add_argument("--patchelf-program", dest="patchelf_bin",
> >+                        default=PATCHELF_BIN,
> >+                        help="Path to patchelf program to be used")
> >+    parser.add_argument("-v", "--verbose", action="store_true", default=False,
> >+                        help="Turn on verbose outputs")
> >+    args = parser.parse_args()
> >+    # sanitizing arguments
> >+    action = args.action
> >+    root = os.path.abspath(args.rootdir)
> >+    libdirs = [os.path.abspath(l) for l in args.libdirs if os.path.isdir(l)]
> >+    patterns = [x for x in args.patterns]
> >+    exclude_dirs = [x for x in args.exclude_dirs]
> >+    patchelf_bin = os.path.abspath(args.patchelf_bin)
> >+    # sanity checks
> >+    if action == "set" and not libdirs:
> >+        msg = "\nERROR: Setting RPATH requires non-empty --libdirs option\n\n"
> >+        msg += parser.format_help()
> >+        raise Exception(msg)
> >+    if action == "sanitize" and not patterns:
> >+        msg = "\nERROR: Sanitizing RPATH requires non-empty --patterns option\n\n"
> >+        msg += parser.format_help()
> >+        raise Exception(msg)
> >+    if not os.path.exists(root):
> >+        msg = "\nERROR: ROOT must be an existing path.\n"
> >+        msg += "\troot: %s\n\n" % root
> >+        msg += parser.format_help()
> >+        raise Exception(msg)
> >+    for libdir in libdirs:
> >+        if not libdir.startswith(root):
> >+            msg = "\nERROR: each libdirs must be under the root location.\n"
> >+            msg += "\troot: %s\n" % root
> >+            msg += "\tfaulty libdir: %s\n\n" % libdir
> >+            msg += parser.format_help()
> >+            raise Exception(msg)
> >+    if not os.path.exists(patchelf_bin):
> >+        patchelf_found = False
> >+        for path in os.environ.get("PATH", "").split(":"):
> >+            if not path:
> >+                continue
> >+            if PATCHELF_BIN in os.listdir(path):
> 
> This can abort with an exception if there is a directory in PATH that isn't
> a readable directory.
> 
> Better to write it as:
> 
>               if not path or not os.path.isdir(path):
>                   continue
>               if PATCHELF_BIN in os.listdir(path):
> 
> 
> -- 
> Sam Thursfield, Codethink Ltd.
> Office telephone: +44 161 236 5575
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
