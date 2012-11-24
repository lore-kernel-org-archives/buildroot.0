From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Nov 2012 00:51:45 +0100
Subject: [Buildroot] [PATCH v2] gstreamer: Added option to disable plugin
In-Reply-To: <98E3058E5505294895CA69F176CAD66272CE97@LEMAIL01.le.imgtec.org>
References: <98E3058E5505294895CA69F176CAD66272CE97@LEMAIL01.le.imgtec.org>
Message-ID: <50B15D91.8090708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Tim,

  The whitespace in your patch is messed up by your e-mail client.  Please use
git send-email to avoid this.


On 22/11/12 14:53, Tim Sheridan wrote:
> The plugin registry can take a while to be generated when GStreamer is initialized. Turning it off speeds up GStreamer application launch times. Default behaviour is unchanged.

  Please wrap the commit message at +- 72 characters

>
> Signed-off-by: Tim Sheridan<tim.sheridan@imgtec.com>
> ---
>   package/multimedia/gstreamer/Config.in    |    9 +++++++++
>   package/multimedia/gstreamer/gstreamer.mk |    3 ++-
>   2 files changed, 11 insertions(+), 1 deletions(-)
>
> diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
> index 4d279b8..e946b18 100644
> --- a/package/multimedia/gstreamer/Config.in
> +++ b/package/multimedia/gstreamer/Config.in
> @@ -16,5 +16,14 @@ config BR2_PACKAGE_GSTREAMER_GST_DEBUG
>            in gstreamer. This has limited CPU overhead, but does
>            increase the rootfs size somewhat.
>
> +config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
> +       bool "enable plugin registry"
> +       default y
> +       depends on BR2_PACKAGE_GSTREAMER
> +       help
> +         Enable support for the GStreamer plugin registry.
> +         This may increase the launch-time for a GStreamer
> +         application.

  The Config.in things should be indented with 1 tab, help text with
1 tab and 2 spaces.  Wrapping should be at 80 characters, with the tab
counting as 8 characters.

> +
>   comment "gstreamer requires a toolchain with WCHAR support"
>          depends on !BR2_USE_WCHAR
> diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
> index a9841b1..b87f029 100644
> --- a/package/multimedia/gstreamer/gstreamer.mk
> +++ b/package/multimedia/gstreamer/gstreamer.mk
> @@ -21,7 +21,8 @@ GSTREAMER_CONF_OPT = \
>                  --disable-tests \
>                  --disable-failing-tests \
>                  --disable-loadsave \
> -               $(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug)
> +               $(if $(BR2_PACKAGE_GSTREAMER_GST_DEBUG),,--disable-gst-debug) \
> +               $(if
> + $(BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY),,--disable-registry)

  No need to split this line, even if it goes over 80 characters. It's less readable
when split.


  All my comments are just whitespace-related, so:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

>
>   GSTREAMER_DEPENDENCIES = libglib2 host-pkgconf
>
> --
> 1.7.1

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
