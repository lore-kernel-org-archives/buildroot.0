From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Feb 2018 23:03:42 +0100
Subject: [Buildroot] [PATCH next 2/5] support/scripts/pkg-stats-new: add -n
 and -p options
In-Reply-To: <20180215220345.8532-1-thomas.petazzoni@bootlin.com>
References: <20180215220345.8532-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180215220345.8532-3-thomas.petazzoni@bootlin.com>
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
 support/scripts/pkg-stats-new | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats-new b/support/scripts/pkg-stats-new
index a5e056a948..d018e1fed4 100755
--- a/support/scripts/pkg-stats-new
+++ b/support/scripts/pkg-stats-new
@@ -31,7 +31,7 @@ class Package:
 # npackages: limit to N packages
 # package_list: limit to those packages in this list
 #
-def get_pkglist():
+def get_pkglist(npackages, package_list):
     WALK_USEFUL_SUBDIRS = ["boot", "linux", "package", "toolchain"]
     WALK_EXCLUDES = [ "boot/common.mk",
                       "linux/linux-ext-.*.mk",
@@ -53,6 +53,7 @@ def get_pkglist():
                       "toolchain/helpers.mk",
                       "toolchain/toolchain-wrapper.mk" ]
     packages = dict()
+    count = 0
     for root, dirs, files in os.walk("."):
         rootdir = root.split("/")
         if len(rootdir) < 2:
@@ -64,6 +65,8 @@ def get_pkglist():
                 continue
             # Strip ending ".mk"
             pkgname = f[:-3]
+            if package_list and pkgname not in package_list:
+                continue
             pkgpath = os.path.join(root, f)
             skip = False
             for exclude in WALK_EXCLUDES:
@@ -76,6 +79,9 @@ def get_pkglist():
             p = Package(pkgname)
             p.path = pkgpath
             packages[pkgname] = p
+            count += 1
+            if npackages and count == npackages:
+                return packages
     return packages
 
 INFRA_RE = re.compile("\$\(eval \$\(([a-z-]*)-package\)\)")
@@ -400,12 +406,23 @@ def parse_args():
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
