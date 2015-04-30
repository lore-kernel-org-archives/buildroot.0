From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 10:40:20 +0200
Subject: [Buildroot] [v6,
	06/15] gpu-viv-bin-mx6q: change output selection mechanism
In-Reply-To: <1421451251-23366-7-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-7-git-send-email-jezz@sysmic.org>
Message-ID: <20150430084020.GF24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:34:02AM +0100, J?r?me Pouiller wrote:
> Move output selection to Config.in. It easier to add new backends selection
> (wayland, directfb, ...).
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/gpu-viv-bin-mx6q/Config.in           | 5 +++++
>  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk | 8 +-------
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> index 7fbddbf..2392d9a 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
> @@ -44,6 +44,11 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
>  
>  endchoice
>  
> +config BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT
> +	string
> +	default "x11" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11
> +	default "fb" if BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_FB
> +
>  config BR2_PACKAGE_PROVIDES_LIBEGL
>  	default "gpu-viv-bin-mx6q"
>  
> diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> index 7845a25..501b124 100644
> --- a/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> +++ b/package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk
> @@ -19,13 +19,7 @@ GPU_VIV_BIN_MX6Q_LICENSE_FILES = EULA
>  GPU_VIV_BIN_MX6Q_REDISTRIBUTE = NO
>  
>  GPU_VIV_BIN_MX6Q_PROVIDES = libegl libgles libopenvg
> -
> -# DirectFB is not supported (wrong version)
> -ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT_X11),y)
> -GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
> -else
> -GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
> -endif
> +GPU_VIV_BIN_MX6Q_LIB_TARGET = $(call qstrip,$(BR2_PACKAGE_GPU_VIV_BIN_MX6Q_OUTPUT))
>  
>  define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
>  	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE))

As explained in my answer to the cover letter, this series of patch has
been successfully tested on a Nitrogen6x board.
http://lists.busybox.net/pipermail/buildroot/2015-April/124739.html

Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
