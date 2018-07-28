From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 16:32:07 +0200
Subject: [Buildroot] [git commit] uboot: zynqmp: generate SPL image with
 PMUFW binary
Message-ID: <20180728172842.9403D8A57B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e865a1f03c7c68b711a2d754cf8ffa3a168082b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to boot on the Xilinx ZynqMP SoCs, U-Boot SPL requires a
recent PMU firmware loaded. Instruct U-Boot to add pmufw.bin to the
boot.bin file together with U-Boot SPL, and the boot ROM will load
both.

For this to work properly, a patch to U-Boot is needed. However this
patch must be applied by each defconfig that wishes to use
BR2_TARGET_UBOOT_ZYNQMP_PMUFW. If it were in boot/uboot/ to be applied
unconditionally, it would break the build for configs using a U-Boot
version higher than 2018.7-rc1 where the patch is already applied.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Joel Carlson <joelsoncarl@gmail.com>
Reviewed-by: Joel Carlson <JoelsonCarl@gmail.com>
Tested-by: Joel Carlson <JoelsonCarl@gmail.com>
[Thomas:
 - indicate that this feature requires U-Boot 2018.07, since commit
   c7df098a71e05dc81cee818747759e8060b59626 is needed.
 - define UBOOT_ZYNQMP_KCONFIG_PMUFW only once, and instead use a
   variable named UBOOT_ZYNQMP_PMUFW_PATH to store the path to the PMU
   firmware]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...p-accept-an-absolute-path-for-PMUFW_INIT_.patch | 68 ++++++++++++++++++++++
 boot/uboot/Config.in                               | 31 ++++++++++
 boot/uboot/uboot.mk                                | 23 ++++++++
 3 files changed, 122 insertions(+)

diff --git a/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch b/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
new file mode 100644
index 0000000000..95ab7b3b75
--- /dev/null
+++ b/board/zynqmp/patches/uboot/0003-arm64-zynqmp-accept-an-absolute-path-for-PMUFW_INIT_.patch
@@ -0,0 +1,68 @@
+From c7df098a71e05dc81cee818747759e8060b59626 Mon Sep 17 00:00:00 2001
+From: Luca Ceresoli <luca@lucaceresoli.net>
+Date: Mon, 4 Jun 2018 12:21:01 +0200
+Subject: [PATCH] arm64: zynqmp: accept an absolute path for PMUFW_INIT_FILE
+
+The value of PMUFW_INIT_FILE is prefixed with "$(srctree)/", thus
+forcing it to be a relative path inside the U-Boot source tree. Since
+the PMUFW is a binary file generated outside of U-Boot, the PMUFW
+binary must be copied inside the U-Boot source tree before the
+build.
+
+This generates a few problems:
+
+ * if the source tree is shared among different out-of-tree builds,
+   they will pollute (and potentially corrupt) each other
+ * the source tree cannot be read-only
+ * any buildsystem must add a command to copy the PMUFW binary
+ * putting an externally-generated binary in the source tree is ugly
+   as hell
+
+Avoid these problems by accepting an absolute path for
+PMUFW_INIT_FILE. This would be as simple as removing the "$(srctree)/"
+prefix, but in order to keep backward compatibility we rather use the
+shell and readlink to get the absolute path even when starting from a
+relative path.
+
+Since 'readlink -f' produces an empty string if the file does not
+exist, we also add a check to ensure the file configured in
+PMUFW_INIT_FILE exists. Otherwise the build would exit successfully,
+but produce a boot.bin without PMUFW as if PMUFW_INIT_FILE were empty.
+
+Tested in the 12 possible combinations of:
+ - PMUFW_INIT_FILE empty, relative, absolute, non-existing
+ - building in-tree, in subdir, in other directory
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+Cc: Michal Simek <michal.simek@xilinx.com>
+Cc: Simon Glass <sjg@chromium.org>
+Cc: Emmanuel Vadot <manu@bidouilliste.com>
+Signed-off-by: Michal Simek <michal.simek@xilinx.com>
+Backported from upstream: https://git.denx.de/?p=u-boot.git;a=commit;h=c7df098a71e05dc81cee818747759e8060b59626
+---
+ scripts/Makefile.spl | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/Makefile.spl b/scripts/Makefile.spl
+index ef018b5b4056..252f13826d4c 100644
+--- a/scripts/Makefile.spl
++++ b/scripts/Makefile.spl
+@@ -167,8 +167,14 @@ ifdef CONFIG_ARCH_ZYNQ
+ MKIMAGEFLAGS_boot.bin = -T zynqimage -R $(srctree)/$(CONFIG_BOOT_INIT_FILE)
+ endif
+ ifdef CONFIG_ARCH_ZYNQMP
++ifneq ($(CONFIG_PMUFW_INIT_FILE),"")
++spl/boot.bin: zynqmp-check-pmufw
++zynqmp-check-pmufw: FORCE
++	( cd $(srctree) && test -r $(CONFIG_PMUFW_INIT_FILE) ) \
++		|| ( echo "Cannot read $(CONFIG_PMUFW_INIT_FILE)" && false )
++endif
+ MKIMAGEFLAGS_boot.bin = -T zynqmpimage -R $(srctree)/$(CONFIG_BOOT_INIT_FILE) \
+-	-n $(srctree)/$(CONFIG_PMUFW_INIT_FILE)
++	-n "$(shell cd $(srctree); readlink -f $(CONFIG_PMUFW_INIT_FILE))"
+ endif
+ 
+ spl/boot.bin: $(obj)/u-boot-spl.bin FORCE
+-- 
+2.7.4
+
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f0166e382b..124991d20b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -368,6 +368,37 @@ config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	  for u-boot-dtb.img file so this U-Boot format is required
 	  to be set.
 
+config BR2_TARGET_UBOOT_ZYNQMP
+	bool "Boot on the Xilinx ZynqMP SoCs"
+	depends on BR2_aarch64
+	help
+	  Enable options specific to the Xilinx ZynqMP family of SoCs.
+
+if BR2_TARGET_UBOOT_ZYNQMP
+
+config BR2_TARGET_UBOOT_ZYNQMP_PMUFW
+	string "PMU firmware location"
+	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
+	help
+	  Location of a PMU firmware binary.
+
+	  If not empty, instructs the U-Boot build process to generate
+	  a boot.bin (to be loaded by the ZynqMP boot ROM) containing
+	  both the U-Boot SPL and the PMU firmware in the
+	  Xilinx-specific boot format.
+
+	  The value can be an absolute or relative path, and will be
+	  used directly from where it is located, or an URI
+	  (e.g. http://...), and it will be downloaded and used from
+	  the download directory.
+
+	  If empty, the generated boot.bin will not contain a PMU
+	  firmware.
+
+	  This feature requires U-Boot >= 2018.07.
+
+endif
+
 config BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC
 	bool "CRC image for Altera SoC FPGA (mkpimage)"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index bf227f2893..d9c9b72e76 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -287,6 +287,25 @@ define UBOOT_INSTALL_IMAGES_CMDS
 			$(BINARIES_DIR)/boot.scr)
 endef
 
+ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
+
+UBOOT_ZYNQMP_PMUFW = $(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PMUFW))
+
+ifneq ($(findstring ://,$(UBOOT_ZYNQMP_PMUFW)),)
+UBOOT_EXTRA_DOWNLOADS += $(UBOOT_ZYNQMP_PMUFW)
+BR_NO_CHECK_HASH_FOR += $(notdir $(UBOOT_ZYNQMP_PMUFW))
+UBOOT_ZYNQMP_PMUFW_PATH = $(UBOOT_DL_DIR)/$(notdir $(UBOOT_ZYNQMP_PMUFW))
+else ifneq ($(UBOOT_ZYNQMP_PMUFW),)
+UBOOT_ZYNQMP_PMUFW_PATH = $(shell readlink -f $(UBOOT_ZYNQMP_PMUFW))
+endif
+
+define UBOOT_ZYNQMP_KCONFIG_PMUFW
+	$(call KCONFIG_SET_OPT,CONFIG_PMUFW_INIT_FILE,"$(UBOOT_ZYNQMP_PMUFW_PATH)", \
+	       $(@D)/.config)
+endef
+
+endif # BR2_TARGET_UBOOT_ZYNQMP
+
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
 	cp -dpf $(@D)/$(UBOOT_BIN_IFT) $(BINARIES_DIR)/
 endef
@@ -336,6 +355,10 @@ UBOOT_DEPENDENCIES += host-mkpimage
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_CRC_ALTERA_SOCFPGA_IMAGE
 endif
 
+define UBOOT_KCONFIG_FIXUP_CMDS
+	$(UBOOT_ZYNQMP_KCONFIG_PMUFW)
+endef
+
 ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
 ifeq ($(BR_BUILDING),y)
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
