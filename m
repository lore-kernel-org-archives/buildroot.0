From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Mar 2015 23:16:50 +0100
Subject: [Buildroot] [PATCH 3/4 v2] support/graph-depends: add option to
	completely exclude a package
In-Reply-To: <cover.1427235377.git.yann.morin.1998@free.fr>
References: <cover.1427235377.git.yann.morin.1998@free.fr>
Message-ID: <7ad42b4a954851cc1d2e194022108b1666f995c5.1427235377.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Similar to --stop-on, but also omits the package from the graph.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Francois Perrad <fperrad@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/graph-depends | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

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
-- 
1.9.1
