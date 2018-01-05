From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Fri,  5 Jan 2018 17:31:12 +0100
Subject: [Buildroot] [PATCH 1/1] board/ci20: Implement creation of a basic
 sdcard image for ci20
Message-ID: <1515169872-25186-1-git-send-email-johannes.schmitz1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a genimage.cfg and post-image.sh to create a working sdcard.img for
the ci20 hardware. We also need a uboot-env.txt to create the partition
for the uboot environment.

Update the board/ci20/readme.txt with the related information. Remove
the tftp netboot description from the readme as it is already to
complicated for a basic bootable example.

Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>
---
 board/ci20/genimage.cfg  | 29 ++++++++++++++++++++++++++
 board/ci20/post-image.sh | 16 +++++++++++++++
 board/ci20/readme.txt    | 53 +++++++++++++++++++++++-------------------------
 board/ci20/uboot-env.txt |  9 ++++++++
 configs/ci20_defconfig   | 18 +++++++---------
 5 files changed, 86 insertions(+), 39 deletions(-)
 create mode 100644 board/ci20/genimage.cfg
 create mode 100755 board/ci20/post-image.sh
 create mode 100644 board/ci20/uboot-env.txt

diff --git a/board/ci20/genimage.cfg b/board/ci20/genimage.cfg
new file mode 100644
index 0000000..72fcadb
--- /dev/null
+++ b/board/ci20/genimage.cfg
@@ -0,0 +1,29 @@
+image sdcard.img {
+    hdimage {
+    }
+
+    partition uboot-spl {
+        in-partition-table = "no"
+        image = "u-boot-spl.bin"
+        offset = 512
+    }
+
+    partition uboot {
+        in-partition-table = "no"
+        image = "u-boot.img"
+        offset = 14k
+    }
+
+    partition uboot-env {
+        in-partition-table = "no"
+        image = "uboot-env.bin"
+        offset = 526k
+    }
+
+    partition rootfs {
+        partition-type = 0x83
+        image = "rootfs.ext4"
+        offset = 2M
+        size = 70M
+    }
+}
diff --git a/board/ci20/post-image.sh b/board/ci20/post-image.sh
new file mode 100755
index 0000000..c82b189
--- /dev/null
+++ b/board/ci20/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                               \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
diff --git a/board/ci20/readme.txt b/board/ci20/readme.txt
index ca7bb52..9dfbb88 100644
--- a/board/ci20/readme.txt
+++ b/board/ci20/readme.txt
@@ -2,41 +2,38 @@
 * MIPS Creator CI20 *
 *********************
 
-The 'ci20_defconfig' will create a root filesystem and a kernel image
-under the 'output/images/' directory. This document will try to explain how
-to use them in order to run Buildroot in the MIPS Creator CI20 board.
+How to build it
+===============
 
-Assuming you are at the U-Boot prompt of the MIPS Creator CI20, you have to
-load the generated kernel image by using the 'tftpboot' command. In
-order to do that, you will need to get the network working. Here you
-have the instructions to set the ip address, netmask and gateway:
+Configure Buildroot
+-------------------
 
-  setenv ipaddr x.x.x.x
-  setenv netmask x.x.x.x
-  setenv gatewayip x.x.x.x
+  $ make ci20_defconfig
 
-Now you have to set the ip for the TFTP server you are going to load the
-kernel image from, and also the name of the kernel image file (we use
-'uImage' as a filename in this example):
+Build the rootfs
+----------------
 
-  setenv serverip x.x.x.x
-  setenv bootfile uImage
+Note: you will need to have access to the network, since Buildroot will
+download the packages' sources.
 
-And finally load the kernel image:
+You may now build your rootfs with:
 
-  tftpboot
+  $ make
 
-Now you have to extract the generated root filesystem into a USB drive
-or SD-Card. Here you have the instructions to boot from the two of them.
-You have to choose the one your prefer:
+(This may take a while, consider getting yourself a coffee ;-) )
 
-From USB
-  setenv bootargs console=ttyS4,115200 console=tty0 mem=256M at 0x0
-mem=768M at 0x30000000 root=/dev/sda1
+How to write the SD card
+========================
 
-From SD-Card
-  setenv bootargs console=ttyS4,115200 console=tty0 mem=256M at 0x0
-mem=768M at 0x30000000 root=/dev/mmcblk0p1
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
 
-And finally run this command to boot the board:
-  bootm
+Make sure the SD card is not mounted then copy the bootable "sdcard.img" onto
+it with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the SDcard into your ci20, and power it up. Your new system
+should come up now and start a console on the UART HEADER.
+
+see: https://elinux.org/CI20_Hardware#Dedicated_UART_header
diff --git a/board/ci20/uboot-env.txt b/board/ci20/uboot-env.txt
new file mode 100644
index 0000000..ae4d49f
--- /dev/null
+++ b/board/ci20/uboot-env.txt
@@ -0,0 +1,9 @@
+baudrate=115200
+board_mfr=NP
+bootargs=console=ttyS4,115200 console=tty0 mem=256M at 0x0 mem=768M at 0x30000000 rootwait root=/dev/mmcblk0p1 devtmpfs.mount=1 ip=dhcp
+bootcmd=run ethargs; ext4load mmc 0:1 0x88000000 /boot/uImage; bootm 0x88000000
+bootdelay=1
+loads_echo=1
+stderr=eserial0,eserial4
+stdin=eserial0,eserial4
+stdout=eserial0,eserial4
diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 6de6394..fddd84a 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -1,28 +1,24 @@
-# architecture
 BR2_mipsel=y
 BR2_mips_xburst=y
 # BR2_MIPS_SOFT_FLOAT is not set
-
-# Linux headers same as kernel, a 3.18 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
-
-# system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
-
-# kernel
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ci20/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dff33297116643485ca37141d804eddd793e834"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
-
-# u-boot
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
 BR2_TARGET_UBOOT_BOARDNAME="ci20_mmc"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_u-boot"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="dd3c1b95dac7d10b2ca5806f65e5c1050d7dd0fa"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
+BR2_TARGET_UBOOT_ENVIMAGE=y
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.4
