From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 22:51:10 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/freescale-imx/firmware-imx:
 Add option for all i.MX FW needs
In-Reply-To: <1594382445-4464-4-git-send-email-stephane.viau@oss.nxp.com>
References: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
 <1594382445-4464-4-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200711225110.71100b85@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jul 2020 14:00:44 +0200
Stephane Viau <stephane.viau@oss.nxp.com> wrote:

> Some SoC need a HDMI FW for their bootloader, some other require EPDC,
> SDMA and/or VPU.
> Instead of trying to "guess" what firmware images need to be installed
> in firmware-imx.mk, let the Config framework do the job and allow each
> SoC to pick what firmware they need.
> 
> Note that this patch should also help introducing an eventual DP FW, as
> Gary mentioned in a separate thread [1].
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2020-May/283181.html
> 
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

I have applied with some changes. See below.

> -	  It contains blobs for SDMA and VPU.
> +	  It contains blobs for SDMA, VPU, etc...

I've improved this with a complete list of the firmware that it can
potentially install.

>  
>  	  This library is provided by Freescale as-is and doesn't have
>  	  an upstream.
>  
> +config BR2_PACKAGE_FIRMWARE_IMX_SDMA

Renamed to:

	BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW

to match the naming of the DDR firmware option.

> +	bool
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7

When you look at the sdma folder, it contains:

sdma-imx25-to1.bin
sdma-imx31-to1.bin
sdma-imx31-to2.bin
sdma-imx35-to1.bin
sdma-imx35-to2.bin
sdma-imx51-to3.bin
sdma-imx53-to1.bin
sdma-imx6q.bin
sdma-imx7d.bin

So there is no firmware for i.MX37, i.MX50, i.MX6S and i.MX6UL, so I
dropped these from the supported platform.

> +	depends on BR2_PACKAGE_FIRMWARE_IMX

Instead of repeating this, I've enclosed all options in a "if
BR2_PACKAGE_FIRMWARE_IMX ... endif" block.

> +
> +config BR2_PACKAGE_FIRMWARE_IMX_VPU

Ditto naming.

> +	bool
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +	depends on BR2_PACKAGE_FIRMWARE_IMX

Ditto dependency.

And same for the other options as well.

I fixed these issues when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
