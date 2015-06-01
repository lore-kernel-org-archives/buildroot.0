From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 2 Jun 2015 01:00:12 +0300 (IDT)
Subject: [Buildroot] [PATCH v2 1/1] Solid-Run HummingBoard i2eX
 defconfig and bootable microSD Bash script
In-Reply-To: <1433195762-30557-1-git-send-email-yba@tkos.co.il>
References: <1433195762-30557-1-git-send-email-yba@tkos.co.il>
Message-ID: <alpine.DEB.2.11.1506020058570.1650@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Should read "v3".

  - yba


On Tue, 2 Jun 2015, Jonathan Ben-Avraham wrote:

> Date: Tue,  2 Jun 2015 00:56:02 +0300
> From: Jonathan Ben-Avraham <yba@tkos.co.il>
> To: buildroot at buildroot.org
> Cc: Jonathan Ben-Avraham <yba@tkos.co.il>
> Subject: [PATCH v2 1/1] Solid-Run HummingBoard i2eX defconfig and bootable
>     microSD Bash script
> 
> Solid-Run HummingBoard i2eX defconfig and bootable microSD Bash script
>
> Fixed various
>
> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
> ---
> board/solid-run/hummingboard-i2eX/readme.txt |  19 ++
> board/solid-run/make_sd_card.sh              | 259 +++++++++++++++++++++++++++
> configs/hummingboard_i2eX_defconfig          |  25 +++
> 3 files changed, 303 insertions(+)
> create mode 100644 board/solid-run/hummingboard-i2eX/readme.txt
> create mode 100755 board/solid-run/make_sd_card.sh
> create mode 100644 configs/hummingboard_i2eX_defconfig
>
> diff --git a/board/solid-run/hummingboard-i2eX/readme.txt b/board/solid-run/hummingboard-i2eX/readme.txt
> new file mode 100644
> index 0000000..d7995f4
> --- /dev/null
> +++ b/board/solid-run/hummingboard-i2eX/readme.txt
> @@ -0,0 +1,19 @@
> +Solid-Run HummingBoard-i2eX minimal defconfig, without WiFi or OpenGL firmware
> +is provided in configs/hummingboard_i2eX_defconfig
> +
> +Bash script for creating bootable microSD cards is in
> +board/solid-run/make_sd_card.sh
> +
> +Example usage:
> +
> +sudo make_sd_card.sh sde output HummingBoard-i2eX 256
> +
> +where:
> +	"sde" is the basename of the device file "/dev/sde'
> +	"output" is the Buildroot output directory, in this case for an in-tree build
> +	"HummingBoard-i2eX" is the board model
> +	256 is the size of the rootfs partition in MiB (default 128 MiB)
> +
> +See also the USAGE variable in the make_sd_card.sh.
> +
> +Maintainer: yba at tkos.co.il
> diff --git a/board/solid-run/make_sd_card.sh b/board/solid-run/make_sd_card.sh
> new file mode 100755
> index 0000000..c15427a
> --- /dev/null
> +++ b/board/solid-run/make_sd_card.sh
> @@ -0,0 +1,259 @@
> +#!/bin/bash -eu
> +# @(#) Create a bootable SD card from Buildroot tree for Solid-Run boards
> +#
> +# Copyright (c) 2015 Tk Open Systems Ltd. all rights reserved
> +#
> +# When distributed as part of Buildroot, this file is licensed to the public
> +# under the terms of the GNU General Public License version 2, as published by
> +# the Free Software Foundation. See http://www.gnu.org/licenses.
> +#
> +# When received from the copyright holder, this file is licensed under the
> +# terms of the "Attribution-ShareAlike 4.0 International" license, See full
> +# text at https://creativecommons.org/licenses/by-sa/4.0/legalcode
> +#
> +# Maintainer: yba at tkos.co.il
> +# See: configs/hummingboard_i2eX_defconfig
> +
> +ME=$(basename ${0})
> +
> +! read -d '' USAGE << EOM
> +USAGE: ${ME} <SD device> <BR output> <board model> [<rootfs size>]
> +where:
> +	<SD device> is the basename of the device file, e.g. "sdb", "mmcblk0"
> +	<BR output> is the Buildroot output directory, e.g. "/home/yba/buildroot/output"
> +	<board model> is "hummingboard_i2eX" or the DTB filename in the images directory
> +	<rootfs size> is the size of the rootfs partition in MiB (default 128 MiB)
> +EOM
> +
> +ERROR=0
> +
> +if [ -z "${1+x}" ]
> +then
> +	if [ -z "${DEVICE+x}" ]
> +	then
> +		echo "${ME} ERROR: No DEVICE env var or device specification in first parameter"
> +		ERROR=$((${ERROR}+1))
> +	fi
> +	if [ -z "${BUILDROOT_OUTPUT_DIR+x}" ]
> +	then
> +		echo "${ME} ERROR: No BUILDROOT_OUTPUT_DIR directory specification env var or in second parameter"
> +		ERROR=$((${ERROR}+1))
> +	fi
> +	if [ -z "${BOARD_MODEL+x}" ]
> +	then
> +		echo "${ME} ERROR: No BOARD_MODEL specification env var or in third parameter"
> +		ERROR=$((${ERROR}+1))
> +	fi
> +else
> +	DEVICE=${1}
> +	if [ -z "${2+x}" ]
> +	then
> +		if [ -z "${BUILDROOT_OUTPUT_DIR+x}" ]
> +		then
> +			echo "${ME} ERROR: No BUILDROOT_OUTPUT_DIR directory specification env var or in second parameter"
> +			ERROR=$((${ERROR}+1))
> +		fi
> +	else
> +		BUILDROOT_OUTPUT_DIR=${2}
> +		if [ -z "${3+x}" ]
> +		then
> +			if [ -z "${BOARD_MODEL+x}" ]
> +			then
> +				echo "${ME} ERROR: No BOARD_MODEL specification env var or in third parameter"
> +				ERROR=$((${ERROR}+1))
> +			fi
> +		else
> +			BOARD_MODEL=${3}
> +		fi
> +	fi
> +fi
> +if [ 0 -ne ${EUID} ]
> +then
> +	echo "${ME} ERROR: You need to run this script as root or using 'sudo'."
> +	ERROR=$((${ERROR}+1))
> +fi
> +
> +[ 0 -lt ${ERROR} ] && { echo "${USAGE}"; exit 1; }
> +
> +if [ -z "${4+x}" ]
> +then
> +	if [ -z "${ROOTFS_PARTITION_SIZE+x}" ]
> +	then
> +		ROOTFS_PARTITION_SIZE=128
> +	fi
> +else
> +	ROOTFS_PARTITION_SIZE=${4}
> +fi
> +
> +# The SD DEVICE could be specified as "mmcblk[0-9]+" or "sd[a-z]" and the SD partitions
> +# as "mmcblk[0-9]+p[1-2]" or "sd[a-z][1-2]" so we need to check if the "p" is needed
> +
> +if echo ${DEVICE} | grep -q mmcblk
> +then
> +	P="p"
> +else
> +	P=""
> +fi
> +
> +PART1=/dev/${DEVICE}${P}1
> +PART2=/dev/${DEVICE}${P}2
> +
> +if [ -z "${DEVICE}" ]
> +then
> +	echo "${ME} ERROR: You need to specify a non-empty SD device name as the"
> +	echo "first command line parameter to this script or in the DEVICE env var."
> +	echo "For example 'sdb' or 'mmcblk0'. Be careful not to do something silly"
> +	echo "like specifying your system hard drive device."
> +	ERROR=$((${ERROR}+1))
> +else
> +	if [ ! -b /dev/${DEVICE} ]
> +	then
> +		echo "${ME} ERROR: /dev/${DEVICE} is not a block device file"
> +		ERROR=$((${ERROR}+1))
> +	fi
> +fi
> +
> +if [ -f /etc/multipath.conf ]
> +then
> +	if grep -q blacklist /etc/multipath.conf && ! grep -q ${DEVICE} /etc/multipath.conf
> +	then
> +		echo
> +		echo "==> WARNING: You probably want to blacklist ${DEVICE} in /etc/multipath.conf"
> +		echo "==> Otherwise the kernel will not be notified of partition changes"
> +		echo
> +		sleep 5
> +	fi
> +fi
> +
> +if [ -z "${BUILDROOT_OUTPUT_DIR}" ]
> +then
> +	echo "${ME} ERROR: You need to specify the Buildroot output directory as"
> +	echo "the third command line parameter to this script or in the BUILDROOT_OUTPUT_DIR"
> +	echo "env var."
> +	ERROR=$((${ERROR}+1))
> +else
> +	if [ ! -d "${BUILDROOT_OUTPUT_DIR}" ]
> +	then
> +		echo "${ME} ERROR: The [${BUILDROOT_OUTPUT_DIR}] directory does not"
> +		echo "exist."
> +		ERROR=$((${ERROR}+1))
> +	fi
> +fi
> +
> +if [ ! -f ${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar ]
> +then
> +	echo "${ME} ERROR: The rootfs image file "
> +	echo "[${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar]"
> +	echo "was not found."
> +	echo "Check that the second parameter is the fully qualified directory."
> +	ERROR=$((${ERROR}+1))
> +fi
> +
> +PATH=${BUILDROOT_OUTPUT_DIR}/host/usr/sbin/:${PATH}
> +
> +for BIN in "sfdisk mkfs.ext4 mount umount dd mktemp partprobe"
> +do
> +	if ! which ${BIN} >/dev/null
> +	then
> +		echo "${ME} ERROR: Required executable ${BIN} is not in PATH [${PATH}]"
> +		ERROR=$((${ERROR}+1))
> +	fi
> +done
> +
> +MOUNT_POINT=$(mktemp -d /tmp/solid-run.XXXX)
> +if [ ! -d "${MOUNT_POINT}" ]
> +then
> +	echo "${ME} ERROR: Can't create mount point"
> +	exit 1
> +fi
> +
> +[ 0 -lt ${ERROR} ] && exit 1
> +
> +# The devices might have already been mounted somewhere else by the automounter
> +# so unmount them here
> +while umount ${PART2}
> +do
> +	echo "${ME} Notice: Unmounted ${PART2}"
> +done
> +
> +while umount ${PART1}
> +do
> +	echo "${ME} Notice: Unmounted ${PART1}"
> +done
> +
> +# Zap any partition table on the SD
> +dd if=/dev/zero of=/dev/${DEVICE} bs=1024 count=32
> +
> +# 1MiB = 2048 Sectors of 512B
> +P1_SIZE=$((2048*32))
> +P2_START=$((2048+${P1_SIZE}+1))
> +P2_SIZE=$((2048*${ROOTFS_PARTITION_SIZE}))
> +
> +# Start the first partition at 1MiB = 2048*512
> +# Use -u S to get predictable partition sizes and placement
> +printf "2028,${P1_SIZE},b,*\n${P2_START},${P2_SIZE},L,-\n" | \
> +	sfdisk -u S --no-reread /dev/${DEVICE}
> +
> +sync
> +partprobe /dev/${DEVICE}
> +
> +[ ! -b ${PART2} ] && printf "Waiting for partitions to be updated"
> +while [ ! -b ${PART2} ]
> +do
> +	sleep 1
> +	printf " ."
> +done
> +echo
> +
> +# Hat tip to hste and jas for this recipe
> +if ! mkfs.ext4 -F -O ^has_journal -E stride=2,stripe-width=1024 -b 4096 ${PART2}
> +then
> +	echo "${ME} ERROR: Failed to create ext4 filesystem on ${PART2}"
> +	exit 1
> +fi
> +
> +if ! mount ${PART2} ${MOUNT_POINT}
> +then
> +	echo "${ME} ERROR: Cannot mount ${PART2} on ${MOUNT_POINT}"
> +	exit 1
> +fi
> +
> +tar xvf ${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar -C ${MOUNT_POINT}
> +umount ${MOUNT_POINT}
> +
> +if ! mkfs.ext4 -F -O ^has_journal -E stride=2,stripe-width=1024 -b 4096 ${PART1}
> +then
> +	echo "${ME} ERROR: Failed to create ext4 filesystem on ${PART1}"
> +	exit 1
> +fi
> +
> +if ! mount ${PART1} ${MOUNT_POINT}
> +then
> +	echo "${ME} ERROR: Cannot mount ${PART1} on ${MOUNT_POINT}"
> +	exit 1
> +fi
> +
> +cp ${BUILDROOT_OUTPUT_DIR}/images/zImage ${MOUNT_POINT}
> +
> +case ${BOARD_MODEL} in
> +	HummingBoard-i2eX)
> +		cp ${BUILDROOT_OUTPUT_DIR}/images/imx6q-hummingboard.dtb \
> +			${MOUNT_POINT}
> +		;;
> +	*)
> +		if [ -f  ${BUILDROOT_OUTPUT_DIR}/images/${BOARD_MODEL} ]
> +		then
> +			cp ${BUILDROOT_OUTPUT_DIR}/images/${BOARD_MODEL} \
> +				${MOUNT_POINT}
> +		else
> +			echo "${ME} WARNING: No dtb file found"
> +		fi
> +		;;
> +esac
> +
> +umount ${MOUNT_POINT}
> +
> +dd if=${BUILDROOT_OUTPUT_DIR}/images/SPL of=/dev/${DEVICE} bs=1K seek=1
> +dd if=${BUILDROOT_OUTPUT_DIR}/images/u-boot.img of=/dev/${DEVICE} bs=1K seek=42
> +sync
> +rmdir ${MOUNT_POINT}
> diff --git a/configs/hummingboard_i2eX_defconfig b/configs/hummingboard_i2eX_defconfig
> new file mode 100644
> index 0000000..cd359fc
> --- /dev/null
> +++ b/configs/hummingboard_i2eX_defconfig
> @@ -0,0 +1,25 @@
> +BR2_arm=y
> +BR2_cortex_a9=y
> +BR2_ARM_EABIHF=y
> +BR2_ARM_FPU_VFPV3=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TARGET_GENERIC_HOSTNAME="HummingBoard"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to HummingBoard i2eX"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/SolidRun/linux-imx6-3.14.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ea83bda1b403d745c67fbf6ea307d05ca138577f"
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v7_cbi_hb"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-hummingboard"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="mx6_cubox-i"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/SolidRun/u-boot-imx6.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="e817fa3165a607b581433a6abfe37e095a5d1dc9"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
