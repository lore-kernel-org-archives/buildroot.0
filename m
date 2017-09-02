From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 02 Sep 2017 13:13:51 -0000
Subject: [Buildroot] [git commit] get-developers: add option to get
	developers for files
Message-ID: <20170902130618.0DE8F818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=009ae96c6f6c4ab18b120d3923583efaea29cfba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DEVELOPERS file lists file patterns, but the get-developers script
only supports getting packages and CPU architectures. Some files are
neither of those, e.g. defconfigs, support files, package infras, ...

Add a '-f' option that allows to give a list of files for which to get
the developer(s).

Note that the DEVELOPERS file contains directories as well as files,
and the directories are not expanded into individual files. Therefore,
we have to use f.startswith(devfile) to match a directory. This assumes
that the directory name ends with /, otherwise 'package/python' would
also match 'package/python-foo'. Since we make sure that directories do
end with / in the DEVELOPERS file, and since false positives are not
much of an issue in this case, this isn't a problem.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/get-developers | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/utils/get-developers b/utils/get-developers
index fa6fc2f..6a028b4 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -3,6 +3,7 @@
 import argparse
 import getdeveloperlib
 import sys
+import os
 
 def parse_args():
     parser = argparse.ArgumentParser()
@@ -12,6 +13,8 @@ def parse_args():
                         help='find developers in charge of this architecture')
     parser.add_argument('-p', dest='package', action='store',
                         help='find developers in charge of this package')
+    parser.add_argument('-f', dest='files', nargs='*',
+                        help='find developers in charge of these files')
     parser.add_argument('-c', dest='check', action='store_const',
                         const=True, help='list files not handled by any developer')
     return parser.parse_args()
@@ -28,6 +31,8 @@ def __main__():
         action += 1
     if args.package is not None:
         action += 1
+    if args.files:
+        action += 1
     if args.check:
         action += 1
     if len(args.patches) != 0:
@@ -59,6 +64,16 @@ def __main__():
                 print(dev.name)
         return
 
+    # Handle the files action
+    if args.files is not None:
+        args.files = [os.path.abspath(f) for f in args.files]
+        for dev in devs:
+            for devfile in dev.files:
+                commonfiles = [f for f in args.files if f.startswith(devfile)]
+                if commonfiles:
+                    print(dev.name)
+                    break
+
     # Handle the patches action
     if len(args.patches) != 0:
         (files, infras) = getdeveloperlib.analyze_patches(args.patches)
