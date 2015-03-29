From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 29 Mar 2015 18:10:46 +0200
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add support for i.MX28 NAND
	format
Message-ID: <1427645447-2419-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow to generate 'u-boot.nand', Freescale i.MX28 BootStream format (.sb)
with a header for booting from NAND flash.

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

Commit Note: This patch is based on top of
"[PATCH v2 1/2] boot/uboot: add support for i.MX28 SD format"
http://patchwork.ozlabs.org/patch/453116/

---
Changes v1 -> v2 (all suggested by Arnout Vandecappelle):
  - Rebase on top of boot/uboot: add support for i.MX28 SD format
    http://patchwork.ozlabs.org/patch/453116/
  - Remove trailing whitespace
  - Fix typo and wrapping
  - Add an explanation like in the commit log to the help text, so the user
    knows why he gets two images (u-boot.nand and u-boot.sb) in the binaries
    directory
  - Explicitly mention in mxsboots options help text that the value has to
    be "a decimal integer value"
  - erase -> eraseblock in BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE
  - Add dependency on host-elftosb

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vincent Stehl? <vincent.stehle@freescale.com>
---
 boot/uboot/Config.in | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  | 12 +++++++++++
 2 files changed, 69 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 3f39ee8..1b3c17c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -129,6 +129,63 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
 	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
 
+config BR2_TARGET_UBOOT_FORMAT_NAND
+	depends on BR2_arm
+	bool "u-boot.nand"
+	help
+	  This is Freescale i.MX28 BootStream format (.sb), with a header
+	  for booting from a NAND flash.
+
+	  U-boot includes an mxsboot tool to generate this format,
+	  starting from 2011.12.
+
+	  There are two possibilities when preparing an image writable to
+	  NAND flash:
+	  1) The NAND was not written at all yet or the BCB (Boot Control
+	  Blocks) is broken. In this case, the NAND image 'u-boot.nand'
+	  needs to written.
+	  2) The NAND flash was already written with a good BCB. This
+	  applies after 'u-boot.nand' was correctly written. There is no
+	  need to write the BCB again. In this case, the bootloader can be
+	  upgraded by writing 'u-boot.sb'.
+
+	  To satisfy both cases, the 'u-boot.nand' image obtained from
+	  mxsboot as well as the U-Boot make target 'u-boot.sb' are copied
+	  to the binaries directory.
+
+	  See doc/README.mxs (or doc/README.mx28_common before 2013.07)
+
+if BR2_TARGET_UBOOT_FORMAT_NAND
+
+config BR2_TARGET_UBOOT_FORMAT_NAND_PAGE_SIZE
+	int "NAND page size"
+	default 2048
+	help
+	  The NAND page size of the targets NAND flash in bytes as a
+	  decimal integer value.
+
+	  The value provided here is passed to the -w option of mxsboot.
+
+config BR2_TARGET_UBOOT_FORMAT_NAND_OOB_SIZE
+	int "NAND OOB size"
+	default 64
+	help
+	  The NAND OOB size of the targets NAND flash in bytes as a
+	  decimal integer value.
+
+	  The value provided here is passed to the -o option of mxsboot.
+
+config BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE
+	int "NAND erase size"
+	default 131072
+	help
+	  The NAND eraseblock size of the targets NAND flash in bytes as
+	  a decimal integer value.
+
+	  The value provided here is passed to the -e option of mxsboot.
+
+endif
+
 config BR2_TARGET_UBOOT_FORMAT_CUSTOM
 	bool "Custom (specify below)"
 	help
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 630619a..d9f4398 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -54,6 +54,10 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SD),y)
 UBOOT_BIN = u-boot.sd
 UBOOT_MAKE_TARGET = u-boot.sb
 UBOOT_DEPENDENCIES += host-elftosb
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND),y)
+UBOOT_BIN = u-boot.nand
+UBOOT_MAKE_TARGET = u-boot.sb
+UBOOT_DEPENDENCIES += host-elftosb
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_CUSTOM),y)
 UBOOT_BIN = $(call qstrip,$(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME))
 else
@@ -123,6 +127,12 @@ define UBOOT_BUILD_CMDS
 		$(UBOOT_MAKE_TARGET)
 	$(if $(BR2_TARGET_UBOOT_FORMAT_SD),
 		$(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)
+	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
+		$(@D)/tools/mxsboot \
+			-w $(BR2_TARGET_UBOOT_FORMAT_NAND_PAGE_SIZE)	\
+			-o $(BR2_TARGET_UBOOT_FORMAT_NAND_OOB_SIZE)	\
+			-e $(BR2_TARGET_UBOOT_FORMAT_NAND_ERASE_SIZE)	\
+			nand $(@D)/u-boot.sb $(@D)/u-boot.nand)
 endef
 
 define UBOOT_BUILD_OMAP_IFT
@@ -132,6 +142,8 @@ endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
+	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
+		cp -dpf $(@D)/$(UBOOT_MAKE_TARGET) $(BINARIES_DIR))
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		cp -dpf $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) $(BINARIES_DIR)/)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
-- 
2.3.4
