From: jonsmirl at gmail.com <jonsmirl@gmail.com>
Date: Fri, 5 Apr 2019 15:29:03 -0400
Subject: [Buildroot] [PATCH v2] libp11: Add new package for OpenSSL
 PKCS#11 engine
In-Reply-To: <1554487021.27243.30.camel@impinj.com>
References: <20181207181314.24051-1-tpiepho@impinj.com>
 <20190404214556.10f7ef0d@windsurf>
 <1554412249.27243.12.camel@impinj.com> <20190405094919.40f655c2@windsurf>
 <1554487021.27243.30.camel@impinj.com>
Message-ID: <CAKON4Ozg+dp1j5BwTOVemKmpL-e+Hmw9E+MPeM7n+drqaiV53g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I managed to get libp11 working with this makefile. The previous problems I
encountered were fixed by a full rebuild of my tree. I needed libp11
because we are using the ATECC608A for securely accessing with AWS IOT. It
also works with Google and Azure.
https://github.com/MicrochipTech/cryptoauthlib/wiki/PKCS11-Linux-Setup


################################################################################
#
# libp11
#
################################################################################

LIBP11_VERSION = 4fa36e3a04bfe2d0a7b0b8b6f25866dac2f6cc8b
LIBP11_SITE = $(call github,OpenSC,libp11,$(LIBP11_VERSION))
LIBP11_DEPENDENCIES = openssl
LIBP11_LICENSE = LGPLv2.1
LIBP11_LICENSE_FILES = COPYING
LIBP11_AUTORECONF = YES
LIBP11_INSTALL_STAGING = YES
LIBP11_INSTALL_TARGET = YES

LIBP11_CONF_OPTS += --with-enginesdir=/usr/lib/engines-1.1
ifeq ($(BR2_PACKAGE_P11_KIT),y)
LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
endif

define LIBP11_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(@D)/src/.libs/libp11.so $(TARGET_DIR)/usr/lib
$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/engines-1.1
$(INSTALL) -D -m 0666 $(@D)/src/.libs/pkcs11.so
$(TARGET_DIR)/usr/lib/engines-1.1
endef

$(eval $(autotools-package))

################################################################################
#
# cryptoauthlib
#
################################################################################

CRYPTOAUTHLIB_VERSION = 21f9f26f3dae7194177f8be1b38bf8081616cd61
CRYPTOAUTHLIB_SITE = $(call
github,MicrochipTech,cryptoauthlib,$(CRYPTOAUTHLIB_VERSION))
CRYPTOAUTHLIB_LICENSE = LGPL-2.1
CRYPTOAUTHLIB_DEPENDENCIES = libp11 udev
CRYPTOAUTHLIB_CONF_OPTS += -DATCA_HAL_I2C=ON -DATCA_PRINTF=ON
-DCMAKE_BUILD_TYPE=DEBUG -DATCA_HAL_KIT_HID=OFF
CRYPTOAUTHLIB_INSTALL_TARGET = YES

define CRYPTOAUTHLIB_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(@D)/lib/libcryptoauth.so* $(TARGET_DIR)/usr/lib
$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/cryptoauthlib
$(INSTALL) -D -m 0666 $(@D)/cryptoauthlib.conf
$(TARGET_DIR)/etc/cryptoauthlib
$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/lib/cryptoauthlib
$(INSTALL) -D -m 0666 $(@D)/app/pkcs11/slot.conf.tmpl
$(TARGET_DIR)/var/lib/cryptoauthlib
endef

$(eval $(cmake-package))


On Fri, Apr 5, 2019 at 1:57 PM Trent Piepho <tpiepho@impinj.com> wrote:

> On Fri, 2019-04-05 at 09:49 +0200, Thomas Petazzoni wrote:
> > On Thu, 4 Apr 2019 21:10:50 +0000
> > Trent Piepho <tpiepho@impinj.com> wrote:
> > Then, even with this fixed, the package didn't build because it was
> > > > installing its OpenSSL modules in the wrong folder, as pkg-config
> > > > --variable enginesdir libcrypto returned a bogus value. I fixed that
> by
> > > > passing --with-enginesdir.
> > >
> > > This is interesting, as when I made this patch for an older buildroot,
> > > pkgconfig would return the correct value.  It was not prefixed with the
> > > stage.  This is a new behavior.
> > >
> > > And it looks like this already hit a bunch of packages with things like
> > > the x11 app-defaults dir.  Since "libdir" is in the whitelist of paths
> > > to prefix, it also hits enginesdir since the latter is based on libdir.
> > >
> > > Maybe that pkg-config whitelist should not affect variables that use
> > > libdir and only prefix libdir itself?
> >
> > We have bumped pkg-config not long ago, and indeed its behavior
> > changed. When you have something like this:
> >
> > prefix=/usr
> > libdir=${prefix}/lib
> > enginesdir=${libdir}/engines
>
> I suppose another fix would be to patch the libcrypto pc file to use
> ${prefix}/lib/engines.  If there were more consumers of enginesdir,
> then perhaps better to fix it once at the source than in each user?
>
> > and "libdir" was part of the special list of variables that we want to
> > prefix with the sysroot, then the old pkg-config would return libdir
> > prefixed with the sysroot, but not enginesdir.
>
> I assume there are packages which install libraries to the stage in
> sub-directories based on libdir, and this new pkg-config behavior is
> better for those cases, while worse for cases like enginesdir.
>
> Maybe some kind of run time control of pkg-config would allow it to
> work better?  For instance, an environment variable with some kind of
> white/black list of variables to prefix.  Default value would prefix
> libdir, etc.  But it could be tweaked on by intfras and/or packages.
> Kind of like:
>
> LIBP11_PKGCONFIG_NOT_STAGE_VARS = enginesdir
>
> Maybe the plumbing costs of this aren't worth making a few packages
> simpler.
>
> > Overall, the issue is that there is no concept in pkg-config for "the
> > value of this variable is going to be used at build time" vs "the
> > value of this variable is going to be used at run time".
>
> Shame.  Maybe buildroot should create a new build system, to replace
> autotools, cmake, and meson, that knows about all the issues of cross
> building?  Yes, huge project.  Need macos and windows support.  But
> think of how much easier buildroot would be if you didn't have to fight
> autotools and cmake!
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Jon Smirl
jonsmirl at gmail.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190405/da160ad8/attachment.html>
