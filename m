From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 14:34:05 +0100
Subject: [Buildroot] [PATCH 1/1] Has been added configs for
 OrangePI-2G-IOT
In-Reply-To: <20180421121900.16492-1-aleksey.kislitsa@gmail.com>
References: <20180421121900.16492-1-aleksey.kislitsa@gmail.com>
Message-ID: <20190206143405.49892786@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution, and sorry for the huge delay in getting
back to you. See below for a number of comments about your patch.

First, the commit title should be:

	configs/orangepi_2g-iot: new defconfig

On Sat, 21 Apr 2018 15:19:00 +0300
Aleksey Kislitsa <aleksey.kislitsa@gmail.com> wrote:

>  .gitignore                                         |   2 +

This file should not be changed.

>  board/orangepi/orangepi-2g-iot/boot.cmd            |  18 +++
>  board/orangepi/orangepi-2g-iot/genimage.cfg        |  36 +++++
>  .../linux/0002-linux-add-support-for-gcc6.patch    |  82 +++++++++++
>  .../linux/0003-linux-use-static-inline.patch       |  38 +++++
>  ...ux-removed-defined-but-not-used-functions.patch | 153 +++++++++++++++++++++
>  .../u-boot/0001-orangepi2giot-fatload.patch        |  22 +++
>  board/orangepi/orangepi-2g-iot/post-build.sh       |  15 ++
>  board/orangepi/orangepi-2g-iot/post-image.sh       |  14 ++
>  board/orangepi/orangepi-2g-iot/readme.txt          |  29 ++++
>  configs/orangepi_2g-iot_defconfig                  |  44 ++++++
>  11 files changed, 453 insertions(+)

Please add an entry in the DEVELOPERS file for this board.

> diff --git a/board/orangepi/orangepi-2g-iot/boot.cmd b/board/orangepi/orangepi-2g-iot/boot.cmd
> new file mode 100644
> index 0000000000..2951de6f00
> --- /dev/null
> +++ b/board/orangepi/orangepi-2g-iot/boot.cmd
> @@ -0,0 +1,18 @@
> +if test "${boot_device}" = "mmc"; then
> +
> +	setenv rootdev "/dev/mmcblk0p2"
> +	setenv rootfstype "ext4"

Is it really useful to have separate variables for this, instead of
just putting the right values in bootargs ?

> +
> +	setenv bootargs "root=${rootdev} rootwait rootfstype=${rootfstype} console=ttyS0,921600 kgdboc=ttyS0,921600 panic=10 consoleblank=0 earlyprintk"

This seems like a complicated kernel command line for a default
configuration. Could you drop kgdboc=ttyS0,921600 panic=10
consoleblank=0 earlyprintk from it ?

> +	fatload mmc 0:1 ${kernel_addr} zImage
> +	fatload mmc 0:1 ${modem_addr} modem.bin
> +else
> +	echo "NAND boot is not implemented yet"

If it's not implemented, then is this condition really necessary ?


> diff --git a/board/orangepi/orangepi-2g-iot/patches/linux/0002-linux-add-support-for-gcc6.patch b/board/orangepi/orangepi-2g-iot/patches/linux/0002-linux-add-support-for-gcc6.patch
> new file mode 100644
> index 0000000000..f674211c62
> --- /dev/null
> +++ b/board/orangepi/orangepi-2g-iot/patches/linux/0002-linux-add-support-for-gcc6.patch
> @@ -0,0 +1,82 @@
> +From 8ae7d1e028c8adb1db187d1940d31fc7aebae15e Mon Sep 17 00:00:00 2001
> +From: Leo Soares <leojrfs@gmail.com>
> +Date: Tue, 13 Jun 2017 17:20:24 +0100
> +Subject: [PATCH] add support for GCC 6
> +
> +---
> + include/linux/compiler-gcc6.h | 66 +++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 66 insertions(+)
> + create mode 100644 include/linux/compiler-gcc6.h

There's no newer kernel version for this platform that would build out
of the box with gcc 6.x?

In any case, the patch needs to have your Signed-off-by (comment
applicable to all patches).

Generally speaking, the support for this board seems to require quite a
few patches. Can some of these be avoided by using more recent upstream
U-Boot/Linux code ?


> diff --git a/board/orangepi/orangepi-2g-iot/post-build.sh b/board/orangepi/orangepi-2g-iot/post-build.sh
> new file mode 100755
> index 0000000000..cde8ad85a6
> --- /dev/null
> +++ b/board/orangepi/orangepi-2g-iot/post-build.sh
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +# post-build.sh for OrangePi taken from CubieBoard's post-build.sh
> +# 2013, Carlo Caione <carlo.caione@gmail.com>
> +
> +BOARD_DIR="$(dirname $0)"
> +MKIMAGE=$HOST_DIR/usr/bin/mkimage
> +BOOT_CMD=$BOARD_DIR/boot.cmd
> +BOOT_CMD_H=$BINARIES_DIR/boot.scr
> +
> +git clone https://github.com/orangepi-xunlong/OrangePiRDA_external.git /tmp/OrangePiRDA_external

Doing a git clone in a post-build script is definitely not good, as it
circumvents the download and legal-info mechanisms of Buildroot. If you
need to download something, create a package.

Could you fix the above comments and submit an updated version ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
