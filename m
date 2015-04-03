From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:19:18 +0200
Subject: [Buildroot] [git commit] Makefile: remove the graphs/ dir on 'make
	clean'
Message-ID: <20150403121940.6348181976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a9a21b95c7c4793182e8e7f0e6b70d8221eef04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, a 'make clean' leaves the graphs/ subdirectory in the
output directory. This commit defines a GRAPHS_DIR variable, used by
the different graph-generating targets, and which gets cleaned up in
the 'clean' target.

[Thomas: use the new GRAPHS_DIR variable in more places, as suggested
by Yann.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               |   15 ++++++++-------
 package/pkg-generic.mk |    6 +++---
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index edb122b..1f2bef0 100644
--- a/Makefile
+++ b/Makefile
@@ -161,6 +161,7 @@ TARGET_DIR := $(BASE_DIR)/target
 # initial definition so that 'make clean' works for most users, even without
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
+GRAPHS_DIR := $(BASE_DIR)/graphs
 
 LEGAL_INFO_DIR = $(BASE_DIR)/legal-info
 REDIST_SOURCES_DIR_TARGET = $(LEGAL_INFO_DIR)/sources
@@ -658,14 +659,14 @@ show-targets:
 	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(TARGETS) $(TARGETS_ROOTFS)
 
 graph-build: $(O)/build/build-time.log
-	@install -d $(O)/graphs
+	@install -d $(GRAPHS_DIR)
 	$(foreach o,name build duration,./support/scripts/graph-build-time \
 					--type=histogram --order=$(o) --input=$(<) \
-					--output=$(O)/graphs/build.hist-$(o).$(BR_GRAPH_OUT) \
+					--output=$(GRAPHS_DIR)/build.hist-$(o).$(BR_GRAPH_OUT) \
 					$(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 	$(foreach t,packages steps,./support/scripts/graph-build-time \
 				   --type=pie-$(t) --input=$(<) \
-				   --output=$(O)/graphs/build.pie-$(t).$(BR_GRAPH_OUT) \
+				   --output=$(GRAPHS_DIR)/build.pie-$(t).$(BR_GRAPH_OUT) \
 				   $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 
 graph-depends-requirements:
@@ -673,11 +674,11 @@ graph-depends-requirements:
 		{ echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1; }
 
 graph-depends: graph-depends-requirements
-	@$(INSTALL) -d $(O)/graphs
+	@$(INSTALL) -d $(GRAPHS_DIR)
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS) \
-	|tee $(BASE_DIR)/graphs/$(@).dot \
-	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(BASE_DIR)/graphs/$(@).$(BR_GRAPH_OUT)
+	|tee $(GRAPHS_DIR)/$(@).dot \
+	|dot $(BR2_GRAPH_DOT_OPTS) -T$(BR_GRAPH_OUT) -o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
@@ -834,7 +835,7 @@ printvars:
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR)
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 22b3fb9..0d95541 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -573,11 +573,11 @@ $(1)-show-depends:
 			@echo $$($(2)_FINAL_DEPENDENCIES)
 
 $(1)-graph-depends: graph-depends-requirements
-			@$$(INSTALL) -d $$(O)/graphs
+			@$$(INSTALL) -d $$(GRAPHS_DIR)
 			@cd "$$(CONFIG_DIR)"; \
 			$$(TOPDIR)/support/scripts/graph-depends -p $(1) $$(BR2_GRAPH_DEPS_OPTS) \
-			|tee $$(O)/graphs/$$(@).dot \
-			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(O)/graphs/$$(@).$$(BR_GRAPH_OUT)
+			|tee $$(GRAPHS_DIR)/$$(@).dot \
+			|dot $$(BR2_GRAPH_DOT_OPTS) -T$$(BR_GRAPH_OUT) -o $$(GRAPHS_DIR)/$$(@).$$(BR_GRAPH_OUT)
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
