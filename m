From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 10:53:19 +0200
Subject: [Buildroot] [PATCH 1/2] configs: add defconfig for TS-4600
In-Reply-To: <20161027000807.20206-2-sebastien.bourdelin@savoirfairelinux.com>
References: <20161027000807.20206-1-sebastien.bourdelin@savoirfairelinux.com>
 <20161027000807.20206-2-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20161027105319.6788479a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Adding Fabio Estevam in Cc, since he has lots of experience with
Freescale stuff, of course.)

On Wed, 26 Oct 2016 20:08:06 -0400, Sebastien Bourdelin wrote:

>  board/technologic/ts4600/genimage.cfg   |  18 +++++
>  board/technologic/ts4600/linux.fragment |   2 +
>  board/technologic/ts4600/post-image.sh  |  18 +++++
>  board/technologic/ts4600/readme.txt     |  57 +++++++++++++++
>  boot/Config.in                          |   1 +
>  boot/ts4600-bootrom/Config.in           |   6 ++
>  boot/ts4600-bootrom/ts4600-bootrom-sign | 124 ++++++++++++++++++++++++++++++++
>  boot/ts4600-bootrom/ts4600-bootrom.mk   |  33 +++++++++

Please separate the boot/ts4600-bootrom/ addition from the addition of
the board configuration (i.e, separate patches).


> diff --git a/boot/ts4600-bootrom/ts4600-bootrom-sign b/boot/ts4600-bootrom/ts4600-bootrom-sign
> new file mode 100755
> index 0000000..d91c10f
> --- /dev/null
> +++ b/boot/ts4600-bootrom/ts4600-bootrom-sign
> @@ -0,0 +1,124 @@
> +#!/bin/bash
> +#
> +# Copyright (C) 2016 Savoir-Faire Linux, Inc
> +# Copyright (C) 2013 Technologic System, Inc
> +# Author: ts-kris <https://github.com/ts-kris>
> +# Author: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> +#
> +# This tool signs a bootstream and add a BCB (Boot Control Block) to be used on i.MX28 SoC.
> +# It is based on the install_bootstream tool from Technologic System:
> +# https://github.com/embeddedarm/linux-2.6.35.3-imx28/blob/master/install_bootstream

Why don't we use this tool instead?

Is this tool really specific to the ts4600 platform, or is it
generally useful on i.MX28 platforms?

> diff --git a/boot/ts4600-bootrom/ts4600-bootrom.mk b/boot/ts4600-bootrom/ts4600-bootrom.mk
> new file mode 100644
> index 0000000..681152d
> --- /dev/null
> +++ b/boot/ts4600-bootrom/ts4600-bootrom.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# ts4600-bootrom
> +#
> +################################################################################

I dislike this new package, because we already have a package for
mxs-bootlets, in boot/mxs-bootlets/.

Could you instead ask embeddedarm people to have a separate repository
for their version of mxs-bootlets, instead of mixing that in the kernel
repository, which is really awful? That would allow you to re-use the
existing mxs-bootlets package.

> diff --git a/configs/ts4600_defconfig b/configs/ts4600_defconfig
> new file mode 100644
> index 0000000..21f5d7f
> --- /dev/null
> +++ b/configs/ts4600_defconfig
> @@ -0,0 +1,20 @@
> +BR2_arm=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +BR2_TOOLCHAIN_EXTERNAL_URL="ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7600-linux/cross-toolchains/imx28-cross-glibc.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_GCC_4_4=y
> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> +BR2_TOOLCHAIN_EXTERNAL_CXX=y

Why are you using this toolchain rather than the default Buildroot
toolchain?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
