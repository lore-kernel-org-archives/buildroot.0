From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 12:19:34 +0200
Subject: [Buildroot] [PATCH 1/4] configs/amarula_vyasa_rk3288: adjust
 U-Boot config to boot larger kernel image
In-Reply-To: <20190419095718.8444-1-shyam.saini@amarulasolutions.com>
References: <20190419095718.8444-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190421121934.0989e6a8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Apr 2019 15:27:15 +0530
Shyam Saini <shyam.saini@amarulasolutions.com> wrote:

> Default value of CONFIG_SYS_BOOTM_LEN in u-boot causes board reset for
> large uImage files, so add u-boot patch to increase the maximum kernel
> image size.
> 
> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>

I've applied to master, but please see some comments below.

> diff --git a/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch b/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
> new file mode 100644
> index 0000000000..64a147c09e
> --- /dev/null
> +++ b/board/amarula/vyasa/patches/uboot/0001-include-configs-Increase-CONFIG_SYS_BOOTM_LEN-to-16M.patch
> @@ -0,0 +1,35 @@
> +From 8ee2b03039cccf64402a72dea2185d7fe1972729 Mon Sep 17 00:00:00 2001
> +From: Shyam Saini <shyam.saini@amarulasolutions.com>
> +Date: Mon, 15 Apr 2019 16:16:16 +0530
> +Subject: [PATCH] include: configs: Increase CONFIG_SYS_BOOTM_LEN to 16MB
> +
> +The default value of CONFIG_SYS_BOOTM_LEN is 0x800000 i.e, 8MB which
> +causes board reset because of larger uImage size.
> +
> +Error log snippet:
> +   Booting using the fdt blob at 0x1f00000
> +   Loading Kernel Image ... Image too large: increase CONFIG_SYS_BOOTM_LEN
> +Must RESET board to recover
> +resetting ...
> +
> +Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>

Could you submit this patch to upstream U-Boot, if not already done ?

> diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
> index 88fb6abbec..c70958d530 100644
> --- a/configs/amarula_vyasa_rk3288_defconfig
> +++ b/configs/amarula_vyasa_rk3288_defconfig
> @@ -44,3 +44,6 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/vyasa/genimage.cfg"
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/vyasa/post-build.sh"
> +BR2_GLOBAL_PATCH_DIR="board/amarula/vyasa/patches/"
> +
> +

Please review your patches a bit more carefully before sending them:
you would have easily spotted that you added two useless empty lines at
the end of this file. I fixed that up when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
