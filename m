From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Date: Sun,  3 Feb 2019 21:41:19 +0100
Subject: [Buildroot] [PATCH] configs/rock64: new defconfig
Message-ID: <20190203204119.31934-1-michal.lyszczek@bofc.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Configuration contains:
  - building tpl, spl and u-boot (forked u-boot repository)
  - booting from SD card and network via PXE
  - working ethernet, usb and uart
  - minimal rootfs with busybox
  - ready to flash SD card image

Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>
---
 board/pine64/rock64/build-uboot-itb.patch | 14 ++++
 board/pine64/rock64/extlinux.conf         |  4 +
 board/pine64/rock64/genimage.cfg          | 23 ++++++
 board/pine64/rock64/post-build.sh         |  9 +++
 board/pine64/rock64/readme.txt            | 93 +++++++++++++++++++++++
 configs/rock64_defconfig                  | 34 +++++++++
 6 files changed, 177 insertions(+)
 create mode 100644 board/pine64/rock64/build-uboot-itb.patch
 create mode 100644 board/pine64/rock64/extlinux.conf
 create mode 100644 board/pine64/rock64/genimage.cfg
 create mode 100755 board/pine64/rock64/post-build.sh
 create mode 100644 board/pine64/rock64/readme.txt
 create mode 100644 configs/rock64_defconfig

diff --git a/board/pine64/rock64/build-uboot-itb.patch b/board/pine64/rock64/build-uboot-itb.patch
new file mode 100644
index 0000000000..72baa2218f
--- /dev/null
+++ b/board/pine64/rock64/build-uboot-itb.patch
@@ -0,0 +1,14 @@
+--- a/Makefile.old	2018-11-10 13:48:26.573232313 +0100
++++ b/Makefile	2018-11-10 13:47:34.043835999 +0100
+@@ -799,6 +799,11 @@
+ ALL-$(CONFIG_X86_RESET_VECTOR) += u-boot.rom
+ endif
+ 
++# rk3328 needs itb image to boot properly
++ifeq ($(CONFIG_ROCKCHIP_RK3328),y)
++ALL-y += u-boot.itb
++endif
++
+ # enable combined SPL/u-boot/dtb rules for tegra
+ ifeq ($(CONFIG_TEGRA)$(CONFIG_SPL),yy)
+ ALL-y += u-boot-tegra.bin u-boot-nodtb-tegra.bin
diff --git a/board/pine64/rock64/extlinux.conf b/board/pine64/rock64/extlinux.conf
new file mode 100644
index 0000000000..bf71982a9f
--- /dev/null
+++ b/board/pine64/rock64/extlinux.conf
@@ -0,0 +1,4 @@
+label rock64-buildroot
+  kernel /boot/Image
+  devicetree /boot/rk3328-rock64.dtb
+  append console=ttyS2,1500000n8 root=/dev/mmcblk0p1 ro rootwait
diff --git a/board/pine64/rock64/genimage.cfg b/board/pine64/rock64/genimage.cfg
new file mode 100644
index 0000000000..0b5a0d8804
--- /dev/null
+++ b/board/pine64/rock64/genimage.cfg
@@ -0,0 +1,23 @@
+image sdcard.img {
+    hdimage {
+    }
+
+    partition uboot-spl {
+        in-partition-table = "no"
+        image = "u-boot-tpl-spl.img"
+        offset = 32768 # 512 * 0x40 from start of sd card
+    }
+
+    partition uboot {
+        in-partition-table = "no"
+        image = "u-boot.itb"
+        offset = 262144 # 512 * 0x200 from start of sd card
+    }
+
+    partition rootfs {
+        partition-type = 0x83
+        bootable = "yes"
+        image = "rootfs.ext2"
+        size = 500M
+    }
+}
diff --git a/board/pine64/rock64/post-build.sh b/board/pine64/rock64/post-build.sh
new file mode 100755
index 0000000000..26b53cba8e
--- /dev/null
+++ b/board/pine64/rock64/post-build.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+MKIMAGE=$HOST_DIR/bin/mkimage
+BOARD_DIR="$(dirname $0)"
+
+$MKIMAGE -n rk3328 -T rksd -d $BINARIES_DIR/u-boot-tpl.bin $BINARIES_DIR/u-boot-tpl.img
+cat $BINARIES_DIR/u-boot-tpl.img $BINARIES_DIR/u-boot-spl.bin > $BINARIES_DIR/u-boot-tpl-spl.img
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/pine64/rock64/readme.txt b/board/pine64/rock64/readme.txt
new file mode 100644
index 0000000000..8923c7ab5c
--- /dev/null
+++ b/board/pine64/rock64/readme.txt
@@ -0,0 +1,93 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Rock64. With this default configuration you
+can log in into board via uart and look around.
+
+Build
+=====
+
+First, load rock64 config for buildroot
+
+  $ make rock64_defconfig
+
+Optionally make changes to buildroot config (to install more programs)
+
+  $ make menuconfig
+
+And then build everything
+
+  $ make
+
+When completed, following files will be generated in output/images directory:
+
+  .
+  ??? Image
+  ??? bl31.bin
+  ??? bl31.elf
+  ??? rk3328-rock64.dtb
+  ??? rootfs.ext2
+  ??? rootfs.ext4 -> rootfs.ext2
+  ??? rootfs.tar
+  ??? sdcard.img
+  ??? u-boot-spl.bin
+  ??? u-boot-tpl-spl.img
+  ??? u-boot-tpl.bin
+  ??? u-boot-tpl.img
+  ??? u-boot.bin
+  ??? u-boot.itb
+
+Creating bootable SD card
+=========================
+
+!!! THIS COMMAND MAY WIPE YOUR DISK!
+!!! MAKE SURE YOU PASSED CORRECT DEVICE!
+!!! OR IT THIS WILL WIPE YOUR DISK!
+
+Simply invoke (as root)
+
+  # dd if=output/images/sdcard.img of=/dev/sdX && sync
+
+Where X is your SD card device (not partition), of= argument may also be
+/dev/mmcblk0 if you are using built-in sd card reader.
+
+Runtime
+=======
+
+Login
+-----
+
+By default, buildroot has no password, just type 'root' as login user, and
+you will be logged in.
+
+Serial console
+--------------
+
+Serial console needs to be connected to pins (into 40pin rpi compatible part)
+
+pin 6:  gnd
+pin 8:  tx
+pin 10: rx
+
+Pin numbers are printed on board.
+
+Uart configuration is not standard. Rock64 uses 1500000 (1,5M) baudrate
+with standard 8n1.
+
+Ethernet
+--------
+
+To enable ethernet you need to load modules for it:
+
+# modprobe stmmac
+# modprobe dwmac-rk
+
+and since by default there is no dhcp installed, you need to configure ip
+address, remember to change address to fit your network.
+
+# ifconfig eth0 up
+# ip addr add 10.1.1.180/24 dev eth0
+# ping 10.1.1.1
+PING 10.1.1.1 (10.1.1.1): 56 data bytes
+64 bytes from 10.1.1.1: seq=0 ttl=64 time=0.695 ms
diff --git a/configs/rock64_defconfig b/configs/rock64_defconfig
new file mode 100644
index 0000000000..c00d8dc25e
--- /dev/null
+++ b/configs/rock64_defconfig
@@ -0,0 +1,34 @@
+BR2_aarch64=y
+BR2_KERNEL_HEADERS_4_19=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/rock64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/rock64/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.19"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-rock64"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ayufan-rock64/linux-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2017.09-rockchip-ayufan-1035-gd646df03ac"
+BR2_TARGET_UBOOT_PATCH="board/pine64/rock64/build-uboot-itb.patch"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock64-rk3328"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin tpl/u-boot-tpl.bin"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.18.1
