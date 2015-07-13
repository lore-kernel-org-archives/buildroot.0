From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 13 Jul 2015 12:54:27 +0200
Subject: [Buildroot] [PATCH v4 1/4] support/scripts: add fix_rpaths
Message-ID: <1436784870-17417-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This pyhton script leverages patchelf program to fix the RPATH of binaries.

It offers 2 actions:
- clear the RPATH;
- set the RPATH using relative paths between every single binary and the
  libraries directories.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v3->v4:
- fix typos and license (Baruch)

changes v2->v3:
- no change
---
 support/scripts/fix_rpaths | 298 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 298 insertions(+)
 create mode 100755 support/scripts/fix_rpaths

diff --git a/support/scripts/fix_rpaths b/support/scripts/fix_rpaths
new file mode 100755
index 0000000..cec9a58
--- /dev/null
+++ b/support/scripts/fix_rpaths
@@ -0,0 +1,298 @@
+#!/usr/bin/env python
+##
+## Author(s):
+##  - Samuel Martin <s.martin49@gmail.com>
+##
+## Copyright (C) 2013 Samuel Martin
+##
+## This program is free software; you can redistribute it and/or modify
+## it under the terms of the GNU General Public License as published by
+## the Free Software Foundation; either version 2 of the License, or
+## (at your option) any later version.
+##
+## This program is distributed in the hope that it will be useful,
+## but WITHOUT ANY WARRANTY; without even the implied warranty of
+## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+## GNU General Public License for more details.
+##
+""" This script scans a direcotry for ELF files and fix their RPATH, making
+them relative.
+"""
+
+from __future__ import print_function, with_statement
+import os
+import stat
+import subprocess
+import sys
+
+PATCHELF_PROGRAM = "patchelf"
+
+
+# pylint: disable=too-few-public-methods
+class PreservedTime(object):
+    """ With-class ensuring the file's times are preserved
+
+    :param path: File path
+    """
+    # pylint: disable=redefined-outer-name
+    def __init__(self, path):
+        self.path = path
+        self.times = None
+
+    # pylint: disable=invalid-name
+    def __enter__(self):
+        st = os.lstat(self.path)
+        self.times = (st.st_atime, st.st_mtime)
+        return self.path
+
+    # pylint: disable=redefined-builtin
+    def __exit__(self, type, value, traceback):
+        os.utime(self.path, self.times)
+
+
+# pylint: disable=redefined-outer-name
+def is_elf_binary(path):
+    """ Return True if path points to a valid ELF file.
+
+    :param path: File path
+    """
+    if not stat.S_ISREG(os.lstat(path).st_mode):
+        return False
+    with PreservedTime(path):
+        # pylint: disable=invalid-name
+        with open(path, "rb") as fp:
+            data = fp.read(4)
+    return data == b"\x7fELF"
+
+
+def has_rpath(elf_file, patchelf_bin=PATCHELF_PROGRAM):
+    """ Return True if the given ELF file accept a RPATH.
+
+    :param elf_file: ELF file path
+    :param patchelf_bin: patchelf program path
+    """
+    cmd = [patchelf_bin, "--print-rpath", elf_file]
+    with PreservedTime(elf_file):
+        try:
+            subprocess.check_call(cmd, stdout=subprocess.PIPE,
+                                  stderr=subprocess.PIPE)
+            elf_with_rpath = True
+        except subprocess.CalledProcessError as _:
+            elf_with_rpath = False
+    return elf_with_rpath
+
+
+def compute_rpath(binary, libdirs):
+    """ Return the RPATH value (with relative paths to the given libdirs).
+
+    :param binary: ELF binary path
+    :param libdirs: List of library directory paths
+    """
+    bindir = os.path.dirname(binary)
+    relpaths = [os.path.relpath(libdir, bindir) for libdir in libdirs]
+    # reduce the list, but keep its original order
+    # pylint: disable=unnecessary-lambda
+    sorted(set(relpaths), key=lambda x: relpaths.index(x))
+    rpaths = [os.path.join("$ORIGIN", relpath) for relpath in relpaths]
+    rpath = ":".join(rpaths)
+    return rpath
+
+
+def fix_rpath(elf_file, rpath, patchelf_bin=PATCHELF_PROGRAM):
+    """ Fix the ELF file RPATH.
+
+    :param elf_file: ELF file patch
+    :param rpath: New RPATH value
+    :param patchelf_bin: patchelf program path
+    """
+    cmd = [patchelf_bin, "--set-rpath", rpath, elf_file]
+    with PreservedTime(elf_file):
+        subprocess.check_call(cmd, stdout=subprocess.PIPE,
+                              stderr=subprocess.PIPE)
+
+
+def shrink_rpath(elf_file, patchelf_bin=PATCHELF_PROGRAM):
+    """ Shrink the ELF file's RPATH.
+
+    :param elf_file: ELF file patch
+    :param patchelf_bin: patchelf program path
+    """
+    cmd = [patchelf_bin, "--shrink-rpath", elf_file]
+    with PreservedTime(elf_file):
+        subprocess.check_call(cmd, stdout=subprocess.PIPE,
+                              stderr=subprocess.PIPE)
+    print("RPATH cleared: %s" % elf_file)
+
+
+def dump_rpath(elf_file, patchelf_bin=PATCHELF_PROGRAM):
+    """ Return the ELF file's RPATH.
+
+    :param elf_file: ELF file patch
+    :param patchelf_bin: patchelf program path
+    """
+    cmd = [patchelf_bin, "--print-rpath", elf_file]
+    with PreservedTime(elf_file):
+        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE,
+                                stderr=subprocess.PIPE)
+        proc.wait()
+        rpath = proc.communicate()[0].strip()
+    if sys.version_info.major >= 3:
+        def _decode(txt):
+            """ Decode function """
+            return txt.decode()
+    else:
+        def _decode(txt):
+            """ Decode function """
+            return txt
+    return _decode(rpath)
+
+
+def update_rpath(elf_file, libdirs, patchelf_bin=PATCHELF_PROGRAM):
+    """ Return the ELF file's RPATH.
+
+    :param elf_file: ELF file patch
+    :param libdirs: List of library directory paths
+    :param patchelf_bin: patchelf program path
+    """
+    rpath = compute_rpath(elf_file, libdirs)
+    fix_rpath(elf_file, rpath, patchelf_bin=patchelf_bin)
+    print("RPATH set: %s \tRPATH='%s'" % (elf_file,
+                                          dump_rpath(elf_file, patchelf_bin)))
+
+
+def find_files(root, file_filter_func=None, exclude_dirs=None):
+    """ Generator returning files from the root location.
+
+    :param root: Root path to be scan
+    :param file_filter_func: Filter function returning a boolean whether the
+                             file path should be yielded or not
+    :param exclude_dirs: List of directories to be prune from the scan
+    """
+    def dummy_filter(_):
+        """ Dummy filter function. Always return True.
+        """
+        return True
+    if not file_filter_func:
+        file_filter_func = dummy_filter
+    for parent, dirs, files in os.walk(root):
+        for xdir in exclude_dirs:
+            if xdir in dirs:
+                del dirs[dirs.index(xdir)]
+                continue
+            for idx, a_dir in enumerate(dirs):
+                if os.path.join(parent, a_dir).endswith(xdir):
+                    del dirs[idx]
+                    continue
+        for a_file in files:
+            full_path = os.path.join(parent, a_file)
+            if not file_filter_func(full_path):
+                continue
+            yield full_path
+
+
+def scan_and_apply(root, rpath_func, exclude_dirs=None,
+                   patchelf_bin=PATCHELF_PROGRAM):
+    """ Scan and update RPATH on ELF files under the root location.
+
+    The new RPATH value is computed from the binaries's and the libraries
+    directories.
+
+    :param root: Root path to be scan
+    :param libdirs: List of library directory paths
+    :param patchelf_bin: patchelf program path
+    """
+    def file_filter(path):
+        """ Return True if the path points to a valid ELF file accepting RPATH.
+        """
+        # check for valid file (discard non-ELF files and broken symlinks)
+        if not is_elf_binary(path):
+            return False
+        return has_rpath(path)
+    exclude_dirs = exclude_dirs if exclude_dirs else list()
+    for filepath in find_files(root, file_filter_func=file_filter,
+                               exclude_dirs=exclude_dirs):
+        rpath_func(filepath, patchelf_bin=patchelf_bin)
+
+
+def main():
+    """ Main function
+    """
+    import argparse
+    parser = argparse.ArgumentParser(description="""\
+            Update the RPATH in all ELF files in ROOT.
+
+            It can perform 2 types of actions on the ELF files, preserving
+            their times:
+            1) 'set' the RPATH, with relative paths between ELF files and
+              the library directories;
+            2) or 'clear' the RPATH.
+
+            """)
+    parser.add_argument("action", choices=["set", "clear"],
+                        help="""\
+            Action processed on RPATH.
+            'set' updates the RPATH with relative path between each binary and
+                library directories passed via the required --libdirs option.
+            'clear' empties the RPATH of the binaries
+            """)
+    parser.add_argument("rootdir", metavar="ROOT",
+                        help="Root path to scan for RPATH fixup")
+    parser.add_argument("--libdirs", nargs="+", default=list(),
+                        help="""\
+            List of library directory paths (must be sub-location of ROOT)""")
+    parser.add_argument("--exclude-dirs", nargs="+", default=list(),
+                        help="List of directories skipped for RPATH update")
+    parser.add_argument("--patchelf-program", dest="patchelf_bin",
+                        default=PATCHELF_PROGRAM,
+                        help="Path to patchelf program to be used")
+    args = parser.parse_args()
+    # sanitizing arguments
+    action = args.action
+    root = os.path.abspath(args.rootdir)
+    libdirs = [os.path.abspath(l) for l in args.libdirs if os.path.isdir(l)]
+    exclude_dirs = [x for x in args.exclude_dirs]
+    patchelf_bin = os.path.abspath(args.patchelf_bin)
+    # sanity checks
+    if action == "set" and not libdirs:
+        msg = "\nERROR: Setting RPATH requires non-empty --libdirs option\n\n"
+        msg += parser.format_help()
+        raise Exception(msg)
+    if not os.path.exists(root):
+        msg = "\nERROR: ROOT must be an existing path.\n"
+        msg += "\troot: %s\n\n" % root
+        msg += parser.format_help()
+        raise Exception(msg)
+    for libdir in libdirs:
+        if not libdir.startswith(root):
+            msg = "\nERROR: each libdirs must be under the root location.\n"
+            msg += "\troot: %s\n" % root
+            msg += "\tfaulty libdir: %s\n\n" % libdir
+            msg += parser.format_help()
+            raise Exception(msg)
+    if not os.path.exists(patchelf_bin):
+        patchelf_found = False
+        for path in os.environ.get("PATH", "").split(":"):
+            if not path:
+                continue
+            if PATCHELF_PROGRAM in os.listdir(path):
+                patchelf_found = True
+                break
+        if not patchelf_found:
+            msg = "\nERROR: no '%s' program found on the host system.\n\n" % \
+                    PATCHELF_PROGRAM
+            msg += parser.format_help()
+            raise Exception(msg)
+    if args.action == "set":
+        def set_rpath(elf_file, patchelf_bin=PATCHELF_PROGRAM):
+            """ Set RPATH
+            """
+            return update_rpath(elf_file, libdirs, patchelf_bin=patchelf_bin)
+        action = set_rpath
+    elif args.action == "clear":
+        action = shrink_rpath
+    scan_and_apply(root, action, exclude_dirs=exclude_dirs,
+                   patchelf_bin=args.patchelf_bin)
+
+
+if __name__ == "__main__":
+    main()
-- 
2.4.5
