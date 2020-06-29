From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 29 Jun 2020 10:08:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: Add option for
 all i.MX FW needs
In-Reply-To: <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
References: <1593012228-18959-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593012228-18959-2-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200629080844.GA9602@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

Sorry for the late reply, apart for the comments already made by otherse
I have one suggestion below.

On Wed, Jun 24, 2020 at 05:23:47PM +0200, Stephane Viau wrote:
> Some SoC need a HDMI FW for their bootloader, some other require EPDC,
> SDMA and/or VPU.
> Instead of trying to "guess" what firmware images need to be installed
> in firmware-imx.mk, let the Config framework do the job and allow each
> SoC to actually 'select' what firmware they need.
> 
> Note that this patch should also help introducing an eventual DP FW, as
> Gary mentioned in a separate thread [1].
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2020-May/283181.html
> 
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>  package/freescale-imx/Config.in | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 0be37ce..2cac650 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -12,40 +12,63 @@ choice
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
>  	bool "imx25-3stack"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
>  	bool "imx27ads"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
>  	bool "imx37-3stack"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
>  	bool "imx50"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
>  	bool "imx51"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
>  	bool "imx53"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>  	bool "imx6q/imx6dl"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
>  	bool "imx6sl/imx6sx"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  	bool "imx6ul/imx6ull"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
>  	bool "imx7d/imx7ulp"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>  	bool "imx8"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>  	bool "imx8m"
>  	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_HDMI_FW
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
>  	bool "imx8mm"
> @@ -57,6 +80,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>  	bool "imx8x"
> +	select BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
>  endchoice
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> @@ -102,6 +126,21 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>  config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>  	bool
>  
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_EPDC_FW
> +	bool
> +
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_HDMI_FW
> +	bool
> +
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_SDMA_FW
> +	bool
> +
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_LEGACY
> +	bool
> +
> +config BR2_PACKAGE_FREESCALE_IMX_NEED_VPU_FW_IMX8_IMX8X
> +	bool

So here you would copy all VPU FW for "LEGACY" but the one for
IMX8/IMX8X?
I'd rather have a generic IMX_NEED_VPU_FW for all platforms that require
a VPU FW and then in firmware-imx.mk only copy the files relevant to the
platform selected (imx35,51,6,8x), what do you think?

Regards,
Gary
