From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 13:48:42 +0200
Subject: [Buildroot] [git commit] boot/uboot: add support for i.MX28 NAND
	format
Message-ID: <20150711115946.0BD6281612@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4dd4b9ace58b2606b35b36a784a02283dace42f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in |   57 ++++++++++++++++++++++++++++++++++++++++++++++++++
 boot/uboot/uboot.mk  |   12 ++++++++++
 2 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index e884cc0..fa1741c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -142,6 +142,63 @@ config BR2_TARGET_UBOOT_FORMAT_SD
 
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
index 8c10c61..2cfff28 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -58,6 +58,10 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_SD),y)
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
@@ -133,6 +137,12 @@ define UBOOT_BUILD_CMDS
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
@@ -142,6 +152,8 @@ endef
 
 define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
+	$(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
+		cp -dpf $(@D)/$(UBOOT_MAKE_TARGET) $(BINARIES_DIR))
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		cp -dpf $(@D)/$(call qstrip,$(BR2_TARGET_UBOOT_SPL_NAME)) $(BINARIES_DIR)/)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
