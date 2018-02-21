From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 23:13:39 +0100
Subject: [Buildroot] [PATCH next v2 2/5] support/scripts/pkg-stats-new: add
 -n and -p options
In-Reply-To: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
References: <20180221221342.15683-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180221221342.15683-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds the following options to the pkg-stats-new script:

 -n, to specify a number of packages to parse instead of all packages

 -p, to specify a list of packages (comma-separated) to parse instead
     of all packages

These options are basically only useful when debugging/developping
this script, but they are very useful, because the script is rather
slow to run completely with all 2000+ packages, especially once
upstream versions will be fetched from release-monitoring.org.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes since v1:
- Fix flake8 warnings
---
 support/scripts/pkg-stats-new | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
index 8c74ff2a37..85a6caeeb9 100755
--- a/support/scripts/pkg-stats-new
+++ b/support/scripts/pkg-stats-new
@@ -23,6 +23,7 @@ import os
 from collections import defaultdict
 import re
 import subprocess
+import sys
 
 
 class Package:
@@ -47,11 +48,14 @@ class Package:
             (self.name, self.path, self.has_license, self.has_license_files, self.has_hash, self.patch_count)
 
 
-def get_pkglist():
+def get_pkglist(npackages, package_list):
     """
     Builds the list of Buildroot packages, returning a list of Package
     objects. Only the .name and .path fields of the Package object are
     initialized.
+
+    npackages: limit to N packages
+    package_list: limit to those packages in this list
     """
     WALK_USEFUL_SUBDIRS = ["boot", "linux", "package", "toolchain"]
     WALK_EXCLUDES = ["boot/common.mk",
@@ -74,6 +78,7 @@ def get_pkglist():
                      "toolchain/helpers.mk",
                      "toolchain/toolchain-wrapper.mk"]
     packages = list()
+    count = 0
     for root, dirs, files in os.walk("."):
         rootdir = root.split("/")
         if len(rootdir) < 2:
@@ -85,6 +90,8 @@ def get_pkglist():
                 continue
             # Strip ending ".mk"
             pkgname = f[:-3]
+            if package_list and pkgname not in package_list:
+                continue
             pkgpath = os.path.join(root, f)
             skip = False
             for exclude in WALK_EXCLUDES:
@@ -96,6 +103,9 @@ def get_pkglist():
                 continue
             p = Package(pkgname, pkgpath)
             packages.append(p)
+            count += 1
+            if npackages and count == npackages:
+                return packages
     return packages
 
 
@@ -452,13 +462,24 @@ def parse_args():
     parser = argparse.ArgumentParser()
     parser.add_argument('-o', dest='output', action='store', required=True,
                         help='HTML output file')
+    parser.add_argument('-n', dest='npackages', type=int, action='store',
+                        help='Number of packages')
+    parser.add_argument('-p', dest='packages', action='store',
+                        help='List of packages')
     return parser.parse_args()
 
 
 def __main__():
     args = parse_args()
+    if args.npackages and args.packages:
+        print "ERROR: -n and -p are mutually exclusive"
+        sys.exit(1)
+    if args.packages:
+        package_list = args.packages.split(",")
+    else:
+        package_list = None
     print "Build package list ..."
-    packages = get_pkglist()
+    packages = get_pkglist(args.npackages, package_list)
     print "Get package infra ..."
     add_infra_info(packages)
     print "Get make info ..."
-- 
2.14.3
