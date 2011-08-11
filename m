From: Matias Garcia <mgarcia@rossvideo.com>
Date: Thu, 11 Aug 2011 15:31:53 -0400
Subject: [Buildroot] Trying to package imlib2
In-Reply-To: <20110811203541.3b238665@gmail.com>
References: <20110811203541.3b238665@gmail.com>
Message-ID: <1313091113.731.6.camel@matias-lnx-host>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frederic,

On Thu, 2011-08-11 at 20:35 +0200, Frederic Bassaler wrote:
> I'm trying to package the imlib2, which I need as a dependency for wbar
> (a small dock app launcher for X)
> 
> here's my imlib2.mk :
> 
> 
> #############################################################
> #
> # IMLIB2
> #
> #############################################################
> IMLIB2_VERSION = 1.4.4
> IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
> IMLIB2_SITE =
> http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
> IMLIB2_INSTALL_STAGING = YES IMLIB2_INSTALL_TARGET = YES
> IMLIB2_DEPENDENCIES = host-pkg-config xlib_libX11 libpng jpeg freetype
> 
> $(eval $(call AUTOTARGETS,package,imlib2))
> 

I'm no seasoned packager and I'm compiling it without X support, but on
a cursory glance I notice some missing dependencies (freetype at least).
The packaging may be slightly out of date, but here's my imlib2 makefile
which builds and runs with uclibc or eglibc for comparison:

#############################################################
#
# imlib2
#
#############################################################

IMLIB2_MAJOR = 1.4.4
IMLIB2_VERSION = $(IMLIB2_MAJOR)
IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.gz
IMLIB2_SITE = http://nanobuild/rossbuild/tftpboot/amazon
IMLIB2_INSTALL_STAGING = YES
IMLIB2_AUTORECONF = YES

IMLIB2_CONF_OPT = --program-transform-name='s,,,' \
		--without-x \
		--without-id3

ifeq ($(BR2_PACKAGE_FREETYPE),y)
IMLIB2_CONF_OPT += --with-freetype-config=
$(STAGING_DIR)/usr/bin/freetype-config
IMLIB2_DEPENDENCIES += freetype
else
IMLIB2_CONF_OPT += --without-freetype
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
IMLIB2_CONF_OPT += --with-jpeg
IMLIB2_DEPENDENCIES += jpeg
else
IMLIB2_CONF_OPT += --without-jpeg
endif

ifeq ($(BR2_PACKAGE_LIBPNG),y)
IMLIB2_CONF_OPT += --with-png
IMLIB2_DEPENDENCIES += libpng
else
IMLIB2_CONF_OPT += --without-png
endif

ifeq ($(BR2_PACKAGE_TIFF),y)
IMLIB2_CONF_OPT += --with-tiff
IMLIB2_DEPENDENCIES += tiff
else
IMLIB2_CONF_OPT += --without-tiff
endif

$(eval $(call AUTOTARGETS,package,imlib2))

> ...
> 
> 
> If a seasoned packager could help :)
> Thanks!
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
