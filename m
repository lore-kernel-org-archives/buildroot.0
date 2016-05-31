From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 31 May 2016 19:00:32 -0300
Subject: [Buildroot] [PATCH 1/1] configs/toradex_apalis_imx6_defconfig:
 new board
In-Reply-To: <20160531224735.65666319@free-electrons.com>
References: <1450265472-18428-1-git-send-email-sergio.prado@e-labworks.com>
 <20160531224735.65666319@free-electrons.com>
Message-ID: <CANu7NGtE3JaO-d3oVzkkJ2kXKsak7G9VZUGt6xkeBQJ7tFNNyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for reviewing the patch. I'll send V2 in the next days.

Best regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2016-05-31 17:47 GMT-03:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello Sergio,
>
> Sorry for the very long delay in reviewing this. It mostly looks good,
> but I have a few comments.
>
> On Wed, 16 Dec 2015 09:31:12 -0200, Sergio Prado wrote:
>
> > diff --git a/board/toradex/apalis-imx6/post-image.sh
> b/board/toradex/apalis-imx6/post-image.sh
> > new file mode 100755
> > index 000000000000..c547049e4fdf
> > --- /dev/null
> > +++ b/board/toradex/apalis-imx6/post-image.sh
> > @@ -0,0 +1,20 @@
> > +#!/usr/bin/env bash
> > +
> > +GENIMAGE_CFG="board/toradex/apalis-imx6/genimage.cfg"
>
> Use $(dirname $0) here:
>
> GENIMAGE_CFG="$(dirname $0)/genimage.cfg"
>
> > +The Apalis iMX6 is a small form-factor Computer on Module that comes in
> > +both quad core and dual core versions based on Freescale i.MX6Q and
> > +Freescale i.MX6D SoCs respectively. The Cortex A9 quad core and dual
> > +core CPU peaks at 1 GHz for commercial temperature variant, while the
> > +industrial temperature variant has a peak frequency of 800 MHz.
> > +
> > +
> https://www.toradex.com/computer-on-modules/apalis-arm-family/freescale-imx-6
> > +
> > +It supports two carrier boards:
> > +
> > +Apalis Evaluation Board
> > +https://www.toradex.com/products/carrier-boards/apalis-evaluation-board
> > +
> > +Ixora Carrier Board
> > +https://www.toradex.com/products/carrier-boards/ixora-carrier-board
> > +
> > +How to build it
> > +===============
> > +
> > +Configure Buildroot:
> > +
> > +    $ make toradex_apalis_imx6_defconfig
> > +
> > +Compile everything and build the rootfs image:
> > +
> > +    $ make
> > +
> > +How to boot the image
> > +========================
>
> Nit: a few too many = signs here.
>
> > +
> > +The board only boots from its internal flash memory eMMC, so the
> > +bootloader image should be copied to it, following the procedures
> > +described in Toradex website.
> > +
> > +
> http://developer.toradex.com/knowledge-base/flashing-linux-on-imx6-modules
> > +
> > +Buildroot prepares a "sdcard.img" in output/images/ with the kernel
> > +image, device trees and a root filesystem, ready to be dumped on an
> > +SD card.
> > +
> > +    $ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
> > +
> > +To boot from the SD card, you should change U-Boot environment. For
> > +convenience, a default environment "uEnv.txt" is provided in
> > +output/images/.
>
> It would be good to explain how to convenience uEnv.txt should be used.
>
> > diff --git a/configs/toradex_apalis_imx6_defconfig
> b/configs/toradex_apalis_imx6_defconfig
> > new file mode 100644
> > index 000000000000..1700fbd42036
> > --- /dev/null
> > +++ b/configs/toradex_apalis_imx6_defconfig
> > @@ -0,0 +1,26 @@
> > +BR2_arm=y
> > +BR2_cortex_a9=y
> > +BR2_ARM_FPU_VFPV3=y
> > +BR2_KERNEL_HEADERS_3_14=y
>
> Please use:
>
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
>
> > +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/apalis-imx6/post-image.sh"
> > +BR2_LINUX_KERNEL=y
> > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://
> git.toradex.com/linux-toradex.git"
> >
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="8f237ebe42f2cb911245369276a6b3043c2815f2"
> > +BR2_LINUX_KERNEL_DEFCONFIG="apalis_imx6"
> > +BR2_LINUX_KERNEL_ZIMAGE=y
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-apalis-eval imx6q-apalis-ixora
> imx6q-apalis_v1_0-eval imx6q-apalis_v1_0-ixora"
> > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
> > +BR2_TARGET_ROOTFS_EXT2=y
> > +BR2_TARGET_ROOTFS_EXT2_4=y
> > +BR2_TARGET_UBOOT=y
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://
> git.toradex.com/u-boot-toradex.git"
> >
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1ef4a29e8cea0239411dde64f9617ad76248fd02"
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="apalis_imx6"
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> > +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.imx"
> > +BR2_PACKAGE_HOST_GENIMAGE=y
>
> Other than that, looks good to me. Can you rework the above minor
> issues (especially explain how to use uEnv.txt) and resend an updated
> version?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160531/7f4b9a87/attachment.html>
