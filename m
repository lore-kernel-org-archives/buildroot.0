From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jun 2016 22:10:18 +0200
Subject: [Buildroot] [PATCH 1/1] qt5wayland: new package
In-Reply-To: <20160627203812.4d1d6148@gmx.net>
References: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160601033811.6031-3-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160627203812.4d1d6148@gmx.net>
Message-ID: <20160627201018.GA3714@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Akihiko

On 2016-06-27 20:38 +0200, Peter Seiderer spake thusly:
> thanks for patch submission, some comments below...

Peter, I think Akihiko sent a new version of this package:

    http://lists.busybox.net/pipermail/buildroot/2016-June/165271.html
    https://patchwork.ozlabs.org/patch/640632/

I'll redirect my review to that newer version. Still, I have a comment
below on your own review...

> On Wed,  1 Jun 2016 12:38:10 +0900, Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp> wrote:
> > Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
> > ---
[--SNIP--]
> > diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
> > new file mode 100644
> > index 0000000..acfff15
> > --- /dev/null
> > +++ b/package/qt5/qt5wayland/Config.in
> > @@ -0,0 +1,16 @@
> > +config BR2_PACKAGE_QT5WAYLAND
> > +	bool "qt5wayland"
> > +	select BR2_PACKAGE_QT5BASE
> > +	select BR2_PACKAGE_QT5DECLARATIVE
> > +	select BR2_PACKAGE_QT5JSBACKEND
> 
> BR2_PACKAGE_QT5JSBACKEND was remove move Buildroot (in 2013?), please remove this line...

It's been removed in ecf4dff (qt5: remove qt5jsbackend package), in
December 2013.

Akihiko, please base your patches on the latest master of Buildroot.

> > +	select BR2_PACKAGE_LIBXKBCOMMON
> > +	select BR2_PACKAGE_XKEYBOARD_CONFIG
> 
> First compile try (for imx6) bailed out with an error about missing 'wayland-egl', fixed
> by adding:
> 
> 	depends on BR2_PACKAGE_MESA3D # provides wayland-egl

Actually, this is no entirely right. It;s not wrong per-se, but there
are other EGL providers that provide wayland-egl.

For example, the nvidia-driver is supposed to provide it (I yet have to
update this package to the latest release; the version we have in
Buildroot is too old to provide wayland-egl).

Furthermore, quite a few proprietary EGL implementations may provide it
as well.

One thing that is right in Peter's comment is that the dependencies is
not correct. At the very least, qt5wayland should probably:

    depends on BR2_PACKAGE_HAS_LIBGLES

Yet, this is clearly not enough, as Peter said. We need a libgles (and
libegl) implementation that also provide wayland-egl.

Unfortunately, we do not have such a thing in Buildroot.

I would suggest that we add a new virtual package, BR2_PACKAGE_HAS_WAYLAND_EGL
which providers can select. So far, mesa3d is our only provider, but in
the future we may (will) have others.

After that new virtual package is added, we can add qt5wayland that
depend on it.

> > +	depends on BR2_PACKAGE_WAYLAND
> > +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> 
> This dependency is from qt5declarative?
> Please change to:
> 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
> 
> > +	help
> > +	  Qt is a cross-platform application and UI framework for
> > +	  developers using C++.
> > +
> > +	  This package corresponds to the qt5wayland module.
> > +
> > +	  http://qt.io
> 
> Comment section missing, e.g.:
> 
> +
> +comment "qt5wayland needs mesa3d and wayland"
> +       depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
> +       depends on !BR2_PACKAGE_MESA3D || !BR2_PACKAGE_WAYLAND
> 
> 
> 
> > diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
> > new file mode 100644
> > index 0000000..297a208
> > --- /dev/null
> > +++ b/package/qt5/qt5wayland/qt5wayland.hash
> > @@ -0,0 +1,4 @@
> > +# Hashes from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtwayland-opensource-src-5.6.0.tar.xz.mirrorlist
> > +sha256 b55d0142f245c927970031ef908e98cb20f1d7a2a5441647ed937252fed3bfcc qtwayland-opensource-src-5.6.0.tar.xz
> > +sha1   db3fc8bfa78f808d060e6ce5d79ae4a94e280b33                         qtwayland-opensource-src-5.6.0.tar.xz
> > +md5    9dbfb0278eb0891e50b136d8b6eaa62b                                 qtwayland-opensource-src-5.6.0.tar.xz
> 
> One (the strongest) hash is enough, just keep sha256 and remove sha1/md5...

It is better to add all hashes published by upstream, even for weak
hashes.

Only when upstream provides no hash do we only compute a strong ash
locally.

So what Akihiko did is correct.

Akihiko, other comments from Peter are good, so take them into account
before you resubmit. I'll further review your v2 now.

Regards,
Yann E. MORIN.

> > diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
> > new file mode 100644
> > index 0000000..be6cf8f
> > --- /dev/null
> > +++ b/package/qt5/qt5wayland/qt5wayland.mk
> > @@ -0,0 +1,34 @@
> > +################################################################################
> > +#
> > +# qt5wayland
> > +#
> > +################################################################################
> > +
> > +QT5WAYLAND_VERSION = $(QT5_VERSION)
> > +QT5WAYLAND_SITE = $(QT5_SITE)
> > +QT5WAYLAND_SOURCE = qtwayland-opensource-src-$(QT5WAYLAND_VERSION).tar.xz
> > +QT5WAYLAND_DEPENDENCIES = qt5base qt5declarative wayland libxkbcommon xkeyboard-config
> > +ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
> > +QT5WAYLAND_DEPENDENCIES += libegl
> > +endif
> > +QT5WAYLAND_INSTALL_STAGING = YES
> > +
> > +define QT5WAYLAND_CONFIGURE_CMDS
> > +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
> > +endef
> > +
> > +define QT5WAYLAND_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> > +endef
> > +
> > +define QT5WAYLAND_INSTALL_STAGING_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> 
> Please add
> 
> 	$(QT5_LA_PRL_FILES_FIXUP)
> 
> as all the other qt5 packages do...
> 
> > +endef
> > +
> 
> Same for:
> 
> ifeq ($(BR2_STATIC_LIBS),)
> > +define QT5WAYLAND_INSTALL_TARGET_CMDS
> > +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
> > +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland-*-client $(TARGET_DIR)/usr/lib/qt/plugins
> > +	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland-*.so $(TARGET_DIR)/usr/lib/qt/plugins/platforms
> > +endef
> endif
> 
> > +
> > +$(eval $(generic-package))
> 
> Only compile tested the package (yet), because weston did not start up without
> errors on my test system...
> 
> Regards,
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
