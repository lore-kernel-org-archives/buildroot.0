From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 22:25:04 +0200
Subject: [Buildroot] [PATCH v2] package/libsvg: new package
In-Reply-To: <1372593363-10994-1-git-send-email-c.schoenert@gmail.com>
References: <1372593363-10994-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <20130630222504.7e6131b8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sun, 30 Jun 2013 13:56:03 +0200, Carsten Schoenert wrote:

> +config BR2_PACKAGE_LIBSVG
> +	bool "libsvg"
> +	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_LIBSVG_EXPAT

I don't think we want the BR2_PACKAGE_LIBSVG_EXPAT option. Just make
this:

	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT

> +	help
> +	  Libsvg provides a parser for SVG content in files or buffers.
> +	  Libsvg does not do any rendering, but instead provides a
> +	  function-based interface that can be used by various rendering
> +	  engines.
> +
> +	  http://cairographics.org/snapshots/
> +
> +if BR2_PACKAGE_LIBSVG
> +
> +config BR2_PACKAGE_LIBSVG_EXPAT
> +    bool "use expat XML parser library"
> +	select BR2_PACKAGE_EXPAT
> +	default y
> +	help
> +	  Libsvg needs a XML parsing library!
> +	  Select expat if you want to use the Expat XML Parser library,
> +	  otherwhise the libxml2 library will be used.

Remove this option.


> +LIBSVG_VERSION         = 0.1.4
> +LIBSVG_SITE            = http://cairographics.org/snapshots/
> +LIBSVG_DEPENDENCIES    = host-pkgconf libpng libjpeg
> +LIBSVG_INSTALL_STAGING = YES
> +LIBSVG_LICENSE         = LGPLv2+
> +LIBSVG_LICENSE_FILES   = COPYING
> +
> +# libsvg needs at last a XML parser
> +ifeq ($(BR2_PACKAGE_LIBSVG_EXPAT),y)

ifeq ($(BR2_PACKAGE_EXPAT),y)

> +LIBSVG_CONF_OPT += --with-expat
> +LIBSVG_DEPENDENCIES += expat
> +else ifeq ($(BR2_PACKAGE_LIBXML2),y)
> +LIBSVG_CONF_OPT += --with-libxml2
> +LIBSVG_DEPENDENCIES += libxml2
> +endif
> +
> +$(eval $(autotools-package))

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
