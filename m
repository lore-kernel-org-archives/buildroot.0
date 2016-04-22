From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Fri, 22 Apr 2016 17:01:14 +0200
Subject: [Buildroot] [PATCH 1/1] Preliminary support for Raspberry Pi 3.
In-Reply-To: <1461150240-23107-1-git-send-email-ubaldo@eja.it>
References: <1461150240-23107-1-git-send-email-ubaldo@eja.it>
Message-ID: <20160422170114.1d505a64@armant.core.local.os.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ubaldo,

I updated a bit your defconfig (see below), and I was able to boot the
generated image. Weirdly I get no getty on the HDMI, just the kernel
boot log. Have I done something wrong ?

Regards,
Ben.

On Wed, 20 Apr 2016 11:04:00 +0000
Ubaldo Porcheddu <ubaldo@eja.it> wrote:

> Signed-off-by: Ubaldo Porcheddu <ubaldo@eja.it>
> ---
>  board/raspberrypi3/genimage-raspberrypi3.cfg | 30 +++++++++++++
>  board/raspberrypi3/post-build.sh             |  9 ++++
>  board/raspberrypi3/post-image.sh             | 22 ++++++++++
>  board/raspberrypi3/readme.txt                | 64
> ++++++++++++++++++++++++++++
> configs/raspberrypi3_defconfig               | 36 ++++++++++++++++ 5
> files changed, 161 insertions(+) create mode 100644
> board/raspberrypi3/genimage-raspberrypi3.cfg create mode 100755
> board/raspberrypi3/post-build.sh create mode 100755
> board/raspberrypi3/post-image.sh create mode 100644
> board/raspberrypi3/readme.txt create mode 100644
> configs/raspberrypi3_defconfig
> 
> diff --git a/board/raspberrypi3/genimage-raspberrypi3.cfg
> b/board/raspberrypi3/genimage-raspberrypi3.cfg new file mode 100644
> index 0000000..7ba89c5
> --- /dev/null
> +++ b/board/raspberrypi3/genimage-raspberrypi3.cfg
> @@ -0,0 +1,30 @@
> +image boot.vfat {
> +  vfat {
> +    files = {
> +      "bcm2710-rpi-3-b.dtb",
> +      "rpi-firmware/bootcode.bin",
> +      "rpi-firmware/cmdline.txt",
> +      "rpi-firmware/config.txt",
> +      "rpi-firmware/fixup.dat",
> +      "rpi-firmware/start.elf",
> +      "kernel-marked/zImage"
> +    }
> +  }
> +  size = 32M
> +}
> +
> +image sdcard.img {
> +  hdimage {
> +  }
> +
> +  partition boot {
> +    partition-type = 0xC
> +    bootable = "true"
> +    image = "boot.vfat"
> +  }
> +
> +  partition rootfs {
> +    partition-type = 0x83
> +    image = "rootfs.ext4"
> +  }
> +}
> diff --git a/board/raspberrypi3/post-build.sh
> b/board/raspberrypi3/post-build.sh new file mode 100755
> index 0000000..7eae14a
> --- /dev/null
> +++ b/board/raspberrypi3/post-build.sh
> @@ -0,0 +1,9 @@
> +#!/bin/sh
> +
> +set -u
> +set -e
> +
> +# Add a console on tty1
> +grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
> +sed -i '/GENERIC_SERIAL/a\
> +tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console'
> ${TARGET_DIR}/etc/inittab diff --git
> a/board/raspberrypi3/post-image.sh b/board/raspberrypi3/post-image.sh
> new file mode 100755 index 0000000..73ffd65
> --- /dev/null
> +++ b/board/raspberrypi3/post-image.sh
> @@ -0,0 +1,22 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +BOARD_NAME="$(basename ${BOARD_DIR})"
> +GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
> +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> +
> +# Mark the kernel as DT-enabled
> +mkdir -p "${BINARIES_DIR}/kernel-marked"
> +${HOST_DIR}/usr/bin/mkknlimg "${BINARIES_DIR}/zImage" \
> +	"${BINARIES_DIR}/kernel-marked/zImage"
> +
> +rm -rf "${GENIMAGE_TMP}"
> +
> +genimage                           \
> +	--rootpath "${TARGET_DIR}"     \
> +	--tmppath "${GENIMAGE_TMP}"    \
> +	--inputpath "${BINARIES_DIR}"  \
> +	--outputpath "${BINARIES_DIR}" \
> +	--config "${GENIMAGE_CFG}"
> +
> +exit $?
> diff --git a/board/raspberrypi3/readme.txt
> b/board/raspberrypi3/readme.txt new file mode 100644
> index 0000000..dcbcffd
> --- /dev/null
> +++ b/board/raspberrypi3/readme.txt
> @@ -0,0 +1,64 @@
> +Raspberry Pi
> +
> +Intro
> +=====
> +
> +These instructions apply to Raspberry Pi 3 version B.
> +
> +How to build it
> +===============
> +
> +Configure Buildroot
> +-------------------
> +
> +
> +  $ make raspberrypi3_defconfig
> +
> +
> +Build the rootfs
> +----------------
> +
> +Note: you will need to have access to the network, since Buildroot
> will +download the packages' sources.
> +
> +You may now build your rootfs with:
> +
> +  $ make
> +
> +(This may take a while, consider getting yourself a coffee ;-) )
> +
> +Result of the build
> +-------------------
> +
> +After building, you should obtain this tree:
> +
> +    output/images/
> +    +-- bcm2710-rpi-3-b.dtb
> +    +-- boot.vfat
> +    +-- kernel-marked/zImage        [1]
> +    +-- rootfs.ext4
> +    +-- rpi-firmware/
> +    |   +-- bootcode.bin
> +    |   +-- cmdline.txt
> +    |   +-- config.txt
> +    |   +-- fixup.dat
> +    |   `-- start.elf
> +    +-- sdcard.img
> +    `-- zImage
> +
> +[1] This is the mkknlimg DT-marked kernel.
> +
> +How to write the SD card
> +========================
> +
> +Once the build process is finished you will have an image called
> "sdcard.img" +in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an SD card with "dd":
> +
> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> +
> +Insert the SDcard into your Raspberry Pi, and power it up. Your new
> system +should come up now and start two consoles: one on the serial
> port on +the P1 header, one on the HDMI output where you can login
> using a USB +keyboard.
> diff --git a/configs/raspberrypi3_defconfig
> b/configs/raspberrypi3_defconfig new file mode 100644
> index 0000000..80ce908
> --- /dev/null
> +++ b/configs/raspberrypi3_defconfig
> @@ -0,0 +1,36 @@
> +BR2_arm=y
> +BR2_cortex_a7=y

Raspberry3 are using A8 processors.

> +BR2_ARM_EABIHF=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Linux headers same as kernel, a 4.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="20fe468af4bb40fec0f81753da4b20a8bfc259c9"

Better use the branch name to allow shallow clones. in this case: 
"rpi-4.1.y"

Why don't you use a more recent branch ?

> +BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"

If using the 4.4 branch, there is a defconfig for bcm2710.

> +
> +# Build the DTB from the kernel sources
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b"
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
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160422/dc37e902/attachment.asc>
