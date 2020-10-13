From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 18:22:07 +0200
Subject: [Buildroot] [PATCH 2/5] configs/mx6udoo: bump bsp versions and
 modify image
In-Reply-To: <20201010063022.448414-3-geomatsi@gmail.com>
References: <20201010063022.448414-1-geomatsi@gmail.com>
 <20201010063022.448414-3-geomatsi@gmail.com>
Message-ID: <20201013182207.31a2dd15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey,

Thanks for this patch. A few questions below.

On Sat, 10 Oct 2020 09:30:19 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> diff --git a/board/udoo/mx6qdl/genimage.cfg b/board/udoo/mx6qdl/genimage.cfg
> new file mode 100644
> index 0000000000..46209120f0
> --- /dev/null
> +++ b/board/udoo/mx6qdl/genimage.cfg

Why do you introduce a genimage.cfg file? It is identical to the one in
board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl,
which I believe is already being used in the current defconfig.

> diff --git a/board/udoo/mx6qdl/post-build.sh b/board/udoo/mx6qdl/post-build.sh
> new file mode 100755
> index 0000000000..6ccd87fafd
> --- /dev/null
> +++ b/board/udoo/mx6qdl/post-build.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +BOARD_DIR="$(dirname $0)"
> +
> +install -d -m 755 $TARGET_DIR/boot
> +$HOST_DIR/bin/mkimage -A arm -O linux -T script -C none  \
> +	-n "boot script" -d $BOARD_DIR/boot.scr.txt $TARGET_DIR/boot/boot.scr

Could you use:

BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/udoo/mx6qdl/boot.scr.txt"

You will still need a post-build.sh script to copy from BINARIES_DIR to
TARGET_DIR/boot, though.

> diff --git a/board/udoo/mx6qdl/post-image.sh b/board/udoo/mx6qdl/post-image.sh
> new file mode 100755
> index 0000000000..18e76aa40d
> --- /dev/null
> +++ b/board/udoo/mx6qdl/post-image.sh

Even if you cannot use for some reason the common post-image script
from board/freescale/common/imx/, you could still use the generic
support/scripts/genimage.sh... which you're anyway doing in a later
commit.

> diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
> index 86ad13bbf3..2cf13ae559 100644
> --- a/configs/mx6udoo_defconfig
> +++ b/configs/mx6udoo_defconfig
> @@ -3,27 +3,30 @@ BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_FPU_VFPV3=y
> -# Linux headers same as kernel, a 4.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> +# Linux headers same as kernel, a 5.8 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"

As asked above, any reason to no longer use this post-image script ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
