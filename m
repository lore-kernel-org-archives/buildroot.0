From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 07:58:07 +0200
Subject: [Buildroot] [git commit] check-package: prepare to extend to other
 directories
Message-ID: <20180401060117.6BFDC81560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7b4bbfc14b9dbea7906b4ddedb80119da8377c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the script only checks files inside the package/ directory.
Upcoming patches will enable it for other directories.

In order to reliably test for file names, i.e. the Config.in in the base
directory, normalize the path of files to check to a relative path to
the base directory.

Rename the variable that holds the compiled regexp to better represent
its content and rearrange how it is declared to make easy to later add
new directories to check. As a consequence the files that declare
package infra types would not be ignored anymore, so create a new
variable to list the files intree to be ignored during the check. The
same variable will be used by upcoming patches to ignore other files.
Ignore pkg-*.mk and doc-asciidoc.mk since they are package infra files.

In order to not produce weird results when used for files outside the
tree (i.e. in a private br2-external) add an explicit command line
option (-b) that bypasses any checks that would make a file be ignored
by the path that contains it.
When in this out-of-tree mode, the user is responsible for providing a
list of files to check that do not contain files the script does not
understand, e.g. package infra files.

As a result of this patch, besides the known use:
$ ./utils/check-package package/new-package/*
someone with the utils/ directory in the path can now also run:
$ cd package/new-package/
$ check-package *
or
$ check-package -b /path/to/br2-ext-tree/package/staging-package/*

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/check-package | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index a87a74decc..d2457c706c 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -4,6 +4,7 @@
 from __future__ import print_function
 import argparse
 import inspect
+import os
 import re
 import sys
 
@@ -24,6 +25,9 @@ def parse_args():
     parser.add_argument("files", metavar="F", type=str, nargs="*",
                         help="list of files")
 
+    parser.add_argument("--br2-external", "-b", dest='intree_only', action="store_false",
+                        help="do not apply the pathname filters used for intree files")
+
     parser.add_argument("--manual-url", action="store",
                         default="http://nightly.buildroot.org/",
                         help="default: %(default)s")
@@ -41,12 +45,21 @@ def parse_args():
 
 
 CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
-FILE_IS_FROM_A_PACKAGE = re.compile("package/[^/]*/")
+DO_CHECK_INTREE = re.compile("|".join([
+    "package/",
+    ]))
+DO_NOT_CHECK_INTREE = re.compile("|".join([
+    "package/doc-asciidoc\.mk$",
+    "package/pkg-\S*\.mk$",
+    ]))
 
 
 def get_lib_from_filename(fname):
-    if FILE_IS_FROM_A_PACKAGE.search(fname) is None:
-        return None
+    if flags.intree_only:
+        if DO_CHECK_INTREE.match(fname) is None:
+            return None
+        if DO_NOT_CHECK_INTREE.match(fname):
+            return None
     if CONFIG_IN_FILENAME.search(fname):
         return checkpackagelib.lib_config
     if fname.endswith(".hash"):
@@ -117,7 +130,16 @@ def __main__():
     global flags
     flags = parse_args()
 
-    if len(flags.files) == 0:
+    if flags.intree_only:
+        # change all paths received to be relative to the base dir
+        base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
+        files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in flags.files]
+        # move current dir so the script find the files
+        os.chdir(base_dir)
+    else:
+        files_to_check = flags.files
+
+    if len(files_to_check) == 0:
         print("No files to check style")
         sys.exit(1)
 
@@ -125,7 +147,7 @@ def __main__():
     total_warnings = 0
     total_lines = 0
 
-    for fname in flags.files:
+    for fname in files_to_check:
         nwarnings, nlines = check_file_using_lib(fname)
         total_warnings += nwarnings
         total_lines += nlines
