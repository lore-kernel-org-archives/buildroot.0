From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed,  4 Mar 2015 21:36:30 -0600
Subject: [Buildroot] [PATCH 1/1] configs: update config for Atmel SAMA5D3
	Xplained board
Message-ID: <1425526590-5961-1-git-send-email-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update configuration to use the 3.18.8 kernel and update U-Boot to
2015.01. With the switch to 2015.01. use the U-Boot SPL image for the
first stage bootloader instead of the at91bootstrap. The U-Boot SPL
requires that the U-Boot image format be u-boot.img in order to load
from the SD card.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 board/atmel/xplained/readme.txt  |  4 ++--
 configs/atmel_xplained_defconfig | 16 +++++++---------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/board/atmel/xplained/readme.txt b/board/atmel/xplained/readme.txt
index e29a116..63744dd 100644
--- a/board/atmel/xplained/readme.txt
+++ b/board/atmel/xplained/readme.txt
@@ -52,8 +52,8 @@ sudo mount /dev/mmcblk0p2 /media/rootfs
 Copy the bootloaders, kernel image and Device Tree blob to the first
 partition:
 
-cp output/images/sama5d3_xplained-sdcardboot-uboot-3.6.2.bin /media/boot/boot.bin
-cp output/images/u-boot.bin /media/boot/u-boot.bin
+cp output/images/uboot-spl.bin /media/boot/boot.bin
+cp output/images/u-boot.img /media/boot/u-boot.img
 cp output/images/zImage /media/boot/zImage
 cp output/images/at91-sama5d3_xplained.dtb /media/boot/at91-sama5d3_xplained.dtb
 
diff --git a/configs/atmel_xplained_defconfig b/configs/atmel_xplained_defconfig
index 8c06489..087f4fa 100644
--- a/configs/atmel_xplained_defconfig
+++ b/configs/atmel_xplained_defconfig
@@ -5,24 +5,22 @@ BR2_cortex_a5=y
 # Toolchain configuration
 BR2_ARM_EABIHF=y
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.15"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y
+BR2_DEFAULT_KERNEL_VERSION="3.18.8"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel configuration
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained"
 
-# First stage bootloader
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
-
-# Second stage bootloader
+# First/second stage bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="sama5d3_xplained_mmc"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2014.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.01"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
-- 
1.9.1
