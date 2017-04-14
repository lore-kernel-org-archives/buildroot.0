From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Apr 2017 00:22:12 +0200
Subject: [Buildroot] [PATCH 2/2] configs: add raspberrypi3 64bits
 defconfig
In-Reply-To: <20170414214551.17986-3-gael.portay@savoirfairelinux.com>
References: <20170414214551.17986-1-gael.portay@savoirfairelinux.com>
 <20170414214551.17986-3-gael.portay@savoirfairelinux.com>
Message-ID: <7f20d3e0-f73b-de31-8d64-f36679d833d1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-04-17 23:45, Ga?l PORTAY wrote:
[snip]
> diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
> index b2bb07067..e4127c9ea 100755
> --- a/board/raspberrypi/post-image.sh
> +++ b/board/raspberrypi/post-image.sh
> @@ -16,6 +16,29 @@ dtoverlay=pi3-miniuart-bt
>  __EOF__
>  	fi
>  	;;
> +	--aarch64)
> +	# Run a 64bits kernel (armv8)
> +	sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
> +	if ! grep -qE '^arm_control=0x200' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> +		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> +
> +# enable 64bits support
> +arm_control=0x200
> +__EOF__
> +	fi
> +
> +	# Enable uart console
> +	if ! grep -qE '^enable_uart=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> +		cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
> +
> +# enable rpi3 ttyS0 serial console
> +enable_uart=1
> +__EOF__
> +	fi
> +
> +	# Use 64bits conffile
> +	GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}-64.cfg"

 Isn't it better to just make a new raspberrypi3-64 symlink?

> +	;;
>  esac
>  
>  rm -rf "${GENIMAGE_TMP}"
> diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> new file mode 100644
> index 000000000..ddc6842f9
> --- /dev/null
> +++ b/configs/raspberrypi3_64_defconfig
> @@ -0,0 +1,37 @@
> +BR2_aarch64=y

 I think an explicit BR2_cortex_a53=y should be added. It's the default because
it's the first one in the list, but I don't think it's good to rely on that.

 BTW, does anyone know why the 32-bit version has cortex_a7?

> +
> +BR2_GCC_VERSION_6_X=y
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Linux headers same as kernel, a 4.9 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
> +
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="935c7ce84c982a26f567a03a58a1537424569938"
> +BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
> +
> +# Build the DTB from the kernel sources
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2837-rpi-3-b"
> +
> +BR2_PACKAGE_RPI_FIRMWARE=y
> +# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
> +
> +# Required tools to create the SD image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_BLOCKS=126976

 I'd prefer a little bit more slack, I used 120000 in the defconfigs I just
updated. And if that is not enough (or very tight), just jump directly to 250000.

 Regards,
 Arnout

> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
