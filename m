From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 17:02:39 +0100
Subject: [Buildroot] [PATCH 4/6 v2] support/graph-depends: add option to
	specify output file
In-Reply-To: <cover.1453651102.git.yann.morin.1998@free.fr>
References: <cover.1453651102.git.yann.morin.1998@free.fr>
Message-ID: <6b52c47dc2907744732cc2da7ee6f22c2b384836.1453651102.git.yann.morin.1998@free.fr>
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

Change the calling sites to use that option, call graph-depends and dot
as two separate commands, so we can bail out on graph-depends error.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 Makefile                      |  6 ++++--
 package/pkg-generic.mk        |  8 +++++---
 support/scripts/graph-depends | 19 +++++++++++++------
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 17c181b..20927de 100644
--- a/Makefile
+++ b/Makefile
@@ -721,8 +721,10 @@ graph-depends: graph-depends-requirements
 	@$(INSTALL) -d $(GRAPHS_DIR)
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
-	|tee $(GRAPHS_DIR)/$(@).dot \
-	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT)
+		-o $(GRAPHS_DIR)/$(@).dot
+	dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) \
+		-o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT) \
+		<$(GRAPHS_DIR)/$(@).dot
 
 graph-size:
 	$(Q)mkdir -p $(GRAPHS_DIR)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1e024d3..e396a5d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -668,9 +668,11 @@ $(1)-show-depends:
 $(1)-graph-depends: graph-depends-requirements
 			@$$(INSTALL) -d $$(GRAPHS_DIR)
 			@cd "$$(CONFIG_DIR)"; \
-			$$(TOPDIR)/support/scripts/graph-depends -p $(1) $$(BR2_GRAPH_DEPS_OPTS) \
-			|tee $$(GRAPHS_DIR)/$$(@).dot \
-			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT)
+			$$(TOPDIR)/support/scripts/graph-depends $$(BR2_GRAPH_DEPS_OPTS) \
+				-p $(1) -o $$(GRAPHS_DIR)/$$(@).dot
+			dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) \
+				-o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT) \
+				<$$(GRAPHS_DIR)/$$(@).dot
 
 $(1)-all-source:	$(1)-source
 $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 78be2ba..e872ed4 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -38,6 +38,8 @@ max_depth = 0
 transitive = True
 
 parser = argparse.ArgumentParser(description="Graph packages dependencies")
+parser.add_argument("--output", "-o", metavar="DOT_FILE", dest="dotfile",
+                    help="File in which to generate the dot program")
 parser.add_argument("--package", '-p', metavar="PACKAGE",
                     help="Graph the dependencies of PACKAGE")
 parser.add_argument("--depth", '-d', metavar="DEPTH", dest="depth", type=int, default=0,
@@ -60,6 +62,11 @@ parser.add_argument("--no-transitive", dest="transitive", action='store_false',
                     help="Draw (do not draw) transitive dependencies")
 args = parser.parse_args()
 
+if args.dotfile is None:
+    outfile = sys.stdout
+else:
+    outfile = open(args.dotfile, "wb")
+
 if args.package is None:
     mode = MODE_FULL
 else:
@@ -366,10 +373,10 @@ def print_attrs(pkg):
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
@@ -396,13 +403,13 @@ def print_pkg_deps(depth, pkg):
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
