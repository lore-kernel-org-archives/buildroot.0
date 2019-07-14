From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 11:57:39 +0200
Subject: [Buildroot] [git commit] configs/warp7: Bump kernel and U-Boot
 versions
Message-ID: <20190714102157.2FBC280163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=340df670fa8c6d772cae4c929ab71caa9fd7f0f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to 2019.07 and kernel to version 5.1.16.

Also
 - adjust the U-Boot binary name after DM conversion.
 - add missing notes about DFU

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Tested-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/warp7/readme.txt  | 22 ++++++++++++++++++----
 configs/warp7_defconfig | 10 +++++-----
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/board/warp7/readme.txt b/board/warp7/readme.txt
index 47458e9b56..aff7a601e5 100644
--- a/board/warp7/readme.txt
+++ b/board/warp7/readme.txt
@@ -20,7 +20,7 @@ You will find in output/images/ the following files:
   - rootfs.ext4
   - rootfs.tar
   - sdcard.img
-  - u-boot.imx
+  - u-boot-dtb.imx
   - zImage
 
 Flash the eMMC image
@@ -61,11 +61,11 @@ Connect a USB to serial adapter between the host PC and warp7 serial
 USB port, and also a USB cable between the OTG warp7 port and the host
 PC.
 
-Copy u-boot.imx to the imx_usb_loader folder.
+Copy u-boot-dtb.imx to the imx_usb_loader folder.
 
-Load u-boot.imx via USB:
+Load u-boot-dtb.imx via USB:
 
-$ sudo ./imx_usb u-boot.imx
+$ sudo ./imx_usb u-boot-dtb.imx
 
 Then U-Boot should start and its messages will appear in the console program.
 
@@ -75,6 +75,20 @@ Use the default environment variables:
 
 => env default -f -a
 => saveenv
+
+Run the DFU command:
+=> dfu 0 mmc 0
+
+Transfer u-boot-dtb.imx that will be flashed into the eMMC:
+
+$ sudo dfu-util -D u-boot-dtb.imx -a boot
+
+Then on the U-Boot prompt the following message should be seen after a
+successful upgrade:
+
+#DOWNLOAD ... OK
+Ctrl+C to exit ...
+
 => ums 0 mmc 0
 
 sudo dd if=output/images/sdcard.img of=/dev/<your-emmc-device>
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 8acd73047e..9b10085b65 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 5.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.16"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
@@ -25,8 +25,8 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # wifi firmware for brcm43430
 BR2_PACKAGE_LINUX_FIRMWARE=y
