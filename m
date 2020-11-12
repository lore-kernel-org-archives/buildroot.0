From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Nov 2020 23:11:13 +0100
Subject: [Buildroot] [git commit branch/next] configs/rock64_defconfig:
 remove defconfig
Message-ID: <20201117203828.D4A177FD00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5fa2469e6506ea4f5a91739aa099f63a10e45ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The rock64 defconfig is currently broken [1][2] since a while due to
incompatibility between uboot-2017.09-rockchip-ayufan fork and pylibfdt.
Even with the latest uboot-2017.09-rockchip-ayufan fork version [3],
it doesn't build.

The original submitter tried the uboot upstream rock64-rk3328_defconfig
but the board doesn't boot [4].

In order to not release 2020.05 with a broken defconfig, let's remove
it. It can be re-added later once the uboot issue has been resolved.

[1] 2020.05-rc2: https://gitlab.com/buildroot.org/buildroot/-/jobs/563613273
[2] 2020.02: https://gitlab.com/buildroot.org/buildroot/-/jobs/548596102
[3] https://github.com/ayufan-rock64/linux-u-boot/releases/tag/2017.09-rockchip-ayufan-1065-g95f6152134
[4] http://lists.busybox.net/pipermail/buildroot/2020-May/282164.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                         |  2 -
 board/pine64/rock64/extlinux.conf                  |  4 -
 board/pine64/rock64/genimage.cfg                   | 23 ------
 ...e-rk3328-needs-itb-image-to-boot-properly.patch | 32 --------
 board/pine64/rock64/post-build.sh                  |  9 --
 board/pine64/rock64/readme.txt                     | 95 ----------------------
 configs/rock64_defconfig                           | 38 ---------
 7 files changed, 203 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 257295358e..6b8083eb47 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1854,8 +1854,6 @@ F:	package/libavl/
 
 N:	Micha?? ??yszczek <michal.lyszczek@bofc.pl>
 F:	board/altera/socrates_cyclone5/
-F:	board/pine64/rock64
-F:	configs/rock64_defconfig
 F:	configs/socrates_cyclone5_defconfig
 F:	package/netifrc/
 F:	package/openrc/
diff --git a/board/pine64/rock64/extlinux.conf b/board/pine64/rock64/extlinux.conf
deleted file mode 100644
index bf71982a9f..0000000000
--- a/board/pine64/rock64/extlinux.conf
+++ /dev/null
@@ -1,4 +0,0 @@
-label rock64-buildroot
-  kernel /boot/Image
-  devicetree /boot/rk3328-rock64.dtb
-  append console=ttyS2,1500000n8 root=/dev/mmcblk0p1 ro rootwait
diff --git a/board/pine64/rock64/genimage.cfg b/board/pine64/rock64/genimage.cfg
deleted file mode 100644
index 0b5a0d8804..0000000000
--- a/board/pine64/rock64/genimage.cfg
+++ /dev/null
@@ -1,23 +0,0 @@
-image sdcard.img {
-    hdimage {
-    }
-
-    partition uboot-spl {
-        in-partition-table = "no"
-        image = "u-boot-tpl-spl.img"
-        offset = 32768 # 512 * 0x40 from start of sd card
-    }
-
-    partition uboot {
-        in-partition-table = "no"
-        image = "u-boot.itb"
-        offset = 262144 # 512 * 0x200 from start of sd card
-    }
-
-    partition rootfs {
-        partition-type = 0x83
-        bootable = "yes"
-        image = "rootfs.ext2"
-        size = 500M
-    }
-}
diff --git a/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch b/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
deleted file mode 100644
index 2d35b78daa..0000000000
--- a/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 211bf049084e6e374dac253138fa813682910146 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
-Date: Tue, 5 Feb 2019 22:08:54 +0100
-Subject: [PATCH] Makefile: rk3328 needs itb image to boot properly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
----
- Makefile | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 8086f3c93e..a6425b5b03 100644
---- a/Makefile
-+++ b/Makefile
-@@ -799,6 +799,11 @@ ifneq ($(BUILD_ROM),)
- ALL-$(CONFIG_X86_RESET_VECTOR) += u-boot.rom
- endif
- 
-+# rk3328 needs itb image to boot properly
-+ifeq ($(CONFIG_ROCKCHIP_RK3328),y)
-+ALL-y += u-boot.itb
-+endif
-+
- # enable combined SPL/u-boot/dtb rules for tegra
- ifeq ($(CONFIG_TEGRA)$(CONFIG_SPL),yy)
- ALL-y += u-boot-tegra.bin u-boot-nodtb-tegra.bin
--- 
-2.18.1
-
diff --git a/board/pine64/rock64/post-build.sh b/board/pine64/rock64/post-build.sh
deleted file mode 100755
index 26b53cba8e..0000000000
--- a/board/pine64/rock64/post-build.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-MKIMAGE=$HOST_DIR/bin/mkimage
-BOARD_DIR="$(dirname $0)"
-
-$MKIMAGE -n rk3328 -T rksd -d $BINARIES_DIR/u-boot-tpl.bin $BINARIES_DIR/u-boot-tpl.img
-cat $BINARIES_DIR/u-boot-tpl.img $BINARIES_DIR/u-boot-spl.bin > $BINARIES_DIR/u-boot-tpl-spl.img
-
-install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/pine64/rock64/readme.txt b/board/pine64/rock64/readme.txt
deleted file mode 100644
index 029c67641e..0000000000
--- a/board/pine64/rock64/readme.txt
+++ /dev/null
@@ -1,95 +0,0 @@
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Rock64. With this default configuration you
-can log in into board via uart and look around.
-
-Board homepage: https://www.pine64.org/?page_id=7147
-
-Build
-=====
-
-First, load rock64 config for buildroot
-
-  $ make rock64_defconfig
-
-Optionally make changes to buildroot config (to install more programs)
-
-  $ make menuconfig
-
-And then build everything
-
-  $ make
-
-When completed, following files will be generated in output/images directory:
-
-  .
-  ????????? Image
-  ????????? bl31.bin
-  ????????? bl31.elf
-  ????????? rk3328-rock64.dtb
-  ????????? rootfs.ext2
-  ????????? rootfs.ext4 -> rootfs.ext2
-  ????????? rootfs.tar
-  ????????? sdcard.img
-  ????????? u-boot-spl.bin
-  ????????? u-boot-tpl-spl.img
-  ????????? u-boot-tpl.bin
-  ????????? u-boot-tpl.img
-  ????????? u-boot.bin
-  ????????? u-boot.itb
-
-Creating bootable SD card
-=========================
-
-!!! THIS COMMAND MAY WIPE YOUR DISK!
-!!! MAKE SURE YOU PASSED CORRECT DEVICE!
-!!! OR IT THIS WILL WIPE YOUR DISK!
-
-Simply invoke (as root)
-
-  # dd if=output/images/sdcard.img of=/dev/sdX && sync
-
-Where X is your SD card device (not partition), of= argument may also be
-/dev/mmcblk0 if you are using built-in sd card reader.
-
-Runtime
-=======
-
-Login
------
-
-By default, buildroot has no password, just type 'root' as login user, and
-you will be logged in.
-
-Serial console
---------------
-
-Serial console needs to be connected to pins (into 40pin rpi compatible part)
-
-pin 6:  gnd
-pin 8:  tx
-pin 10: rx
-
-Pin numbers are printed on board.
-
-Uart configuration is not standard. Rock64 uses 1500000 (1,5M) baudrate
-with standard 8n1.
-
-Ethernet
---------
-
-To enable ethernet you need to load modules for it:
-
-# modprobe stmmac
-# modprobe dwmac-rk
-
-and since by default there is no dhcp installed, you need to configure ip
-address, remember to change address to fit your network.
-
-# ifconfig eth0 up
-# ip addr add 10.1.1.180/24 dev eth0
-# ping 10.1.1.1
-PING 10.1.1.1 (10.1.1.1): 56 data bytes
-64 bytes from 10.1.1.1: seq=0 ttl=64 time=0.695 ms
diff --git a/configs/rock64_defconfig b/configs/rock64_defconfig
deleted file mode 100644
index 30bf12c061..0000000000
--- a/configs/rock64_defconfig
+++ /dev/null
@@ -1,38 +0,0 @@
-BR2_aarch64=y
-BR2_GLOBAL_PATCH_DIR="board/pine64/rock64/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rock64/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rock64/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.19"
-BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-rock64"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v1.4"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ayufan-rock64/linux-u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2017.09-rockchip-ayufan-1035-gd646df03ac"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock64-rk3328"
-BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
-BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin tpl/u-boot-tpl.bin"
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
