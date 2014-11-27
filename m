From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 19:16:20 +0100
Subject: [Buildroot] [PATCH v2 3/9] imx-vpu: Use self-extractible helper
In-Reply-To: <1416432642-26005-4-git-send-email-jezz@sysmic.org>
References: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
 <1416432642-26005-4-git-send-email-jezz@sysmic.org>
Message-ID: <20141127181620.GH3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-11-19 22:30 +0100, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/freescale-imx/imx-vpu/imx-vpu.mk | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
> index e0292ed..110287b 100644
> --- a/package/freescale-imx/imx-vpu/imx-vpu.mk
> +++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
> @@ -6,8 +6,6 @@
>  
>  IMX_VPU_VERSION = $(FREESCALE_IMX_VERSION)
>  IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
> -IMX_VPU_LICENSE = Freescale License
> -IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
>  IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
>  
>  IMX_VPU_INSTALL_STAGING = YES
> @@ -21,21 +19,13 @@ IMX_VPU_MAKE_ENV = \
>  	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
>  	INCLUDE="-idirafter $(LINUX_DIR)/include"
>  
> -# The archive is a shell-self-extractor of a bzipped tar. It happens
> -# to extract in the correct directory (imx-vpu-x.y.z)
> -# The --force makes sure it doesn't fail if the source dir already exists.
> -# The --auto-accept skips the license check - not needed for us
> -# because we have legal-info
> -# Since there's a EULA in the bin file, extract it to imx-vpu-x.y.z/EULA
> -#
> +# See freescale-imx.mk
> +IMX_VPU_LICENSE = Freescale Semiconductor Software License Agreement
> +IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
> +IMX_VPU_REDISTRIBUTE = NO
> +
>  define IMX_VPU_EXTRACT_CMDS
> -	awk 'BEGIN      { start=0; } \
> -	     /^EOEULA/  { start = 0; } \
> -	                { if (start) print; } \
> -	     /<<EOEULA/ { start=1; }'\
> -	    $(DL_DIR)/$(IMX_VPU_SOURCE) > $(@D)/EULA
> -	cd $(BUILD_DIR); \
> -	sh $(DL_DIR)/$(IMX_VPU_SOURCE) --force --auto-accept
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_VPU_SOURCE))
>  endef
>  
>  define IMX_VPU_BUILD_CMDS
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
