From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:00:07 +0200
Subject: [Buildroot] [PATCH v2 04/14] imx-gpu-viv: bump version to
	5.0.11-p8.4
In-Reply-To: <dabb46035a5df04fd47c23e690f24ed07a2204a8.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <dabb46035a5df04fd47c23e690f24ed07a2204a8.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-yvfRCmYnFfWNc92bs3v0ceARaqdUuMrcsb_fe440ggUeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

A couple of aesthetic remarks.

On Fri, Jun 10, 2016 at 8:09 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> Software floating point is no longer supported.
>
> For a detailed list of changes in this update, see the Graphics section of
> the i.MX Linux Release Notes contained in the i.MX Linux BSP documentation
> here:
>
> https://www.nxp.com/webapp/Download?colCode=L4.1.15_1.1.0_LINUX_DOCS&location=null&fpsp=1&WT_TYPE=Supporting%20Information&WT_VENDOR=FREESCALE&WT_FILE_FORMAT=gz&WT_ASSET=Documentation&fileExt=.gz&Parent_nodeId=1337637154535695831062&Parent_pageType=product
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/b667ed4
> https://github.com/Freescale/meta-fsl-arm/commit/af5b3a6
>
> This package has been tested with both X11 and Framebuffer backends:
>  # cd /usr/share/examples/viv_samples/vdk/
>  # apitrace trace --api egl ./tutorial7
>  # gmem_info
>  ... display memory use per PID ...
>  # apitrace replay tutorial7.trace
>  # eglretrace tutorial7.trace
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>
> ---
> Changes v1 -> v2:
>   - added test procedure to comment
>   - updated from p8.3 to p8.4
>
>  package/freescale-imx/imx-gpu-viv/Config.in        |  6 +++++-
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash |  4 +---
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 10 +++-------
>  3 files changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
> index 20759b1..9a7cf56 100644
> --- a/package/freescale-imx/imx-gpu-viv/Config.in
> +++ b/package/freescale-imx/imx-gpu-viv/Config.in
> @@ -2,12 +2,16 @@ comment "imx-gpu-viv needs an (e)glibc toolchain"
>         depends on BR2_arm
>         depends on !BR2_TOOLCHAIN_USES_GLIBC
>
> +comment "imx-gpu-viv needs EABIhf"
> +       depends on BR2_arm
> +       depends on !BR2_ARM_EABIHF
> +
>  config BR2_PACKAGE_IMX_GPU_VIV
>         bool "imx-gpu-viv"
>         select BR2_PACKAGE_HAS_LIBEGL
>         select BR2_PACKAGE_HAS_LIBGLES
>         select BR2_PACKAGE_HAS_LIBOPENVG
> -       depends on BR2_arm # Only relevant for i.MX6
> +       depends on BR2_ARM_EABIHF # Only relevant for EABIhf i.MX6

I'm not fond of this comment since "EABIhf i.MX6" are two terms that
don't go together IMO. I'd either just keep the previous comment or
something like "Only relevant for i.MX6 + EABIhf toolchain".

Thomas, what do you think?

>         # Library binaries are linked against libc.so.6
>         depends on BR2_TOOLCHAIN_USES_GLIBC
>         help
> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
> index 4119388..f94d3148 100644
> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
> @@ -1,3 +1 @@
> -# locally computed
> -sha256 3ea201f91ce9b56455e4983ab1055e8175415fbbf2800dc097d47e78ceefba34  imx-gpu-viv-5.0.11.p7.4-sfp.bin
> -sha256 b80838104f2f2e3b0baf2f1aacdca263c1c92589ce919b3be40aaad23f686b7f  imx-gpu-viv-5.0.11.p7.4-hfp.bin
> +sha256 8f79ce562d8ac1efb0a2af403b405541f98c55ae1631a18a3d7fad3224dfb44b  imx-gpu-viv-5.0.11.p8.4-hfp.bin
> diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> index b51a7af..2a15b55 100644
> --- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> +++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
> @@ -4,19 +4,15 @@
>  #
>  ################################################################################
>
> -IMX_GPU_VIV_BASE_VERSION = 5.0.11.p7.4
> -ifeq ($(BR2_ARM_EABIHF),y)
> +IMX_GPU_VIV_BASE_VERSION = 5.0.11.p8.4
>  IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-hfp
> -else
> -IMX_GPU_VIV_VERSION = $(IMX_GPU_VIV_BASE_VERSION)-sfp
> -endif
>  IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
>  IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin

I think it is ok to keep the version naming like you did but m
