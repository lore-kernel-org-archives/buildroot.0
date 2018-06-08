From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jun 2018 21:25:18 +0200
Subject: [Buildroot] [git commit] configs/imx7dpico: Bump kernel and U-Boot
Message-ID: <20180608192414.EAF3987FDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0233e7ded1d4cb6fa7b0f8ce3a74a7f1c0db816b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel to version 4.17 and U-Boot to 2018.05.

As the dtb file has been renamed in mainline, make the necessary
adjustments in U-Boot environment and also in
BR2_LINUX_KERNEL_INTREE_DTS_NAME.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../patches/uboot/0001-picomx7dname.patch          | 31 ++++++++++++++++++++++
 configs/imx7dpico_defconfig                        | 13 +++++----
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/board/technexion/imx7dpico/patches/uboot/0001-picomx7dname.patch b/board/technexion/imx7dpico/patches/uboot/0001-picomx7dname.patch
new file mode 100644
index 0000000000..59408bcd7a
--- /dev/null
+++ b/board/technexion/imx7dpico/patches/uboot/0001-picomx7dname.patch
@@ -0,0 +1,31 @@
+From 6d298b0fcacfc555f93864fa45fb612140902388 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Tue, 5 Jun 2018 22:12:48 -0300
+Subject: [PATCH] pico-imx7d: Adjust the dtb name
+
+Since kernel commit 41bbeadceb03 ("ARM: dts: imx7d-pico-pi: Separate
+into cpu and baseboard dts") the dtb name has changed.
+
+Fix it accordingly.
+
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ include/configs/pico-imx7d.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/pico-imx7d.h b/include/configs/pico-imx7d.h
+index b208d7f..d2ffa70 100644
+--- a/include/configs/pico-imx7d.h
++++ b/include/configs/pico-imx7d.h
+@@ -41,7 +41,7 @@
+ 	"console=ttymxc4\0" \
+ 	"fdt_high=0xffffffff\0" \
+ 	"initrd_high=0xffffffff\0" \
+-	"fdt_file=imx7d-pico.dtb\0" \
++	"fdt_file=imx7d-pico-pi.dtb\0" \
+ 	"fdt_addr=0x83000000\0" \
+ 	"ip_dyn=yes\0" \
+ 	"mmcdev="__stringify(CONFIG_SYS_MMC_ENV_DEV)"\0" \
+-- 
+2.7.4
+
diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index b72d56bc94..971e4022f2 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -3,8 +3,11 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+# patches
+BR2_GLOBAL_PATCH_DIR="board/technexion/imx7dpico/patches"
+
+# Linux headers same as kernel, a 4.17 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
@@ -12,16 +15,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico-pi"
 
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="pico-imx7d"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # required tools to create the eMMC image
