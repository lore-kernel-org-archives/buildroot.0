From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Mar 2015 18:27:49 +0100
Subject: [Buildroot] [PATCH v4] configs: add defconfig for Freescale
	i.MX31 PDK
In-Reply-To: <1426863456-2581-1-git-send-email-vincent.stehle@freescale.com>
References: <550B3F16.60600@mind.be>
 <1426863456-2581-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <550DAA15.7070103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/15 15:57, Vincent Stehl? wrote:
> The i.MX31 Product Development Kit (or PDK) is Freescale development board
> based on the i.MX31 application processor.
> 
> This defconfig is based on mainline kernel v3.15.10, and is aimed at a PDK in
> "3 stack" configuration, with CPU engine board, personality board and debug
> board.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Minor comments below.

> diff --git a/board/freescale/imx31_3stack/readme.txt b/board/freescale/imx31_3stack/readme.txt
> new file mode 100644
> index 0000000..47447fd
> --- /dev/null
> +++ b/board/freescale/imx31_3stack/readme.txt
> @@ -0,0 +1,92 @@
> +**************************************
> +Freescale i.MX31 PDK development board
> +**************************************

 Excellent readme!

[snip]
> diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
> new file mode 100644
> index 0000000..f929db0
> --- /dev/null
> +++ b/configs/freescale_imx31_3stack_defconfig
> @@ -0,0 +1,20 @@
> +# architecture
> +BR2_arm=y
> +BR2_arm1136jf_s_r0=y
> +BR2_ARM_EABIHF=y
> +
> +# toolchain
> +BR2_KERNEL_HEADERS_VERSION=y
> +BR2_DEFAULT_KERNEL_VERSION="3.15.10"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15=y

 It would be good to add a comment here that explains that upstream is broken
since 3.16.

 It would be even better to fix upstream :-)

> +
> +# system
> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> +
> +# kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"

 That's actually a pretty bloated config, containing many drivers that are
irrelevant for this board. But it's probably not easy to tone it down to the
really needed set, and you probably anyway want to keep v4l, alsa and IPv6, so
perhaps it's not worth the bother to look for a reduced defconfig.


 Regards,
 Arnout


> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_TARGET_ROOTFS_CPIO_GZIP=y
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
