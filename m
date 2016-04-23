From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Apr 2016 22:14:17 +0200
Subject: [Buildroot] [PATCH v2] board: add support for Hardkernel
	ODROID-C2 Board
In-Reply-To: <1461054935-10822-1-git-send-email-brian.kim@hardkernel.com>
 (Brian Kim's message of "Tue, 19 Apr 2016 17:35:35 +0900")
References: <1461054935-10822-1-git-send-email-brian.kim@hardkernel.com>
Message-ID: <87eg9wqe06.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Brian" == Brian Kim <brian.kim@hardkernel.com> writes:

 > The ODROID-C2 is a 64-bit quad-core single board computer(SBC) that is
 > one of the most cost-effective 64bit development boards available in the
 > ARM world.

 > http://www.hardkernel.com/main/products/prdt_info.php?g_code=G145457216438

Thanks!

See below for a few comments:

 > Signed-off-by: Brian Kim <brian.kim@hardkernel.com>
 > ---
 >  board/hardkernel/odroidc2/boot.ini      | 22 ++++++++++++++
 >  board/hardkernel/odroidc2/genimage.cfg  | 27 +++++++++++++++++
 >  board/hardkernel/odroidc2/post-image.sh | 21 +++++++++++++
 >  board/hardkernel/odroidc2/readme.txt    | 53 +++++++++++++++++++++++++++++++++
 >  configs/odroidc2_defconfig              | 39 ++++++++++++++++++++++++
 >  5 files changed, 162 insertions(+)
 >  create mode 100644 board/hardkernel/odroidc2/boot.ini
 >  create mode 100644 board/hardkernel/odroidc2/genimage.cfg
 >  create mode 100755 board/hardkernel/odroidc2/post-image.sh
 >  create mode 100644 board/hardkernel/odroidc2/readme.txt
 >  create mode 100644 configs/odroidc2_defconfig

 > diff --git a/board/hardkernel/odroidc2/boot.ini b/board/hardkernel/odroidc2/boot.ini
 > new file mode 100644
 > index 0000000..8b67b5e
 > --- /dev/null
 > +++ b/board/hardkernel/odroidc2/boot.ini
 > @@ -0,0 +1,22 @@
 > +ODROIDC2-UBOOT-CONFIG
 > +
 > +# HDMI mode
 > +setenv m "720p60hz" # Progressive 60Hz
 > +
 > +# HDMI BPP Mode
 > +setenv m_bpp "32"
 > +
 > +# Default Console Device Setting
 > +setenv condev "console=ttyS0,115200n8"	# Serial Console
 > +
 > +# Boot Arguments
 > +setenv bootargs "root=/dev/mmcblk0p2 rootwait ro ${condev}
 > no_console_suspend hdmimode=${m} m_bpp=${m_bpp} vout=${vout}
 > fsck.repair=yes net.ifnames=0 elevator=noop"

What is fsck.repair and net.ifnames for? It sounds like user space stuff
that doesn't apply to Buildroot.

> diff --git a/board/hardkernel/odroidc2/post-image.sh b/board/hardkernel/odroidc2/post-image.sh
 > new file mode 100755
 > index 0000000..b2a351f
 > --- /dev/null
 > +++ b/board/hardkernel/odroidc2/post-image.sh
 > @@ -0,0 +1,21 @@
 > +#!/bin/sh
 > +
 > +BOARD_DIR="$(dirname $0)"
 > +GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
 > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 > +
 > +cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
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
 > +dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=1 count=442 conv=sync,notrunc
 > +dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=512 skip=1 seek=1 conv=fsync,notrunc

So amlogic uses the classic x86 bootsector for early startup code? Cute.

Fiddling with the output of genimage here isn't really nice, but I also
don't really see how to do it otherwise - So OK.

 > +
 > +exit $?

This is the default anyway, so this can be dropped.

 > diff --git a/board/hardkernel/odroidc2/readme.txt b/board/hardkernel/odroidc2/readme.txt

 > +How to write the SD card or eMMC
 > +================================
 > +
 > +Once the build process is finished you will have an image called "sdcard.img"
 > +in the output/images/ directory.
 > +
 > +Copy the bootable "sdcard.img" onto an SD card od eMMC with "dd":

s/od/or/

> diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
 > new file mode 100644
 > index 0000000..4fe6bcd
 > --- /dev/null
 > +++ b/configs/odroidc2_defconfig
 > @@ -0,0 +1,39 @@
 > +# Architecture
 > +BR2_aarch64=y
 > +BR2_ARM_ENABLE_NEON=y
 > +BR2_ARM_FPU_NEON=y

We don't have neon options for aarch64 (as neon support is mandatory for
aarch64).

 > +
 > +BR2_TOOLCHAIN_BUILDROOT_CXX=y

C++ support isn't needed, so this can be dropped.

 > +
 > +# System
 > +BR2_TARGET_GENERIC_HOSTNAME="odroidc2"

The board has a network interface, right? How about setting
BR2_SYSTEM_DHCP="eth0"?

> +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y
 > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
 > +
 > +# Kernel
 > +BR2_KERNEL_HEADERS_VERSION=y
 > +BR2_DEFAULT_KERNEL_VERSION="3.14.29"
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="odroidc2-3.14.y"

This is a name of a git branch. We want reproducable builds in Buildroot
so REPO_VERSION should refer to a specific git hash or a tag name. I've
changed it to the current top of that branch.

> +BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
 > +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="meson64_odroidc2"
 > +BR2_LINUX_KERNEL_IMAGE=y
 > +
 > +# U-Boot
 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="odroidc2-v2015.01"

Same comment as for the Linux kernel.

Committed with these issues fixed, thanks. Please send a followup patch
to add BR2_SYSTEM_DHCP / drop unneeded kernel commandline arguments if
applicable.

-- 
Bye, Peter Korsgaard
