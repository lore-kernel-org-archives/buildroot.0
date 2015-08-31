From: Floris Bos <bos@je-eigen-domein.nl>
Date: Mon, 31 Aug 2015 15:25:46 +0200
Subject: [Buildroot] [PATCH 4/4] board/raspberrypi: auto-expand rootfs
 on first boot
In-Reply-To: <1440273688-92868-4-git-send-email-benoit@wsystem.com>
References: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <1440273688-92868-4-git-send-email-benoit@wsystem.com>
Message-ID: <55E455DA.9050403@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/22/2015 10:01 PM, Beno?t Th?baudeau wrote:
> Add init scripts to auto-expand the persistent rootfs on the first boot
> to fill the medium.

Had a look at your script, but think it has more dependencies than 
strictly necessary.

>   
> diff --git a/board/raspberrypi/rootfs-overlay/etc/init.d/S22expand-rootpart b/board/raspberrypi/rootfs-overlay/etc/init.d/S22expand-rootpart
> new file mode 100755
> index 0000000..7f19e7a
> --- /dev/null
> +++ b/board/raspberrypi/rootfs-overlay/etc/init.d/S22expand-rootpart
> @@ -0,0 +1,36 @@
> +#!/bin/sh
> +
> +case "$1" in
> +	start)
> +		echo -n "Expanding the root partition: "
> +		BLOCK_DEV="/dev/mmcblk0"
> +		PART_NUM="2"
> +		PART_START="$(parted -ms "${BLOCK_DEV}" unit s p 2>/dev/null | \
> +			grep "^${PART_NUM}:" | cut -d : -f 2 | sed 's/s$//')"
> +		if [ -z "${PART_START}" ]; then
> +			echo "failed"

Note that the existing start sector can also be found in 
/sys/class/block/mmcblk0p2/start
So can remove the parted dependency.

> +		else
> +			fdisk "${BLOCK_DEV}" <<-EOF &>/dev/null
> +				d
> +				$PART_NUM
> +				n
> +				p
> +				$PART_NUM
> +				$PART_START
> +
> +				w
> +			EOF
> +			echo "done"
> +		fi
> +		rm -f /etc/init.d/S22expand-rootpart
> +		if [ "${PART_START}" ]; then
> +			reboot -f
> +			while true; do :; done
> +		fi
> +		exit 2
> +		;;
> +	*)
> +		echo "Usage: $0 start" >&2
> +		exit 1
> +		;;
> +esac
> diff --git a/board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs b/board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs
> new file mode 100755
> index 0000000..7b3f286
> --- /dev/null
> +++ b/board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +case "$1" in
> +	start)
> +		echo -n "Expanding the root FS: "
> +		resize2fs /dev/mmcblk0p2 &>/dev/null
> +		ret=$?
> +		[ ${ret} -eq 0 ] && echo "done" || echo "failed"
> +		rm -f /etc/init.d/S23expand-rootfs
> +		exit ${ret}
> +		;;
> +	*)
> +		echo "Usage: $0 start" >&2
> +		exit 1
> +		;;
> +esac
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index 73dc290..2e064e0 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -3,6 +3,7 @@ BR2_cortex_a7=y
>   BR2_ARM_EABIHF=y
>   BR2_ARM_FPU_NEON_VFPV4=y
>   
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

Why is glibc required?
Isn't it possible to just set the right options (like wchar, largefile) 
for uclibc?

>   BR2_TOOLCHAIN_BUILDROOT_CXX=y
>   
>   BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> @@ -27,6 +28,13 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
>   BR2_PACKAGE_RPI_FIRMWARE=y
>   # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
>   
> +BR2_PACKAGE_E2FSPROGS=y
> +BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
> +BR2_PACKAGE_PARTED=y
> +BR2_PACKAGE_UTIL_LINUX_BINARIES=y
> +
> +BR2_ROOTFS_OVERLAY="board/raspberrypi2/rootfs-overlay"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"

Why is UTIL_LINUX_BINARIES necessary?
If for fdisk, doesn't busybox provides this as well?



Yours sincerely,

Floris Bos
