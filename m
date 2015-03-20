From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Fri, 20 Mar 2015 18:41:56 +0100
Subject: [Buildroot] [PATCH 1/2] imx6sabresd: rename to imx6sabre
Message-ID: <1426873317-22471-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename imx6sabresd board folder to imx6sabre, to prepare for Sabre Auto
addition. Update doc, link and defconfigs accordingly.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Eric B?nard <eric@eukrea.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
---
 board/freescale/imx53loco/create-boot-sd.sh        |  2 +-
 board/freescale/imx6sabre/create-boot-sd.sh        | 93 ++++++++++++++++++++++
 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 +++++++++
 board/freescale/imx6sabre/readme.txt               | 68 ++++++++++++++++
 board/freescale/imx6sabresd/create-boot-sd.sh      | 93 ----------------------
 ...ommon-boot-Linux-to-init-in-mfgtools-mode.patch | 36 ---------
 board/freescale/imx6sabresd/readme.txt             | 67 ----------------
 configs/freescale_imx6dlsabresd_defconfig          |  2 +-
 configs/freescale_imx6qsabresd_defconfig           |  2 +-
 9 files changed, 200 insertions(+), 199 deletions(-)
 create mode 100755 board/freescale/imx6sabre/create-boot-sd.sh
 create mode 100644 board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
 create mode 100644 board/freescale/imx6sabre/readme.txt
 delete mode 100755 board/freescale/imx6sabresd/create-boot-sd.sh
 delete mode 100644 board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
 delete mode 100644 board/freescale/imx6sabresd/readme.txt

diff --git a/board/freescale/imx53loco/create-boot-sd.sh b/board/freescale/imx53loco/create-boot-sd.sh
index 3083fd2..b1ce208 120000
--- a/board/freescale/imx53loco/create-boot-sd.sh
+++ b/board/freescale/imx53loco/create-boot-sd.sh
@@ -1 +1 @@
-../imx6sabresd/create-boot-sd.sh
\ No newline at end of file
+../imx6sabre/create-boot-sd.sh
\ No newline at end of file
diff --git a/board/freescale/imx6sabre/create-boot-sd.sh b/board/freescale/imx6sabre/create-boot-sd.sh
new file mode 100755
index 0000000..af45115
--- /dev/null
+++ b/board/freescale/imx6sabre/create-boot-sd.sh
@@ -0,0 +1,93 @@
+#!/bin/sh
+
+set -u
+set -e
+
+PROGNAME=$(basename $0)
+
+usage()
+{
+    echo "Create an SD card that boots on an i.MX53/6 board."
+    echo
+    echo "Note: all data on the the card will be completely deleted!"
+    echo "Use with care!"
+    echo "Superuser permissions may be required to write to the device."
+    echo
+    echo "Usage: ${PROGNAME} <sd_block_device>"
+    echo "Arguments:"
+    echo "  <sd_block_device>     The device to be written to"
+    echo
+    echo "Example: ${PROGNAME} /dev/mmcblk0"
+    echo
+}
+
+if [ $# -ne 1 ]; then
+    usage
+    exit 1
+fi
+
+if [ $(id -u) -ne 0 ]; then
+    echo "${PROGNAME} must be run as root"
+    exit 1
+fi
+
+DEV=${1}
+
+# The partition name prefix depends on the device name:
+# - /dev/sde -> /dev/sde1
+# - /dev/mmcblk0 -> /dev/mmcblk0p1
+if echo ${DEV}|grep -q mmcblk ; then
+    PART="p"
+else
+    PART=""
+fi
+
+PART1=${DEV}${PART}1
+PART2=${DEV}${PART}2
+
+# Unmount the partitions if mounted
+umount ${PART1} || true
+umount ${PART2} || true
+
+# First, clear the card
+dd if=/dev/zero of=${DEV} bs=1M count=20
+
+sync
+
+# Partition the card.
+# SD layout for i.MX6 boot:
+# - Bootloader at offset 1024
+# - FAT partition starting at 1MB offset, containing uImage and *.dtb
+# - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
+sfdisk ${DEV} <<EOF
+32,480,b
+512,,L
+EOF
+
+sync
+
+# Copy the bootloader at offset 1024
+dd if=output/images/u-boot.imx of=${DEV} obs=512 seek=2
+
+# Prepare a temp dir for mounting partitions
+TMPDIR=$(mktemp -d)
+
+# FAT partition: kernel and DTBs
+mkfs.vfat ${PART1}
+mount ${PART1} ${TMPDIR}
+cp output/images/*Image ${TMPDIR}/
+cp output/images/*.dtb  ${TMPDIR}/ || true
+sync
+umount ${TMPDIR}
+
+# ext2 partition: root filesystem
+mkfs.ext2 ${PART2}
+mount ${PART2} ${TMPDIR}
+tar -C ${TMPDIR}/ -xf output/images/rootfs.tar
+sync
+umount ${TMPDIR}
+
+# Cleanup
+rmdir ${TMPDIR}
+sync
+echo Done
diff --git a/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
new file mode 100644
index 0000000..c01df4e
--- /dev/null
+++ b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
@@ -0,0 +1,36 @@
+From 4a7cd7c5b165317dccf45cfc235da3e14bc339e8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
+Date: Tue, 12 Aug 2014 10:17:31 +0200
+Subject: [PATCH] mx6qsabre_common: boot Linux to /init in mfgtools mode
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Buildroot supplies a nice /init wrapper script to use when booting from a
+ramdisk.
+
+This patch tells u-boot to tell the kernel to boot into /init (instead of
+/linuxrc) on i.MX6, when booting in mfgtools mode. This way we can boot a
+buildroot system entirely through USB.
+
+Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
+---
+ include/configs/mx6qsabre_common.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/configs/mx6qsabre_common.h b/include/configs/mx6qsabre_common.h
+index 69ff0df..ec7b665 100644
+--- a/include/configs/mx6qsabre_common.h
++++ b/include/configs/mx6qsabre_common.h
+@@ -129,7 +129,7 @@
+ 
+ #define CONFIG_MFG_ENV_SETTINGS \
+ 	"mfgtool_args=setenv bootargs console=" CONFIG_CONSOLE_DEV ",115200 " \
+-		"rdinit=/linuxrc " \
++		"rdinit=/init " \
+ 		"g_mass_storage.stall=0 g_mass_storage.removable=1 " \
+ 		"g_mass_storage.idVendor=0x066F g_mass_storage.idProduct=0x37FF "\
+ 		"g_mass_storage.iSerialNumber=\"\" "\
+-- 
+2.0.1
+
diff --git a/board/freescale/imx6sabre/readme.txt b/board/freescale/imx6sabre/readme.txt
new file mode 100644
index 0000000..4287a4a
--- /dev/null
+++ b/board/freescale/imx6sabre/readme.txt
@@ -0,0 +1,68 @@
+*******************************************************
+Freescale i.MX6Q and i.MX6DL SABRESD development boards
+*******************************************************
+
+This file documents the Buildroot support for the Freescale SABRE Board for
+Smart Devices Based on the i.MX 6 Series (SABRESD).
+
+Read the SABRESD Quick Start Guide for an introduction to the board:
+http://cache.freescale.com/files/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.pdf
+
+Build
+=====
+
+First, configure Buildroot for your SABRE board.
+For i.MX6Q SABRE SD board:
+
+  make freescale_imx6qsabresd_defconfig
+
+For i.MX6DL SABRE SD board:
+
+  make freescale_imx6dlsabresd_defconfig
+
+Build all components:
+
+  make
+
+You will find in ./output/images/ the following files:
+  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb or imx6q-sabreauto.dtb or
+    imx6dl-sabreauto.dtb
+  - rootfs.ext2
+  - rootfs.tar
+  - u-boot.imx
+  - uImage
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Run the following script as root on your SD card. This will partition the card
+and copy the bootloader, kernel, DTBs and root filesystem as needed.
+
+*** WARNING! The script will destroy all the card content. Use with care! ***
+
+  ./board/freescale/imx6sabre/create-boot-sd.sh <your-sd-device>
+
+Boot the SABRE board
+====================
+
+To boot your newly created system on a SABRE SD Board (refer to the SABRE SD
+Quick Start Guide for guidance):
+- insert the SD card in the SD3 slot of the board;
+- locate the BOOT dip switches (SW6), set dips 2 and 7 to ON, all others to OFF;
+- connect a Micro USB cable to Debug Port and connect using a terminal emulator
+  at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+
+https://community.freescale.com/docs/DOC-95015
+https://community.freescale.com/docs/DOC-95017
+https://community.freescale.com/docs/DOC-99218
diff --git a/board/freescale/imx6sabresd/create-boot-sd.sh b/board/freescale/imx6sabresd/create-boot-sd.sh
deleted file mode 100755
index af45115..0000000
--- a/board/freescale/imx6sabresd/create-boot-sd.sh
+++ /dev/null
@@ -1,93 +0,0 @@
-#!/bin/sh
-
-set -u
-set -e
-
-PROGNAME=$(basename $0)
-
-usage()
-{
-    echo "Create an SD card that boots on an i.MX53/6 board."
-    echo
-    echo "Note: all data on the the card will be completely deleted!"
-    echo "Use with care!"
-    echo "Superuser permissions may be required to write to the device."
-    echo
-    echo "Usage: ${PROGNAME} <sd_block_device>"
-    echo "Arguments:"
-    echo "  <sd_block_device>     The device to be written to"
-    echo
-    echo "Example: ${PROGNAME} /dev/mmcblk0"
-    echo
-}
-
-if [ $# -ne 1 ]; then
-    usage
-    exit 1
-fi
-
-if [ $(id -u) -ne 0 ]; then
-    echo "${PROGNAME} must be run as root"
-    exit 1
-fi
-
-DEV=${1}
-
-# The partition name prefix depends on the device name:
-# - /dev/sde -> /dev/sde1
-# - /dev/mmcblk0 -> /dev/mmcblk0p1
-if echo ${DEV}|grep -q mmcblk ; then
-    PART="p"
-else
-    PART=""
-fi
-
-PART1=${DEV}${PART}1
-PART2=${DEV}${PART}2
-
-# Unmount the partitions if mounted
-umount ${PART1} || true
-umount ${PART2} || true
-
-# First, clear the card
-dd if=/dev/zero of=${DEV} bs=1M count=20
-
-sync
-
-# Partition the card.
-# SD layout for i.MX6 boot:
-# - Bootloader at offset 1024
-# - FAT partition starting at 1MB offset, containing uImage and *.dtb
-# - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
-sfdisk ${DEV} <<EOF
-32,480,b
-512,,L
-EOF
-
-sync
-
-# Copy the bootloader at offset 1024
-dd if=output/images/u-boot.imx of=${DEV} obs=512 seek=2
-
-# Prepare a temp dir for mounting partitions
-TMPDIR=$(mktemp -d)
-
-# FAT partition: kernel and DTBs
-mkfs.vfat ${PART1}
-mount ${PART1} ${TMPDIR}
-cp output/images/*Image ${TMPDIR}/
-cp output/images/*.dtb  ${TMPDIR}/ || true
-sync
-umount ${TMPDIR}
-
-# ext2 partition: root filesystem
-mkfs.ext2 ${PART2}
-mount ${PART2} ${TMPDIR}
-tar -C ${TMPDIR}/ -xf output/images/rootfs.tar
-sync
-umount ${TMPDIR}
-
-# Cleanup
-rmdir ${TMPDIR}
-sync
-echo Done
diff --git a/board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
deleted file mode 100644
index c01df4e..0000000
--- a/board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 4a7cd7c5b165317dccf45cfc235da3e14bc339e8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
-Date: Tue, 12 Aug 2014 10:17:31 +0200
-Subject: [PATCH] mx6qsabre_common: boot Linux to /init in mfgtools mode
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Buildroot supplies a nice /init wrapper script to use when booting from a
-ramdisk.
-
-This patch tells u-boot to tell the kernel to boot into /init (instead of
-/linuxrc) on i.MX6, when booting in mfgtools mode. This way we can boot a
-buildroot system entirely through USB.
-
-Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
----
- include/configs/mx6qsabre_common.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/configs/mx6qsabre_common.h b/include/configs/mx6qsabre_common.h
-index 69ff0df..ec7b665 100644
---- a/include/configs/mx6qsabre_common.h
-+++ b/include/configs/mx6qsabre_common.h
-@@ -129,7 +129,7 @@
- 
- #define CONFIG_MFG_ENV_SETTINGS \
- 	"mfgtool_args=setenv bootargs console=" CONFIG_CONSOLE_DEV ",115200 " \
--		"rdinit=/linuxrc " \
-+		"rdinit=/init " \
- 		"g_mass_storage.stall=0 g_mass_storage.removable=1 " \
- 		"g_mass_storage.idVendor=0x066F g_mass_storage.idProduct=0x37FF "\
- 		"g_mass_storage.iSerialNumber=\"\" "\
--- 
-2.0.1
-
diff --git a/board/freescale/imx6sabresd/readme.txt b/board/freescale/imx6sabresd/readme.txt
deleted file mode 100644
index 583ef40..0000000
--- a/board/freescale/imx6sabresd/readme.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-*******************************************************
-Freescale i.MX6Q and i.MX6DL SABRESD development boards
-*******************************************************
-
-This file documents the Buildroot support for the Freescale SABRE Board for
-Smart Devices Based on the i.MX 6 Series (SABRESD).
-
-Read the SABRESD Quick Start Guide for an introduction to the board:
-http://cache.freescale.com/files/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.pdf
-
-Build
-=====
-
-First, configure Buildroot for your SABRESD board.
-For i.MX6Q:
-
-  make freescale_imx6qsabresd_defconfig
-
-For i.MX6DL:
-
-  make freescale_imx6dlsabresd_defconfig
-
-Build all components:
-
-  make
-
-You will find in ./output/images/ the following files:
-  - imx6dl-sabresd.dtb or imx6q-sabresd.dtb
-  - rootfs.ext2
-  - rootfs.tar
-  - u-boot.imx
-  - uImage
-
-Create a bootable SD card
-=========================
-
-To determine the device associated to the SD card have a look in the
-/proc/partitions file:
-
-  cat /proc/partitions
-
-Run the following script as root on your SD card. This will partition the card
-and copy the bootloader, kernel, DTBs and root filesystem as needed.
-
-*** WARNING! The script will destroy all the card content. Use with care! ***
-
-  ./board/freescale/imx6sabresd/create-boot-sd.sh <your-sd-device>
-
-Boot the SABRESD board
-======================
-
-To boot your newly created system (refer to the SABRESD Quick Start Guide for
-guidance):
-- insert the SD card in the SD3 slot of the board;
-- locate the BOOT dip switches (SW6), set dips 2 and 7 to ON, all others to OFF;
-- connect a Micro USB cable to Debug Port and connect using a terminal emulator
-  at 115200 bps, 8n1;
-- power on the board.
-
-Enjoy!
-
-References
-==========
-
-https://community.freescale.com/docs/DOC-95015
-https://community.freescale.com/docs/DOC-95017
-https://community.freescale.com/docs/DOC-99218
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 680031d..a13d2b9 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_cortex_a9=y
 
 # patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
 # toolchain
 BR2_KERNEL_HEADERS_VERSION=y
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index f2f702e..95f29d7 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_cortex_a9=y
 
 # patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
 # toolchain
 BR2_KERNEL_HEADERS_VERSION=y
-- 
2.1.4
