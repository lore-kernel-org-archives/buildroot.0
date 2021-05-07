From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 May 2021 00:02:32 +0200
Subject: [Buildroot] [PATCH v3 3/7] configs/beaglev_defconfig: new
 defconfig
In-Reply-To: <20210504205139.1055360-4-thomas.petazzoni@bootlin.com>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-4-thomas.petazzoni@bootlin.com>
Message-ID: <20210507220232.GD2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-05-04 22:51 +0200, Thomas Petazzoni spake thusly:
> This commit introduces support for the RISC-V based BeagleV platform,
> which uses a Starfive JH7100.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> diff --git a/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch b/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
> new file mode 100644
> index 0000000000..74d70f2721
> --- /dev/null
> +++ b/board/beaglev/patches/uboot/0001-include-configs-starfive-vic7100-adjust-fdt_addr_r.patch
> @@ -0,0 +1,39 @@
> +From 2c4c813940c577590f3352cef0c49a8def17905d Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Wed, 28 Apr 2021 22:58:45 +0200
> +Subject: [PATCH] include/configs/starfive-vic7100: adjust fdt_addr_r
> +
> +The default fdt_addr_r of 0x88000000 doesn't work, the kernel never
> +boots. Using 0x90000000 works fine.
> +
> +Since it would overlap with the kernel_comp_addr_r area, this one is
> +moved 16 MB further, at 0x91000000.

Is this something that is so board specific that we can't upstream it?

[--SNIP--]
> diff --git a/board/beaglev/post-build.sh b/board/beaglev/post-build.sh
> new file mode 100755
> index 0000000000..e303d4b8d9
> --- /dev/null
> +++ b/board/beaglev/post-build.sh
> @@ -0,0 +1,17 @@
> +#!/bin/sh
> +BOARD_DIR=$(dirname $0)
> +
> +# The DTB to use is provided within the U-Boot source tree, so we grab
> +# it from there, and install it to TARGET_DIR/boot/.
> +UBOOT_DIR=$(make -C ${CONFIG_DIR} --no-print-directory VARS=UBOOT_DIR printvars | cut -f2 -d'=')

Here, I've used eval, as suggested in the manual:

    eval $(make -C ${CONFIG_DIR} --no-print-directory QUOTED_VARS=YES VARS=UBOOT_DIR printvars)

Applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
