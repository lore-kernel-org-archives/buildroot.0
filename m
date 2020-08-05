From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 22:51:18 +0200
Subject: [Buildroot] [PATCH 2/2] configs/freescale_imx7ulpevkb: new
 defconfig
In-Reply-To: <20200731121333.3754957-2-fabrice.goucem@oss.nxp.com>
References: <20200731121333.3754957-1-fabrice.goucem@oss.nxp.com>
 <20200731121333.3754957-2-fabrice.goucem@oss.nxp.com>
Message-ID: <20200805225118.0189afd4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Thanks for this patch, see below for some comments.

On Fri, 31 Jul 2020 14:13:33 +0200
Fabrice Goucem <fabrice.goucem@oss.nxp.com> wrote:

>  DEVELOPERS                              |  2 +
>  board/freescale/imx7ulpevkb/readme.txt  | 76 +++++++++++++++++++++++++
>  configs/freescale_imx7ulpevkb_defconfig | 29 ++++++++++
>  package/freescale-imx/Config.in         |  8 ++-

This is doing two things at once: adding the IMX7ULP support in
package/freescale-imx/Config.in (which should come as a separate patch,
and before the imx-m4-demos package) and the imx7ulpevkb defconfig
addition. Could you split that up ?


> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 75c213a1d7..cc0d8fc7a8 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -38,7 +38,10 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  	bool "imx6ul/imx6ull"
>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> -	bool "imx7d/imx7ulp"
> +	bool "imx7d"
> +
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP
> +	bool "imx7ulp"

The commit log should detail why you're separating IMX7ULP from IMX7:
because they have different imx-m4-demos packages, at least that's what
I understood.

>  
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>  	bool "imx8"
> @@ -68,6 +71,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>  	default "IMX6S" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
>  	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  	default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> +	default "IMX7ULP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP
>  	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>  	default "IMX8MQ" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>  	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
> @@ -90,6 +94,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \

Are you sure the i.MX7 has a GPU ? According to
https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-7-processors:IMX7-SERIES
only the i.MX7 ULP has a GPU, unless I'm misreading this.

> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
> @@ -99,6 +104,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_MCORE
>  	bool
>  	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
> +		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
>  		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
