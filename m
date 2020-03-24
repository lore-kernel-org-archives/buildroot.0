From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 21:23:33 +0100
Subject: [Buildroot] [git commit] configs/freescale_imx7dsabresd: bump BSP
 components to 4.19.35_1.1.0
Message-ID: <20200324201037.71519880C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3dd443478f6591c02d2266bb12907236654f6d2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also dropped uboot patch accepted upstream in v2018.05 in
commit f916757300c15aa1a3f0ccc98e7abb8a84c97da0

Tested-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...distinct-pre-processed-mkimage-config-fil.patch | 89 ----------------------
 configs/freescale_imx7dsabresd_defconfig           | 11 +--
 2 files changed, 4 insertions(+), 96 deletions(-)

diff --git a/board/freescale/imx7dsdb/patches/uboot/0001-imx-Create-distinct-pre-processed-mkimage-config-fil.patch b/board/freescale/imx7dsdb/patches/uboot/0001-imx-Create-distinct-pre-processed-mkimage-config-fil.patch
deleted file mode 100644
index b8989cb965..0000000000
--- a/board/freescale/imx7dsdb/patches/uboot/0001-imx-Create-distinct-pre-processed-mkimage-config-fil.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 27a2cd6a1980adf3002412678c8fdec6528dc47d Mon Sep 17 00:00:00 2001
-From: Trent Piepho <tpiepho@impinj.com>
-Date: Fri, 6 Apr 2018 17:11:27 -0700
-Subject: [PATCH] imx: Create distinct pre-processed mkimage config files
-
-Each imx image is created by a separate sub-make and during this process
-the mkimage config file is run though cpp.
-
-The cpp output is to the same file no matter what imx image is being
-created.
-
-This means if two imx images are generated in parallel they will attempt
-to independently produce the same pre-processed mkimage config file at
-the same time.
-
-Avoid the problem by making the pre-processed config file name unique
-based on the imx image it will be used in.  This way each image will
-create a unique config file and they won't clobber each other when run
-in parallel.
-
-This should fixed the build bug referenced in b5b0e4e3 ("imximage:
-Remove failure when no IVT offset is found").
-
-Cc: Breno Lima <breno.lima@nxp.com>
-Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Cc: Fabio Estevam <fabio.estevam@nxp.com>
-Signed-off-by: Trent Piepho <tpiepho@impinj.com>
-Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
-[fabio: Adapted to imx_v2017.03_4.9.11_1.0.0_ga]
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- arch/arm/imx-common/Makefile | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/arch/arm/imx-common/Makefile b/arch/arm/imx-common/Makefile
-index d862258..f1bae8d 100644
---- a/arch/arm/imx-common/Makefile
-+++ b/arch/arm/imx-common/Makefile
-@@ -69,9 +69,11 @@ endif
- quiet_cmd_cpp_cfg = CFGS    $@
-       cmd_cpp_cfg = $(CPP) $(cpp_flags) -x c -o $@ $<
- 
--IMX_CONFIG = $(CONFIG_IMX_CONFIG:"%"=%).cfgtmp
-+# mkimage source config file
-+IMX_CONFIG = $(CONFIG_IMX_CONFIG:"%"=%)
- 
--$(IMX_CONFIG): %.cfgtmp: % FORCE
-+# How to create a cpp processed config file, they all use the same source
-+%.cfgout: $(IMX_CONFIG) FORCE
- 	$(Q)mkdir -p $(dir $@)
- 	$(call if_changed_dep,cpp_cfg)
- 
-@@ -79,7 +81,7 @@ MKIMAGEFLAGS_u-boot.imx = -n $(filter-out $(PLUGIN).bin $< $(PHONY),$^) -T imxim
- 	-e $(CONFIG_SYS_TEXT_BASE)
- u-boot.imx: MKIMAGEOUTPUT = u-boot.imx.log
- 
--u-boot.imx: u-boot.bin $(IMX_CONFIG) $(PLUGIN).bin FORCE
-+u-boot.imx: u-boot.bin u-boot.cfgout $(PLUGIN).bin FORCE
- 	$(call if_changed,mkimage)
- 
- ifeq ($(CONFIG_OF_SEPARATE),y)
-@@ -87,16 +89,15 @@ MKIMAGEFLAGS_u-boot-dtb.imx = -n $(filter-out $(PLUGIN).bin $< $(PHONY),$^) -T i
- 	-e $(CONFIG_SYS_TEXT_BASE)
- u-boot-dtb.imx: MKIMAGEOUTPUT = u-boot-dtb.imx.log
- 
--u-boot-dtb.imx: u-boot-dtb.bin $(IMX_CONFIG) $(PLUGIN).bin FORCE
-+u-boot-dtb.imx: u-boot-dtb.bin u-boot-dtb.cfgout $(PLUGIN).bin FORCE
- 	$(call if_changed,mkimage)
- endif
- 
- MKIMAGEFLAGS_SPL = -n $(filter-out $(PLUGIN).bin $< $(PHONY),$^) -T imximage \
- 	-e $(CONFIG_SPL_TEXT_BASE)
--
- SPL: MKIMAGEOUTPUT = SPL.log
- 
--SPL: spl/u-boot-spl.bin $(IMX_CONFIG) $(PLUGIN).bin FORCE
-+SPL: spl/u-boot-spl.bin spl/u-boot-spl.cfgout $(PLUGIN).bin FORCE
- 	$(call if_changed,mkimage)
- 
- MKIMAGEFLAGS_u-boot.uim = -A arm -O U-Boot -a $(CONFIG_SYS_TEXT_BASE) \
-@@ -124,4 +125,4 @@ cmd_u-boot-nand-spl_imx = (printf '\000\000\000\000\106\103\102\040\001' && \
- spl/u-boot-nand-spl.imx: SPL FORCE
- 	$(call if_changed,u-boot-nand-spl_imx)
- 
--targets += $(addprefix ../../../,$(IMX_CONFIG) SPL u-boot.uim spl/u-boot-nand-spl.imx)
-+targets += $(addprefix ../../../,SPL spl/u-boot-spl.cfgout u-boot-dtb.cfgout u-boot.cfgout u-boot.uim spl/u-boot-nand-spl.imx)
--- 
-2.7.4
-
diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index 9d00a53eb8..86009c1c21 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -2,11 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/imx7dsdb/patches"
-
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
@@ -29,7 +26,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 
