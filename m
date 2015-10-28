From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Oct 2015 23:28:35 +0100
Subject: [Buildroot] [PATCH v7] board: add support for Intel Galileo Gen
	2
In-Reply-To: <1445359684.18938.6.camel@intel.com>
References: <1445359684.18938.6.camel@intel.com>
Message-ID: <56314C13.5030302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-10-15 18:48, Kinsella, Ray wrote:
> Delta's from v6:-
>  * Changed spaces for tabs in efi-part, genimage, grub & S09modload 
> 
> Board support package includes:-
>  * Toplevel build root configuration
>  * Github based 3.8.7 Kernel
>   * Upstream 3.8.7
>   * Linux 3.8.7 Kernel Driver Patches

 There is now a v1.2 BSP at Intel that is based on 3.14. Unfortunately, it's in
a 7z-packed tarball so not exactly easy to integrate...


>  * Linux 3.8.7 configuration
>  * Grub configuration
>  * Init Script to load modules
>  * genimage config to create sdcard image. 
> 
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
[snip]
> diff --git a/board/intel/galileo/efi-part.cfg b/board/intel/galileo/efi-part.cfg
> new file mode 100644
> index 0000000..c7f6e71
> --- /dev/null
> +++ b/board/intel/galileo/efi-part.cfg
> @@ -0,0 +1,9 @@
> +image efi-part.vfat {
> +	vfat {
> +		files = {
> +			"startup.nsh",
> +			"EFI",
> +		}
> +	}
> +	size=512K
> +}
> diff --git a/board/intel/galileo/genimage.cfg b/board/intel/galileo/genimage.cfg
> new file mode 100644
> index 0000000..b1db6f7
> --- /dev/null
> +++ b/board/intel/galileo/genimage.cfg
> @@ -0,0 +1,15 @@
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		image = "efi-part.vfat"

 Doesn't genimage allow to specify this in a single file?

> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext2"
> +		size = 512M
> +	}
> +}
[snip]
> diff --git a/board/intel/galileo/linux-3.8.config b/board/intel/galileo/linux-3.8.config
> new file mode 100644
> index 0000000..9d724fe
> --- /dev/null
> +++ b/board/intel/galileo/linux-3.8.config
> @@ -0,0 +1,310 @@
[snip]
> +CONFIG_EXT2_FS=y

 ext2 is completely useless.

> +CONFIG_EXT3_FS=y
> +# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> +CONFIG_EXT3_FS_POSIX_ACL=y
> +CONFIG_EXT3_FS_SECURITY=y

 ext3 could be replaced by ext4.

> +CONFIG_VFAT_FS=y
> +CONFIG_PROC_KCORE=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_HUGETLBFS=y
> +# CONFIG_MISC_FILESYSTEMS is not set
> +CONFIG_NLS_DEFAULT="utf8"
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_CODEPAGE_850=y
> +CONFIG_NLS_ASCII=y
> +CONFIG_NLS_ISO8859_1=y
> +CONFIG_PRINTK_TIME=y
> +# CONFIG_ENABLE_WARN_DEPRECATED is not set
> +CONFIG_FRAME_WARN=2048
> +CONFIG_MAGIC_SYSRQ=y
> +# CONFIG_UNUSED_SYMBOLS is not set
> +CONFIG_HEADERS_CHECK=y
> +# CONFIG_SCHED_DEBUG is not set
> +CONFIG_TIMER_STATS=y
> +CONFIG_DEBUG_MEMORY_INIT=y
> +# CONFIG_FTRACE is not set
> +CONFIG_DEBUG_STACKOVERFLOW=y
> +CONFIG_X86_PTDUMP=y
> +# CONFIG_DEBUG_RODATA_TEST is not set
> +CONFIG_DEBUG_SET_MODULE_RONX=y
> +# CONFIG_DOUBLEFAULT is not set
> +CONFIG_DEBUG_BOOT_PARAMS=y
> +CONFIG_OPTIMIZE_INLINING=y
> +CONFIG_KEYS=y
> +CONFIG_KEYS_DEBUG_PROC_KEYS=y
> +CONFIG_SECURITY=y
> +CONFIG_SECURITY_NETWORK=y
> +CONFIG_CRYPTO_CRC32C=y

 That's probably a leftover of some option you disabled.

> +# CONFIG_VIRTUALIZATION is not set
> +CONFIG_CRC_T10DIF=y

 This one too.

> diff --git a/board/intel/galileo/post-build.sh b/board/intel/galileo/post-build.sh
> new file mode 100755
> index 0000000..490fb4d
> --- /dev/null
> +++ b/board/intel/galileo/post-build.sh
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +cp board/intel/galileo/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
> diff --git a/board/intel/galileo/post-image.sh b/board/intel/galileo/post-image.sh
> new file mode 100755
> index 0000000..f2aa43e
> --- /dev/null
> +++ b/board/intel/galileo/post-image.sh
> @@ -0,0 +1,26 @@
> +#!/bin/bash

 No bashisms here, so /bin/sh

 Perhaps add a -e to exit on failure.

> +
> +EFI_IMAGE_CFG="board/intel/galileo/efi-part.cfg"
> +GENIMAGE_CFG="board/intel/galileo/genimage.cfg"
> +EFI_PART_DIR="${BINARIES_DIR}/efi-part"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +mkimage () {
> +	rm -rf "${GENIMAGE_TMP}"
> +
> +	genimage \
> +		--rootpath "${TARGET_DIR}" \
> +		--tmppath "${GENIMAGE_TMP}" \
> +		--inputpath "$1" \
> +		--outputpath "${BINARIES_DIR}" \
> +		--config "$2"
> +}
> +
> +# Create the EFI Partition
> +mkimage "${EFI_PART_DIR}" "${EFI_IMAGE_CFG}"
> +
> +# Create the SD Card Image
> +mkimage "${BINARIES_DIR}" "${GENIMAGE_CFG}"
> +
> +RET=${?}
> +exit ${RET}

 These two lines are redundant.

> diff --git a/board/intel/galileo/rootfs_overlay/etc/init.d/S09modload b/board/intel/galileo/rootfs_overlay/etc/init.d/S09modload
> new file mode 100755
> index 0000000..427bddb
> --- /dev/null
> +++ b/board/intel/galileo/rootfs_overlay/etc/init.d/S09modload
> @@ -0,0 +1,35 @@
> +#!/bin/sh
> +#
> +
> +load_drivers()
> +{
> +	while IFS= read -r line; do
> +	  	modprobe $line
> +	done < "/etc/modules-load.galileo/$1.conf"
> +}
> +
> +do_board()
> +{
> +	board=$(cat /sys/devices/virtual/dmi/id/board_name)
> +	case "$board" in
> +		*"GalileoGen2" )
> +			load_drivers "galileo_gen2" ;;
> +		*"Galileo" )
> +			load_drivers "galileo" ;;
> +	esac
> +}
> +
> +case "$1" in
> +	start)
> +		do_board
> +		;;
> +	stop)
> +		;;
> +	restart|reload)
> +		;;
> +	*)
> +		echo "Usage: $0 {start|stop|restart}"
> +		exit 1
> +esac
> +
> +exit $?
> diff --git a/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf
> new file mode 100644
> index 0000000..762aa2d
> --- /dev/null
> +++ b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo.conf
> @@ -0,0 +1,6 @@
> +intel_qrk_gip
> +cy8c9540a
> +i2c_dev
> +industrialio
> +ad7298
> +stmmac

 Why not just hard link all of these instead of loading them as modules? The
drivers that differ between the two modules are so small that it's not going to
make a significant difference in kernel size.

> diff --git a/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf
> new file mode 100644
> index 0000000..e8081e0
> --- /dev/null
> +++ b/board/intel/galileo/rootfs_overlay/etc/modules-load.galileo/galileo_gen2.conf
> @@ -0,0 +1,7 @@
> +intel_qrk_gip
> +gpio-pca953x
> +pca9685
> +i2c_dev
> +industrialio
> +adc1x8s102
> +stmmac
> diff --git a/configs/galileo_defconfig b/configs/galileo_defconfig
> new file mode 100644
> index 0000000..9bd3745
> --- /dev/null
> +++ b/configs/galileo_defconfig
> @@ -0,0 +1,25 @@
> +BR2_x86_x1000=y
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="3.8"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8=y
> +BR2_BINUTILS_VERSION_2_25_X=y

 Perhaps add a comment here that this version is needed for the -Wl,... option.

> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
> +BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> +BR2_ROOTFS_OVERLAY="board/intel/galileo/rootfs_overlay"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/galileo/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/galileo/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/mdr78/Linux-x1000.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d1a51d55dc67022be6c2d15163ce6dd28540042f"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/intel/galileo/linux-3.8.config"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_2r1=y

 Can we use ext4 instead?

> +BR2_TARGET_ROOTFS_EXT2_LABEL="rootfs.ext2"

 That's not needed.


 Regards,
 Arnout

> +BR2_TARGET_GRUB2=y
> +BR2_TARGET_GRUB2_I386_EFI=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
