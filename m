From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu,  1 Nov 2018 15:02:29 +0100
Subject: [Buildroot] [PATCH 1/3] core: Move per-package host preparation
 into separate step
In-Reply-To: <20181101140231.24380-1-anaumann@ultratronik.de>
References: <20181101140231.24380-1-anaumann@ultratronik.de>
Message-ID: <20181101140231.24380-2-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately, the kconfig infrastructure is running the 'make xxx_defconfig'
step before the configure-step is "officially" started. This is due to
the kconfig_fixup target.
This however requires availability of the toolchain and other prerequisites,
so this patch introduces an intermediate target to prepare the per-package
host dir.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/pkg-generic.mk | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1ebc230129..2cb4582d97 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -223,14 +223,21 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 	$(if $(wildcard $(dir)),,\
 		$(error BR2_GLOBAL_PATCH_DIR contains nonexistent directory $(dir))))
 
-# Configure
-$(BUILD_DIR)/%/.stamp_configured:
-	@$(call step_start,configure)
-	@$(call MESSAGE,"Configuring")
+# Prepare per-package host dir for configure
+$(BUILD_DIR)/%/.stamp_configure_prepared:
+	@$(call step_start,configure_prepared)
+	@$(call MESSAGE,"Prepare per-package host")
 	$(foreach pkg,$($(PKG)_FINAL_DEPENDENCIES),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/host/ \
 		$(PER_PACKAGE_DIR)/$(pkg)/host/ \
 		$(HOST_DIR)$(sep))
+	@$(call step_end,configure_prepared)
+	$(Q)touch $@
+
+# Configure
+$(BUILD_DIR)/%/.stamp_configured:
+	@$(call step_start,configure)
+	@$(call MESSAGE,"Configuring")
 	$(foreach pkg,$($(PKG)_FINAL_DEPENDENCIES),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/target/ \
 		$(PER_PACKAGE_DIR)/$(pkg)/target/ \
@@ -651,6 +658,7 @@ $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
 $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
+$(2)_TARGET_CONFIGURE_PREP =	$$($(2)_DIR)/.stamp_configure_prepared
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
 $(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
 $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
@@ -738,13 +746,14 @@ $(1)-build:		$$($(2)_TARGET_BUILD)
 $$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
 
 # Since $(2)_FINAL_DEPENDENCIES are phony targets, they are always "newer"
-# than $(2)_TARGET_CONFIGURE. This would force the configure step (and
+# than $(2)_TARGET_CONFIGURE_PREP. This would force the configure step (and
 # therefore the other steps as well) to be re-executed with every
 # invocation of make.  Therefore, make $(2)_FINAL_DEPENDENCIES an order-only
 # dependency by using |.
 
 $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
-$$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)
+$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_CONFIGURE_PREP)
+$$($(2)_TARGET_CONFIGURE_PREP): | $$($(2)_FINAL_DEPENDENCIES)
 
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
 $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
@@ -756,7 +765,7 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
 #  extract
 #  patch
 #  configure
-$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_PATCH)
+$$($(2)_TARGET_CONFIGURE_PREP):	$$($(2)_TARGET_PATCH)
 
 $(1)-patch:		$$($(2)_TARGET_PATCH)
 $$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
@@ -794,7 +803,7 @@ else
 
 # Use an order-only dependency so the "<pkg>-clean-for-rebuild" rule
 # can remove the stamp file without triggering the configure step.
-$$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_RSYNC)
+$$($(2)_TARGET_CONFIGURE_PREP): | $$($(2)_TARGET_RSYNC)
 
 $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
 
@@ -865,6 +874,7 @@ $(1)-rebuild:		$(1)-clean-for-rebuild $(1)
 
 $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
 			rm -f $$($(2)_TARGET_CONFIGURE)
+			rm -f $$($(2)_TARGET_CONFIGURE_PREP)
 
 $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)
 
@@ -876,6 +886,7 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):		PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE_PREP):	PKG=$(2)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-- 
2.19.1
