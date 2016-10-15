From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 18:35:52 +0200
Subject: [Buildroot] [PATCH v2] configs: add defconfig for Digilent Zybo
In-Reply-To: <ecf2d7c6-c68e-1571-86f5-06cf7ba91118@gmail.com> (Sebastien Van
 Cauwenberghe's message of "Sun, 24 Jul 2016 17:36:58 +0200")
References: <ecf2d7c6-c68e-1571-86f5-06cf7ba91118@gmail.com>
Message-ID: <87insta7tj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sebastien" == Sebastien Van Cauwenberghe <svancau@gmail.com> writes:

 > This configuration allows out-of-the box Digilent Zybo
 > support. It uses mainline U-boot and Linux kernel. 
 > This configuration generates a SD card image named sdcard.img.

 > Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
 > ---
 >  board/digilent/zybo/genimage-zybo.cfg | 29 +++++++++++++
 >  board/digilent/zybo/post-image.sh     | 21 ++++++++++
 >  board/digilent/zybo/readme.txt        | 76 +++++++++++++++++++++++++++++++++++
 >  board/digilent/zybo/system.bit        |  0
 >  board/digilent/zybo/uEnv.txt          |  5 +++
 >  configs/zynq_zybo_defconfig           | 26 ++++++++++++
 >  6 files changed, 157 insertions(+)
 >  create mode 100644 board/digilent/zybo/genimage-zybo.cfg
 >  create mode 100755 board/digilent/zybo/post-image.sh
 >  create mode 100644 board/digilent/zybo/readme.txt
 >  create mode 100644 board/digilent/zybo/system.bit
 >  create mode 100644 board/digilent/zybo/uEnv.txt
 >  create mode 100644 configs/zynq_zybo_defconfig

 > diff --git a/board/digilent/zybo/genimage-zybo.cfg b/board/digilent/zybo/genimage-zybo.cfg
 > new file mode 100644
 > index 0000000..f39186d
 > --- /dev/null
 > +++ b/board/digilent/zybo/genimage-zybo.cfg

We normally just call this genimage.cfg, so I've renamed this.

 > +++ b/board/digilent/zybo/post-image.sh
 > @@ -0,0 +1,21 @@
 > +#!/bin/sh
 > +
 > +BOARD_DIR="$(dirname $0)"
 > +BOARD_NAME="$(basename ${BOARD_DIR})"
 > +GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 > +GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 > +OUTPUT_DIR="${O}/images"

And dropped BOARD_NAME / OUTPUT_DIR.

> +
 > +rm -rf "${GENIMAGE_TMP}"
 > +
 > +cp board/digilent/zybo/uEnv.txt ${BINARIES_DIR}
 > +cp board/digilent/zybo/system.bit ${BINARIES_DIR}
 > +
 > +genimage                           \
 > +	--rootpath "${TARGET_DIR}"     \
 > +	--tmppath "${GENIMAGE_TMP}"    \
 > +	--inputpath "${BINARIES_DIR}"  \
 > +	--outputpath "${BINARIES_DIR}" \
 > +	--config "${GENIMAGE_CFG}"
 > +
 > +exit $?

exit $? isn't needed, so I've dropped that.

> +++ b/configs/zynq_zybo_defconfig
 > @@ -0,0 +1,26 @@
 > +BR2_arm=y
 > +BR2_cortex_a9=y
 > +BR2_ARM_ENABLE_NEON=y

Zynq 7000 also has a FPU, so I've enabled BR2_ARM_ENABLE_VFP=y to use
it.

> +BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
 > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/digilent/zybo/post-image.sh"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.4"

You didn't select 4.6.x kernel headers, so I've added that.

> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 > +BR2_LINUX_KERNEL_UIMAGE=y
 > +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="zynq-zybo"
 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y
 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
 > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zybo"
 > +BR2_TARGET_UBOOT_NEEDS_DTC=y
 > +BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 > +BR2_TARGET_UBOOT_SPL=y
 > +BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
 > +BR2_PACKAGE_HOST_GENIMAGE=y

The genimage configuration uses dosfstools and mtools, so I've added
those host packages.

> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

u-boot tools isn't needed by the post-image script, so I've removed
that.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
