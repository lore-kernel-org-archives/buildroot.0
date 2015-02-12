From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Feb 2015 20:09:40 +0100
Subject: [Buildroot] [PATCH 1/1] Add default configuration for Raspberry
 Pi 2 (ARMv7 & NEON)
In-Reply-To: <20150211175219.22579465@hebden.net.au>
References: <20150211175219.22579465@hebden.net.au>
Message-ID: <20150212190940.GA4277@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2015-02-11 17:52 +1100, James Hebden spake thusly:
> From f73918e7f673845086503011d6130d4805e26549 Mon Sep 17 00:00:00 2001
> From: James Hebden <james@hebden.net.au>
> Date: Tue, 10 Feb 2015 08:51:50 +1100
> Subject: [PATCH 1/1] Added RPi2
> 
> I've put together a simple patch to add default a default config for
> the Raspberry Pi 2 Model B. Unlike earlier models the RPi2 supports
> ARMv7 instructions and NEON - so I've enabled those whilst compiling.
> It also sports a quad core processor so I've enabled SMP - those are
> the only substantial changes from the default configurations for the
> first edition Raspberry Pi. I've build and tested against a Raspberry
> Pi 2 model B booting from SD card and couldn't find any issues with the
> resulting image.
> 
> Signed-off-by: James Hebden <james@hebden.net.au>

Thank you for this patch.

However, here are a few comments:

  - your mailer wrapped long lines, so we can not apply it; please use
    "git-send-email" to send patches;

  - you provide a full Linux config file; this is huge and should be
    reduced to a defconfig. Use "make update-linux-defconfig" in your
    build directory to get a linux defconfig file;
    (B.B.: it's a pity they are not yet bundling a bcmrpi2_defconfig in
    the Linux kernel tree...)

  - you are doing two things in this patch: add a configuration for a
    new board, and bump the rpi-firmware version; this should be done in
    two different patches, the first to do the rpi-firmware version
    bump, the second to add the new board.


> +++ b/configs/raspberrypi_2_defconfig

I'd prefer the board be named raspberrypi2 (not raspberrypi_2).

> @@ -0,0 +1,21 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARCH="arm"
> +BR2_ENDIAN="LITTLE"
> +BR2_GCC_TARGET_ABI="aapcs-linux"
> +BR2_GCC_TARGET_CPU="cortex-a7"
> +BR2_GCC_TARGET_FPU="neon-vfpv4"
> +BR2_GCC_TARGET_FLOAT_ABI="softfp"
> +BR2_GCC_TARGET_MODE="arm"
> +BR2_ARM_EABI=y

Don't we prefer EABIhf instead?

> +BR2_ARM_FPU_NEON_VFPV4=y

I've had a look on ARM's infocenter, and it is indeed a VFPv4-D32.

Note for my future-self: on Cortex-A7 (and A15):
  - VFPv4 without NEON is D16
  - VFPv4 with NEON is D32

http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0464f/BABDAHCE.html

> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rpi-3.18.y-rebase"

We can not use a branch name here. We want either a tag or a sha1.
Currently, this is 0be82f722c097340632a59b879fbfee9c6148f53.

However, as the RPi folks often rebase tht branch, we can't guarantee
this sha1 will be available forever. There's nothing we can do about
this... :-(

Excep you may add a comment in this defconfig file.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-2.defconfig"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_PACKAGE_RPI_FIRMWARE=y
> +BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
> diff --git a/package/rpi-firmware/rpi-firmware.mk
> b/package/rpi-firmware/rpi-firmware.mk index 03178d5..c7c668c 100644
> --- a/package/rpi-firmware/rpi-firmware.mk
> +++ b/package/rpi-firmware/rpi-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RPI_FIRMWARE_VERSION = 393dcc0e76f18f6ac1b67ba45d36058410670034
> +RPI_FIRMWARE_VERSION = d10602a5f3f3788ed673d98e3dec2af25666365d
>  RPI_FIRMWARE_SITE = $(call
> github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
> RPI_FIRMWARE_LICENSE = BSD-3c RPI_FIRMWARE_LICENSE_FILES =
> boot/LICENCE.broadcom

See hos the long lines get mangled above? Using git-send-email would not
exhibit this problem.

Care to address the issues and resubmit, please?

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
