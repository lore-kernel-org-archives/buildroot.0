From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:24:43 +0100
Subject: [Buildroot] [git commit] board: add support for chiliBoard
Message-ID: <20170130202529.AC103819DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9abeddce65a62e89223cecedb29e9e207f7b0a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Board support package includes:

 * Buildroot defconfig
 * Mainline Linux kernel v4.9.6
 * Mainline U-Boot (current HEAD revision is used, as board support
   patches are not in stable release yet)
 * genimage config to create sdcard image
 * Board readme.txt

[Peter: use http:// instead of git:// for u-boot]
Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/grinn/chiliboard/genimage.cfg  | 31 ++++++++++++++++++++++++
 board/grinn/chiliboard/post-image.sh | 14 +++++++++++
 board/grinn/chiliboard/readme.txt    | 46 ++++++++++++++++++++++++++++++++++++
 configs/grinn_chiliboard_defconfig   | 28 ++++++++++++++++++++++
 4 files changed, 119 insertions(+)

diff --git a/board/grinn/chiliboard/genimage.cfg b/board/grinn/chiliboard/genimage.cfg
new file mode 100644
index 0000000..ffe027e
--- /dev/null
+++ b/board/grinn/chiliboard/genimage.cfg
@@ -0,0 +1,31 @@
+# Minimal microSD card image for Grinn's chiliBoard
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "MLO",
+      "u-boot.img",
+      "am335x-chiliboard.dtb",
+      "zImage"
+    }
+  }
+  size = 16M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 1M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/grinn/chiliboard/post-image.sh b/board/grinn/chiliboard/post-image.sh
new file mode 100755
index 0000000..1a076ee
--- /dev/null
+++ b/board/grinn/chiliboard/post-image.sh
@@ -0,0 +1,14 @@
+#!/usr/bin/env bash
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+    --rootpath "${TARGET_DIR}" \
+    --tmppath "${GENIMAGE_TMP}" \
+    --inputpath "${BINARIES_DIR}" \
+    --outputpath "${BINARIES_DIR}" \
+    --config "${GENIMAGE_CFG}"
diff --git a/board/grinn/chiliboard/readme.txt b/board/grinn/chiliboard/readme.txt
new file mode 100644
index 0000000..676aa70
--- /dev/null
+++ b/board/grinn/chiliboard/readme.txt
@@ -0,0 +1,46 @@
+**********
+chiliBoard
+**********
+
+Build
+=====
+
+First, configure Buildroot for your chiliBoard:
+
+  make grinn_chiliboard_defconfig
+
+Build image:
+
+  make
+
+After building you should get a tree like this:
+
+  output/images/
+  ????????? am335x-chiliboard.dtb
+  ????????? boot.vfat
+  ????????? MLO
+  ????????? rootfs.ext2
+  ????????? rootfs.ext4
+  ????????? rootfs.tar
+  ????????? sdcard.img
+  ????????? u-boot.img
+  ????????? zImage
+
+Create a bootable microSD card
+==============================
+
+Buildroot prepares a bootable microSD card image "sdcard.img" in output/images/
+directory, To flash SD card just run the following command:
+
+  sudo dd if=output/images/sdcard.img of=/dev/<sd_card> bs=1M
+
+where <sd_card> can be sdX or mmcblkX
+
+*** WARNING! This will destroy all contents of device you specify! ***
+
+Boot chiliBoard
+===============
+
+- insert the microSD card in the microSD slot of the board;
+- plug micro USB cable to provide power and console interface
+- use terminal emulator with 115200 bps, 8n1
diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
new file mode 100644
index 0000000..cfd22b8
--- /dev/null
+++ b/configs/grinn_chiliboard_defconfig
@@ -0,0 +1,28 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/chiliboard/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-chiliboard"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="aac477eca88dd81b18b48573ababee5112d571f3"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="chiliboard"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
