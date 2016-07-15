From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 15 Jul 2016 11:01:00 -0400
Subject: [Buildroot] [PATCH v6 2/2] configs: add defconfig for TS-4800
In-Reply-To: <1468594860-14932-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
References: <1468594860-14932-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
Message-ID: <1468594860-14932-3-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TS-4800 is supported by mainline Linux as of 4.5 and by U-boot
as of v2016-07.

The package requires the custom ts4800-mbrboot routine.

A post-image script is provided to generate an image that can be "dd"
directly to an SD card.

More details on the board here:
  http://wiki.embeddedarm.com/wiki/TS-4800

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
Signed-off-by: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
---
Changes v5->v6:
	- removed custom U-boot v2016.07 which is now the default version in
	  BR
Changes v4->v5 (after Peter Korsgaard's review):
	- delete all the unnecessary defconfig options

 board/technologic/ts4800/genimage.cfg   | 37 +++++++++++++++++++++++++++++++++
 board/technologic/ts4800/linux.fragment |  3 +++
 board/technologic/ts4800/post-image.sh  | 22 ++++++++++++++++++++
 configs/ts4800_defconfig                | 19 +++++++++++++++++
 4 files changed, 81 insertions(+)
 create mode 100644 board/technologic/ts4800/genimage.cfg
 create mode 100644 board/technologic/ts4800/linux.fragment
 create mode 100755 board/technologic/ts4800/post-image.sh
 create mode 100644 configs/ts4800_defconfig

diff --git a/board/technologic/ts4800/genimage.cfg b/board/technologic/ts4800/genimage.cfg
new file mode 100644
index 0000000..2070cc5
--- /dev/null
+++ b/board/technologic/ts4800/genimage.cfg
@@ -0,0 +1,37 @@
+image boot.vfat {
+        vfat {
+                files = {
+                        "zImage",
+                        "imx51-ts4800.dtb"
+                }
+        }
+        size = 8M
+}
+
+image sdcard.img {
+        hdimage {
+        }
+
+        partition mbrboot {
+                in-partition-table = "no"
+                image = "mbrboot.bin"
+                offset = 0
+        }
+
+        partition uboot {
+                partition-type = 0xda
+                image = "u-boot.bin"
+                size = 256k
+        }
+
+        partition kernel {
+                partition-type = 0xC
+                image = "boot.vfat"
+        }
+
+        partition rootfs {
+                partition-type = 0x83
+                image = "rootfs.ext4"
+                size = 256M
+        }
+}
diff --git a/board/technologic/ts4800/linux.fragment b/board/technologic/ts4800/linux.fragment
new file mode 100644
index 0000000..0451c86
--- /dev/null
+++ b/board/technologic/ts4800/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_TOUCHSCREEN_TS4800=y
+CONFIG_TS4800_WATCHDOG=y
+CONFIG_TS4800_IRQ=y
diff --git a/board/technologic/ts4800/post-image.sh b/board/technologic/ts4800/post-image.sh
new file mode 100755
index 0000000..bbfea28
--- /dev/null
+++ b/board/technologic/ts4800/post-image.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+#
+# Copyright (C) 2015 Savoir-faire Linux
+# Post image generation script.
+
+IDIR="$1"
+
+BOARD_DIR="board/technologic/ts4800"
+GENIMAGE_CFG_DEFAULT="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_CFG=${GENIMAGE_CFG_DEFAULT}
+GENIMAGE_TMP=${BUILD_DIR}/.genimage_tmp
+
+rm -rf ${GENIMAGE_TMP}
+
+${HOST_DIR}/usr/bin/genimage \
+        --config ${GENIMAGE_CFG} \
+        --rootpath ${TARGET_DIR} \
+        --tmppath ${GENIMAGE_TMP} \
+        --inputpath $IDIR \
+        --outputpath $IDIR
+
+exit $?
diff --git a/configs/ts4800_defconfig b/configs/ts4800_defconfig
new file mode 100644
index 0000000..eacf8ff
--- /dev/null
+++ b/configs/ts4800_defconfig
@@ -0,0 +1,19 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/technologic/ts4800/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(TOPDIR)/board/technologic/ts4800/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-ts4800"
+BR2_PACKAGE_BUSYBOX_WATCHDOG=y
+BR2_PACKAGE_TS4800_MBRBOOT=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="ts4800"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
1.9.1
