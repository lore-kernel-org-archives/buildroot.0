From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 21 Nov 2020 12:03:16 +0100
Subject: [Buildroot] [PATCH v4 5/5] board: add nvidia jetson nano support
In-Reply-To: <20201119075328.8599-5-christian@paral.in>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-5-christian@paral.in>
Message-ID: <be9e5bd9-53b4-19cf-092f-c310a1f4d904@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Le 19/11/2020 ? 08:53, Christian Stewart a ?crit?:
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---
> 
> v3 -> v4:
> 
>  - thanks Romain for the review
>  - cjs: added gcc + binutils version specifiers
>  - tested against devkit hardware
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  board/jetson/nano/format-sd.sh | 167 +++++++++++++++++++++++++++++++++
>  board/jetson/nano/readme.txt   |  57 +++++++++++
>  board/jetsonnano               |   1 +
>  configs/jetsonnano_defconfig   |  64 +++++++++++++
>  4 files changed, 289 insertions(+)
>  create mode 100644 board/jetson/nano/format-sd.sh
>  create mode 100644 board/jetson/nano/readme.txt
>  create mode 120000 board/jetsonnano
>  create mode 100644 configs/jetsonnano_defconfig
> 
> diff --git a/board/jetson/nano/format-sd.sh b/board/jetson/nano/format-sd.sh
> new file mode 100644
> index 0000000000..1d3b6c442a
> --- /dev/null
> +++ b/board/jetson/nano/format-sd.sh
> @@ -0,0 +1,167 @@
> +#!/bin/bash
> +set -eo pipefail
> +
> +# NOTE: The following copyright applies to linux4tegra and associated tools:
> +
> +# Copyright (c) 2019-2020, NVIDIA Corporation.  All Rights Reserved.
> +#
> +# NVIDIA Corporation and its licensors retain all intellectual property
> +# and proprietary rights in and to this software, related documentation
> +# and any modifications thereto.  Any use, reproduction, disclosure or
> +# distribution of this software and related documentation without an express
> +# license agreement from NVIDIA Corporation is strictly prohibited.
> +
> +if [ $EUID != 0 ]; then
> +  echo "This script requires root."
> +fi
> +
> +if [ -z "$NVIDIA_SD" ]; then
> +    echo "Please set NVIDIA_SD and try again."
> +    exit 1
> +fi
> +
> +if [ ! -b "$NVIDIA_SD" ]; then
> +    echo "$NVIDIA_SD is not a block device or doesn't exist."
> +    exit 1
> +fi
> +
> +IMAGES_DIR=$1
> +if [ -z $IMAGES_DIR ]; then
> +    echo "usage: $0 path/to/images/dir"
> +    exit 1
> +fi
> +
> +uimg_path=$IMAGES_DIR/Image
> +if [ ! -f "$uimg_path" ]; then
> +  echo "Image not found, make sure Buildroot is done compiling."
> +  exit 1
> +fi
> +
> +l4t_tools_path=$IMAGES_DIR/linux4tegra/tools
> +if [ ! -d $l4t_tools_path ]; then
> +    echo "linux4tegra tools not found, ensure buildroot is done compiling."
> +    exit 1
> +fi
> +
> +# jetson-nano
> +boardid="3448"
> +target="jetson-nano-qspi-sd"
> +storage="sdcard"
> +rev="300" # from 100, 200, 300
> +chipid="0x21"
> +
> +l4t_dir=${IMAGES_DIR}/linux4tegra
> +rootfs_img=$IMAGES_DIR/rootfs.ext2
> +
> +# TODO: dynamic rootfs size: the following /almost/ works:
> +#rootfs_size=$(du -ms ${rootfs_img} | awk '{print $1}')
> +#rootfs_size=$((rootfs_size + (rootfs_size / 10)))
> +
> +rootfs_size=2048
> +
> +echo "creating signed images"
> +pushd ${l4t_dir}
> +export BOARDID="${boardid}"
> +export FAB="${rev}"
> +
> +${l4t_dir}/flash.sh \
> +          --no-flash \
> +          --sign \
> +          --no-systemimg \
> +          -x ${chipid} \
> +          -B ${boardid} \
> +          -S "${rootfs_size}MiB" \
> +          -I $IMAGES_DIR/rootfs.ext2 \
> +          -K $IMAGES_DIR/u-boot-dtb.bin \
> +          -d $IMAGES_DIR/tegra210-p3448-0000-p3449-0000-b00.dtb \
> +          "${target}" "mmcblk0p1"
> +popd
> +
> +bootloader_dir=${l4t_dir}/bootloader
> +if [ ! -f "${bootloader_dir}/flashcmd.txt" ]; then
> +		echo "ERROR: ${bootloader_dir}/flashcmd.txt not found"
> +		exit 1
> +fi
> +
> +signed_image_dir=${bootloader_dir}/signed
> +if [ ! -d "${signed_image_dir}" ]; then
> +		echo "ERROR: ${signed_image_dir} not found"
> +		exit 1
> +fi
> +
> +chipid=$(sed -nr 's/.*chip ([^ ]*).*/\1/p' "${bootloader_dir}/flashcmd.txt")
> +if [ "${chipid}" = "0x21" ]; then
> +		signed_cfg="flash.xml"
> +else
> +		signed_cfg="flash.xml.tmp"
> +fi
> +
> +if [ ! -f "${signed_image_dir}/${signed_cfg}" ]; then
> +		echo "ERROR: ${signed_image_dir}/${signed_cfg} not found"
> +		exit 1
> +fi
> +
> +echo "create partitions"
> +partitions=($(${l4t_tools_path}/nvptparser.py "${signed_image_dir}/${signed_cfg}" "${storage}"))
> +part_type=8300 # Linux Filesystem
> +
> +sgdisk -og "${NVIDIA_SD}"
> +for part in "${partitions[@]}"; do
> +		eval "${part}"
> +		if [ "${part_name}" = "master_boot_record" ]; then
> +			  continue
> +		fi
> +		part_size=$((${part_size} / 512)) # convert to sectors
> +		sgdisk -n "${part_num}":0:+"${part_size}" \
> +			     -c "${part_num}":"${part_name}" \
> +			     -t "${part_num}":"${part_type}" "${NVIDIA_SD}"
> +done
> +
> +# prefer root partprobe
> +PARTPROBE=partprobe
> +if [ -f /usr/sbin/partprobe ]; then
> +    PARTPROBE=/usr/sbin/partprobe
> +fi

This requires partprobe installed on the build machine.
partprobe is available in HOST_DIR (see HOST_DIR/sbin/partprobe)

> +
> +$PARTPROBE ${NVIDIA_SD} || true
> +sleep 1
> +if $PARTPROBE ${NVIDIA_SD}; then
> +    # wait for partitions to settle
> +    sleep 1
> +fi
> +
> +echo "write partitions"
> +for part in "${partitions[@]}"; do
> +		eval "${part}"
> +		target_file=""
> +		if [ "${part_name}" = "APP" ]; then
> +			  target_file="${IMAGES_DIR}/rootfs.ext2" # Buildroot target system.
> +		elif [ -e "${signed_image_dir}/${part_file}" ]; then
> +			  target_file="${signed_image_dir}/${part_file}"
> +		elif [ -e "${bootloader_dir}/${part_file}" ]; then
> +			  target_file="${bootloader_dir}/${part_file}"
> +		fi
> +
> +		echo "writing partition ${part_name}"
> +		if [ "${part_name}" = "master_boot_record" ]; then
> +			  echo "writing ${part_file}"
> +			  dd conv=notrunc conv=fsync if="${signed_image_dir}/${part_file}" of="${NVIDIA_SD}" bs="${part_size}" count=1
> +			  continue
> +		fi
> +
> +		if [ "${target_file}" != "" ] && [ "${part_file}" != "" ]; then
> +			  echo "writing ${target_file}"
> +        target_part=${NVIDIA_SD}p${part_num}
> +        if [ ! -b ${target_part} ]; then
> +            target_part=${NVIDIA_SD}${part_num}
> +        fi
> +        if [ ! -b ${target_part} ]; then
> +            echo "Partition block device ${target_part} or ${NVIDIA_SD}p${part_num} does not exist!"
> +            exit 1
> +        fi
> +			  sudo dd conv=fsync if="${target_file}" of="${target_part}"
> +		fi
> +done
> +
> +echo "Successfully flashed $NVIDIA_SD"
> +
> diff --git a/board/jetson/nano/readme.txt b/board/jetson/nano/readme.txt
> new file mode 100644
> index 0000000000..8161c7e60f
> --- /dev/null
> +++ b/board/jetson/nano/readme.txt
> @@ -0,0 +1,57 @@
> +NVIDIA Jetson Nano
> +
> +Intro
> +=====
> +
> +This configuration adds support for the Jetson Nano devkit.
> +
> +Building
> +========
> +
> +Configure Buildroot
> +-------------------
> +
> +For Jetson Nano:
> +
> +  $ make jetsonnano_defconfig
> +
> +Build the rootfs
> +----------------
> +
> +You may now build your rootfs with:
> +
> +  $ make
> +
> +
> +Flashing
> +========
> +
> +Once the build process is finished you will have the target binaries in the
> +output/images directory with a copy of linux4tegra.
> +
> +To format your SD card with the required partition layout, use the
> +"format-sd.sh" script located under board/jetson/nano/format-sd.sh:
> +
> +  sudo \
> +    NVIDIA_SD=/dev/sdX \
> +    PATH=$(pwd)/output/host/sbin:$PATH \
> +    bash board/jetson/nano/format-sd.sh ./output/images
> +
> +This will also flash the ext4 rootfs image to the SD card.
> +
> +Bootup Process
> +==============
> +
> +The Jetson Nano can boot to a SD card.
> +
> +A "secure boot" process is used, with multiple bootloaders:
> +
> + - BootROM -> MB1 (TrustZone)
> + - MB2/BPMP -> (Non-Trustzone)
> + - Cboot (uses Little Kernel)
> + - Uboot
> + - Kernel
> + 
> +Cboot could be compiled from source, and the source is available from the
> +official sources, however, we do not (yet) compile cboot.
> +
> diff --git a/board/jetsonnano b/board/jetsonnano
> new file mode 120000
> index 0000000000..808abfb405
> --- /dev/null
> +++ b/board/jetsonnano
> @@ -0,0 +1 @@
> +./jetson/nano
> \ No newline at end of file
> diff --git a/configs/jetsonnano_defconfig b/configs/jetsonnano_defconfig
> new file mode 100644
> index 0000000000..e2ec18616f
> --- /dev/null
> +++ b/configs/jetsonnano_defconfig
> @@ -0,0 +1,64 @@
> +BR2_aarch64=y
> +BR2_cortex_a57=y
> +BR2_ARM_FPU_FP_ARMV8=y
> +
> +# enable specific optimizations
> +BR2_TARGET_OPTIMIZATION="-march=armv8-a+crypto -mcpu=cortex-a57+crypto"
> +
> +# Toolchain reference: docs.nvidia.com: "Jetson Linux Driver Package Toolchain"
> +BR2_TOOLCHAIN_BUILDROOT=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> +BR2_BINUTILS_VERSION_2_32_X=y
> +BR2_GCC_VERSION_7_X=y
> +BR2_GCC_ENABLE_LTO=n

Same as for jetson-tx2.

Best regards,
Romain


> +BR2_USE_MMU=y
> +
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Linux headers same as kernel, a 4.9 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +BR2_KERNEL_HEADERS_AS_KERNEL=y
> +
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +# patches-l4t-r32.4
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,madisongh,linux-tegra-4.9,0be1a57448010ae60505acf4e2153638455cee7c)/linux-tegra-4.9.140-r1.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="tegra"
> +
> +# Build the DTB from the kernel sources
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="_ddot_/_ddot_/_ddot_/_ddot_/nvidia/platform/t210/porg/kernel-dts/tegra210-p3448-0000-p3449-0000-a02 _ddot_/_ddot_/_ddot_/_ddot_/nvidia/platform/t210/porg/kernel-dts/tegra210-p3448-0000-p3449-0000-b00"
> +
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +BR2_PACKAGE_LINUX4TEGRA=y
> +BR2_PACKAGE_LINUX4TEGRA_PLATFORM_T210REF=y
> +
> +# TODO: NVIDIA_CONTAINER_TOOLKIT requires a go-module integration.
> +# BR2_PACKAGE_NVIDIA_CONTAINER_TOOLKIT=y
> +
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX=y
> +
> +# Required tools to create the image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_JQ=y
> +BR2_PACKAGE_HOST_PARTED=y
> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="1024M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Uboot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="p3450-porg"
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,paralin,u-boot-tegra,45dfa3dff43f880243a9fe68f3d911e99a240654)/u-boot-tegra-l4t-r32.4.2-v2016.07.tar.gz"
> +BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> 
