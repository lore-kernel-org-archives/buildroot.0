From: Joris Offouga <offougajoris@gmail.com>
Date: Tue,  9 Jul 2019 11:57:03 +0200
Subject: [Buildroot] [PATCH 2/2] configs/imx7dpico: Bump U-Boot to 2019.07
 and kernel to version 5.1.16.
In-Reply-To: <20190709095703.24229-1-offougajoris@gmail.com>
References: <20190709095703.24229-1-offougajoris@gmail.com>
Message-ID: <20190709095703.24229-2-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also
 - adjust the U-Boot binary name after DM conversion.
 - add missing notes about flashing U-Boot and SPL

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 board/technexion/imx7dpico/readme.txt | 55 ++++++++++++++++++++++++++-
 configs/imx7dpico_defconfig           |  6 +--
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/board/technexion/imx7dpico/readme.txt b/board/technexion/imx7dpico/readme.txt
index 1b9e80a0fd..53197d458d 100644
--- a/board/technexion/imx7dpico/readme.txt
+++ b/board/technexion/imx7dpico/readme.txt
@@ -20,10 +20,63 @@ You will find in output/images/ the following files:
   - rootfs.ext4
   - rootfs.tar
   - sdcard.img
-  - u-boot.img
+  - u-boot-dtb.img
   - SPL
   - zImage
 
+Flash U-Boot and SPL
+=====
+
+Note: This method is convenient for development purposes.
+If the eMMC has already a U-Boot flashed with DFU support then
+the user can go to step 2 below in order to update U-Boot.
+
+Put pico board in USB download mode (refer to the PICO-iMX7D Quick Start Guide
+page 3)
+
+Connect a USB to serial adapter between the host PC and pico.
+
+Connect a USB cable between the OTG pico port and the host PC.
+
+Note: Some computers may be a bit strict with USB current draw and will
+shut down their ports if the draw is too high. The solution for that is
+to use an externally powered USB hub between the board and the host computer.
+
+Open a terminal program such as minicom.
+
+Copy SPL and u-boot-dtb.img to the imx_usb_loader folder.
+
+Load the SPL binary via USB:
+
+$ sudo ./imx_usb SPL
+
+Load the u-boot-dtb.img binary via USB:
+
+$ sudo ./imx_usb u-boot-dtb.img
+
+Then U-Boot starts and its messages appear in the console program.
+
+Use the default environment variables:
+
+=> env default -f -a
+=> saveenv
+
+Run the DFU agent so we can flash the new images using dfu-util tool:
+
+=> dfu 0 mmc 0
+
+Flash SPL and u-boot-dtb.img into the eMMC running the following commands on a PC:
+
+$ sudo dfu-util -D SPL -a spl
+
+$ sudo dfu-util -D u-boot-dtb.img -a u-boot
+
+Remove power from the pico board.
+
+Put pico board into normal boot mode.
+
+Power up the board and the new updated U-Boot should boot from eMMC.
+
 Flash the eMMC
 ==============
 
diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index a5d41657f1..151b7fd65a 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.16"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico-pi"
@@ -25,8 +25,8 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx7d"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
-BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 
 # wifi firmware for brcm43439
 BR2_PACKAGE_LINUX_FIRMWARE=y
-- 
2.17.1
