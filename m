From: imrehg at gmail.com <imrehg@gmail.com>
Date: Mon, 19 Oct 2015 11:45:05 +0800
Subject: [Buildroot] [PATCH 1/1] board/via/imx6_vab820: update to latest BSP
	release
Message-ID: <1445226305-29641-1-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gergely Imreh <imrehg@gmail.com>

Changes:
* Update Kernel and U-Boot to the latest 2.0.6 BSP release from the
official sources.
* Add genimage config to create bootable SD card image

Signed-off-by: Gergely Imreh <imrehg@gmail.com>

---
I've added the genimage method because it is in part very handy, and
in part seem to have shown up for a couple of other boards in patches,
though not that much in the repo (only Wandboard at the moment).
Let me know if that's okay to have as default, or if I should roll back
that part of the changeset and just have manual boot image creation steps
as before.

 board/via/imx6_vab820/genimage.cfg                 | 38 ++++++++++++++++++++++
 .../uboot/default-to-boot-from-the-SD-card.patch   | 25 --------------
 board/via/imx6_vab820/post-image.sh                | 16 +++++++++
 board/via/imx6_vab820/readme.txt                   | 17 ++++++++--
 configs/via_imx6_vab820_defconfig                  | 15 +++++----
 5 files changed, 78 insertions(+), 33 deletions(-)
 create mode 100644 board/via/imx6_vab820/genimage.cfg
 delete mode 100644 board/via/imx6_vab820/patches/uboot/default-to-boot-from-the-SD-card.patch
 create mode 100755 board/via/imx6_vab820/post-image.sh

diff --git a/board/via/imx6_vab820/genimage.cfg b/board/via/imx6_vab820/genimage.cfg
new file mode 100644
index 0000000..8d5c23f
--- /dev/null
+++ b/board/via/imx6_vab820/genimage.cfg
@@ -0,0 +1,38 @@
+# Minimal SD card image for the VIA VAB-820 / AMOS-820
+#
+# The SD card must have at least 1 MB free at the beginning.
+# U-Boot and is dumped as is.
+# A FAT boot partition and an Ext4 root filesystem partition are required.
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx6q-vab820.dtb",
+      "uImage"
+    }
+  }
+  size = 10M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.imx"
+    offset = 1024
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+    size = 512M
+  }
+}
diff --git a/board/via/imx6_vab820/patches/uboot/default-to-boot-from-the-SD-card.patch b/board/via/imx6_vab820/patches/uboot/default-to-boot-from-the-SD-card.patch
deleted file mode 100644
index 9b219f7..0000000
--- a/board/via/imx6_vab820/patches/uboot/default-to-boot-from-the-SD-card.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 6e72bef18c928753c9861c1f6fc8c2c4dd5d1e97 Mon Sep 17 00:00:00 2001
-From: Gergely Imreh <imrehg@gmail.com>
-Date: Thu, 30 Apr 2015 16:24:38 +0800
-Subject: [PATCH] default to boot from the SD card
-
----
- include/configs/mx6qvab820_common.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/configs/mx6qvab820_common.h b/include/configs/mx6qvab820_common.h
-index 99bc8a9..2e70c94 100644
---- a/include/configs/mx6qvab820_common.h
-+++ b/include/configs/mx6qvab820_common.h
-@@ -216,7 +216,7 @@
- 	"bootcmd_mmc=setenv mmcdev 1; setenv rootdev 0; setenv mmcname mmc; run bootcmd_main;\0"
- 
- #define CONFIG_BOOTCOMMAND \
--	"run bootcmd_mmc"
-+	"run bootcmd_sd"
- 
- #define CONFIG_ARP_TIMEOUT     200UL
- 
--- 
-2.3.7
-
diff --git a/board/via/imx6_vab820/post-image.sh b/board/via/imx6_vab820/post-image.sh
new file mode 100755
index 0000000..8d502a5
--- /dev/null
+++ b/board/via/imx6_vab820/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/bash
+
+GENIMAGE_CFG="board/via/imx6_vab820/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+  --rootpath "${TARGET_DIR}" \
+  --tmppath "${GENIMAGE_TMP}" \
+  --inputpath "${BINARIES_DIR}" \
+  --outputpath "${BINARIES_DIR}" \
+  --config "${GENIMAGE_CFG}"
+
+RET=${?}
+exit ${RET}
diff --git a/board/via/imx6_vab820/readme.txt b/board/via/imx6_vab820/readme.txt
index 7345e5d..908441f 100644
--- a/board/via/imx6_vab820/readme.txt
+++ b/board/via/imx6_vab820/readme.txt
@@ -25,14 +25,27 @@ When you are happy with the setup, run:
 The result of the build with the default settings should be these files:
 
   output/images
+  ??? boot.vfat
   ??? imx6q-vab820.dtb
+  ??? rootfs.ext2
+  ??? rootfs.ext4 -> rootfs.ext2
   ??? rootfs.tar
+  ??? sdcard.img
   ??? u-boot.imx
   ??? uImage
 
+Copy the bootable `sdcard.img` onto an SD card with "dd":
 
-Set up your SD card
--------------------
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX bs=1M conv=fsync
+
+where "sdX" is the appropriate partition of your card.
+
+For details about the medium image layout, see the definition in
+`board/via/imx6_vab820/genimage.cfg`.
+
+
+Setting up your SD card manually
+--------------------------------
 
 *Important*: pay attention which partition you are modifying so you don't
 accidentally erase the wrong file system, e.g your host computer or your
diff --git a/configs/via_imx6_vab820_defconfig b/configs/via_imx6_vab820_defconfig
index 8f24c65..8880bd5 100644
--- a/configs/via_imx6_vab820_defconfig
+++ b/configs/via_imx6_vab820_defconfig
@@ -8,18 +8,15 @@ BR2_ARM_FPU_VFPV3=y
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.10.17"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
-BR2_GLOBAL_PATCH_DIR="board/via/imx6_vab820/patches"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/viaembedded/vab820-kernel-bsp.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="via_3.10.17_2.0.1"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="via_3.10.17_2.0.6"
+BR2_LINUX_KERNEL_DEFCONFIG="via_vab820"
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_USE_INTREE_DTS=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-vab820"
 
 # Bootloader
@@ -27,5 +24,11 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qvab820"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/viaembedded/vab820-uboot-bsp.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="via_3.10.17_2.0.1"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="via_3.10.17_2.0.6"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/via/imx6_vab820/post-image.sh"
-- 
2.6.1
