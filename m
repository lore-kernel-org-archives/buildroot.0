From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 10 Dec 2011 20:49:30 +0100
Subject: [Buildroot] [PATCH v6 1/3] New package: ImLib2
In-Reply-To: <1318840867-20976-2-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Mon, 17 Oct 2011 10:41:05
 +0200")
References: <1318840867-20976-1-git-send-email-yegorslists@googlemail.com>
 <1318840867-20976-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <87aa70ky0l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 yegorslists> From: Yegor Yefremov <yegorslists@googlemail.com>
 yegorslists> Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
 yegorslists> Signed-off-by: Matias Garcia <mgarcia@rossvideo.com>
 yegorslists> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed with minor tweaks (see below), thanks.

 yegorslists> +++ b/package/imlib2/Config.in
 yegorslists> @@ -0,0 +1,37 @@
 yegorslists> +config BR2_PACKAGE_IMLIB2
 yegorslists> +	bool "imlib2"
 yegorslists> +	select BR2_PACKAGE_FREETYPE
 yegorslists> +	help
 yegorslists> +	  Imlib 2 is the successor to Imlib. This library provides
 yegorslists> +	  routines to load, save and render images in various formats.
 yegorslists> +
 yegorslists> +	  http://freshmeat.net/projects/imlib2/
 yegorslists> +
 yegorslists> +if BR2_PACKAGE_IMLIB2
 yegorslists> +
 yegorslists> +config BR2_PACKAGE_IMLIB2_JPEG
 yegorslists> +	select BR2_PACKAGE_JPEG
 yegorslists> +	bool "JPEG support"

Nit: We normally have the 'bool "blah"' as the first line after the
config line.

 yegorslists> +config BR2_PACKAGE_IMLIB2_X
 yegorslists> +	depends on BR2_PACKAGE_XORG7
 yegorslists> +	select BR2_PACKAGE_XLIB_LIBXEXT
 yegorslists> +	select BR2_PACKAGE_XLIB_LIBX11
 yegorslists> +	bool "X support"

Most people using imlib2 and X probably want to enable this, so I made
it 'default y'

 yegorslists> +++ b/package/imlib2/imlib2.mk
 yegorslists> @@ -0,0 +1,54 @@
 yegorslists> +#############################################################
 yegorslists> +#
 yegorslists> +## IMLIB2
 yegorslists> +#
 yegorslists> +##############################################################
 yegorslists> +IMLIB2_VERSION = 1.4.5
 yegorslists> +IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
 yegorslists> +IMLIB2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
 yegorslists> +IMLIB2_INSTALL_STAGING = YES
 yegorslists> +IMLIB2_DEPENDENCIES = host-pkg-config freetype
 yegorslists> +IMLIB2_CONF_OPT = --with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
 yegorslists> +
 yegorslists> +ifeq ($(BR2_PACKAGE_IMLIB2_X),y)
 yegorslists> +	IMLIB2_CONF_OPT += --with-x
 yegorslists> +	IMLIB2_DEPENDENCIES += xlib_libX11 xlib_libXext
 yegorslists> +endif

You forgot the else .. --without-x part.

-- 
Bye, Peter Korsgaard
