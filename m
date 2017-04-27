From: George Redivo <george.redivo@datacom.ind.br>
Date: Thu, 27 Apr 2017 12:04:18 -0300
Subject: [Buildroot] [PATCH 1/1] Create 'make <pkt>-show-rrdepends' command
Message-ID: <1493305458-15309-1-git-send-email-george.redivo@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The created command shows, recursively, the reverse depends of a
package,
it means that the command shows not only the direct dependants (which is
done by 'show-rdepends'), but also all indirect dependents.

To do this it was necessary to create a new parameter '--flat-list', or
'-f', to graph-depends.
This parameter instructs the script to just print the name of package
instead of the .dot syntax.

Signed-off-by: George Redivo <george.redivo@datacom.ind.br>
---
 Makefile                      |  1 +
 package/pkg-generic.mk        | 10 ++++++++++
 support/scripts/graph-depends | 16 ++++++++++++----
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 919d589..61943d8 100644
--- a/Makefile
+++ b/Makefile
@@ -996,6 +996,7 @@ help:
 	@echo '  <pkg>-build            - Build <pkg> up to the build step'
 	@echo '  <pkg>-show-depends     - List packages on which <pkg> depends'
 	@echo '  <pkg>-show-rdepends    - List packages which have <pkg> as a dependency'
+	@echo '  <pkg>-show-rrdepends   - List, recursivelly, packages which have <pkg> as a dependency'
 	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
 	@echo '  <pkg>-graph-rdepends   - Generate a graph of <pkg>'\''s reverse dependencies'
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3b26e6b..c0f83b6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -353,6 +353,13 @@ define pkg-graph-depends
 		$$(GRAPHS_DIR)/$$(@).dot
 endef
 
+define pkg-rrdepends
+	@$$(INSTALL) -d $$(GRAPHS_DIR)
+	@cd "$$(CONFIG_DIR)"; \
+	$$(TOPDIR)/support/scripts/graph-depends $$(BR2_GRAPH_DEPS_OPTS) \
+		-p $(1) --reverse -f
+endef
+
 ################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
@@ -737,6 +744,9 @@ $(1)-show-depends:
 $(1)-show-rdepends:
 			@echo $$($(2)_RDEPENDENCIES)
 
+$(1)-show-rrdepends:
+	$(call pkg-rrdepends,$(1))
+
 $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
 	$$(info $(1))
 
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index b258c56..f6fec09 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -69,6 +69,8 @@ parser.add_argument("--direct", dest="direct", action='store_true', default=True
                     help="Draw direct dependencies (the default)")
 parser.add_argument("--reverse", dest="direct", action='store_false',
                     help="Draw reverse dependencies")
+parser.add_argument("--flat-list", '-f', dest="flat_list", action='store_true', default=False,
+                    help="Do not draw, just print a flat list output.")
 args = parser.parse_args()
 
 check_only = args.check_only
@@ -361,7 +363,10 @@ def print_pkg_deps(depth, pkg):
     if pkg in done_deps:
         return
     done_deps.append(pkg)
-    print_attrs(pkg)
+    if args.flat_list:
+        outfile.write("%s\n" % (pkg))
+    else:
+        print_attrs(pkg)
     if pkg not in dict_deps:
         return
     for p in stop_list:
@@ -385,13 +390,16 @@ def print_pkg_deps(depth, pkg):
                     add = False
                     break
             if add:
-                outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
+                if not args.flat_list:
+                    outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
                 print_pkg_deps(depth+1, d)
 
 # Start printing the graph data
-outfile.write("digraph G {\n")
+if not args.flat_list:
+    outfile.write("digraph G {\n")
 
 done_deps = []
 print_pkg_deps(0, rootpkg)
 
-outfile.write("}\n")
+if not args.flat_list:
+    outfile.write("}\n")
-- 
1.9.1
