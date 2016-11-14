From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 14 Nov 2016 14:22:33 +0100
Subject: [Buildroot] [PATCH 1/6] check-shlibs-deps: new script to check
	shared library dependencies
In-Reply-To: <20161114132238.6569-1-jezz@sysmic.org>
References: <20161114132238.6569-1-jezz@sysmic.org>
Message-ID: <20161114132238.6569-2-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a script that show or check binary dependencies based on linked shared
libraries.

To do that, it scan NEEDED entries in ELF header and get corresponding package
from packages-file-list.txt.

It have 3 modes:

    check-shlibs-deps -b OUTDIR
        Scan $TARGET_DIR and display found dependencies for all ELF files

    check-shlibs-deps -b OUTDIR -p PACKAGE
        Display found dependencies for PACKAGE

    check-shlibs-deps -b OUTDIR -p PACKAGE -d DEP1,DEP2,...
        Display missing dependencies for PACKAGE

Unfortunately, `packages-file-list.txt' is not properly filled when Top Level
Parallelization is enabled. Therefore, check-shlibs-deps does not (yet) work
with it.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 support/scripts/check-shlibs-deps | 172 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100755 support/scripts/check-shlibs-deps

diff --git a/support/scripts/check-shlibs-deps b/support/scripts/check-shlibs-deps
new file mode 100755
index 0000000..5ce024c
--- /dev/null
+++ b/support/scripts/check-shlibs-deps
@@ -0,0 +1,172 @@
+#!/usr/bin/env python
+
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+# Copyright (C) 2016 by Jerome Pouiller <jerome.pouiller@sysmic.org>
+# Inspired from size-stats and check-host-rpath scripts
+
+import os
+import re
+import subprocess
+import argparse
+
+ignored_deps = [ "unknown", "glibc", "uclibc", "musl" ]
+
+# Add an entry in dictionnaries pkgsdict and filesdict
+def add_file(pkgsdict, filesdict, abspath, pkg):
+    if not os.path.exists(abspath):
+        return
+    #if abspath in filesdict and filesdict[abspath] != pkg:
+    #    print("WARNING: %s is owned by %s, but overwritten by %s" %
+    #       (abspath, filesdict[abspath], pkg))
+    filesdict[abspath] = pkg
+    if not pkg in pkgsdict:
+        pkgsdict[pkg] = set()
+    pkgsdict[pkg].add(abspath)
+
+# Build dictionnaries from "build/packages-file-list.txt"
+def build_dicts(builddir):
+    pkgsdict = {}
+    filesdict = {}
+    with open(os.path.join(builddir, "build", "packages-file-list.txt")) as filelistf:
+        for line in filelistf.readlines():
+            pkg, fpath = line.split(",", 1)
+            fpath = fpath.strip()
+            fpath = os.path.join(builddir, "target", fpath)
+            fpath = os.path.normpath(os.path.relpath(fpath))
+            add_file(pkgsdict, filesdict, fpath, pkg)
+    return filesdict, pkgsdict
+
+# Return package associated to a file
+def get_package(filesdict, fpath):
+    if not fpath in filesdict:
+        #print("WARNING: %s is not part of any package" % fpath)
+        # Do not flood user with warning messages. Especially host-gcc-final
+        # does not declare its files and produce many warnings.
+        filesdict[fpath] = "unknown"
+    return filesdict[fpath]
+
+# Return list of libraries linked with a binary
+def get_shared_libs(builddir, binary):
+    libs = set()
+    # Host readelf seems able to read foreign binaries (tested with arm/glibc and arm/uclibc)
+    pipe = subprocess.Popen([ "readelf", "-d", binary ], stdout=subprocess.PIPE)
+    for line in pipe.stdout:
+        match = re.match("^.* \(NEEDED\) .*Shared library: \[(.+)\]$", line)
+        if match:
+            libname = match.group(1)
+            # Support case where "/lib" s a symlink to "/usr/lib"
+            lpaths = set()
+            for dir in [ "usr/lib", "lib" ]:
+                lpaths.add(os.path.relpath(os.path.realpath(os.path.join(builddir, "target", dir, libname))))
+            found = 0
+            for file in lpaths:
+                if os.path.exists(file):
+                    found += 1
+                    libs.add(file)
+            #if found == 0:
+            #    # FIXME: Also take into account RPATH in order to find missed libraries
+            #    print("WARNING: %s depends on %s but it was not found on filesystem" % (binary, libname))
+            if found > 1:
+                print("BUG: %s depends on %s but it was found multiple time on filesystem" % (binary, libname))
+    return libs
+
+# Return a list a dependencies for a list of ELF files
+def build_package_deps(builddir, filesdict, bins):
+    pkgdeps = { }
+    for binary in bins:
+        shlibs = get_shared_libs(builddir, binary)
+        for sh in shlibs:
+            pkg = get_package(filesdict, binary)
+            if not pkg in pkgdeps:
+                pkgdeps[pkg] = set()
+            dep = get_package(filesdict, sh)
+            if not dep in ignored_deps and dep != pkg:
+                pkgdeps[pkg].add(dep)
+    return pkgdeps
+
+# Filter ELF files from a list of files
+def filter_elf(builddir, files):
+    bins = set()
+    pipe = subprocess.Popen([ "file" ] + list(files), stdout=subprocess.PIPE)
+    for line in pipe.stdout:
+        match = re.match("^([^:]+): +ELF ", line)
+        if match:
+            bins.add(match.group(1));
+    return bins
+
+# Return files found in "target/"
+def build_file_list(builddir):
+    files = set()
+    for dirpath, _, filelist in os.walk(os.path.join(builddir, "target")):
+        for f in filelist:
+            file = os.path.join(dirpath, f)
+            file = os.path.relpath(os.path.realpath(file))
+            if not os.path.islink(file):
+                files.add(file)
+    return files
+
+def main(builddir, package, deps):
+    filesdict, pkgsdict = build_dicts(builddir)
+    if package and not package in pkgsdict:
+        print("'%s' is an unkown package" % package)
+        exit(0)
+
+    if package:
+        file_list = pkgsdict[package]
+    else:
+        file_list = build_file_list(builddir)
+    # print("List of files to check:\n  %s" % "\n  ".join(sorted(file_list)))
+    bins = filter_elf(builddir, file_list)
+    # print("List of binaries to check:\n  %s" % "\n  ".join(sorted(bins)))
+    pkgdeps = build_package_deps(builddir, filesdict, sorted(bins))
+    error = 0
+    for p, pdeps in sorted(pkgdeps.items()):
+        if not deps == None:
+            for d in pdeps:
+                if not d in sorted(deps):
+                    print("%s: missed dependency to %s" % (p, d))
+                    error += 1
+        else:
+            print("%s: %s" % (p, " ".join(sorted(pdeps))))
+    return error
+
+
+parser = argparse.ArgumentParser(description='Show or check binary dependencies based on linked shared libraries')
+
+parser.add_argument("--builddir", '-b', metavar="BUILDDIR", required=True,
+        help="Buildroot output directory")
+parser.add_argument("--package", '-p', metavar="PACKAGE",
+        help="Check only PACKAGE (else, show dpendencies of all binairies)")
+parser.add_argument("--deps", '-d', metavar="DEP1,DEP2,...", nargs='?', default="",
+        help="Report errors if found dependencies are not a subset of '--deps'. '-p' is mandatory with this option")
+parser.add_argument('-w', action='store_true',
+        help="Do not return non zero when dependency is missing")
+args = parser.parse_args()
+if not args.package and args.deps:
+    print("ERROR: cannot use --deps wihout --package")
+    exit(1)
+
+if args.deps == "":
+    deps = None
+elif args.deps == None:
+    deps = []
+else:
+    deps = args.deps.split(",")
+
+ret = main(args.builddir, args.package, deps)
+if not args.w:
+    exit(ret)
+exit(0)
-- 
2.9.3
