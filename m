From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 15 Jul 2014 15:26:34 -0300
Subject: [Buildroot] [PATCH] u-boot: Allow to specify a list of patches
Message-ID: <1405448794-10517-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's often desirable to specify a list of patches, in addition to the current
support to pass a directory full of uboot-*.patch files. This matches the
option currently available for specifying Linux patches, except this commit
doesn't add the URL option. Relying on URLs is fragile and makes a build hard
to reproduce.

U-Boot is as special as Linux, in the sense that it needs to be customized more
often than not, so having a flexible mechanism is useful.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 Config.in.legacy     | 14 ++++++++++++++
 boot/uboot/Config.in | 11 ++++++-----
 boot/uboot/uboot.mk  | 12 ++++++++----
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 23962a2..7fd8b9c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -248,6 +248,20 @@ config BR2_PACKAGE_LIBV4L_V4L2_DBG
 	  This libv4l option has been deprecated and replaced by a single
 	  option to build all the libv4l utilities.
 
+config BR2_TARGET_UBOOT_PATCH
+	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""
+
+config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
+	string "u-boot: the patches list option has been renamed"
+	help
+	  The option BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR has been renamed to
+	  BR2_TARGET_UBOOT_PATCH.
+
+config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR_WRAP
+	bool
+	default y if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""
+	select BR2_LEGACY
+
 ###############################################################################
 comment "Legacy options removed in 2014.05"
 
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 0f98d7f..ec7095a 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -70,12 +70,13 @@ config BR2_TARGET_UBOOT_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
-config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
-	string "custom patch dir"
+config BR2_TARGET_UBOOT_PATCH
+	string "Custom U-Boot patches"
 	help
-	  If your board requires custom patches, add the path to the
-	  directory containing the patches here. The patches must be
-	  named uboot-<something>.patch.
+	  A space-separated list of patches to be applied.
+	  Each patch can be described as a local file path, or a directory.
+	  In the case of a directory, all files matching uboot-*.patch in
+	  the directory will be applied.
 
 	  Most users may leave this empty
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 532ac8b..753bccb 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -85,14 +85,18 @@ endef
 
 UBOOT_POST_EXTRACT_HOOKS += UBOOT_COPY_OLD_LICENSE_FILE
 
-ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
+UBOOT_PATCHES = $(call qstrip,$(BR2_TARGET_UBOOT_PATCH))
 define UBOOT_APPLY_CUSTOM_PATCHES
-	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) \
-		uboot-\*.patch
+	for p in $(UBOOT_PATCHES) ; do \
+		if test -d $$p ; then \
+			support/scripts/apply-patches.sh $(@D) $$p uboot-\*.patch ; \
+		else \
+			support/scripts/apply-patches.sh $(@D) `dirname $$p` `basename $$p` ; \
+		fi \
+	done
 endef
 
 UBOOT_POST_PATCH_HOOKS += UBOOT_APPLY_CUSTOM_PATCHES
-endif
 
 define UBOOT_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(UBOOT_CONFIGURE_OPTS) 	\
-- 
1.9.1
