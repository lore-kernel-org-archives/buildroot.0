From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Mar 2019 00:43:14 +0100
Subject: [Buildroot] [PATCH v4 3/6] qt5: Convert packages to qmake infra
In-Reply-To: <20190322183904.22401-4-anaumann@ultratronik.de>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-4-anaumann@ultratronik.de>
Message-ID: <fdbdea0d-2526-0e5c-f7dc-4515d6bd0607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andreas,

 Such a huge patch is pretty difficult to review and commit in one shot...

 It would be a lot easier with one patch per package, because then we can apply
a few and leave the rest for another day.

On 22/03/2019 19:39, Andreas Naumann wrote:
> In most cases the configure, build, install-staging and install-target
> commands are replaced with the qmake-package generics. In some cases the
> custom environment/option variables are renamed to the generic name.

[snip]
> diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
> index a714fca9c9..22cbf3cb87 100644
> --- a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
> +++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
> @@ -11,13 +11,8 @@ QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
>  QT_WEBKIT_KIOSK_LICENSE = LGPL-3.0
>  QT_WEBKIT_KIOSK_LICENSE_FILES = doc/lgpl.html
>  
> -define QT_WEBKIT_KIOSK_CONFIGURE_CMDS
> -	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
> -endef
> -
> -define QT_WEBKIT_KIOSK_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> -endef
> +QT_WEBKIT_KIOSK_INSTALL_STAGING = NO

 This isn't needed, it's the default.

> +QT_WEBKIT_KIOSK_CONF_OPTS = PREFIX=/usr
>  
>  define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src -f Makefile.qt-webkit-kiosk \
> @@ -29,4 +24,4 @@ define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
>  		$(if $(BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS),install_sound)
>  endef
>  
> -$(eval $(generic-package))
> +$(eval $(qmake-package))
> diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
> index 48a931d60b..eeb1b3644c 100644
> --- a/package/qt5/qt53d/qt53d.mk
> +++ b/package/qt5/qt53d/qt53d.mk
> @@ -17,41 +17,4 @@ endif
>  QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
>  QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
>  
> -define QT53D_CONFIGURE_CMDS
> -	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
> -endef
> -
> -define QT53D_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> -endef
> -
> -define QT53D_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
> -	$(QT5_LA_PRL_FILES_FIXUP)
> -endef
> -
> -ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
> -define QT53D_INSTALL_TARGET_EXAMPLES
> -	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/qt3d $(TARGET_DIR)/usr/lib/qt/examples/

 So, how is the examples case handled now?

> -endef
> -endif
> -
> -ifeq ($(BR2_STATIC_LIBS),)
> -ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> -# Available since 5.9
> -define QT53D_INSTALL_TARGET_LATEST
> -	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geometryloaders $(TARGET_DIR)/usr/lib/qt/plugins
> -	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/renderplugins $(TARGET_DIR)/usr/lib/qt/plugins
> -endef
> -endif
> -define QT53D_INSTALL_TARGET_CMDS
> -	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
> -	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
> -	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
> -	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
> -	$(QT53D_INSTALL_TARGET_LATEST)
> -	$(QT53D_INSTALL_TARGET_EXAMPLES)
> -endef
> -endif
> -
> -$(eval $(generic-package))
> +$(eval $(qmake-package))

[snip]

 I didn't look at the rest yet.

 Regards,
 Arnout
