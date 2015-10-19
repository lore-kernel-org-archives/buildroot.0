From: Jan Viktorin <viktorin@rehivetech.com>
Date: Mon, 19 Oct 2015 18:24:52 +0200
Subject: [Buildroot] [PATCH 2/4] boot/uboot: compute CRC on SPLs for Altera
	SoC FPGA
In-Reply-To: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
References: <1445271894-22553-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1445271894-22553-3-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 boot/uboot/Config.in | 10 ++++++++++
 boot/uboot/uboot.mk  |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 8643dab..b2a69f3 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -338,6 +338,16 @@ config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	 for u-boot-dtb.img file so this U-Boot format is required
 	 to be set.
 
+config BR2_TARGET_UBOOT_SOCFPGA_IMAGE_CRC
+	bool "CRC SPL image for SoC FPGA"
+	depends on BR2_arm
+	depends on BR2_TARGET_UBOOT_SPL
+	help
+	  Generate SPL image fixed by the mkpimage tool to enable
+	  booting on the SoC FPGA based platforms. The tool is
+	  available at https://github.com/maximeh/mkpimage.
+	  It requires a Go language compiler installed on your host.
+
 menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 	bool "Environment image"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 66e728f..8b32154 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -215,6 +215,15 @@ UBOOT_DEPENDENCIES += host-zynq-boot-bin
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_SOCFPGA_IMAGE_CRC),y)
+define UBOOT_CRC_SOCFPGA_IMAGE
+	$(HOST_DIR)/usr/bin/mkpimage -o $(BINARIES_DIR)/$(notdir $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))).crc \
+		$(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
+endef
+UBOOT_DEPENDENCIES += host-mkpimage
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_CRC_SOCFPGA_IMAGE
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
-- 
2.6.1
