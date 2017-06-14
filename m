From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 15 Jun 2017 00:11:31 +0200
Subject: [Buildroot] [PATCH 4/8] Makefile: declare targets PHONY where they
	are defined
In-Reply-To: <20170614221135.17470-1-arnout@mind.be>
References: <20170614221135.17470-1-arnout@mind.be>
Message-ID: <20170614221135.17470-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, a lot of targets are declared PHONY together in the middle
of the Makefile. This has two important shortcomings:

- it is more difficult to see if a target is missing from PHONY;

- it is currently inside the ifeq ($(BR2_HAVE_DOT_CONFIG),y) condition,
  but some of these targets are also defined when there is no .config;
  in that case, these targets are not declared as PHONY.

Both issues can easily be solved by putting the PHONY declaration next
to the definition of the target.

The noconfig_targets are also all declared PHONY together; however,
for these we anyway have to keep the noconfig_targets variable
up-to-date, and that PHONY declaration is outside all conditions, so
there is no benefit of splitting them.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 1e22858082..fca528ca19 100644
--- a/Makefile
+++ b/Makefile
@@ -84,6 +84,7 @@ else # umask / $(CURDIR) / $(O)
 
 # This is our default rule, so must come first
 all:
+.PHONY: all
 
 # Set and export the version string
 export BR2_VERSION := 2017.08-git
@@ -538,6 +539,7 @@ $(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
 
 endif
 
+.PHONY: dirs
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
 
@@ -546,12 +548,9 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
+.PHONY: world
 world: target-post-image
 
-.PHONY: all world dirs clean distclean source outputmakefile \
-	legal-info legal-info-prepare legal-info-clean printvars help \
-	list-defconfigs target-finalize target-post-image source-check
-
 # Populating the staging with the base directories is handled by the skeleton package
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)
@@ -654,6 +653,7 @@ endif
 
 $(TARGETS_ROOTFS): target-finalize
 
+.PHONY: target-finalize
 target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
@@ -714,11 +714,13 @@ endif
 		$(call MESSAGE,"Executing post-build script $(s)"); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+.PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
+.PHONY: source
 source: $(foreach p,$(PACKAGES),$(p)-all-source)
 
 _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
@@ -726,11 +728,14 @@ external-deps:
 	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
 
 # check if download URLs are outdated
+.PHONY: source-check
 source-check: $(foreach p,$(PACKAGES),$(p)-all-source-check)
 
+.PHONY: legal-info-clean
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
 
+.PHONY: legal-info-prepare
 legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call MESSAGE,"Collecting legal info")
 	@$(call legal-license-file,buildroot,COPYING,COPYING,HOST)
@@ -740,6 +745,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call legal-warning,the Buildroot source code has not been saved)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
+.PHONY: legal-info
 legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
 		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
 	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
@@ -921,6 +927,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
 # output directory.
+.PHONY: outputmakefile
 outputmakefile:
 ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
@@ -937,6 +944,7 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
 # only the variables matching the make pattern passed in VARS are
 # displayed.
+.PHONY: printvars
 printvars:
 	@$(foreach V, \
 		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
@@ -947,11 +955,13 @@ printvars:
 			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
 # ' Syntax colouring...
 
+.PHONY: clean
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
+.PHONY: distclean
 distclean: clean
 ifeq ($(O),$(CURDIR)/output)
 	rm -rf $(O)
@@ -959,6 +969,7 @@ endif
 	rm -rf $(TOPDIR)/dl $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
 		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE)
 
+.PHONY: help
 help:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
@@ -1055,6 +1066,7 @@ endef
 
 # We iterate over BR2_EXTERNAL_NAMES rather than BR2_EXTERNAL_DIRS,
 # because we want to display the name of the br2-external tree.
+.PHONY: list-defconfigs
 list-defconfigs:
 	$(call list-defconfigs,$(TOPDIR))
 	$(foreach name,$(BR2_EXTERNAL_NAMES),\
-- 
2.11.0
