From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 21 Jan 2021 22:03:00 +0100
Subject: [Buildroot] [PATCH v1] package/qt5webengine: add optional
 host-freetype/host-libjpeg dependency
In-Reply-To: <20210119222234.29ac8a2a@windsurf.home>
References: <20201221203952.22168-1-ps.report@gmx.net>
 <20201221203952.22168-3-ps.report@gmx.net>
 <20201230111823.3114e2a6@windsurf>
 <20210119222234.29ac8a2a@windsurf.home>
Message-ID: <20210121220300.6858c020@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 19 Jan 2021 22:22:34 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
>
> On Wed, 30 Dec 2020 11:18:23 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > > +ifeq ($(BR2_PACKAGE_QT5BASE_FONTCONFIG),y)
> > > +QT5WEBENGINE_DEPENDENCIES += host-freetype
> > > +endif
> > > +
> > > +ifeq ($(BR2_PACKAGE_QT5BASE_JPEG),y)
> > > +QT5WEBENGINE_DEPENDENCIES += host-libjpeg
> > > +endif
> >
> > This looks really odd. Why would these target-related features require
> > host-freetype and host-libjpeg ? Aren't we instead seeing some
> > pkg-config issue where it's trying to find freetype/libjpeg for the
> > target, but it for some reason doesn't work, and tries to find them for
> > the host ?
>
> Do you have some further feedback on this issue ?

Did try to find out where the mismatch comes from...., but without success...

The best solution/hack so far is:

--- a/package/qt5/qt5webengine/host-pkg-config.in
+++ b/package/qt5/qt5webengine/host-pkg-config.in
@@ -2,5 +2,5 @@
 PKG_CONFIG_SYSROOT_DIR="/" \
 PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
-PKG_CONFIG_LIBDIR="@HOST_DIR@/lib/pkgconfig:@HOST_DIR@/share/pkgconfig" \
+PKG_CONFIG_LIBDIR="@HOST_DIR@/lib/pkgconfig:@HOST_DIR@/share/pkgconfig:@SYSROOT@/usr/lib/pkgconfig" \
 exec @HOST_DIR@/bin/pkgconf "$@"


--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -54,7 +54,7 @@ QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_PYTHON2_SYMLINK
 QT5WEBENGINE_ENV += NINJAFLAGS="-j$(PARALLEL_JOBS)"

 define QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
-	sed s%@HOST_DIR@%$(HOST_DIR)%g $(QT5WEBENGINE_PKGDIR)/host-pkg-config.in > $(@D)/host-bin/host-pkg-config
+	sed s%@HOST_DIR@%$(HOST_DIR)%g $(QT5WEBENGINE_PKGDIR)/host-pkg-config.in | sed s%@SYSROOT@%$(STAGING_DIR)%g > $(@D)/host-bin/host-pkg-config
 	chmod +x $(@D)/host-bin/host-pkg-config
 endef
 QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_CREATE_HOST_PKG_CONFIG

Regards,
Peter

>
> Thanks!
>
> Thomas
