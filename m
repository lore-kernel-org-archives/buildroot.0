From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  3 Jan 2015 15:29:13 +0100
Subject: [Buildroot] [V2 2/2] graph-depends: add an option --stop-on-virtual
In-Reply-To: <1420295353-8065-1-git-send-email-francois.perrad@gadz.org>
References: <1420295353-8065-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1420295353-8065-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/common-usage.txt  |  3 +++
 support/scripts/graph-depends | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 89cd9fe..966c694 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -215,6 +215,9 @@ The +graph-depends+ behaviour can be controlled by setting options in the
   root package (+R+), the target packages (+T+) and the host packages
   (+H+). Defaults to: +lightblue,grey,gainsboro+
 
+* +--stop-on-virtual+, +--dont-stop-on-virtual+, to follow (or not)
+  the dependencies of virtual package
+
 --------------------------------
 BR2_GRAPH_DEPS_OPTS='-d 3 --no-transitive --colours=red,green,blue' make graph-depends
 --------------------------------
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 28fe2f0..4e12351 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -36,6 +36,9 @@ max_depth = 0
 # Whether to draw the transitive dependencies
 transitive = True
 
+# Stop dependency on virtual package
+stop_on_virtual = False
+
 parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
@@ -51,6 +54,10 @@ parser.add_argument("--transitive", dest="transitive", action='store_true',
                     default=False)
 parser.add_argument("--no-transitive", dest="transitive", action='store_false',
                     help="Draw (do not draw) transitive dependencies")
+parser.add_argument("--stop-on-virtual", dest="stop_on_virtual", action='store_true',
+                    default=False)
+parser.add_argument("--dont-stop-on-virtual", dest="stop_on_virtual", action='store_false',
+                    help="Stop (or do not stop) on virtual package")
 args = parser.parse_args()
 
 if args.package is None:
@@ -63,6 +70,8 @@ max_depth = args.depth
 
 transitive = args.transitive
 
+stop_on_virtual = args.stop_on_virtual
+
 # Get the colours: we need exactly three colours,
 # so no need not split more than 4
 # We'll let 'dot' validate the colours...
@@ -313,6 +322,8 @@ def print_pkg_deps(depth, pkg):
     print_attrs(pkg)
     if pkg not in dict_deps:
         return
+    if stop_on_virtual and dict_version.get(pkg) == "virtual":
+        return
     if max_depth == 0 or depth < max_depth:
         for d in dict_deps[pkg]:
             print("%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d)))
-- 
2.1.0
