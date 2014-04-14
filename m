From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 20:56:20 +0200
Subject: [Buildroot] [git commit] support/graph-depends: add option to limit
	the depth of the graph
Message-ID: <20140414201322.6722699371@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12c5e68ea803a0ea05afab55e2f81d02a812b130
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the complete dependency chain of a package is used to
generate the dependency graph. When this dependency chain is long,
the generated graph becomes almost unreadable.

However, it is often sufficient to get the first few levels of
dependency of a package.

Add a new variable BR2_GRAPH_DEPTH, that the user can set to limit
the depth of the dependency list.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                      |    3 +-
 package/pkg-generic.mk        |    2 +-
 support/scripts/graph-depends |   49 +++++++++++++++++++++++++++++++----------
 3 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index b0eec7f..467e21c 100644
--- a/Makefile
+++ b/Makefile
@@ -150,6 +150,7 @@ endif
 # Need that early, before we scan packages
 # Avoids doing the $(or...) everytime
 BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
+BR_GRAPH_DEPTH := $(or $(BR2_GRAPH_DEPTH),0)
 
 BUILD_DIR:=$(BASE_DIR)/build
 BINARIES_DIR:=$(BASE_DIR)/images
@@ -672,7 +673,7 @@ graph-build: $(O)/build/build-time.log
 graph-depends:
 	@$(INSTALL) -d $(O)/graphs
 	@cd "$(CONFIG_DIR)"; \
-	$(TOPDIR)/support/scripts/graph-depends \
+	$(TOPDIR)/support/scripts/graph-depends -d $(BR_GRAPH_DEPTH) \
 	|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 080ee56..c162902 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -495,7 +495,7 @@ $(1)-show-depends:
 $(1)-graph-depends:
 			@$(INSTALL) -d $(O)/graphs
 			@cd "$(CONFIG_DIR)"; \
-			$(TOPDIR)/support/scripts/graph-depends -p $(1) \
+			$(TOPDIR)/support/scripts/graph-depends -p $(1) -d $(BR_GRAPH_DEPTH) \
 			|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$$(@).$(BR_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index fc3cadd..ebf511b 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -8,6 +8,8 @@
 # dependencies for the current configuration.
 # If '-p <package-name>' is specified, graph-depends will draw a graph
 # of dependencies for the given package name.
+# If '-d <depth>' is specified, graph-depends will limit the depth of
+# the dependency graph to 'depth' levels.
 #
 # Limitations
 #
@@ -31,10 +33,13 @@ FULL_MODE = 1
 PKG_MODE  = 2
 
 mode = 0
+max_depth = 0
 
 parser = argparse.ArgumentParser(description="Graph pacakges dependencies")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
+parser.add_argument("--depth", '-d', metavar="DEPTH",
+                    help="Limit the dependency graph to DEPTH levels")
 args = parser.parse_args()
 
 if args.package == None:
@@ -43,6 +48,9 @@ else:
     mode = PKG_MODE
     rootpkg = args.package
 
+if args.depth != None:
+    max_depth = int(args.depth)
+
 allpkgs = []
 
 # Execute the "make show-targets" command to get the list of the main
@@ -193,6 +201,7 @@ if mode == FULL_MODE:
     deps = get_all_depends(filtered_targets)
     if deps != None:
         dependencies += deps
+    rootpkg = 'all'
 
 # In pkg mode, start directly with get_all_depends() on the requested
 # package
@@ -201,26 +210,42 @@ elif mode == PKG_MODE:
 
 dependencies = remove_redundant_deps(dependencies)
 
-# Start printing the graph data
-print "digraph G {"
-
-# First, the dependencies. Usage of set allows to remove duplicated
-# dependencies in the graph
-for dep in set(dependencies):
-    print "%s -> %s" % (pkg_node_name(dep[0]), pkg_node_name(dep[1]))
+# Make the dependencies a dictionnary { 'pkg':[dep1, dep2, ...] }
+dict_deps = {}
+for dep in dependencies:
+    if not dict_deps.has_key(dep[0]):
+        dict_deps[dep[0]] = []
+    dict_deps[dep[0]].append(dep[1])
 
-# Then, the node attributes: color, style and label.
-for pkg in allpkgs:
+# Print the attributes of a node: label and fill-color
+def print_attrs(pkg):
     if pkg == 'all':
         print "all [label = \"ALL\"]"
         print "all [color=lightblue,style=filled]"
-        continue
-
+        return
     print "%s [label = \"%s\"]" % (pkg_node_name(pkg), pkg)
-
     if mode == PKG_MODE and pkg == rootpkg:
         print "%s [color=lightblue,style=filled]" % pkg_node_name(rootpkg)
     else:
         print "%s [color=grey,style=filled]" % pkg_node_name(pkg)
 
+# Print the dependency graph of a package
+def print_pkg_deps(depth, pkg):
+    if pkg in done_deps:
+        return
+    done_deps.append(pkg)
+    print_attrs(pkg)
+    if not dict_deps.has_key(pkg):
+        return
+    if max_depth == 0 or depth < max_depth:
+        for d in dict_deps[pkg]:
+            print "%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d))
+            print_pkg_deps(depth+1, d)
+
+# Start printing the graph data
+print "digraph G {"
+
+done_deps = []
+print_pkg_deps(0, rootpkg)
+
 print "}"
