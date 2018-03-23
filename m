From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 21:54:52 +0100
Subject: [Buildroot] [PATCH v3 2/5] support/scripts/pkg-stats-new: add -n
 and -p options
In-Reply-To: <20180323205455.24789-1-thomas.petazzoni@bootlin.com>
References: <20180323205455.24789-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180323205455.24789-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds the following options to the pkg-stats-new script:

 -n, to specify a number of packages to parse instead of all packages

 -p, to specify a list of packages (comma-separated) to parse instead
     of all packages

These options are basically only useful when debugging/developing
this script, but they are very useful, because the script is rather
slow to run completely with all 2000+ packages, especially once
upstream versions will be fetched from release-monitoring.org.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes since v2:
- Indicate in help text that the list of packages is
  comma-separated. Comment from Ricardo.
- Fix typo in commit log. Comment from Ricardo.
- Added Reviewed-by from Ricardo.

Changes since v1:
- Fix flake8 warnings
---
 support/scripts/pkg-stats-new | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
index 955d3ce990..5dc70f1671 100755
--- a/support/scripts/pkg-stats-new
+++ b/support/scripts/pkg-stats-new
@@ -23,6 +23,7 @@ import os
 from collections import defaultdict
 import re
 import subprocess
+import sys
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
 
@@ -116,11 +117,14 @@ class Package:
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
@@ -143,6 +147,7 @@ def get_pkglist():
                      "toolchain/helpers.mk",
                      "toolchain/toolchain-wrapper.mk"]
     packages = list()
+    count = 0
     for root, dirs, files in os.walk("."):
         rootdir = root.split("/")
         if len(rootdir) < 2:
@@ -154,6 +159,8 @@ def get_pkglist():
                 continue
             # Strip ending ".mk"
             pkgname = f[:-3]
+            if package_list and pkgname not in package_list:
+                continue
             pkgpath = os.path.join(root, f)
             skip = False
             for exclude in WALK_EXCLUDES:
@@ -165,6 +172,9 @@ def get_pkglist():
                 continue
             p = Package(pkgname, pkgpath)
             packages.append(p)
+            count += 1
+            if npackages and count == npackages:
+                return packages
     return packages
 
 
@@ -434,13 +444,24 @@ def parse_args():
     parser = argparse.ArgumentParser()
     parser.add_argument('-o', dest='output', action='store', required=True,
                         help='HTML output file')
+    parser.add_argument('-n', dest='npackages', type=int, action='store',
+                        help='Number of packages')
+    parser.add_argument('-p', dest='packages', action='store',
+                        help='List of packages (comma separated)')
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
     print "Getting package make info ..."
     package_init_make_info()
     print "Getting package details ..."
-- 
2.14.3
