From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Mar 2015 23:56:30 +0100
Subject: [Buildroot] [PATCH 1/4] support/graph-depends: add option to stop
	on specific packages
In-Reply-To: <cover.1427150990.git.yann.morin.1998@free.fr>
References: <cover.1427150990.git.yann.morin.1998@free.fr>
Message-ID: <73b4c7d6899ce923db27c91bff33087f2ce379db.1427150990.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new option to graph-depends, that users can set to stop the graph
on a specific (set of) package(s).

This accepts any actual package name, or the 'virtual' keyword to stop
on virtual packages.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Francois Perrad <fperrad@gmail.com>
---
 support/scripts/graph-depends | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 5b9b195..a2310c0 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -36,11 +36,14 @@ max_depth = 0
 # Whether to draw the transitive dependencies
 transitive = True
 
-parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
+parser = argparse.ArgumentParser(description="Graph packages dependencies")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
 parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
                     help="Limit the dependency graph to DEPTH levels; 0 means no limit.")
+parser.add_argument("--stop-on", "-s", metavar="PACKAGE", dest="stop_list", action="append",
+                    help="do not graph past this package (can be given multiple times)." \
+                       + " 'virtual' to stop on virtual packages.")
 parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
                     default="lightblue,grey,gainsboro",
                     help="Comma-separated list of the three colours to use" \
@@ -61,6 +64,11 @@ else:
 
 max_depth = args.depth
 
+if args.stop_list is None:
+    stop_list = []
+else:
+    stop_list = args.stop_list
+
 transitive = args.transitive
 
 # Get the colours: we need exactly three colours,
@@ -304,6 +312,10 @@ def print_pkg_deps(depth, pkg):
     print_attrs(pkg)
     if pkg not in dict_deps:
         return
+    if pkg in stop_list:
+        return
+    if dict_version.get(pkg) == "virtual" and "virtual" in stop_list:
+        return
     if max_depth == 0 or depth < max_depth:
         for d in dict_deps[pkg]:
             print("%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d)))
-- 
1.9.1
