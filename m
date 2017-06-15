From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:51:56 +0200
Subject: [Buildroot] [git commit] Makefile: add missing PHONY targets
Message-ID: <20170615100005.A0AF88165E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ab14ff20938b68d95c4b312073e27d24b5fedc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quite a few targets in the top-level Makefile were missing the .PHONY
marking. Now that the .PHONY declarations are next to the definition
of the targets, they are much easier to find.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index fca528c..320f74a 100644
--- a/Makefile
+++ b/Makefile
@@ -546,6 +546,7 @@ dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
 
+.PHONY: prepare
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
 .PHONY: world
@@ -723,6 +724,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 .PHONY: source
 source: $(foreach p,$(PACKAGES),$(p)-all-source)
 
+.PHONY: _external-deps external-deps
 _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
 external-deps:
 	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
@@ -760,11 +762,14 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
 		mv .legal-info.sha256 legal-info.sha256)
 	@echo "Legal info produced in $(LEGAL_INFO_DIR)"
 
+.PHONY: show-targets
 show-targets:
 	@echo $(PACKAGES) $(TARGETS_ROOTFS)
 
+.PHONY: show-build-order
 show-build-order: $(patsubst %,%-show-build-order,$(PACKAGES))
 
+.PHONY: graph-build
 graph-build: $(O)/build/build-time.log
 	@install -d $(GRAPHS_DIR)
 	$(foreach o,name build duration,./support/scripts/graph-build-time \
@@ -776,10 +781,12 @@ graph-build: $(O)/build/build-time.log
 				   --output=$(GRAPHS_DIR)/build.pie-$(t).$(BR_GRAPH_OUT) \
 				   $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
 
+.PHONY: graph-depends-requirements
 graph-depends-requirements:
 	@dot -? >/dev/null 2>&1 || \
 		{ echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1; }
 
+.PHONY: graph-depends
 graph-depends: graph-depends-requirements
 	@$(INSTALL) -d $(GRAPHS_DIR)
 	@cd "$(CONFIG_DIR)"; \
@@ -789,6 +796,7 @@ graph-depends: graph-depends-requirements
 		-o $(GRAPHS_DIR)/$(@).$(BR_GRAPH_OUT) \
 		$(GRAPHS_DIR)/$(@).dot
 
+.PHONY: graph-size
 graph-size:
 	$(Q)mkdir -p $(GRAPHS_DIR)
 	$(Q)$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
@@ -796,6 +804,7 @@ graph-size:
 		--file-size-csv $(GRAPHS_DIR)/file-size-stats.csv \
 		--package-size-csv $(GRAPHS_DIR)/package-size-stats.csv
 
+.PHONY: check-dependencies
 check-dependencies:
 	@cd "$(CONFIG_DIR)"; \
 	$(TOPDIR)/support/scripts/graph-depends -C
