From: Jonathan Ben-Avraham <yba@tkos.co.il>
Date: Sun, 31 May 2015 01:31:24 +0300
Subject: [Buildroot] [PATCH v2 1/1] Solid-Run HummingBoard i2eX defconfig
	and bootable microSD Bash script
Message-ID: <1433025084-25182-1-git-send-email-yba@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Solid-Run HummingBoard i2eX defconfig and bootable microSD Bash script

Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
---
 board/solid-run/hummingboard-i2eX/readme.txt |  11 ++
 board/solid-run/make_sd_card.sh              | 278 +++++++++++++++++++++++++++
 configs/hummingboard_i2eX_defconfig          |  25 +++
 3 files changed, 314 insertions(+)
 create mode 100644 board/solid-run/hummingboard-i2eX/readme.txt
 create mode 100755 board/solid-run/make_sd_card.sh
 create mode 100644 configs/hummingboard_i2eX_defconfig

diff --git a/board/solid-run/hummingboard-i2eX/readme.txt b/board/solid-run/hummingboard-i2eX/readme.txt
new file mode 100644
index 0000000..4e25179
--- /dev/null
+++ b/board/solid-run/hummingboard-i2eX/readme.txt
@@ -0,0 +1,11 @@
+Solid-Run HummingBoard-i2eX minimal defconfig, without WiFi or OpenGL firmware
+is provided in configs/hummingboard_i2eX_defconfig
+
+Bash script for creating bootable microSD cards is in
+board/solid-run/make_sd_card.sh
+
+Example usage:
+
+sudo make_sd_card.sh sde output HummingBoard-i2eX 256
+
+Maintainer: yba at tkos.co.il
diff --git a/board/solid-run/make_sd_card.sh b/board/solid-run/make_sd_card.sh
new file mode 100755
index 0000000..8586ff6
--- /dev/null
+++ b/board/solid-run/make_sd_card.sh
@@ -0,0 +1,278 @@
+#!/bin/bash -eu
+# @(#) Create a bootable SD card from Buildroot tree for Solid-Run boards
+#
+# Copyright (c) 2015 Tk Open Systems Ltd. all rights reserved
+# License granted for public use under the terms of the "Attribution-ShareAlike
+# 4.0 International" license, See full text at
+# https://creativecommons.org/licenses/by-sa/4.0/legalcode
+# Maintainer: yba at tkos.co.il
+# See: configs/hummingboard_i2eX_defconfig
+
+ME=$(basename ${0})
+
+! read -d '' USAGE << EOM
+USAGE: ${ME} <SD device> <BR output> <board model> [<rootfs size>]
+where: 
+	<SD device> is the basename of the device file, e.g. "sdb", "mmcblk0"
+	<BR output> is the Buildroot output directory, e.g. "/home/yba/buildroot/output"
+	<board model> is "hummingboard_i2eX" or the DTB filename in the images directory
+	<rootfs size> is the size of the rootfs partition in MiB (default 128 MiB)
+EOM
+
+ERROR=0
+
+if [ -z "${1+x}" ]
+then
+	if [ -z "${DEVICE+x}" ]
+	then
+		echo "${ME} ERROR: No DEVICE env var or device specification in first parameter"
+		ERROR=$((${ERROR}+1))
+	fi
+	if [ -z "${BUILDROOT_OUTPUT_DIR+x}" ]
+	then
+		echo "${ME} ERROR: No BUILDROOT_OUTPUT_DIR directory specification env var or in second parameter"
+		ERROR=$((${ERROR}+1))
+	fi
+	if [ -z "${BOARD_MODEL+x}" ]
+	then
+		echo "${ME} ERROR: No BOARD_MODEL specification env var or in third parameter"
+		ERROR=$((${ERROR}+1))
+	fi
+else
+	DEVICE=${1}
+	if [ -z "${2+x}" ]
+	then
+		if [ -z "${BUILDROOT_OUTPUT_DIR+x}" ]
+		then
+			echo "${ME} ERROR: No BUILDROOT_OUTPUT_DIR directory specification env var or in second parameter"
+			ERROR=$((${ERROR}+1))
+		fi
+	else
+		BUILDROOT_OUTPUT_DIR=${2}
+		if [ -z "${3+x}" ]
+		then
+			if [ -z "${BOARD_MODEL+x}" ]
+			then
+				echo "${ME} ERROR: No BOARD_MODEL specification env var or in third parameter"
+				ERROR=$((${ERROR}+1))
+			fi
+		else
+			BOARD_MODEL=${3}
+		fi
+	fi
+fi
+[ 0 -lt ${ERROR} ] && { echo "${USAGE}"; exit 1; }
+ERROR=0
+
+if [ -z "${4+x}" ]
+then
+	if [ -z "${ROOTFS_PARTITION_SIZE+x}" ]
+	then
+		ROOTFS_PARTITION_SIZE=128
+	fi
+else
+	ROOTFS_PARTITION_SIZE=${4}
+fi
+
+
+# rootfs partition starting at 1MB with size of ROOTFS_PARTITION_SIZE
+ROOTFS_PARTITION="n\np\n1\n2048\n+16M\nn\np\n2\n\n+${ROOTFS_PARTITION_SIZE}M\na\n\nw\n"
+
+# Not so cool - I will have to maintain this script every time Rabeeh pushes
+# new code
+if [ -z "${KERNEL_DIR+x}" ]
+then
+	KERNEL_DIR=${BUILDROOT_OUTPUT_DIR}/build/linux-ea83bda1b403d745c67fbf6ea307d05ca138577f
+fi
+
+if [ -z "${UBOOT_DIR+x}" ]
+then
+	UBOOT_DIR=${BUILDROOT_OUTPUT_DIR}/build/uboot-e817fa3165a607b581433a6abfe37e095a5d1dc9
+fi
+
+# Handle Ubuntu fdisk silliness
+if echo $(uname -a) | grep -q Ubuntu
+then
+	FDISK="fdisk -c -u"
+else
+	FDISK="fdisk -u=sectors"
+fi
+
+# The SD DEVICE could be specified as "mmcblk[0-9]+" or "sd[a-z]" and the SD partitions
+# as "mmcblk[0-9]+p[1-2]" or "sd[a-z][1-2]" so we need to check if the "p" is needed
+
+if echo ${DEVICE} | grep -q mmcblk
+then
+	P="p"
+else
+	P=""
+fi
+
+PART1=/dev/${DEVICE}${P}1
+PART2=/dev/${DEVICE}${P}2
+
+if [ 0 -ne ${EUID} ]
+then
+	echo "${ME} ERROR: You need to run this script as root or using 'sudo'."
+	exit 1
+fi
+
+if [ -z "${DEVICE}" ]
+then
+	echo "${ME} ERROR: You need to specify a non-empty SD device name as the"
+	echo "first command line parameter to this script or in the DEVICE env var."
+	echo "For example 'sdb' or 'mmcblk0'. Be careful not to do something silly"
+	echo "like specifying your system hard drive device."
+	ERROR=$((${ERROR}+1))
+else
+	if [ ! -b /dev/${DEVICE} ]
+	then
+		echo "${ME} ERROR: /dev/${DEVICE} is not a block device file"
+		ERROR=$((${ERROR}+1))
+	fi
+fi
+
+if [ -f /etc/multipath.conf ]
+then
+	if grep -q blacklist /etc/multipath.conf && ! grep -q ${DEVICE} /etc/multipath.conf 
+	then
+		echo
+		echo "==> WARNING: You probably want to blacklist ${DEVICE} in /etc/multipath.conf"
+		echo "==> Otherwise the kernel will not be notified of partition changes"
+		echo
+		sleep 5
+	fi
+fi
+
+if [ -z "${BUILDROOT_OUTPUT_DIR}" ]
+then
+	echo "${ME} ERROR: You need to specify the Buildroot output directory as"
+	echo "the third command line parameter to this script or in the BUILDROOT_OUTPUT_DIR"
+	echo "env var."
+	ERROR=$((${ERROR}+1))
+else
+	if [ ! -d "${BUILDROOT_OUTPUT_DIR}" ]
+	then
+		echo "${ME} ERROR: The [${BUILDROOT_OUTPUT_DIR}] directory does not"
+		echo "exist."
+		ERROR=$((${ERROR}+1))
+	fi
+fi
+
+if [ ! -d ${KERNEL_DIR} ]
+then
+	echo "${ME} INTERNAL ERROR: The kernel dir ${KERNEL_DIR} does not exist."
+	echo "The kernel version has probably been changed."
+	ERROR=$((${ERROR}+1))
+fi
+
+if [ ! -d ${UBOOT_DIR} ]
+then
+	echo "${ME} INTERNAL ERROR: The U-Boot dir ${UBOOT_DIR} does not exist."
+	echo "The kernel version has probably been changed."
+	ERROR=$((${ERROR}+1))
+fi
+
+if [ ! -f ${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar ]
+then
+	echo "${ME} ERROR: The rootfs image file "
+	echo "[${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar]"
+	echo "was not found."
+	echo "Check that the second parameter is the fully qualified directory."
+	ERROR=$((${ERROR}+1))
+fi
+
+
+BINS="fdisk mkfs.ext4 mount umount dd mktemp partprobe"
+for BIN in ${BINS}
+do
+	if ! which ${BIN} >/dev/null
+	then
+		echo "${ME} ERROR: Required executable ${BIN} is not in PATH"
+		ERROR=$((${ERROR}+1))
+	fi
+done
+
+MOUNT_POINT=$(mktemp -d /tmp/solid-run.XXXX)
+if [ ! -d "${MOUNT_POINT}" ]
+then
+	echo "${ME} ERROR: Can't create mount point"
+	exit 1
+fi
+
+[ 0 -lt ${ERROR} ] && exit 1
+
+# The devices might have already been mounted somewhere else by the automounter
+# so unmount them here
+while umount ${PART2}
+do
+	echo "${ME} Notice: Unmounted ${PART2}"
+done
+
+while umount ${PART1}
+do
+	echo "${ME} Notice: Unmounted ${PART1}"
+done
+
+# Zap any partition table on the SD
+dd if=/dev/zero of=/dev/${DEVICE} bs=1024 count=32
+
+printf ${ROOTFS_PARTITION} | ${FDISK} /dev/${DEVICE} || partprobe /dev/${DEVICE}
+sleep 2
+
+if [ ! -b ${PART2} ]
+then
+	echo "${ME} ERROR: ${PART2} partition not recognized"
+	exit 1
+fi
+
+# Hat tip to hste and jas for this recipe
+if ! mkfs.ext4 -F -O ^has_journal -E stride=2,stripe-width=1024 -b 4096 ${PART2}
+then
+	echo "${ME} ERROR: Failed to create ext4 filesystem on ${PART2}"
+	exit 1
+fi
+
+if ! mount ${PART2} ${MOUNT_POINT}
+then
+	echo "${ME} ERROR: Cannot mount ${PART2} on ${MOUNT_POINT}"
+	exit 1
+fi
+
+tar xvf ${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar -C ${MOUNT_POINT}
+umount ${MOUNT_POINT}
+
+if ! mkfs.ext4 -F -O ^has_journal -E stride=2,stripe-width=1024 -b 4096 ${PART1}
+then
+	echo "${ME} ERROR: Failed to create ext4 filesystem on ${PART1}"
+	exit 1
+fi
+
+if ! mount ${PART1} ${MOUNT_POINT}
+then
+	echo "${ME} ERROR: Cannot mount ${PART1} on ${MOUNT_POINT}"
+	exit 1
+fi
+
+cp ${BUILDROOT_OUTPUT_DIR}/images/zImage ${MOUNT_POINT}
+
+case ${BOARD_MODEL} in
+	HummingBoard-i2eX)
+		cp ${BUILDROOT_OUTPUT_DIR}/images/imx6q-hummingboard.dtb ${MOUNT_POINT}
+		;;
+	*)
+		if [ -f  ${BUILDROOT_OUTPUT_DIR}/images/${BOARD_MODEL} ]
+		then
+			cp ${BUILDROOT_OUTPUT_DIR}/images/${BOARD_MODEL} ${MOUNT_POINT}
+		else
+			echo "${ME} WARNING: No dtb file found"
+		fi
+		;;
+esac
+
+umount ${MOUNT_POINT}
+
+dd if=${BUILDROOT_OUTPUT_DIR}/images/SPL of=/dev/${DEVICE} bs=1K seek=1
+dd if=${BUILDROOT_OUTPUT_DIR}/images/u-boot.img of=/dev/${DEVICE} bs=1K seek=42
+sync
+rmdir ${MOUNT_POINT}
diff --git a/configs/hummingboard_i2eX_defconfig b/configs/hummingboard_i2eX_defconfig
new file mode 100644
index 0000000..cd359fc
--- /dev/null
+++ b/configs/hummingboard_i2eX_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_VFPV3=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_HOSTNAME="HummingBoard"
+BR2_TARGET_GENERIC_ISSUE="Welcome to HummingBoard i2eX"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/SolidRun/linux-imx6-3.14.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ea83bda1b403d745c67fbf6ea307d05ca138577f"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7_cbi_hb"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-hummingboard"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6_cubox-i"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/SolidRun/u-boot-imx6.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="e817fa3165a607b581433a6abfe37e095a5d1dc9"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.1.4
