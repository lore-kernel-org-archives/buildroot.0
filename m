From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 16:03:46 +0200
Subject: [Buildroot] [PATCH 2/9] graphs: add option to remove transitive
	dependencies in dependency graph
In-Reply-To: <cover.1402236171.git.yann.morin.1998@free.fr>
References: <cover.1402236171.git.yann.morin.1998@free.fr>
Message-ID: <b9cdb115c9a83250a7ac86619aabdea04a436e8f.1402236171.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, all the dependencies of a package are drawn on the dependency
graph, including transitive dependencies (e.g. A->B->C and A->C).

For very big graphs, with lots of packages with lots of dependencies, the
dependency graph can be very dense, and transitive dependencies are
cluttering the graph.

In some cases, only getting the "build-order" dependencies is enough (e.g.
to see what impact a package rebuild would have).

Add a new environment variable to disable drawing transitive dependencies.

Basically, it would turn this graph:

    pkg1 ---> pkg2 ---> pkg3 -------------------.
         |\__________/                 \         \
         |\____________________         \         \
         |                     \         \         \
          `-> pkg4 ---> pkg5 ---> pkg6 ---> pkg7 ---> pkg8
                    \__________/

into that graph:

    pkg1 ---> pkg2 ---> pkg3 -----------.
         |                               \
          `-> pkg4 ---> pkg5 ---> pkg6 ---> pkg7 ---> pkg8

[Thanks to Samuel for the parser hints]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 support/scripts/graph-depends | 49 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 443ac7d..c5fb520 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -40,6 +40,10 @@ parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
 parser.add_argument("--depth", '-d', metavar="DEPTH",
                     help="Limit the dependency graph to DEPTH levels")
+parser.add_argument("--transitive", dest="transitive", action='store_true',
+                    default=True)
+parser.add_argument("--no-transitive", dest="transitive", action='store_false',
+                    help="Draw (do not draw) transitive dependencies")
 args = parser.parse_args()
 
 if args.package is None:
@@ -51,6 +55,8 @@ else:
 if args.depth is not None:
     max_depth = int(args.depth)
 
+transitive = args.transitive
+
 allpkgs = []
 
 # Execute the "make show-targets" command to get the list of the main
@@ -220,6 +226,49 @@ for dep in dependencies:
         dict_deps[dep[0]] = []
     dict_deps[dep[0]].append(dep[1])
 
+# This function return True if pkg is a dependency (direct or
+# transitive) of pkg2, dependencies being listed in the deps
+# dictionary. Returns False otherwise.
+def is_dep(pkg,pkg2,deps):
+    if deps.has_key(pkg2):
+        for p in deps[pkg2]:
+            if pkg == p:
+                return True
+            if is_dep(pkg,p,deps):
+                return True
+    return False
+
+# This function eliminates transitive dependencies; for example, given
+# these dependency chain: A->{B,C} and B->{C}, the A->{C} dependency is
+# already covered by B->{C}, so C is a transitive dependency of A, via B.
+# The functions does:
+#   - for each dependency d[i] of the package pkg
+#     - if d[i] is a dependency of any of the other dependencies d[j]
+#       - do not keep d[i]
+#     - otherwise keep d[i]
+def remove_transitive_deps(pkg,deps):
+    d = deps[pkg]
+    new_d = []
+    for i in range(len(d)):
+        keep_me = True
+        for j in range(len(d)):
+            if j==i:
+                continue
+            if is_dep(d[i],d[j],deps):
+                keep_me = False
+        if keep_me:
+            new_d.append(d[i])
+    return new_d
+
+# This functions trims down the dependency list of all packages.
+def remove_extra_deps(deps):
+    for pkg in deps.keys():
+        if not transitive:
+            deps[pkg] = remove_transitive_deps(pkg,deps)
+    return deps
+
+dict_deps = remove_extra_deps(dict_deps)
+
 # Print the attributes of a node: label and fill-color
 def print_attrs(pkg):
     name = pkg_node_name(pkg)
-- 
1.8.3.2
