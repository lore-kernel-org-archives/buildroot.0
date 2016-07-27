From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 22:21:09 +0200
Subject: [Buildroot] [PATCH 1/1] gupnp-dlna: new package
In-Reply-To: <1469551209-28213-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469551209-28213-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160727222109.24c808ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 18:40:09 +0200, Fabrice Fontaine wrote:
> GUPnP DLNA is a small utility library that aims to ease the
> DLNA-related tasks such as media profile guessing, transcoding
> to a given profile, etc.
> 
> http://www.gupnp.org/
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Thanks, it looks pretty good, I only have a few comments below.

> diff --git a/package/gupnp-dlna/Config.in b/package/gupnp-dlna/Config.in
> new file mode 100644
> index 0000000..f2a45b4
> --- /dev/null
> +++ b/package/gupnp-dlna/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_GUPNP_DLNA
> +	bool "gupnp-dlna"
> +	depends on BR2_USE_WCHAR # glib2, gupnp
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, gupnp
> +	depends on BR2_USE_MMU # glib2, gupnp
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_GUPNP

I couldn't spot in the configure.ac file where the gupnp dependency is
needed.

> +GUPNP_DLNA_VERSION_MAJOR = 0.10
> +GUPNP_DLNA_VERSION = $(GUPNP_DLNA_VERSION_MAJOR).5
> +GUPNP_DLNA_SOURCE = gupnp-dlna-$(GUPNP_DLNA_VERSION).tar.xz
> +GUPNP_DLNA_SITE = \
> +	http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/$(GUPNP_DLNA_VERSION_MAJOR)
> +GUPNP_DLNA_LICENSE = LGPLv2+

The COPYING file contains the text of the LGPLv2.1, but the source file
contains LGPLv2+. So let's stick with LGPLv2+, but it would be good to
have a comment.

> +GUPNP_DLNA_LICENSE_FILES = COPYING
> +GUPNP_DLNA_INSTALL_STAGING = YES
> +GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2 gupnp

Again, I can see the host-pkgconf, libglib2 and libxml2 dependencies in
the configure.ac file, but not the gupnp one.

> +
> +ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
> +GUPNP_DLNA_CONF_OPTS = --enable-legacy-gstreamer-metadata-backend

Use +=

> +GUPNP_DLNA_DEPENDENCIES += gstreamer gst-plugins-base

Please add:

else

GUPNP_DLNA_CONF_OPTS += --disable-legacy-gstreamer-metadata-backend

> +endif
> +
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)

GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend

> +GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base

else

GUPNP_DLNA_CONF_OPTS += --disable-gstreamer-metadata-backend

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
