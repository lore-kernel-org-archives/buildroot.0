From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 22:59:05 +0200
Subject: [Buildroot] [git commit] core/graph-depends: add option to graph
	reverse dependencies
Message-ID: <20161025210108.D8C16818AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a2eb55ca73cbe8536a9d9bdd29feaf70a462961
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we can dump the reverse dependencies of a package, add the
ability to graph those.

It does not make sense to do a full reverse graph, as it would be
semantically equivalent to the direct graph. So we only provide a
per-package reverse graph.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                      |  3 ++-
 package/pkg-generic.mk        | 21 ++++++++++++++-------
 support/scripts/graph-depends | 18 ++++++++++++++++--
 3 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 5c65f90..c00e200 100644
--- a/Makefile
+++ b/Makefile
@@ -761,7 +761,7 @@ graph-depends: graph-depends-requirements
 	@$(INSTALL) -d $(GRAPHS_DIR)
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
-		-o $(GRAPHS_DIR)/$(@).dot
+		--direct -o $(GRAPHS_DIR)/$(@).dot
 	dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) \
 		-o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT) \
 		$(GRAPHS_DIR)/$(@).dot
@@ -977,6 +977,7 @@ help:
 	@echo '  <pkg>-show-depends     - List packages on which <pkg> depends'
 	@echo '  <pkg>-show-rdepends    - List packages which have <pkg> as a dependency'
 	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
+	@echo '  <pkg>-graph-rdepends   - Generate a graph of <pkg>'\''s reverse dependencies'
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 81bb82c..3349092 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -317,6 +317,16 @@ be selected at a time. Please fix your configuration)
 endif
 endef
 
+define pkg-graph-depends
+	@$$(INSTALL) -d $$(GRAPHS_DIR)
+	@cd "$$(CONFIG_DIR)"; \
+	$$(TOPDIR)/support/scripts/graph-depends $$(BR2_GRAPH_DEPS_OPTS) \
+		-p $(1) $(2) -o $$(GRAPHS_DIR)/$$(@).dot
+	dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) \
+		-o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT) \
+		$$(GRAPHS_DIR)/$$(@).dot
+endef
+
 ################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
@@ -702,13 +712,10 @@ $(1)-show-rdepends:
 			@echo $$($(2)_RDEPENDENCIES)
 
 $(1)-graph-depends: graph-depends-requirements
-			@$$(INSTALL) -d $$(GRAPHS_DIR)
-			@cd "$$(CONFIG_DIR)"; \
-			$$(TOPDIR)/support/scripts/graph-depends $$(BR2_GRAPH_DEPS_OPTS) \
-				-p $(1) -o $$(GRAPHS_DIR)/$$(@).dot
-			dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) \
-				-o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT) \
-				$$(GRAPHS_DIR)/$$(@).dot
+	$(call pkg-graph-depends,$(1),--direct)
+
+$(1)-graph-rdepends: graph-depends-requirements
+	$(call pkg-graph-depends,$(1),--reverse)
 
 $(1)-all-source:	$(1)-source
 $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index cb00383..c3c97cb 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -63,6 +63,10 @@ parser.add_argument("--transitive", dest="transitive", action='store_true',
                     default=False)
 parser.add_argument("--no-transitive", dest="transitive", action='store_false',
                     help="Draw (do not draw) transitive dependencies")
+parser.add_argument("--direct", dest="direct", action='store_true', default=True,
+                    help="Draw direct dependencies (the default)")
+parser.add_argument("--reverse", dest="direct", action='store_false',
+                    help="Draw reverse dependencies")
 args = parser.parse_args()
 
 check_only = args.check_only
@@ -95,6 +99,16 @@ else:
 
 transitive = args.transitive
 
+if args.direct:
+    rule = "show-depends"
+    arrow_dir = "forward"
+else:
+    if mode == MODE_FULL:
+        sys.stderr.write("--reverse needs a package\n")
+        sys.exit(1)
+    rule = "show-rdepends"
+    arrow_dir = "back"
+
 # Get the colours: we need exactly three colours,
 # so no need not split more than 4
 # We'll let 'dot' validate the colours...
@@ -151,7 +165,7 @@ def get_depends(pkgs):
     sys.stderr.write("Getting dependencies for %s\n" % pkgs)
     cmd = ["make", "-s", "--no-print-directory" ]
     for pkg in pkgs:
-        cmd.append("%s-show-depends" % pkg)
+        cmd.append("%s-%s" % (pkg, rule))
     p = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
     output = p.communicate()[0]
     if p.returncode != 0:
@@ -418,7 +432,7 @@ def print_pkg_deps(depth, pkg):
                     add = False
                     break
             if add:
-                outfile.write("%s -> %s\n" % (pkg_node_name(pkg), pkg_node_name(d)))
+                outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
                 print_pkg_deps(depth+1, d)
 
 # Start printing the graph data
