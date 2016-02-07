From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Feb 2016 22:34:25 +0100
Subject: [Buildroot] [PATCH 2/6 v3] support/graph-depends: add option to
	specify output file
In-Reply-To: <cover.1454880734.git.yann.morin.1998@free.fr>
References: <cover.1454880734.git.yann.morin.1998@free.fr>
Message-ID: <e3c730b6288daeebf708640fed37b38339cf263a.1454880734.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, graph-depends outputs the dotfile program to stdout, and uses
stderr to trace the dependencies it is currently looking for.

Redirection was done because the output was directly piped into the dot
program to generate the final PDF/SVG/... dependency graph, but that
meant that an error in the graph-depends script was never caught
(because shell pipes only return the final command exit status, and an
empty dot program is perfectly valid so dot would not complain).

Add an option to tell graph-depends where to store the generated dot
program, and keep stdout as the default if not specified.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Changes v2 -> v3:
  - rename variable to a consistent 'outfile' name  (Thomas)
  - don't change the Makefiles now  (Thomas)
---
 support/scripts/graph-depends | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index fd8ad2f..74ba995 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -38,6 +38,8 @@ max_depth = 0
 transitive = True
 
 parser = argparse.ArgumentParser(description="Graph packages dependencies")
+parser.add_argument("--outfile", "-o", metavar="DOT_FILE", dest="outfile",
+                    help="File in which to generate the dot representation")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
 parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
@@ -60,6 +62,11 @@ parser.add_argument("--no-transitive", dest="transitive", action='store_false',
                     help="Draw (do not draw) transitive dependencies")
 args = parser.parse_args()
 
+if args.outfile is None:
+    outfile = sys.stdout
+else:
+    outfile = open(args.outfile, "wb")
+
 if args.package is None:
     mode = MODE_FULL
 else:
@@ -339,10 +346,10 @@ def print_attrs(pkg):
             color = target_colour
     version = dict_version.get(pkg)
     if version == "virtual":
-        print("%s [label = <<I>%s</I>>]" % (name, label))
+        outfile.write("%s [label = <<I>%s</I>>]\n" % (name, label))
     else:
-        print("%s [label = \"%s\"]" % (name, label))
-    print("%s [color=%s,style=filled]" % (name, color))
+        outfile.write("%s [label = \"%s\"]\n" % (name, label))
+    outfile.write("%s [color=%s,style=filled]\n" % (name, color))
 
 # Print the dependency graph of a package
 def print_pkg_deps(depth, pkg):
@@ -369,13 +376,13 @@ def print_pkg_deps(depth, pkg):
                     add = False
                     break
             if add:
-                print("%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d)))
+                outfile.write("%s -> %s\n" % (pkg_node_name(pkg), pkg_node_name(d)))
                 print_pkg_deps(depth+1, d)
 
 # Start printing the graph data
-print("digraph G {")
+outfile.write("digraph G {\n")
 
 done_deps = []
 print_pkg_deps(0, rootpkg)
 
-print("}")
+outfile.write("}\n")
-- 
1.9.1
