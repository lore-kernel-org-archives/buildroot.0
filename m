From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 23:43:21 +0100
Subject: [Buildroot] [git commit] boot/uboot: compute CRC on SPLs for Altera
	SoC FPGA
Message-ID: <20160322225028.1B9FD80458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39a91b282608c3b22437bc0c74c235ddd77229d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
[Thomas: add Altera in the option name and description, drop reference
to Go being needed and to Maxime Hadjinlian's version of mkpimage
since a C version is now used.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 0e79734..a6b9f17 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -326,6 +326,14 @@ config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	  for u-boot-dtb.img file so this U-Boot format is required
 	  to be set.
 
+config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
+	bool "CRC SPL image for Altera SoC FPGA"
+	depends on BR2_arm
+	depends on BR2_TARGET_UBOOT_SPL
+	help
+	  Generate SPL image fixed by the mkpimage tool to enable
+	  booting on the Altera SoC FPGA based platforms.
+
 menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 	bool "Environment image"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index f9a3ff8..3c96259 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -194,6 +194,15 @@ UBOOT_DEPENDENCIES += host-zynq-boot-bin
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC),y)
+define UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
+	$(HOST_DIR)/usr/bin/mkpimage -o $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))).crc \
+		$(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
+endef
+UBOOT_DEPENDENCIES += host-mkpimage
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
