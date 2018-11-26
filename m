From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:09:46 +0100
Subject: [Buildroot] [git commit] Makefile: rework main directory creation
 logic
Message-ID: <20181202071559.74F90815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0f4f95e390bcb1c953efa125f5277a8a235396e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the current code, the creation of the main output directories
(BUILD_DIR, STAGING_DIR, HOST_DIR, TARGET_DIR, etc.) is done by a
global "dirs" target. While this works fine in the current situation,
it doesn't work well in a context where per-package host and target
directories are used.

For example, with the current code and per-package host directories,
the output/staging symbolic link ends up being created as a link to
the per-package package sysroot directory of the first package being
built, instead of the global sysroot.

This commit reworks the creation of those directories by having the
package/pkg-generic.mk code ensure that the build directory, target
directory, host directory, staging directory and binaries directory
exist before they are needed.

Two new targets, host-finalize and staging-finalize are added in the
main Makefile to create the compatibility symlinks for host and
staging directories. They will be extended later with additional logic
for per-package directories.

Thanks to those changes, the global "dirs" target is entirely removed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile               | 21 +++++++++------------
 fs/common.mk           |  1 +
 package/pkg-generic.mk |  7 ++++++-
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 2819d44124..e675ac26aa 100644
--- a/Makefile
+++ b/Makefile
@@ -572,10 +572,6 @@ $(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
 
 endif
 
-.PHONY: dirs
-dirs: $(BUILD_DIR) $(STAGING_DIR) $(BASE_TARGET_DIR) \
-	$(HOST_DIR) $(HOST_DIR_SYMLINK) $(BINARIES_DIR)
-
 $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 	$(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" syncconfig
 
@@ -605,11 +601,6 @@ sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
 		--transform='s#^\.#$(BR2_SDK_PREFIX)#' \
 		-C $(HOST_DIR) "."
 
-# Populating the staging with the base directories is handled by the skeleton package
-$(STAGING_DIR):
-	@mkdir -p $(STAGING_DIR)
-	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
-
 RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
 	--exclude CVS
@@ -710,8 +701,14 @@ $(TARGETS_ROOTFS): target-finalize
 # Avoid the rootfs name leaking down the dependency chain
 target-finalize: ROOTFS=
 
+host-finalize: $(HOST_DIR_SYMLINK)
+
+.PHONY: staging-finalize
+staging-finalize:
+	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
+
 .PHONY: target-finalize
-target-finalize: $(PACKAGES)
+target-finalize: $(PACKAGES) host-finalize
 	@$(call MESSAGE,"Finalizing target directory")
 	# Check files that are touched by more than one package
 	./support/scripts/check-uniq-files -t target $(BUILD_DIR)/packages-file-list.txt
@@ -782,7 +779,7 @@ endif
 	touch $(TARGET_DIR)/usr
 
 .PHONY: target-post-image
-target-post-image: $(TARGETS_ROOTFS) target-finalize
+target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	@rm -f $(ROOTFS_COMMON_TAR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
@@ -811,7 +808,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
 .PHONY: legal-info
-legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
+legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all-legal-info) \
 		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
 	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
 	@if [ -r $(LEGAL_WARNINGS) ]; then \
diff --git a/fs/common.mk b/fs/common.mk
index 2a5a202a89..96658428ba 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -145,6 +145,7 @@ $$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
 $$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
 $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
 	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
+	mkdir -p $$(@D)
 	rm -rf $$(ROOTFS_$(2)_DIR)
 	mkdir -p $$(ROOTFS_$(2)_DIR)
 	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ef890981bb..90b3b42731 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -173,6 +173,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call step_start,rsync)
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
+	@mkdir -p $(@D)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $($(PKG)_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS) $(call qstrip,$(SRCDIR))/ $(@D)
@@ -238,6 +239,7 @@ $(BUILD_DIR)/%/.stamp_built::
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
+	@mkdir -p $(HOST_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
@@ -267,6 +269,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
+	@mkdir -p $(STAGING_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
@@ -298,6 +301,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
+	@mkdir -p $(BINARIES_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Installing to images directory")
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
@@ -309,6 +313,7 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
+	@mkdir -p $(TARGET_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(if $(BR2_INIT_SYSTEMD),\
@@ -737,7 +742,7 @@ $$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
 $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
 $$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)
 
-$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
+$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | prepare
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
 
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
