From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 30 Jun 2020 13:53:41 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/freescale-imx/firmware-imx:
 Add option for all i.MX FW needs
In-Reply-To: <1593419148-26821-3-git-send-email-stephane.viau@oss.nxp.com>
References: <1593419148-26821-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593419148-26821-3-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200630115341.GA791671@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane

On Mon, Jun 29, 2020 at 10:25:46AM +0200, Stephane Viau wrote:
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
> ---
> v2:
> - Do not embed VPU FW for i.MX 6S/6UL/7 (Fabio)
> - Name VPU FW after IP name (Fabio)
> - Rename symbols using the "_NEED_" in their name (Thomas)
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>  package/freescale-imx/firmware-imx/Config.in | 43 +++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
> index d6310e6..2ac5dfa 100644
> --- a/package/freescale-imx/firmware-imx/Config.in
> +++ b/package/freescale-imx/firmware-imx/Config.in
> @@ -4,11 +4,52 @@ config BR2_PACKAGE_FIRMWARE_IMX
>  	help
>  	  Firmware blobs for the Freescale i.MX SoCs.
>  
> -	  It contains blobs for SDMA and VPU.
> +	  It contains blobs for SDMA, VPU, etc...
>  
>  	  This library is provided by Freescale as-is and doesn't have
>  	  an upstream.
>  
> +config BR2_PACKAGE_FIRMWARE_IMX_SDMA
> +	bool
> +	depends on BR2_PACKAGE_FIRMWARE_IMX
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
> +
> +config BR2_PACKAGE_FIRMWARE_IMX_VPU_CODA
> +	bool
> +	depends on BR2_PACKAGE_FIRMWARE_IMX
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
> +
> +config BR2_PACKAGE_FIRMWARE_IMX_VPU_MALONE
> +	bool
> +	depends on BR2_PACKAGE_FIRMWARE_IMX
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> +	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X

So here you are either copying all the VPU Malone blob or all the VPU
CODA blob no matter the platform being used?

Since we cleaning things up, I'd rather have a generic
BR2_PACKAGE_FIRMWARE_IMX_VPU config for all the platforms that require a
VPU blob (from firmware-imx).
Then in the .mk I'd only copy the VPU blob associated to the platform
selected (mx27, mx6, mx8 etc).
That way we don't embed imx27 blob when we build for imx6. As someone
mentioned in the previous, there's no need to embeds blobs we know are
useless.

What do you think?

Regards,
Gary
