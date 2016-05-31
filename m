From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 22:59:35 +0200
Subject: [Buildroot] [git commit] uboot: Support multiple environment source
	files
Message-ID: <20160601161312.A4DB7802A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0542bb79e823505a730b6a2c2f01b33b6293cf03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow multiple file names to be listed in
BR2_TARGET_UBOOT_ENVIMAGE_SOURCE, concatenating them in the order
listed.

This allows the bulk of the environment to be shared across multiple
boards using a common environment file with board-specific values
supplied in a secondary environment source file.

Signed-off-by: Cam Hutchison <camh@xdna.net>
[Thomas: adjust indentation in the .mk file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 8 ++++++--
 boot/uboot/uboot.mk  | 7 ++++---
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 21f9abd..9ffbb51 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -348,9 +348,13 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 if BR2_TARGET_UBOOT_ENVIMAGE
 
 config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
-	string "Source file for environment"
+	string "Source files for environment"
 	help
-	  Text file describing the environment.
+	  Text files describing the environment. Files should have
+	  lines of the form var=value, one per line. Blank lines and
+	  lines starting with a # are ignored.
+
+	  Multiple source files are concatenated in the order listed.
 
 config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
 	string "Size of environment"
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index e071303..3b2a230 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -165,9 +165,10 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		cp -dpf $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) $(BINARIES_DIR)/)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
-		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
-		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
-		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
+		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
+			$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
+			-o $(BINARIES_DIR)/uboot-env.bin -)
 endef
 
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
