From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 27 Jun 2016 20:38:12 +0200
Subject: [Buildroot] [PATCH 1/1] qt5wayland: new package
In-Reply-To: <20160601033811.6031-3-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160601033811.6031-1-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160601033811.6031-3-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160627203812.4d1d6148@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Akihiko,

thanks for patch submission, some comments below...

On Wed,  1 Jun 2016 12:38:10 +0900, Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp> wrote:

> Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
> ---
>  package/qt5/Config.in                  |  1 +
>  package/qt5/qt5base/Config.in          |  3 ++-
>  package/qt5/qt5base/qt5base.mk         |  4 ++++
>  package/qt5/qt5wayland/Config.in       | 16 ++++++++++++++++
>  package/qt5/qt5wayland/qt5wayland.hash |  4 ++++
>  package/qt5/qt5wayland/qt5wayland.mk   | 34 ++++++++++++++++++++++++++++++++++
>  6 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 package/qt5/qt5wayland/Config.in
>  create mode 100644 package/qt5/qt5wayland/qt5wayland.hash
>  create mode 100644 package/qt5/qt5wayland/qt5wayland.mk
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 84cbb0f..b18c135 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -48,6 +48,7 @@ source "package/qt5/qt5svg/Config.in"
>  source "package/qt5/qt5tools/Config.in"
>  source "package/qt5/qt5webchannel/Config.in"
>  source "package/qt5/qt5websockets/Config.in"
> +source "package/qt5/qt5wayland/Config.in"
>  source "package/qt5/qt5x11extras/Config.in"
>  source "package/qt5/qt5xmlpatterns/Config.in"
>  comment "technology preview"
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index 64a7f65..2b8e278 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -122,7 +122,8 @@ config BR2_PACKAGE_QT5BASE_GUI
>  	select BR2_PACKAGE_QT5BASE_LINUXFB if \
>  	       !BR2_PACKAGE_QT5BASE_DIRECTFB && \
>  	       !BR2_PACKAGE_QT5BASE_XCB && \
> -	       !BR2_PACKAGE_QT5BASE_EGLFS
> +	       !BR2_PACKAGE_QT5BASE_EGLFS && \
> +	       !BR2_PACKAGE_QT5WAYLAND
>  	help
>  	  This option enables the Qt5Gui library.
>  
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 9ff7af1..dcc4967 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -118,6 +118,10 @@ else
>  QT5BASE_CONFIGURE_OPTS += -no-eglfs
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT5WAYLAND),y)
> +QT5BASE_CONFIGURE_OPTS += -no-qpa-platform-guard
> +endif
> +
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
>  
> diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
> new file mode 100644
> index 0000000..acfff15
> --- /dev/null
> +++ b/package/qt5/qt5wayland/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_QT5WAYLAND
> +	bool "qt5wayland"
> +	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5DECLARATIVE
> +	select BR2_PACKAGE_QT5JSBACKEND

BR2_PACKAGE_QT5JSBACKEND was remove move Buildroot (in 2013?), please remove this line...

> +	select BR2_PACKAGE_LIBXKBCOMMON
> +	select BR2_PACKAGE_XKEYBOARD_CONFIG

First compile try (for imx6) bailed out with an error about missing 'wayland-egl', fixed
by adding:

	depends on BR2_PACKAGE_MESA3D # provides wayland-egl

> +	depends on BR2_PACKAGE_WAYLAND
> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE

This dependency is from qt5declarative?
Please change to:
	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative

> +	help
> +	  Qt is a cross-platform application and UI framework for
> +	  developers using C++.
> +
> +	  This package corresponds to the qt5wayland module.
> +
> +	  http://qt.io

Comment section missing, e.g.:

+
+comment "qt5wayland needs mesa3d and wayland"
+       depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
+       depends on !BR2_PACKAGE_MESA3D || !BR2_PACKAGE_WAYLAND



> diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
> new file mode 100644
> index 0000000..297a208
> --- /dev/null
> +++ b/package/qt5/qt5wayland/qt5wayland.hash
> @@ -0,0 +1,4 @@
> +# Hashes from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtwayland-opensource-src-5.6.0.tar.xz.mirrorlist
> +sha256 b55d0142f245c927970031ef908e98cb20f1d7a2a5441647ed937252fed3bfcc qtwayland-opensource-src-5.6.0.tar.xz
> +sha1   db3fc8bfa78f808d060e6ce5d79ae4a94e280b33                         qtwayland-opensource-src-5.6.0.tar.xz
> +md5    9dbfb0278eb0891e50b136d8b6eaa62b                                 qtwayland-opensource-src-5.6.0.tar.xz

One (the strongest) hash is enough, just keep sha256 and remove sha1/md5...

> diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
> new file mode 100644
> index 0000000..be6cf8f
> --- /dev/null
> +++ b/package/qt5/qt5wayland/qt5wayland.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# qt5wayland
> +#
> +################################################################################
> +
> +QT5WAYLAND_VERSION = $(QT5_VERSION)
> +QT5WAYLAND_SITE = $(QT5_SITE)
> +QT5WAYLAND_SOURCE = qtwayland-opensource-src-$(QT5WAYLAND_VERSION).tar.xz
> +QT5WAYLAND_DEPENDENCIES = qt5base qt5declarative wayland libxkbcommon xkeyboard-config
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
> +QT5WAYLAND_DEPENDENCIES += libegl
> +endif
> +QT5WAYLAND_INSTALL_STAGING = YES
> +
> +define QT5WAYLAND_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
> +endef
> +
> +define QT5WAYLAND_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define QT5WAYLAND_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install

Please add

	$(QT5_LA_PRL_FILES_FIXUP)

as all the other qt5 packages do...

> +endef
> +

Same for:

ifeq ($(BR2_STATIC_LIBS),)
> +define QT5WAYLAND_INSTALL_TARGET_CMDS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland-*-client $(TARGET_DIR)/usr/lib/qt/plugins
> +	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland-*.so $(TARGET_DIR)/usr/lib/qt/plugins/platforms
> +endef
endif

> +
> +$(eval $(generic-package))

Only compile tested the package (yet), because weston did not start up without
errors on my test system...

Regards,
Peter
