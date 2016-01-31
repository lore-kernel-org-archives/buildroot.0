From: Cam Hutchison <camh@xdna.net>
Date: Sun, 31 Jan 2016 11:48:33 +1100
Subject: [Buildroot] [PATCH 1/1] uboot: Support multiple environment source
	files
Message-ID: <1454201313-17766-1-git-send-email-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow multiple file names to be listed in
BR2_TARGET_UBOOT_ENVIMAGE_SOURCE, concatenating them in the order
listed.

This allows the bulk of the environment to be shared across multiple
boards using a common environment file with board-specific values
supplied in a secondary environment source file.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 boot/uboot/Config.in | 8 ++++++--
 boot/uboot/uboot.mk  | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index dde4710..04c36bc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -349,9 +349,13 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 if BR2_TARGET_UBOOT_ENVIMAGE
 
 config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
-	string "Source file for environment"
+	string "Source files for environment"
 	help
-	  Text file describing the environment.
+	  Text files describing the environment. Files should have
+	  lines of the form var=value, one per line. Blank lines
+	  and lines starting with a # are ignored.
+
+	  Multiple source files are concatenated in the order listed.
 
 config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
 	string "Size of environment"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d539b31..515b1ea 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -171,9 +171,10 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		cp -dpf $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) $(BINARIES_DIR)/)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
+		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
 		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
-		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
+		-o $(BINARIES_DIR)/uboot-env.bin -)
 endef
 
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
-- 
2.1.4
