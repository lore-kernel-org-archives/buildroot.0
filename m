From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Wed, 20 Jan 2016 15:30:20 +0100
Subject: [Buildroot] [PATCH] board: add support for Freescale i.MX6UL
	Evaluation Kit
Message-ID: <1453300220-29113-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien BOIBESSOT <julien.boibessot@armadeus.com>

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
---
 board/freescale/imx6ulevk/create-boot-sd.sh | 92 +++++++++++++++++++++++++++++
 board/freescale/imx6ulevk/readme.txt        | 58 ++++++++++++++++++
 configs/freescale_imx6ulevk_defconfig       | 31 ++++++++++
 3 files changed, 181 insertions(+)
 create mode 100755 board/freescale/imx6ulevk/create-boot-sd.sh
 create mode 100644 board/freescale/imx6ulevk/readme.txt
 create mode 100644 configs/freescale_imx6ulevk_defconfig

diff --git a/board/freescale/imx6ulevk/create-boot-sd.sh b/board/freescale/imx6ulevk/create-boot-sd.sh
new file mode 100755
index 0000000..b3c47ae
--- /dev/null
+++ b/board/freescale/imx6ulevk/create-boot-sd.sh
@@ -0,0 +1,92 @@
+#!/bin/sh
+
+set -u
+set -e
+
+PROGNAME=$(basename $0)
+
+usage()
+{
+    echo "Create an SD card that boots on an i.MX6UL EVK board."
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
+# SD layout for i.MX6UL boot (mimic Freescale's .sdcard):
+# - FAT partition at offset 8192 containing zImage and dtbs
+# - ext2/3 partition formatted as ext2 or ext3, containing the root filesystem.
+sfdisk --force -u S ${DEV} <<EOF
+8192,16384,c
+24576,1703936,83
+EOF
+
+sync
+
+# Copy the bootloader@offset 1024
+dd if=output/images/u-boot.imx of=${DEV} obs=512 seek=2
+
+# Prepare a temp dir for mounting partitions
+TMPDIR=$(mktemp -d)
+ 
+# FAT partition: kernel
+mkfs.vfat ${PART1}
+mount ${PART1} ${TMPDIR}
+cp output/images/zImage ${TMPDIR}/
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
diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
new file mode 100644
index 0000000..024b9b9
--- /dev/null
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -0,0 +1,58 @@
+***************************
+Freescale i.MX6UL EVK board
+***************************
+
+This file documents the Buildroot support for the Freescale i.MX6UL EVK board.
+
+Please read the i.MX6UL Evaluation Kit Quick Start Guide [1] for an
+introduction to the board.
+
+Build
+=====
+
+First, configure Buildroot for your i.MX6UL EVK board:
+
+  make freescale_imx6ulevk_defconfig
+
+Build all components:
+
+  make
+
+You will find in ./output/images/ the following files:
+  - imx6ul-14x14-evk.dtb
+  - rootfs.tar
+  - u-boot.imx
+  - zImage
+
+Create a bootable microSD card
+==============================
+
+To determine the device associated to the microSD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Run the following script as root on your microSD card. This will partition the
+card and copy the bootloader, kernel and root filesystem as needed.
+
+*** WARNING! The script will destroy all the card content. Use with care! ***
+
+  ./board/freescale/imx6ulevk/create-boot-sd.sh <your-microsd-device>
+
+Boot the i.MX6UL EVK board
+=========================
+
+To boot your newly created system (refer to the i.MX6UL EVK Quick Start Guide
+[1] for guidance):
+- insert the microSD card in the microSD slot of the board;
+- verify that your i.MX6UL EVK board jumpers and switches are set as mentioned
+  in the i.MX6UL EVK Quick Start Guide [1];
+- put a micro USB cable into the Debug USB Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
+
+Enjoy!
+
+References
+==========
+[1] http://cache.freescale.com/files/32bit/doc/quick_start_guide/IMX6ULTRALITEQSG.pdf
diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
new file mode 100644
index 0000000..7ba5e7b
--- /dev/null
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -0,0 +1,31 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_EABI=y
+BR2_ARM_FPU_NEON=y
+
+# toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.14.28"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="imx_3.14.38_6ul_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="imx_v2015.04_3.14.38_6ul_ga"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
-- 
2.1.4
