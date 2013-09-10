From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 10 Sep 2013 09:46:03 +0200
Subject: [Buildroot] [PATCH v3 2/3] pkg-generic: fix rules for top-level
	parallel make
In-Reply-To: <1378799164-28645-1-git-send-email-fabio.porcedda@gmail.com>
References: <1378799164-28645-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1378799164-28645-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be able to use top-level parallel make we must don't depend in a rule
on the order of evaluation of the prerequisites, so instead of reling on
the left to right ordering of evaluation of the prerequisites add
an explicit rule to describe the dependencies.

So add explicit dependencies for the following stamp files:
   %/.stamp_extracted
   %/.stamp_patched
   %/.stamp_configured
   %/.stamp_built
   %/.stamp_host_installed
   %/.stamp_staging_installed
   %/.stamp_images_installed
   %/.stamp_target_installed

Because the %-build target is not anymore part of the dependcy chain,
add a new variable <pkgname>_BUILD_DEPENDENCIES to be used instead.
This new variable is used only by the uclibc package for building
the toolchain.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-generic.mk   | 45 +++++++++++++++++++++------------------------
 package/uclibc/uclibc.mk |  2 +-
 2 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4dd395b..5ea41ff 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -53,7 +53,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 endif
 
 # Unpack the archive
-$(BUILD_DIR)/%/.stamp_extracted:
+$(BUILD_DIR)/%/.stamp_extracted: $(BUILD_DIR)/%/.stamp_downloaded
 	@$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
@@ -88,7 +88,7 @@ endif
 # prefix of the patches
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)
-$(BUILD_DIR)/%/.stamp_patched:
+$(BUILD_DIR)/%/.stamp_patched: $(BUILD_DIR)/%/.stamp_extracted
 	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
@@ -115,21 +115,21 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(Q)touch $@
 
 # Build
-$(BUILD_DIR)/%/.stamp_built::
+$(BUILD_DIR)/%/.stamp_built:	$(BUILD_DIR)/%/.stamp_configured
 	@$(call MESSAGE,"Building")
 	$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Install to host dir
-$(BUILD_DIR)/%/.stamp_host_installed:
+$(BUILD_DIR)/%/.stamp_host_installed:		$(BUILD_DIR)/%/.stamp_built
 	@$(call MESSAGE,"Installing to host directory")
 	$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Install to staging dir
-$(BUILD_DIR)/%/.stamp_staging_installed:
+$(BUILD_DIR)/%/.stamp_staging_installed:	$(BUILD_DIR)/%/.stamp_built
 	@$(call MESSAGE,"Installing to staging directory")
 	$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
@@ -143,14 +143,14 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(Q)touch $@
 
 # Install to images dir
-$(BUILD_DIR)/%/.stamp_images_installed:
+$(BUILD_DIR)/%/.stamp_images_installed:		$(BUILD_DIR)/%/.stamp_built
 	@$(call MESSAGE,"Installing to images directory")
 	$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
 # Install to target dir
-$(BUILD_DIR)/%/.stamp_target_installed:
+$(BUILD_DIR)/%/.stamp_target_installed:		$(BUILD_DIR)/%/.stamp_built
 	@$(call MESSAGE,"Installing to target")
 	$(if $(BR2_INIT_SYSTEMD),\
 		$($(PKG)_INSTALL_INIT_SYSTEMD))
@@ -308,6 +308,7 @@ $(2)_REDISTRIBUTE		?= YES
 
 
 $(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+$(2)_BUILD_DEPENDENCIES		?=
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
@@ -359,30 +360,29 @@ $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
 endif
 
 ifeq ($$($(2)_INSTALL_TARGET),YES)
-$(1)-install-target:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_TARGET)
+$(1)-install-target:	$$($(2)_TARGET_INSTALL_TARGET)
 else
 $(1)-install-target:
 endif
 
 ifeq ($$($(2)_INSTALL_STAGING),YES)
-$(1)-install-staging:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_STAGING)
+$(1)-install-staging:	$$($(2)_TARGET_INSTALL_STAGING)
 else
 $(1)-install-staging:
 endif
 
 ifeq ($$($(2)_INSTALL_IMAGES),YES)
-$(1)-install-images:	$(1)-build \
-			$$($(2)_TARGET_INSTALL_IMAGES)
+$(1)-install-images:	$$($(2)_TARGET_INSTALL_IMAGES)
 else
 $(1)-install-images:
 endif
 
-$(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
+$(1)-install-host:      $$($(2)_TARGET_INSTALL_HOST)
 
-$(1)-build:		$(1)-configure \
-			$$($(2)_TARGET_BUILD)
+$$($(2)_TARGET_BUILD):	| $$($(2)_BUILD_DEPENDENCIES)
+$(1)-build:		$$($(2)_TARGET_BUILD)
+
+$(1)-configure:		$$($(2)_TARGET_CONFIGURE)
 
 ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 # In the normal case (no package override), the sequence of steps is
@@ -391,13 +391,11 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 #  extract
 #  patch
 #  configure
-$(1)-configure:		$(1)-patch $(1)-depends \
-			$$($(2)_TARGET_CONFIGURE)
+$$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES) $$($(2)_TARGET_PATCH)
 
-$(1)-patch:		$(1)-extract $$($(2)_TARGET_PATCH)
+$(1)-patch:		$$($(2)_TARGET_PATCH)
 
-$(1)-extract:		$(1)-source \
-			$$($(2)_TARGET_EXTRACT)
+$(1)-extract:		$$($(2)_TARGET_EXTRACT)
 
 $(1)-depends:		$$($(2)_DEPENDENCIES)
 
@@ -407,10 +405,9 @@ else
 #  source, by rsyncing
 #  depends
 #  configure
-$(1)-configure:		$(1)-depends \
-			$$($(2)_TARGET_CONFIGURE)
+$$($(2)_TARGET_CONFIGURE):	| $$($(2)_DEPENDENCIES) $$($(2)_TARGET_RSYNC)
 
-$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
+$(1)-depends:		$$($(2)_DEPENDENCIES)
 
 $(1)-patch:		$(1)-rsync
 $(1)-extract:		$(1)-rsync
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 39877bb..b960f59 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -23,7 +23,7 @@ UCLIBC_INSTALL_STAGING = YES
 UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
 
 # Before uClibc is built, we must have the second stage cross-compiler
-uclibc-build: host-gcc-intermediate
+UCLIBC_BUILD_DEPENDENCIES = host-gcc-intermediate
 
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
-- 
1.8.4
