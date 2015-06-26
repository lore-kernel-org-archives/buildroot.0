From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 26 Jun 2015 18:27:48 +0200
Subject: [Buildroot] [V4 1/2] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <1435313217-12871-2-git-send-email-francois.perrad@gadz.org>
References: <1435313217-12871-1-git-send-email-francois.perrad@gadz.org>
 <1435313217-12871-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <558D7D84.1000605@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois,

Francois Perrad wrote:
> config device tree / mainline (4.0.5)
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   board/olimex/a20_olinuxino_lime/boot.cmd      |  5 ++
>   board/olimex/a20_olinuxino_lime/post-build.sh |  8 +++
>   board/olimex/a20_olinuxino_lime/readme.txt    | 86 +++++++++++++++++++++++++++

I confirm these files work for the A20-OLinuXino-Micro too, so I'd move
them to board/olimex/a20_olinuxino/ (without the _lime suffix).

I'll build support for the Micro on top of them.

[...]
> diff --git a/board/olimex/a20_olinuxino_lime/boot.cmd b/board/olimex/a20_olinuxino_lime/boot.cmd
> new file mode 100644
> index 0000000..44d9239
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/boot.cmd
> @@ -0,0 +1,5 @@
> +setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
> +ext4load mmc 0 0x49000000 /boot/${fdtfile}

Using ${fdtfile} here is a good idea, it simplified my job. Thanks!

[...]
> diff --git a/board/olimex/a20_olinuxino_lime/readme.txt b/board/olimex/a20_olinuxino_lime/readme.txt
> new file mode 100644
> index 0000000..3fc9c02
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/readme.txt
> @@ -0,0 +1,86 @@
> +A20-OLinuXino-LIME
> +
> +Intro
> +=====
> +
> +This is a open hardware board,
> +see https://www.olimex.com/Products/OLinuXino/open-source-hardware

I still think a link to the board webpage would be informative...

[...]
> diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
> new file mode 100644
> index 0000000..62f0a4c
> --- /dev/null
> +++ b/configs/olimex_a20_olinuxino_lime_defconfig
> @@ -0,0 +1,45 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_EABIHF=y

This SoC has NEON and VFPv4, so you should add:
BR2_ARM_FPU_NEON_VFPV4=y

I booted a Micro board with a defconfig that is very similar to yours.
But I couldn't borrow a Lime yet, do I just build-tested it.

-- 
Luca
