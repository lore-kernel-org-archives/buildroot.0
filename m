From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 22:47:47 +0100
Subject: [Buildroot] [git commit] uboot: remove deprecated
	BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR option
Message-ID: <20160315214849.456187FCCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21b25d28fc7af3bb1b2c55e4a46e0d067ebc0081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been deprecated for a year now so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy     |  7 +++++++
 boot/uboot/Config.in | 12 ------------
 boot/uboot/uboot.mk  | 10 ----------
 3 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8a067dd..8cae3b2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
+	bool "uboot custom patch dir removed"
+	select BR2_LEGACY
+	help
+	  The uboot custom patch directory option has been removed. Use
+	  the improved BR2_TARGET_UBOOT_PATCH option instead.
+
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_VOID
 	bool "xf86-input-void removed"
 	select BR2_LEGACY
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f1d3d2a..0e79734 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -90,18 +90,6 @@ config BR2_TARGET_UBOOT_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
-config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
-	string "custom patch dir"
-	depends on BR2_DEPRECATED_SINCE_2015_05
-	help
-	  If your board requires custom patches, add the path to the
-	  directory containing the patches here. The patches must be
-	  named uboot-<something>.patch.
-
-	  Most users may leave this empty
-
-	  NOTE: Use BR2_TARGET_UBOOT_PATCH instead.
-
 config BR2_TARGET_UBOOT_PATCH
 	string "Custom U-Boot patches"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d539b31..f9a3ff8 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -100,16 +100,6 @@ endef
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 UBOOT_POST_RSYNC_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
-# Prior to Buildroot 2015.05, only patch directories were supported. New
-# configurations use BR2_TARGET_UBOOT_PATCH instead.
-ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
-define UBOOT_APPLY_CUSTOM_PATCHES
-	$(APPLY_PATCHES) $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \*.patch
-endef
-
-UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
-endif
-
 # Analogous code exists in linux/linux.mk. Basically, the generic
 # package infrastructure handles downloading and applying remote
 # patches. Local patches are handled depending on whether they are
