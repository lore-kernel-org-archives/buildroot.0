From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:36 +0100
Subject: [Buildroot] [PATCH v6 14/28] package/qt5webengine: Convert to qmake
 infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-15-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mostly straightforward conversion but keeping custom config/build env
to apply the python2 workaround.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5webengine/qt5webengine.mk | 47 +++---------------------
 1 file changed, 6 insertions(+), 41 deletions(-)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 1d5ee8d819..798b777df0 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -30,16 +30,16 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
 endif
 
-QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_system_ffmpeg
+QT5WEBENGINE_CONF_OPTS += WEBENGINE_CONFIG+=use_system_ffmpeg
 
 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
-QT5WEBENGINE_QMAKEFLAGS += WEBENGINE_CONFIG+=use_proprietary_codecs
+QT5WEBENGINE_CONF_OPTS += WEBENGINE_CONFIG+=use_proprietary_codecs
 endif
 
 ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
 QT5WEBENGINE_DEPENDENCIES += alsa-lib
 else
-QT5WEBENGINE_QMAKEFLAGS += QT_CONFIG-=alsa
+QT5WEBENGINE_CONF_OPTS += QT_CONFIG-=alsa
 endif
 
 # QtWebengine's build system uses python, but only supports python2. We work
@@ -63,42 +63,7 @@ QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
 QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
 endif
 
-define QT5WEBENGINE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
-endef
-
-define QT5WEBENGINE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBENGINE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(MAKE) -C $(@D) install
-endef
-
-define QT5WEBENGINE_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebEngine $(TARGET_DIR)/usr/qml/
-endef
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5WEBENGINE_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webengine* $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifneq ($(BR2_STATIC_LIBS),y)
-define QT5WEBENGINE_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebEngine*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/libexec/QtWebEngineProcess $(TARGET_DIR)/usr/libexec/
-	cp -dpfr $(STAGING_DIR)/usr/resources/ $(TARGET_DIR)/usr/
-	mkdir -p $(TARGET_DIR)/usr/translations/qtwebengine_locales/
-	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/qtwebengine_locales/
-endef
-endif
-
-define QT5WEBENGINE_INSTALL_TARGET_CMDS
-	$(QT5WEBENGINE_INSTALL_TARGET_LIBS)
-	$(QT5WEBENGINE_INSTALL_TARGET_QMLS)
-	$(QT5WEBENGINE_INSTALL_TARGET_EXAMPLES)
-endef
+QT5WEBENGINE_CONF_ENV = $(QT5WEBENGINE_ENV)
+QT5WEBENGINE_MAKE_ENV = $(QT5WEBENGINE_ENV)
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.25.0
