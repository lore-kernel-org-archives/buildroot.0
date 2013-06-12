From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Jun 2013 07:51:34 +0200
Subject: [Buildroot] [PATCH v10 06/13] gstreamer1: Add gstreamer version
 1.1.1 package
In-Reply-To: <1370647138-26623-7-git-send-email-spenser@gillilanding.com>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
 <1370647138-26623-7-git-send-email-spenser@gillilanding.com>
Message-ID: <51B80C66.3070602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Spenser,

On 08/06/13 01:18, Spenser Gilliland wrote:
> This patch adds the gstreamer version 1.x series to buildroot.

  Missing SoB

> ---
>   package/multimedia/Config.in                |    1 +
>   package/multimedia/gstreamer1/Config.in     |   41 +++++++++++++++++++++++++++
>   package/multimedia/gstreamer1/gstreamer1.mk |   38 +++++++++++++++++++++++++
>   3 files changed, 80 insertions(+), 0 deletions(-)
>   create mode 100644 package/multimedia/gstreamer1/Config.in
>   create mode 100644 package/multimedia/gstreamer1/gstreamer1.mk
>
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index dd74863..0351fd0 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -6,6 +6,7 @@ source "package/multimedia/faad2/Config.in"
>   source "package/multimedia/flac/Config.in"
>   source "package/multimedia/ffmpeg/Config.in"
>   source "package/multimedia/gstreamer/Config.in"
> +source "package/multimedia/gstreamer1/Config.in"

  I think this should come below the gst-0.10 packages (so below 
gst-plugins-ugly) so they're more logically collected.


>   source "package/multimedia/gst-ffmpeg/Config.in"
>   source "package/multimedia/gst-dsp/Config.in"
>   source "package/multimedia/gst-fsl-plugins/Config.in"
> diff --git a/package/multimedia/gstreamer1/Config.in b/package/multimedia/gstreamer1/Config.in
> new file mode 100644
> index 0000000..96b32e9
> --- /dev/null
> +++ b/package/multimedia/gstreamer1/Config.in
> @@ -0,0 +1,41 @@
> +config BR2_PACKAGE_GSTREAMER1
> +	bool "gstreamer1"
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  GStreamer is an open source multimedia framework. This 1.x version of
> +	  Gstreamer is incompatible with Gstreamer 0.1x.

  Well, gstreamer 0.11 was actually an experimental pre-release branch 
for 1.x (although there are still lots of incompatible changes between 
0.11 and 1.0). I think it's more clear and accurate if you say it's 
incompatible with Gstreamer 0.10.


> +
> +	  http://gstreamer.freedesktop.org/
> +
> +if BR2_PACKAGE_GSTREAMER1
> +
> +config BR2_PACKAGE_GSTREAMER1_GST_DEBUG
> +	bool "enable gst-debug trace support"
> +	default y
> +	help
> +	  Enable support for the gst-debug tracing functionality in gstreamer.
> +	  This has limited CPU overhead, but does increase the rootfs size
> +	  somewhat.

  I believe the disable-parse and disable-trace options have at least as 
much impact on CPU and size overhead as the gst-debug, so it would make 
sense to export them as well. Although actually I expect the difference 
to be vanishingly small for any of them.

> +
> +config BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY
> +	bool "enable plugin registry"
> +	default y
> +	help
> +	  Enable support for the GStreamer plugin registry. This may increase
> +	  the launch-time for a GStreamer application.
> +
> +config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
> +	bool "install gst-launch gst-inspect"

  "install gst-launch & gst-inspect"

> +	default y
> +	help
> +	  Install the gst-launch and gst-inspect tools. This will take up
> +	  additional space on the target
> +
> +endif
> +
> +comment "gstreamer1 requires a toolchain with WCHAR and threads support"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +
> diff --git a/package/multimedia/gstreamer1/gstreamer1.mk b/package/multimedia/gstreamer1/gstreamer1.mk
> new file mode 100644
> index 0000000..90cf0f6
> --- /dev/null
> +++ b/package/multimedia/gstreamer1/gstreamer1.mk
> @@ -0,0 +1,38 @@
> +#############################################################
> +#
> +# gstreamer1
> +#
> +#############################################################
> +
> +GSTREAMER1_VERSION = 1.1.1
> +GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
> +GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
> +GSTREAMER1_INSTALL_STAGING = YES
> +GSTREAMER1_LICENSE_FILES = COPYING
> +GSTREAMER1_LICENSE = GPLv2 LGPLv2+ LGPLv2.1+

  I couldn't find any GPLv2 license headers except some tests and an m4 
header (which we normally don't consider to be part of the code requiring 
a license).


  Regards,
  Arnout

> +
> +# Checking if unaligned memory access works correctly cannot be done when cross
> +# compiling. For the following architectures there is no information available
> +# in the configure script.
> +ifeq ($(BR2_avr32),y)
> +GSTREAMER1_CONF_ENV = as_cv_unaligned_access=no
> +endif
> +ifeq ($(BR2_aarch64),y)
> +GSTREAMER1_CONF_ENV = as_cv_unaligned_access=yes
> +endif
> +
> +GSTREAMER1_CONF_OPT = \
> +	--disable-examples \
> +	--disable-tests \
> +	--disable-failing-tests \
> +	--disable-debug \
> +	--disable-valgrind \
> +	--disable-benchmarks \
> +	--disable-check \
> +	$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),,--disable-gst-debug) \
> +	$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),,--disable-registry) \
> +	$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),,--disable-tools)
> +
> +GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
