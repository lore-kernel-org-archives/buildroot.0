From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 6 Jun 2016 16:33:45 +0200
Subject: [Buildroot] [PATCH 04/10] imx-codec: rename from libfslcodec
 and bump version to 4.0.9
In-Reply-To: <1c80fb18ed68a53b0eae32552132b91f5fc12469.1464958470.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <1c80fb18ed68a53b0eae32552132b91f5fc12469.1464958470.git.awebster@arcx.com>
Message-ID: <CAAMH-yseZTKvF_jw8UKe8pkoMuYwD6R+eHMGvkE6c4YteQWt4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 3, 2016 at 3:10 PM, Andrew Webster <awebster@arcx.com> wrote:
> Changelog:
> --[aac_dec] refine the code for pure c build
>   aac decoder c build need float point support, which use some
>   float point function.
>
> This patch is based on the Yocto equivalent:
> https://github.com/Freescale/meta-fsl-arm/commit/4b91194
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>
> ---
>  Config.in.legacy                                   |  7 +++++++
>  package/Config.in                                  |  1 -
>  package/freescale-imx/Config.in                    |  1 +
>  .../imx-codec}/Config.in                           |  6 +++---
>  package/freescale-imx/imx-codec/imx-codec.hash     |  2 ++
>  package/freescale-imx/imx-codec/imx-codec.mk       | 23 ++++++++++++++++++++++
>  package/gstreamer/gst-fsl-plugins/Config.in        |  4 ++--
>  .../gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk   |  2 +-
>  package/gstreamer1/gst1-imx/Config.in              |  2 +-
>  package/gstreamer1/gst1-imx/gst1-imx.mk            |  4 ++--
>  package/libfslcodec/libfslcodec.hash               |  2 --
>  package/libfslcodec/libfslcodec.mk                 | 23 ----------------------
>  12 files changed, 42 insertions(+), 35 deletions(-)
>  rename package/{libfslcodec => freescale-imx/imx-codec}/Config.in (75%)
>  create mode 100644 package/freescale-imx/imx-codec/imx-codec.hash
>  create mode 100644 package/freescale-imx/imx-codec/imx-codec.mk
>  delete mode 100644 package/libfslcodec/libfslcodec.hash
>  delete mode 100644 package/libfslcodec/libfslcodec.mk
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index b73603b..54d43f1 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -142,6 +142,13 @@ comment "build, or run, in unpredictable ways.               "
>  comment "----------------------------------------------------"
>  endif
>
> +config BR2_PACKAGE_LIBFSLCODEC
> +       bool "libfslcodec has been renamed to imx-codec"
> +       select BR2_LEGACY
> +       select BR2_PACKAGE_IMX_CODEC
> +       help
> +         The libfslcodec has been renamed to match the renamed package.
> +

This section should actually be under "Legacy options removed in 2016.08" below.

>  ###############################################################################
>  comment "Legacy options removed in 2016.08"
>
> diff --git a/package/Config.in b/package/Config.in
> index ae74f17..c41e4f6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1089,7 +1089,6 @@ menu "Multimedia"
>         source "package/libdvdnav/Config.in"
>         source "package/libdvdread/Config.in"
>         source "package/libebml/Config.in"
> -       source "package/libfslcodec/Config.in"
>         source "package/libfslparser/Config.in"
>         source "package/libfslvpuwrap/Config.in"
>         source "package/libhdhomerun/Config.in"
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index 8c03190..052de5a 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -49,6 +49,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53 || \
>                 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
>
> +source "package/freescale-imx/imx-codec/Config.in"
>  source "package/freescale-imx/imx-kobs/Config.in"
>  source "package/freescale-imx/imx-lib/Config.in"
>  source "package/freescale-imx/imx-uuc/Config.in"
> diff --git a/package/libfslcodec/Config.in b/package/freescale-imx/imx-codec/Config.in
> similarity index 75%
> rename from package/libfslcodec/Config.in
> rename to package/freescale-imx/imx-codec/Config.in
> index d2007fe..e161699 100644
> --- a/package/libfslcodec/Config.in
> +++ b/package/freescale-imx/imx-codec/Config.in
> @@ -1,5 +1,5 @@
> -config BR2_PACKAGE_LIBFSLCODEC
> -       bool "libfslcodec"
> +config BR2_PACKAGE_IMX_CODEC
> +       bool "imx-codec"
>         depends on BR2_arm # Only relevant for i.MX
>         depends on BR2_TOOLCHAIN_USES_GLIBC # prebuilt binaries
>         help
> @@ -8,6 +8,6 @@ config BR2_PACKAGE_LIBFSLCODEC
>           This library is provided by Freescale as-is and doesn't have
>           an upstream.

Although it isn't done in the Yocto patch I guess this renaming is a
good time to remove the Freescale reference. This library is now
provided by NXP as-is, targeting NXP i.MX SoCs.

Regards,
Gary
