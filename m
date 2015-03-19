From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 19 Mar 2015 10:02:56 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add support for i.MX28 NAND
	format
Message-ID: <1426755776-25244-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow to generate 'u-boot.nand', Freescale i.MX28 SB format with a header
for booting from NAND flash.

There are two possibilities when preparing an image writable to NAND flash:
1) The NAND was not written at all yet or the BCB (Boot Control Blocks) is
   broken. In this case, the NAND image 'u-boot.nand' needs to written.
2) The NAND flash was already written with a good BCB. This applies after
   'u-boot.nand' was correctly written. There is no need to write the BCB
   again. In this case, the bootloader can be upgraded by writing 'u-boot.sb'.

To satisfy both cases 'u-boot.nand' as well as the make target 'u-boot.sb' are
copied to the binaries directory. 

mxsboot for NAND images needs all three parameters typed in as integer values
(hex values do not work). The default values choosen are typical sizes for a
NAND flash.

For more information see:
http://www.denx-cs.de/doku/?q=m28evkrunuboot

This patch is motivated by
"[PATCH 1/2] boot/uboot: add support for i.MX28 SD format"
http://patchwork.ozlabs.org/patch/451565/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 boot/uboot/Config.in | 43 +++++++++++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  | 11 +++++++++++
 2 files changed, 54 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 03e6acc..aaf9dc6 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -117,6 +117,49 @@ config BR2_TARGET_UBOOT_FORMAT_SB
 	depends on BR2_arm
 	bool "u-boot.sb"
 
+config BR2_TARGET_UBOOT_FORMAT_NAND
+	depends on BR2_arm
+	bool "u-boot.nand"
+	help
+	  This is Freescale i.MX28 SB format, with a header for booting from an
+	  NAND flash.
+
+	  U-boot includes an mxsboot tool to generate this format, starting
+	  from v2011.12.
+
+	  See doc/README.mxs.
+
+if BR2_TARGET_UBOOT_FORMAT_NAND
+
+config BR2_TARGET_UBOOT_FORMAT_NAND_PAGE_SIZE
+	int "NAND page size"
+	default 2048
+	help
+	  The NAND page size of the targets NAND flash in bytes and as an
+	  integer value.
+
+	  The value provided here is passed to the -w option of mxsboot.
+
+config BR2_TARGET_UBOOT_FORMAT_NAND_OOB_SIZE
+	int "NAND OOB size"
+	default 64
+	help
+	  The NAND OOB size of the targets NAND flash in bytes and as an
+	  integer value.
+
+	  The value provided here is passed to the -o option of mxsboot.
+
+config BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE
+	int "NAND erase size"
+	default 131072
+	help
+	  The NAND erase size of the targets NAND flash in bytes and as an
+	  integer value.
+
+	  The value provided here is passed to the -e option of mxsboot.
+
+endif
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	bool "Custom (specify below)"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a9ba054..15c5a84 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -49,6 +49,9 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SB),y)
 UBOOT_BIN = u-boot.sb
 UBOOT_MAKE_TARGET = $(UBOOT_BIN)
 UBOOT_DEPENDENCIES += host-elftosb
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND),y)
+UBOOT_BIN = u-boot.nand
+UBOOT_MAKE_TARGET = u-boot.sb
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BIN = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 else
@@ -116,6 +119,12 @@ define UBOOT_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
 		$(UBOOT_MAKE_TARGET)
+	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
+		$(@D)/tools/mxsboot \
+			-w $(BR2_TARGET_UBOOT_FORMAT_NAND_PAGE_SIZE)	\
+			-o $(BR2_TARGET_UBOOT_FORMAT_NAND_OOB_SIZE)	\
+			-e $(BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE)	\
+			nand $(@D)/u-boot.sb $(@D)/u-boot.nand)
 endef
 
 define UBOOT_BUILD_OMAP_IFT
@@ -125,6 +134,8 @@ endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
+	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
+		cp -dpf $(@D)/$(UBOOT_MAKE_TARGET) $(BINARIES_DIR))
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		cp -dpf $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) $(BINARIES_DIR)/)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
-- 
2.3.3
