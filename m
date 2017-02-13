From: Lionel Flandrin <lionel@svkt.org>
Date: Mon, 13 Feb 2017 14:59:34 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: add support for full image socfpga
	mkpimage support
In-Reply-To: <20170213135934.32014-1-lionel@svkt.org>
References: <20170130103326.14427-2-lionel@svkt.org>
 <20170213135934.32014-1-lionel@svkt.org>
Message-ID: <20170213135934.32014-2-lionel@svkt.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously only SPL packaging was supported, now we can also wrap the
u-boot-dtb.bin if enabled.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
---
 boot/uboot/Config.in | 18 +++++++++++++++---
 boot/uboot/uboot.mk  | 10 +++++++++-
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1aa2cb7b4..51c0ccc6e 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -343,13 +343,25 @@ config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	  to be set.
 
 config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
-	bool "CRC SPL image for Altera SoC FPGA"
+	bool "CRC image for Altera SoC FPGA (mkpimage)"
 	depends on BR2_arm
-	depends on BR2_TARGET_UBOOT_SPL
+	depends on BR2_TARGET_UBOOT_SPL || BR2_TARGET_UBOOT_FORMAT_DTB_BIN
 	help
-	  Generate SPL image fixed by the mkpimage tool to enable
+	  Pass the U-Boot image through the mkpimage tool to enable
 	  booting on the Altera SoC FPGA based platforms.
 
+	  On some platforms, it's the SPL that needs to be passed
+	  through mkpimage. On some other platforms there is no SPL
+	  because the internal SRAM is big enough to store the full
+	  U-Boot. In this case, it's directly the full U-Boot image
+	  that is passed through mkpimage.
+
+	  Therefore, this option will convert the SPL image defined by
+	  BR2_TARGET_UBOOT_SPL_NAME using mkpimage if
+	  BR2_TARGET_UBOOT_SPL is enabled. Otherwise, it will convert
+	  the full U-Boot image u-boot-dtb.bin if
+	  BR2_TARGET_UBOOT_FORMAT_DTB_BIN is enabled.
+
 menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 	bool "Environment image"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ac3b42e42..1e22eaa8e 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -262,9 +262,17 @@ UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_GENERATE_ZYNQ_IMAGE
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC),y)
+ifeq ($(BR2_TARGET_UBOOT_SPL),y)
+UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = $(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME))
+UBOOT_CRC_ALTERA_SOCFPGA_HEADER_VERSION = 0
+else
+UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES = u-boot-dtb.bin
+UBOOT_CRC_ALTERA_SOCFPGA_HEADER_VERSION = 1
+endif
 define UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
-	$(foreach f,$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)), \
+	$(foreach f,$(UBOOT_CRC_ALTERA_SOCFPGA_INPUT_IMAGES), \
 		$(HOST_DIR)/usr/bin/mkpimage \
+			-v $(UBOOT_CRC_ALTERA_SOCFPGA_HEADER_VERSION) \
 			-o $(BINARIES_DIR)/$(notdir $(call qstrip,$(f))).crc \
 			$(@D)/$(call qstrip,$(f))
 	)
-- 
2.11.0
