From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 01 Jul 2013 09:56:46 +0200
Subject: [Buildroot] [PATCH v2] package/libsvg: new package
In-Reply-To: <1372593363-10994-1-git-send-email-c.schoenert@gmail.com>
 (Carsten Schoenert's message of "Sun, 30 Jun 2013 13:56:03 +0200")
References: <1372593363-10994-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <87ip0uvhkx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> Libsvg provides a library for parsing SVG content in files or buffers.
 Carsten> Libsvg does not do any rendering, but instead provides a function-based
 Carsten> interface that can be used by various rendering engines.

 Carsten> +++ b/package/libsvg/Config.in
 Carsten> @@ -0,0 +1,23 @@
 Carsten> +config BR2_PACKAGE_LIBSVG
 Carsten> +	bool "libsvg"
 Carsten> +	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_LIBSVG_EXPAT
 Carsten> +	help
 Carsten> +	  Libsvg provides a parser for SVG content in files or buffers.
 Carsten> +	  Libsvg does not do any rendering, but instead provides a
 Carsten> +	  function-based interface that can be used by various rendering
 Carsten> +	  engines.
 Carsten> +
 Carsten> +	  http://cairographics.org/snapshots/
 Carsten> +
 Carsten> +if BR2_PACKAGE_LIBSVG
 Carsten> +
 Carsten> +config BR2_PACKAGE_LIBSVG_EXPAT
 Carsten> +    bool "use expat XML parser library"
 Carsten> +	select BR2_PACKAGE_EXPAT
 Carsten> +	default y
 Carsten> +	help
 Carsten> +	  Libsvg needs a XML parsing library!
 Carsten> +	  Select expat if you want to use the Expat XML Parser library,
 Carsten> +	  otherwhise the libxml2 library will be used.
 Carsten> +
 Carsten> +endif # BR2_PACKAGE_LIBSVG

My idea was to simply automatically use the expat backend if
BR2_PACKAGE_EXPAT is enabled, and not have an explicit option for it, so
you can drop this suboption.
 Carsten> +++ b/package/libsvg/libsvg.mk
 Carsten> @@ -0,0 +1,23 @@
 Carsten> +################################################################################
 Carsten> +#
 Carsten> +# libsvg
 Carsten> +#
 Carsten> +################################################################################
 Carsten> +
 Carsten> +LIBSVG_VERSION         = 0.1.4
 Carsten> +LIBSVG_SITE            = http://cairographics.org/snapshots/
 Carsten> +LIBSVG_DEPENDENCIES    = host-pkgconf libpng libjpeg

Ohh? You didn't have libpng/libjpeg as dependencies in v1? Are they
needed? If so, you need to select them in Config.in as well.

 Carsten> +LIBSVG_INSTALL_STAGING = YES
 Carsten> +LIBSVG_LICENSE         = LGPLv2+
 Carsten> +LIBSVG_LICENSE_FILES   = COPYING
 Carsten> +
 Carsten> +# libsvg needs at last a XML parser
 Carsten> +ifeq ($(BR2_PACKAGE_LIBSVG_EXPAT),y)

This then becomes:

ifeq ($(BR2_PACKAGE_EXPAT),y)

 Carsten> +LIBSVG_CONF_OPT += --with-expat
 Carsten> +LIBSVG_DEPENDENCIES += expat
 Carsten> +else ifeq ($(BR2_PACKAGE_LIBXML2),y)
 Carsten> +LIBSVG_CONF_OPT += --with-libxml2
 Carsten> +LIBSVG_DEPENDENCIES += libxml2
 Carsten> +endif
 Carsten> +
 Carsten> +$(eval $(autotools-package))
 Carsten> -- 
 Carsten> 1.7.10.4

-- 
Bye, Peter Korsgaard
