From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:55:31 +0200
Subject: [Buildroot] [git commit] support/graph-depends: add option to
	completely exclude a package
Message-ID: <20150331220030.777B67F980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64b70f55cbdd78063262f050b8eb6db71c8035e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to --stop-on, but also omits the package from the graph.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Francois Perrad <fperrad@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-depends |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index b0202e6..c1fc042 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -46,6 +46,8 @@ parser.add_argument("--stop-on", "-s", metavar="PACKAGE", dest="stop_list", acti
                     help="Do not graph past this package (can be given multiple times)." \
                        + " Can be a package name or a glob, or" \
                        + " 'virtual' to stop on virtual packages.")
+parser.add_argument("--exclude", "-x", metavar="PACKAGE", dest="exclude_list", action="append",
+                    help="Like --stop-on, but do not add PACKAGE to the graph.")
 parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
                     default="lightblue,grey,gainsboro",
                     help="Comma-separated list of the three colours to use" \
@@ -71,6 +73,11 @@ if args.stop_list is None:
 else:
     stop_list = args.stop_list
 
+if args.exclude_list is None:
+    exclude_list = []
+else:
+    exclude_list = args.exclude_list
+
 transitive = args.transitive
 
 # Get the colours: we need exactly three colours,
@@ -321,8 +328,14 @@ def print_pkg_deps(depth, pkg):
         return
     if max_depth == 0 or depth < max_depth:
         for d in dict_deps[pkg]:
-            print("%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d)))
-            print_pkg_deps(depth+1, d)
+            add = True
+            for p in exclude_list:
+                if fnmatch(d,p):
+                    add = False
+                    break
+            if add:
+                print("%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d)))
+                print_pkg_deps(depth+1, d)
 
 # Start printing the graph data
 print("digraph G {")
