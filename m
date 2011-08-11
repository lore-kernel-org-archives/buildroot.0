From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Thu, 11 Aug 2011 22:18:08 +0200
Subject: [Buildroot] Trying to package imlib2
In-Reply-To: <1313091113.731.6.camel@matias-lnx-host>
References: <20110811203541.3b238665@gmail.com>
 <1313091113.731.6.camel@matias-lnx-host>
Message-ID: <20110811221808.51b334d7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matias


Le Thu, 11 Aug 2011 15:31:53 -0400,
Matias Garcia <mgarcia@rossvideo.com> a ?crit :

> Hi Frederic,
> 
> On Thu, 2011-08-11 at 20:35 +0200, Frederic Bassaler wrote:
> > I'm trying to package the imlib2, which I need as a dependency for
> > wbar (a small dock app launcher for X)
> > 
> > here's my imlib2.mk :
> > 
> > 
> > #############################################################
> > #
> > # IMLIB2
> > #
> > #############################################################
> > IMLIB2_VERSION = 1.4.4
> > IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
> > IMLIB2_SITE =
> > http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
> > IMLIB2_INSTALL_STAGING = YES IMLIB2_INSTALL_TARGET = YES
> > IMLIB2_DEPENDENCIES = host-pkg-config xlib_libX11 libpng jpeg
> > freetype
> > 
> > $(eval $(call AUTOTARGETS,package,imlib2))
> > 
> 
> I'm no seasoned packager and I'm compiling it without X support, but
> on a cursory glance I notice some missing dependencies (freetype at
> least). The packaging may be slightly out of date, but here's my
> imlib2 makefile which builds and runs with uclibc or eglibc for
> comparison:
> 
> #############################################################
> #
> # imlib2
> #
> #############################################################
> 
> IMLIB2_MAJOR = 1.4.4
> IMLIB2_VERSION = $(IMLIB2_MAJOR)
> IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.gz
> IMLIB2_SITE = http://nanobuild/rossbuild/tftpboot/amazon
> IMLIB2_INSTALL_STAGING = YES
> IMLIB2_AUTORECONF = YES
> 
> IMLIB2_CONF_OPT = --program-transform-name='s,,,' \
> 		--without-x \
> 		--without-id3
> 
> ifeq ($(BR2_PACKAGE_FREETYPE),y)
> IMLIB2_CONF_OPT += --with-freetype-config=
> $(STAGING_DIR)/usr/bin/freetype-config
> IMLIB2_DEPENDENCIES += freetype
> else
> IMLIB2_CONF_OPT += --without-freetype
> endif
> 
> ifeq ($(BR2_PACKAGE_JPEG),y)
> IMLIB2_CONF_OPT += --with-jpeg
> IMLIB2_DEPENDENCIES += jpeg
> else
> IMLIB2_CONF_OPT += --without-jpeg
> endif
> 
> ifeq ($(BR2_PACKAGE_LIBPNG),y)
> IMLIB2_CONF_OPT += --with-png
> IMLIB2_DEPENDENCIES += libpng
> else
> IMLIB2_CONF_OPT += --without-png
> endif
> 
> ifeq ($(BR2_PACKAGE_TIFF),y)
> IMLIB2_CONF_OPT += --with-tiff
> IMLIB2_DEPENDENCIES += tiff
> else
> IMLIB2_CONF_OPT += --without-tiff
> endif
> 
> $(eval $(call AUTOTARGETS,package,imlib2))
> 
> > ...
> > 
> > 
> > If a seasoned packager could help :)
> > Thanks!
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


Your .mk file helped a lot!

I adapted it like, this to compile with X :

#############################################################
#
# IMLIB2
#
#############################################################
IMLIB2_VERSION = 1.4.4
IMLIB2_SOURCE = imlib2-$(IMLIB2_VERSION).tar.bz2
IMLIB2_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/project/enlightenment/imlib2-src/$(IMLIB2_VERSION)/
IMLIB2_INSTALL_STAGING = YES IMLIB2_AUTORECONF = YES
IMLIB2_DEPENDENCIES = host-pkg-config

ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
IMLIB2_CONF_OPT += --with-x
IMLIB2_DEPENDENCIES += xlib_libX11
else
IMLIB2_CONF_OPT += --without-x
endif

ifeq ($(BR2_PACKAGE_FREETYPE),y)
IMLIB2_CONF_OPT +=
--with-freetype-config=$(STAGING_DIR)/usr/bin/freetype-config
IMLIB2_DEPENDENCIES += freetype else
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

--------------------------------------------------

And it builds further, then there's a different
error :

...
Making all in modules
make[4]: entrant dans le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4/src/modules ? Making
all in loaders make[5]: entrant dans le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4/src/modules/loaders ?
CC     png_la-loader_png.lo CC     jpeg_la-loader_jpeg.lo
loader_png.c: In function 'load':
loader_png.c:61: error: dereferencing pointer to incomplete type
loader_png.c: In function 'save':
loader_png.c:268: error: dereferencing pointer to incomplete type
loader_png.c:280: error: dereferencing pointer to incomplete type
loader_png.c:289: error: dereferencing pointer to incomplete type
loader_png.c:300: error: dereferencing pointer to incomplete type
make[5]: *** [png_la-loader_png.lo] Erreur 1
make[5]: *** Attente des t?ches non termin?es....
make[5]: quittant le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4/src/modules/loaders ?
make[4]: *** [all-recursive] Erreur 1 make[4]: quittant le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4/src/modules ? make[3]:
*** [all-recursive] Erreur 1 make[3]: quittant le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4/src ? make[2]: ***
[all-recursive] Erreur 1 make[2]: quittant le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4 ? make[1]: *** [all]
Erreur 2 make[1]: quittant le r?pertoire
? /home/fred/buildroot/output/build/imlib2-1.4.4 ? make: ***
[/home/fred/buildroot/output/build/imlib2-1.4.4/.stamp_built] Erreur 2



Maybe something is still missing?
