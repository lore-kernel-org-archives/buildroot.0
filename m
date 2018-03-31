From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 18:35:42 +0200
Subject: [Buildroot] [PATCH v2 4/5] support/scripts/graph-depends: add
 --flat-list option
In-Reply-To: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
References: <20180331163543.6278-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180331163543.6278-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: George Redivo <george.redivo@datacom.ind.br>

graph-depends currently spits out a graph in .dot format. However, as
part of the upcoming introduction of <pkg>-show-recursive-depends and
<pkg>-show-recursive-rdepends, we need graph-depends to be able to
display a flat list.

Signed-off-by: George Redivo <george.redivo@datacom.ind.br>
[Thomas:
 - Rebase on top of graph-depends changes
 - Do not display the package name itself in the list, only its
   dependencies (or reverse dependencies)
 - Display the result on a single line, instead of one package per
   line, in order to match what <pkg>-show-depends and
   <pkg>-show-rdepends are doing today.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/graph-depends | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 3a60e478d4..a177296da2 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -248,11 +248,14 @@ done_deps = []
 
 # Print the dependency graph of a package
 def print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
-                   arrow_dir, depth, max_depth, pkg, colors):
+                   arrow_dir, draw_graph, depth, max_depth, pkg, colors):
     if pkg in done_deps:
         return
     done_deps.append(pkg)
-    print_attrs(outfile, pkg, dict_version.get(pkg), depth, colors)
+    if draw_graph:
+        print_attrs(outfile, pkg, dict_version.get(pkg), depth, colors)
+    elif depth != 0:
+        outfile.write("%s " % pkg)
     if pkg not in dict_deps:
         return
     for p in stop_list:
@@ -276,9 +279,10 @@ def print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
                     add = False
                     break
             if add:
-                outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
+                if draw_graph:
+                    outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
                 print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
-                               arrow_dir, depth + 1, max_depth, d, colors)
+                               arrow_dir, draw_graph, depth + 1, max_depth, d, colors)
 
 
 def parse_args():
@@ -314,6 +318,8 @@ def parse_args():
                         help="Draw reverse dependencies")
     parser.add_argument("--quiet", '-q', dest="quiet", action='store_true',
                         help="Quiet")
+    parser.add_argument("--flat-list", '-f', dest="flat_list", action='store_true', default=False,
+                        help="Do not draw graph, just print a flat list")
     return parser.parse_args()
 
 
@@ -356,6 +362,8 @@ def main():
         get_depends_func = brpkgutil.get_rdepends
         arrow_dir = "back"
 
+    draw_graph = not args.flat_list
+
     # Get the colors: we need exactly three colors,
     # so no need not split more than 4
     # We'll let 'dot' validate the colors...
@@ -404,12 +412,16 @@ def main():
                                          args.quiet)
 
     # Start printing the graph data
-    outfile.write("digraph G {\n")
+    if draw_graph:
+        outfile.write("digraph G {\n")
 
     print_pkg_deps(outfile, dict_deps, dict_version, stop_list, exclude_list,
-                   arrow_dir, 0, args.depth, rootpkg, colors)
+                   arrow_dir, draw_graph, 0, args.depth, rootpkg, colors)
 
-    outfile.write("}\n")
+    if draw_graph:
+        outfile.write("}\n")
+    else:
+        outfile.write("\n")
 
 
 if __name__ == "__main__":
-- 
2.14.3
