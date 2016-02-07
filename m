From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 23:16:11 +0100
Subject: [Buildroot] [git commit] core: catch failures in graph-depends
Message-ID: <20160207222644.69024817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e7020ef643c3266d31027bcdb50d59767adc87e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we generate the dependency graph in a single command, piping
the stdout of support/scripts/.graph-depends to the stdin of dot.

Unfortunately, this means we can't catch a failure of graph-depends, as
the shell can only treturn the exit code of the last command in a pipe.

Still, we do want to keep the output of graph-depends, and we in fact do
keep it by mean of a tee.

graph-depends has just gained the ability to generate its output to a
file, so we break the pipe in two differnet commands, so we can bail out
on graph-depends errors.

Do that for the two call sites.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 6 ++++--
 package/pkg-generic.mk | 8 +++++---
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 68259fd..7c5daa4 100644
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
+		$(GRAPHS_DIR)/$(@).dot
 
 graph-size:
 	$(Q)mkdir -p $(GRAPHS_DIR)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1e024d3..e22babb 100644
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
+				$$(GRAPHS_DIR)/$$(@).dot
 
 $(1)-all-source:	$(1)-source
 $(1)-all-source:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-source)
