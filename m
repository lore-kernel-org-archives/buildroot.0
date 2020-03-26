From: Julien Olivain <julien.olivain@oss.nxp.com>
Date: Thu, 26 Mar 2020 14:23:20 +0100
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx6{dl, q,
 sx}*: bump BSP components to 4.19.35_1.1.0
Message-ID: <20200326132320.79708-1-julien.olivain@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also:
- drop uboot patch accepted upstream in v2018.05 in
  commit f916757300c15aa1a3f0ccc98e7abb8a84c97da0
- Add kernel dependency on host-openssl needed for v4.19.
- Rebased uboot patch

Tested-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
(Tested on i.MX6Quad SabreAuto)
Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
 ...nct-pre-processed-mkimage-config-fil.patch | 89 -------------------
 ...-boot-Linux-to-init-in-mfgtools-mode.patch | 29 +++---
 configs/freescale_imx6dlsabreauto_defconfig   |  9 +-
 configs/freescale_imx6dlsabresd_defconfig     |  9 +-
 configs/freescale_imx6qsabreauto_defconfig    |  9 +-
 configs/freescale_imx6qsabresd_defconfig      |  9 +-
 configs/freescale_imx6sxsabresd_defconfig     |  9 +-
 7 files changed, 40 insertions(+), 123 deletions(-)
 delete mode 100644 board/freescale/imx6sabre/patches/uboot/0002-imx-Create-distinct-pre-processed-mkimage-config-fil.patch

diff --git a/board/freescale/imx6sabre/patches/uboot/0002-imx-Create-distinct-pre-processed-mkimage-config-fil.patch b/board/freescale/imx6sabre/patches/uboot/0002-imx-Create-distinct-pre-processed-mkimage-config-fil.patch
deleted file mode 100644
index b8989cb965..0000000000
--- a/board/freescale/imx6sabre/patches/uboot/0002-imx-Create-distinct-pre-processed-mkimage-config-fil.patch
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
diff --git a/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
index d57875f842..ee13222381 100644
--- a/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
+++ b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
@@ -1,7 +1,7 @@
-From 90ecc0ad14337898b75843efc6530fc4a34f7808 Mon Sep 17 00:00:00 2001
+From e9b507b695331ef6fa941b471be0a7f284ec6980 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
 Date: Tue, 12 Aug 2014 10:17:31 +0200
-Subject: [PATCH] mx6qsabre_common: boot Linux to /init in mfgtools mode
+Subject: [PATCH 1/1] mx6qsabre_common: boot Linux to /init in mfgtools mode
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -14,23 +14,24 @@ This patch tells u-boot to tell the kernel to boot into /init (instead of
 buildroot system entirely through USB.
 
 Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
+Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
 ---
- include/configs/mx6sabre_common.h | 2 +-
+ include/configs/imx_env.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common.h
-index 93d4c4b..d2e7efd 100644
---- a/include/configs/mx6sabre_common.h
-+++ b/include/configs/mx6sabre_common.h
-@@ -52,7 +52,7 @@
+diff --git a/include/configs/imx_env.h b/include/configs/imx_env.h
+index 234af33e55..7e31d208dc 100644
+--- a/include/configs/imx_env.h
++++ b/include/configs/imx_env.h
+@@ -20,7 +20,7 @@
  
- #define CONFIG_MFG_ENV_SETTINGS \
- 	"mfgtool_args=setenv bootargs console=" CONSOLE_DEV ",115200 " \
+ #define CONFIG_MFG_ENV_SETTINGS_DEFAULT \
+ 	"mfgtool_args=setenv bootargs console=${console},${baudrate} " \
 -		"rdinit=/linuxrc " \
 +		"rdinit=/init " \
- 		"g_mass_storage.stall=0 g_mass_storage.removable=1 " \
- 		"g_mass_storage.idVendor=0x066F g_mass_storage.idProduct=0x37FF "\
- 		"g_mass_storage.iSerialNumber=\"\" "\
+ 		"clk_ignore_unused "\
+ 		"\0" \
+ 	"kboot="MFG_BOOT_CMD"\0"\
 -- 
-2.1.4
+2.25.1
 
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 55db461f44..ce68a9dacb 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -18,10 +18,11 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
@@ -39,5 +40,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index dc9b498aa4..8cc1ef818e 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -18,10 +18,11 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
@@ -38,5 +39,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index bc333e1a37..d444fa6731 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
@@ -18,10 +18,11 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
@@ -39,5 +40,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index e0ef20c578..3edfe6677f 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -18,10 +18,11 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
@@ -39,5 +40,5 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index eb11fb8ae1..79f4bf5268 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -8,8 +8,8 @@ BR2_ARM_FPU_VFPV3=y
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -18,10 +18,11 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
@@ -37,6 +38,6 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.25.1
