From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 24 Apr 2015 15:18:35 -0400
Subject: [Buildroot] [PATCH] uboot: BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR ->
	legacy
Message-ID: <1429903115-29129-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This changes BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR from deprecated to
legacy. The added legacy handling will automatically copy the
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR setting to BR2_TARGET_UBOOT_PATCH,
which should make upgrading configurations easier.

Thanks to Arnout for suggesting the switch to legacy.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 Config.in.legacy     | 15 +++++++++++++++
 boot/uboot/Config.in | 12 ------------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 70a9043..341d006 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,21 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.05"
 
+config BR2_TARGET_UBOOT_PATCH
+	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""
+
+config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
+	string "uboot: the custom patch dir option has been renamed"
+	help
+	  The option BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR has been renamed to
+	  BR2_TARGET_UBOOT_PATCH. Check that your configuration has been updated
+	  correctly and delete this string.
+
+config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR_WRAP
+	bool
+	default y if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""
+	select BR2_LEGACY
+
 config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
 	bool "RTAI patch file path has been removed"
 	help
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 4f01499..acfbf5a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -70,18 +70,6 @@ config BR2_TARGET_UBOOT_VERSION
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
-- 
1.9.1
