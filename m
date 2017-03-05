From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:28:21 +0100
Subject: [Buildroot] [git commit] u-boot: add support for full image socfpga
	mkpimage
Message-ID: <20170305214312.E6AF5822B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ee5978a91ba905340196136e13ed223277bb209
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On older SoCFPGA SoCs, there was not enough SRAM to fit the entire
U-Boot, so a SPL model was used. The SPL was therefore the binary that
had to be "prepared" to be loaded by the ROM code using the mkpimage
tool.

With newer SoCFPGA SoCs, there is enough SRAM to fit the entire U-Boot,
and therefore the ROM code directly loads U-Boot. In this case, it's the
real U-Boot image (not the SPL) that needs to be prepared using
mkpimage.

This code adds support for the newer SoCFPGA SoCs, by adjusting the
mkpimage related logic to apply on the SPL if an SPL is enabled, or on
the full U-Boot image otherwise.

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 22 +++++++++++++++++++---
 boot/uboot/uboot.mk  | 10 +++++++++-
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1aa2cb7..5601e01 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -343,13 +343,29 @@ config BR2_TARGET_UBOOT_ZYNQ_IMAGE
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
+	  If BR2_TARGET_UBOOT_SPL is enabled then
+	  BR2_TARGET_UBOOT_SPL_NAME is converted by mkpimage using
+	  header version 0.
+
+	  Otherwise the full u-boot-dtb.bin is converted using
+	  mkpimage header version 1.
+
+	  In either case the resulting file will be given a .crc
+	  extension.
+
 menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 	bool "Environment image"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ac3b42e..1e22eaa 100644
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
