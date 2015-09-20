From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:58:21 +0200
Subject: [Buildroot] [PATCH v2 3/4] cubieboard: update build support for
 cubieboard 1/2/3.
In-Reply-To: <1438067769-10254-3-git-send-email-fancp2007@gmail.com>
References: <1438067769-10254-1-git-send-email-fancp2007@gmail.com>
 <1438067769-10254-3-git-send-email-fancp2007@gmail.com>
Message-ID: <20150920155821.3e3c3026@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Scott Fan,

On Tue, 28 Jul 2015 15:16:08 +0800, Scott Fan wrote:
> This patch update the cb1/cb2's defconfig to mainline u-boot version,
> and bump their linux-sunxi kernel to latest stage/sunxi-3.4 branch.
> 
> Additionally, add defconfig for cubieboard3 (a.k.a. cubietruck).
> 
> Finally, support set up the SD card only to boot from network.

Thanks for this patch. There are things that I like (like using the
in-kernel defconfig + a fragment), but there are also things I don't
really like. Most notably, the addition of the "boot from network"
feature. Our defconfig typically build a system that will boot from SD
or NAND, and we don't aim at supporting dozens of possibilities in
those defconfigs. They are meant to be a starting point, and the user
should know how to customize the U-Boot boot command and kernel
configuration to use network boot instead.

So, could you rework this by not adding the network boot option?

Also, maybe, instead of doing this crazy SD card setup script, could
you use the genimage tool, like is done for the Wandboard. See
configs/wandboard_config, board/wandboard/post-image.sh and
board/wandboard/genimage.cfg ?

This is optional of course, but I'd prefer to move in this direction
rather than a complete rewrite of
board/cubietech/cubieboard/mkcubiecard.sh for no real reason.

> diff --git a/board/cubietech/cubieboard/boot.cmd b/board/cubietech/cubieboard/boot.cmd
> index 849ed00..519b0e7 100644
> --- a/board/cubietech/cubieboard/boot.cmd
> +++ b/board/cubietech/cubieboard/boot.cmd
> @@ -1,4 +1,5 @@
> +setenv bootm_boot_mode sec

What is this doing?

>  setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait panic=10 ${extra}
> -fatload mmc 0 0x43000000 script.bin
> -fatload mmc 0 0x48000000 uImage
> -bootm 0x48000000
> +load mmc 0:1 0x43000000 script.bin || load mmc 0:1 0x43000000 boot/script.bin
> +load mmc 0:1 0x42000000 uImage || load mmc 0:1 0x42000000 boot/uImage

Why do we have the two possible locations for the script.bin and
uImage ?

> diff --git a/board/cubietech/cubieboard/mkcubiecard.sh b/board/cubietech/cubieboard/mkcubiecard.sh
> index f1d5a9f..a5bd8ec 100755
> --- a/board/cubietech/cubieboard/mkcubiecard.sh
> +++ b/board/cubietech/cubieboard/mkcubiecard.sh
> @@ -1,4 +1,9 @@
> -#! /bin/sh
> +#!/bin/sh
> +### BEGIN INTRO
> +# mkcubiecard.sh v0.2:
> +# 2015, Scott Fan <fancp2007@gmail.com>
> +# rewrite this script more clear;
> +# add the 'netboot' argument, to make a network-bootable card.

There are too many things done in one patch. You should do several
patches doing changes to this script, one patch updating the existing
cubieboard* defconfig, and one adding the cubietruck defconfig.

And better than rewriting the script: remove it and use genimage
instead.

> diff --git a/board/cubietech/cubieboard/sun4i-cubieboard.config b/board/cubietech/cubieboard/sun4i-cubieboard.config
> new file mode 100644
> index 0000000..43eee73
> --- /dev/null
> +++ b/board/cubietech/cubieboard/sun4i-cubieboard.config
> @@ -0,0 +1,4 @@
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_SUNXI_EMAC=y
> diff --git a/board/cubietech/cubieboard/sun7i-cubieboard2.config b/board/cubietech/cubieboard/sun7i-cubieboard2.config
> new file mode 100644
> index 0000000..43eee73
> --- /dev/null
> +++ b/board/cubietech/cubieboard/sun7i-cubieboard2.config
> @@ -0,0 +1,4 @@
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_SUNXI_EMAC=y
> diff --git a/board/cubietech/cubieboard/sun7i-cubietruck.config b/board/cubietech/cubieboard/sun7i-cubietruck.config
> new file mode 100644
> index 0000000..ff7813f
> --- /dev/null
> +++ b/board/cubietech/cubieboard/sun7i-cubietruck.config
> @@ -0,0 +1,4 @@
> +CONFIG_IP_PNP=y
> +CONFIG_IP_PNP_DHCP=y
> +CONFIG_ROOT_NFS=y
> +CONFIG_SUNXI_GMAC=y

As I said above, really good idea to use config fragments! However, it
would be nicer if the files indicated that it's a kernel configuration
fragment, so maybe:

	linux-sun7i-cubietruck.config

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
