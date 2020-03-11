From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:59:35 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5webengine: convert to qmake
 infrastructure
Message-ID: <20200311214717.AF67590A05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a96e52cb8b071c151d083bb9f37fd6801651a84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mostly straightforward conversion but keeping custom config/build env
to apply the python2 workaround.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webengine/qt5webengine.mk | 49 +++++---------------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 34573e2042..4abcf45964 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -7,7 +7,7 @@
 QT5WEBENGINE_VERSION = $(QT5_VERSION)
 QT5WEBENGINE_SITE = $(QT5_SITE)
 QT5WEBENGINE_SOURCE = qtwebengine-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBENGINE_VERSION).tar.xz
-QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp qt5base \
+QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp \
 	qt5declarative qt5webchannel host-bison host-flex host-gperf \
 	host-pkgconf host-python
 QT5WEBENGINE_INSTALL_STAGING = YES
@@ -25,16 +25,16 @@ endif
 
 QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
 
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
@@ -56,42 +56,7 @@ endef
 QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
 QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
 
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
-	mkdir -p $(TARGET_DIR)/usr/translations/
-	cp -dpfr $(STAGING_DIR)/usr/translations/qtwebengine_locales $(TARGET_DIR)/usr/translations/
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
