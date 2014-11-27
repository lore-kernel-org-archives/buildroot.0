From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 20:22:03 +0100
Subject: [Buildroot] [PATCH v2 7/9] gpu-viv-bin-mx6q: Use
	self-extractible helper
In-Reply-To: <1416432642-26005-8-git-send-email-jezz@sysmic.org>
References: <1416432642-26005-1-git-send-email-jezz@sysmic.org>
 <1416432642-26005-8-git-send-email-jezz@sysmic.org>
Message-ID: <20141127192203.GL3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-11-19 22:30 +0100, J?r?me Pouiller spake thusly:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Ditto the variable re-ordering...

Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index 85d01d2..1e731b3 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -12,29 +12,17 @@ GPU_VIV_BIN_MX6Q_VERSION = $(GPU_VIV_BIN_MX6Q_BASE_VERSION)-sfp
>  endif
>  GPU_VIV_BIN_MX6Q_SITE = $(FREESCALE_IMX_SITE)
>  GPU_VIV_BIN_MX6Q_SOURCE = gpu-viv-bin-mx6q-$(GPU_VIV_BIN_MX6Q_VERSION).bin
> -
>  GPU_VIV_BIN_MX6Q_INSTALL_STAGING = YES
> +GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
> +GPU_VIV_BIN_MX6Q_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT))
>  
> +# See freescale-imx.mk
>  GPU_VIV_BIN_MX6Q_LICENSE = Freescale Semiconductor Software License Agreement
> -
> -# No license file is included in the archive; we could extract it from
> -# the self-extractor, but that's just too much effort.
> -# This is a legal minefield: the EULA specifies that
> -# the Board Support Package includes software and hardware (sic!)
> -# for which a separate license is needed...
> +GPU_VIV_BIN_MX6Q_LICENSE_FILES = EULA
>  GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
>  
> -GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
> -GPU_VIV_BIN_MX6Q_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT))
> -
> -# The archive is a shell-self-extractor of a bzipped tar. It happens
> -# to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
> -# The --force makes sure it doesn't fail if the source dir already exists.
> -# The --auto-accept skips the license check - not needed for us
> -# because we have legal-info.
>  define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
> -	(cd $(BUILD_DIR); \
> -		sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)
> +	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE))
>  endef
>  
>  # Instead of building, we fix up the inconsistencies that exist
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
