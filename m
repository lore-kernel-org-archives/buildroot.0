From: imrehg at gmail.com <imrehg@gmail.com>
Date: Fri, 23 Jan 2015 16:02:48 +0800
Subject: [Buildroot] [PATCH 1/1] board: add support for the VIA VAB-820 board
In-Reply-To: <1422000168-19305-1-git-send-email-imrehg@gmail.com>
References: <1422000168-19305-1-git-send-email-imrehg@gmail.com>
Message-ID: <1422000168-19305-2-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gergely Imreh <imrehg@gmail.com>

The VIA VAB-820 board (and the AMOS-820 system built around it) is
based on Freescale i.MX6Q for embedded and industrial computing

http://www.viaembedded.com/en/products/boards/2150/1/VAB-820_(Pico-ITX).html

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
---
 board/via/imx6_vab820/6x_bootscript.txt            |  5 ++
 board/via/imx6_vab820/post-build.sh                |  7 ++
 board/via/imx6_vab820/readme.txt                   | 95 ++++++++++++++++++++++
 .../imx6_vab820/uboot-0001-add-bootscript.patch    | 44 ++++++++++
 configs/via_imx6_vab820_defconfig                  | 38 +++++++++
 5 files changed, 189 insertions(+)
 create mode 100644 board/via/imx6_vab820/6x_bootscript.txt
 create mode 100755 board/via/imx6_vab820/post-build.sh
 create mode 100644 board/via/imx6_vab820/readme.txt
 create mode 100644 board/via/imx6_vab820/uboot-0001-add-bootscript.patch
 create mode 100644 configs/via_imx6_vab820_defconfig

diff --git a/board/via/imx6_vab820/6x_bootscript.txt b/board/via/imx6_vab820/6x_bootscript.txt
new file mode 100644
index 0000000..0cd6c52
--- /dev/null
+++ b/board/via/imx6_vab820/6x_bootscript.txt
@@ -0,0 +1,5 @@
+set loadaddr 0x10800000
+set kernel uImage
+set hdmi video=mxcfb0:dev=hdmi,1920x1080M at 60,bpp=32
+set bootargs console=ttymxc1,115200 console=tty1,115200 ${hdmi} root=/dev/mmcblk1p2 rootwait rw
+mmc dev 0; ext2load mmc 0:1 ${loadaddr} ${kernel} && bootm ; echo "Error loading kernel image"
diff --git a/board/via/imx6_vab820/post-build.sh b/board/via/imx6_vab820/post-build.sh
new file mode 100755
index 0000000..0d49680
--- /dev/null
+++ b/board/via/imx6_vab820/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+TARGET_DIR=$1
+BOARD_DIR="$(dirname $0)"
+
+mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "boot script" \
+    -d $BOARD_DIR/6x_bootscript.txt $TARGET_DIR/6x_bootscript
diff --git a/board/via/imx6_vab820/readme.txt b/board/via/imx6_vab820/readme.txt
new file mode 100644
index 0000000..243cf81
--- /dev/null
+++ b/board/via/imx6_vab820/readme.txt
@@ -0,0 +1,95 @@
+VIA VAB-820/AMOS-820
+====================
+
+These settings are aimed to use Buildroot-generated images on an SD card
+with a VIA VAB-820 board or AMOS-820 system. Code is based on the original
+VIA BSP, which is in turn based on the Freescale Linux 3.0.35 / 4.1.0 BSP.
+
+Configuring and building Buildroot
+----------------------------------
+
+First apply the relevant defconfig
+
+  $ make via_imx6_vab820_defconfig
+
+Then you can edit build uptions by
+
+  $ make menuconfig
+
+When happy with the setup run
+
+  $ make
+
+The results of the build should be these files in the default setting:
+
+  output/images
+  ??? 6x_bootscript
+  ??? rootfs.tar
+  ??? rootfs.tar.gz
+  ??? u-boot.bin
+  ??? uImage
+
+Set up your SD card
+-------------------
+
+Important: pay attention which partition you ar modifying so you don't
+accidentally erase your host computer's system!
+
+In the default setup you need to create 2 partitions on your SD card:
+a boot partition (ext2) and a root partition (ext4). For example, if your
+SD card is at /dev/sdX, using fdisk, starting from an empty card:
+
+  # fdisk /dev/sdX
+  n  (new partition)
+  p  (primary partition)
+  <return>  (default first sector, should be at least 2048 or larger)
+  50M  (50MB size)
+  n  (the second partition)
+  p  (primary partition type)
+  <return>  (default first sector)
+  <return>  (use all remaining space)
+  p  (print so the partition looks something like this:)
+    Device     Boot  Start      End  Sectors  Size Id Type
+    /dev/sdX1         2048   104447   102400   50M 83 Linux
+    /dev/sdX2       104448 15564799 15460352  7.4G 83 Linux
+  w  (save changes)
+
+After this you need to format the the newly created file system:
+
+  # mkfs.ext2 -L boot /dev/sdX1
+  # mkfs.ext4 -L rootfs /dev/sdX2
+
+After this the system can be copied onto the card. First copy the u-boot
+onto the region of the card before the first partition (starting from the
+root directory of buildroot):
+
+  # dd if=output/images/u-boot.bin bs=512 seek=2 skip=2 of=/dev/sdX
+
+Mount the first partition /dev/sdX1, and copy the boot script and kernel:
+
+  # cp output/images/6x_bootscript /mnt/<BOOT-PARTITION>
+  # cp output/images/uImage /mnt/<BOOT-PARTITION>
+
+Finally copy the root file system as well onto the mounted /dev/sdX1
+rootfs partition:
+
+  # tar xzvf output/images/rootfs.tar.gz -C /mnt/<ROOTFS-PARTITION>
+
+Booting
+-------
+
+On the VAB-820 board make sure the jumper J11 (just next to the SD card
+slot) is sorted betweek  the two pins towards the center of the board.
+This signals to the onboard bootloader to try get the u-boot from the
+SD card.
+
+If you haven't modified the u-boot variables (i.e. never run a `saveenv`
+in the u-boot console), the SD card should automatically boot.
+
+If you have modified the variables, you might need to run a `destroyenv`
+in the u-boot console to clear all the settings and let the just compiled
+u-boot and the 6x_bootscript take care of things.
+
+In the future, add your modifications to the defaults at
+`board/via/imx6_vab820/6x_bootscript.txt`, and see the `post-build.sh`
+in the same directory on how to create a new `6x_bootscript`.
diff --git a/board/via/imx6_vab820/uboot-0001-add-bootscript.patch b/board/via/imx6_vab820/uboot-0001-add-bootscript.patch
new file mode 100644
index 0000000..5054aad
--- /dev/null
+++ b/board/via/imx6_vab820/uboot-0001-add-bootscript.patch
@@ -0,0 +1,44 @@
+From 029eae9870057300547e41bd3e289132a35d4467 Mon Sep 17 00:00:00 2001
+From: Gergely Imreh <imrehg@gmail.com>
+Date: Thu, 22 Jan 2015 14:19:53 +0800
+Subject: [PATCH] vab820: modify default bootcmd to look for 6x_bootscript on
+ the first partition
+
+Previously it is not possible to supply the relevant u-boot parameters on the
+SD card or eMMC storage, but they are always either read from the compiled-in
+parameters, or the SPI flash.
+
+This modification is based on the Boundary Devices Nitrogen6X board's parameters.
+https://github.com/boundarydevices/u-boot-imx6/blob/77ab23a8670d5d05679a168f595ab11c3cea034b/include/configs/mx6_r.h#L175-L191
+---
+ include/configs/mx6q_sabrelite.h | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/include/configs/mx6q_sabrelite.h b/include/configs/mx6q_sabrelite.h
+index 987df11..73b762e 100644
+--- a/include/configs/mx6q_sabrelite.h
++++ b/include/configs/mx6q_sabrelite.h
+@@ -170,7 +170,19 @@
+ 		"bootcmd_mmc=run bootargs_base bootargs_mmc; mmc dev 1; ext2load mmc 1:1 $loadaddr $vkernel && bootm\0"   \
+ 		"bootargs_sd=setenv bootargs ${bootargs} root=/dev/mmcblk1p1 rootwait rw\0"     \
+ 		"bootcmd_sd=run bootargs_base bootargs_sd; mmc dev 0; ext2load mmc 0:1 $loadaddr $vkernel && bootm\0"   \
+-		"bootcmd=run bootcmd_mmc\0"
++		"bootcmd=for disk in 0 1 " \
++		   "; do "\
++                     " mmc dev ${disk} ;" \
++		     "for fs in fat ext2 ; do " \
++		       "${fs}load "  \
++		         "mmc ${disk}:1 "  \
++		         "10008000 " \
++		         "/6x_bootscript" \
++		         "&& source 10008000 ; " \
++		     "done ; " \
++		  "done ; " \
++		"echo ; echo 6x_bootscript not found ;\0" \
++
+ #endif
+ 
+ #define CONFIG_ARP_TIMEOUT	200UL
+-- 
+2.2.2
+
diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
new file mode 100644
index 0000000..167a90a
--- /dev/null
+++ b/configs/via_imx6_vab820_defconfig
@@ -0,0 +1,38 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# toolchain
+BR2_DEPRECATED=y
+BR2_KERNEL_HEADERS_3_0=y
+BR2_DEFAULT_KERNEL_HEADERS="3.0.101"
+BR2_GCC_VERSION_4_7_X=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/viaembedded/vab820-kernel-bsp.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="via_3.0.35"
+BR2_LINUX_KERNEL_DEFCONFIG="imx6"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_UBOOT_IMAGE=y
+BR2_LINUX_KERNEL_UIMAGE=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6q_sabrelite"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/viaembedded/vab820-uboot-bsp.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="via_3.0.35"
+BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/via/imx6_vab820"
+BR2_TARGET_UBOOT_FORMAT_BIN=y
+
+# rootfs
+BR2_TARGET_ROOTFS_TAR=y
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+
+# post-build	
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/via/imx6_vab820/post-build.sh"
-- 
2.2.2
