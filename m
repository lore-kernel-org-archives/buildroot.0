From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  7 May 2014 00:44:27 +0200
Subject: [Buildroot] [PATCH] graphs: add option to remove transitive
	dependencies in dependency graph
Message-ID: <1399416267-16009-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, all the dependencies of a package are drawn on the dependency
graph, including transitive dependencies (e.g. A->B->C and A->C).

Very big graphs, with lots of packages with lots of dependencies, the
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

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

---
Note: some graphs showing the results are there:
    http://ymorin.is-a-geek.org/download/tmp/graphs/
---
 Makefile                      |  9 +++++++--
 package/pkg-generic.mk        |  2 +-
 support/scripts/graph-depends | 45 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 2f18aab..5c71cd7 100644
--- a/Makefile
+++ b/Makefile
@@ -150,7 +150,12 @@ endif
 # Need that early, before we scan packages
 # Avoids doing the $(or...) everytime
 BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
-BR_GRAPH_DEPTH := $(or $(BR2_GRAPH_DEPTH),0)
+BR_GRAPH_DEPS_OPTS := --depth $(or $(BR2_GRAPH_DEPTH),0)
+ifeq ($(BR2_GRAPH_NO_TRANSITIVE),)
+BR_GRAPH_DEPS_OPTS += --transitive
+else
+BR_GRAPH_DEPS_OPTS += --no-transitive
+endif
 
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
@@ -674,7 +679,7 @@ graph-build: $(O)/build/build-time.log
 graph-depends:
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
-	$(TOPDIR)/support/scripts/graph-depends -d $(BR_GRAPH_DEPTH) \
+	$(TOPDIR)/support/scripts/graph-depends $(BR_GRAPH_DEPS_OPTS) \
 	|tee $(O)/graphs/$(@).dot \
 	|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index cf02210..6b53746 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -495,7 +495,7 @@ $(1)-show-depends:
 $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
 			@cd "$(CONFIG_DIR)"; \
-			$(TOPDIR)/support/scripts/graph-depends -p $(1) -d $(BR_GRAPH_DEPTH) \
+			$(TOPDIR)/support/scripts/graph-depends -p $(1) $(BR_GRAPH_DEPS_OPTS) \
 			|tee $(O)/graphs/$$(@).dot \
 			|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
 
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index e2a5e1e..4195646 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -40,6 +40,9 @@ parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
 parser.add_argument("--depth", '-d', metavar="DEPTH",
                     help="Limit the dependency graph to DEPTH levels")
+parser.add_argument("--transitive", dest="transitive", action='store_true')
+parser.add_argument("--no-transitive", dest="transitive", action='store_false')
+parser.set_defaults(transitive=True)
 args = parser.parse_args()
 
 if args.package is None:
@@ -51,6 +54,8 @@ else:
 if args.depth is not None:
     max_depth = int(args.depth)
 
+transitive = args.transitive
+
 allpkgs = []
 
 # Execute the "make show-targets" command to get the list of the main
@@ -220,6 +225,46 @@ for dep in dependencies:
         dict_deps[dep[0]] = []
     dict_deps[dep[0]].append(dep[1])
 
+# This function return True if pkg is a dependency (direct or
+# transitive) of pkg2, dependencies being listed in the deps
+# dictionary.
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
+#   - for each package 'pkg' (for which we have a dependency list):
+#     - for each dependency d[i] of that package
+#       - if d[i] is a dependency of any of the other dependency d[j]
+#         - do not keep d[i]
+#       - otherwise keep d[i] 
+def remove_transitive_deps(deps):
+    new_dict_deps = {}
+    for pkg in deps.keys():
+        d = deps[pkg]
+        new_dict_deps[pkg] = []
+        for i in range(len(d)):
+            add_me = True
+            for j in range(len(d)):
+                if j==i:
+                    continue
+                if is_dep(d[i],d[j],deps):
+                    add_me = False
+            if add_me:
+                new_dict_deps[pkg].append(d[i])
+    return new_dict_deps
+
+if not transitive:
+    dict_deps = remove_transitive_deps(dict_deps)
+
 # Print the attributes of a node: label and fill-color
 def print_attrs(pkg):
     if pkg == 'all':
-- 
1.8.3.2
