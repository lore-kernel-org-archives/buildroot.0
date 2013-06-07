From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jun 2013 11:42:50 +0200
Subject: [Buildroot] [PATCH v9 06/14] gstreamer1: Add gstreamer version
 1.0.7 package
In-Reply-To: <1369931437-12445-7-git-send-email-spenser@gillilanding.com>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-7-git-send-email-spenser@gillilanding.com>
Message-ID: <20130607114250.4222b224@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 30 May 2013 11:30:29 -0500, Spenser Gilliland wrote:
> diff --git a/package/multimedia/gstreamer1/Config.in b/package/multimedia/gstreamer1/Config.in
> new file mode 100644
> index 0000000..c627eb7
> --- /dev/null
> +++ b/package/multimedia/gstreamer1/Config.in
> @@ -0,0 +1,38 @@
> +config BR2_PACKAGE_GSTREAMER1
> +	bool "gstreamer1"
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  GStreamer is an open source multimedia framework.
> +
> +	  http://gstreamer.freedesktop.org/

Please mention explicitly that this is Gstreamer 1.x, incompatible with
Gstreamer 0.10.x, blabla.

Maybe also add a patch that similarly adjust the Gstreamer 0.10.x help
text to mention this.

> +
> +comment "gstreamer requires a toolchain with WCHAR and threads support"

gstreamer1

> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +

This comment should either go *before* the config
BR2_PACKAGE_GSTREAMER1 definition, or *after* the if
BR2_PACKAGE_GSTREAMER1.. endif block below. Otherwise, the sub-options
don't get indented below the gstreamer1 main option.

> diff --git a/package/multimedia/gstreamer1/gstreamer1.mk b/package/multimedia/gstreamer1/gstreamer1.mk
> new file mode 100644
> index 0000000..7abdc09
> --- /dev/null
> +++ b/package/multimedia/gstreamer1/gstreamer1.mk
> @@ -0,0 +1,36 @@
> +#############################################################
> +#
> +# gstreamer1
> +#
> +#############################################################
> +
> +GSTREAMER1_VERSION = 1.0.7
> +GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
> +GSTREAMER1_SITE = http://gstreamer.freedesktop.org/src/gstreamer
> +GSTREAMER1_INSTALL_STAGING = YES

license + license files.

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
> +		--disable-examples \
> +		--disable-tests \
> +		--disable-failing-tests \
> +		--disable-debug \
> +		--disable-valgrind \
> +		--disable-benchmarks \
> +		--disable-check \
> +		$(if $(BR2_PACKAGE_GSTREAMER1_GST_DEBUG),,--disable-gst-debug) \
> +		$(if $(BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY),,--disable-registry) \
> +		$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),,--disable-tools) \

Trailing backslash on the last line.

Also, please indent those lines with only one tab. I know it has two
tabs in the original gstreamer.mk, but let's fix that when introducing
new packages.

> +
> +GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
> +
> +$(eval $(autotools-package))

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
