From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:36:36 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5virtualkeyboard: convert to
 qmake infrastructure
Message-ID: <20200311213449.57514909E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=170777f342467bf932e48c1946477f913e8c0dff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems the old method was missing some files from the install
step since after the conversion the following additional files
appear in target after a build with all config options selected:

usr/lib/qt/plugins/lipi_toolkit/libactivedtw.so
usr/lib/qt/plugins/lipi_toolkit/libboxfld.so
usr/lib/qt/plugins/lipi_toolkit/libl7.so
usr/lib/qt/plugins/lipi_toolkit/liblipiengine.so
usr/lib/qt/plugins/lipi_toolkit/liblogger.so
usr/lib/qt/plugins/lipi_toolkit/libneuralnet.so
usr/lib/qt/plugins/lipi_toolkit/libnn.so
usr/lib/qt/plugins/lipi_toolkit/libnpen.so
usr/lib/qt/plugins/lipi_toolkit/libpointfloat.so
usr/lib/qt/plugins/lipi_toolkit/libpreproc.so
usr/lib/qt/plugins/lipi_toolkit/libsubstroke.so
usr/lib/qt/plugins/virtualkeyboard/libqtvirtualkeyboard_lipi.so

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 54 ++--------------------
 1 file changed, 4 insertions(+), 50 deletions(-)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 3823b8e017..3984c9866e 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -7,7 +7,7 @@
 QT5VIRTUALKEYBOARD_VERSION = $(QT5_VERSION)
 QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)
 QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5VIRTUALKEYBOARD_VERSION).tar.xz
-QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5base qt5declarative qt5svg
+QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5declarative qt5svg
 QT5VIRTUALKEYBOARD_INSTALL_STAGING = YES
 
 QT5VIRTUALKEYBOARD_LICENSE = GPL-3.0
@@ -34,59 +34,13 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING),y)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=handwriting
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+=handwriting
 QT5VIRTUALKEYBOARD_LICENSE += , MIT (lipi-toolkit)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
 endif
 
 ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION),y)
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=arrow-key-navigation
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+=arrow-key-navigation
 endif
 
-ifeq ($(QT5VIRTUALKEYBOARD_3RDPARTY_PARTS),YES)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS
-	cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr
-endef
-endif
-
-define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5VIRTUALKEYBOARD_QMAKEFLAGS))
-endef
-
-define QT5VIRTUALKEYBOARD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
-	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/
-endef
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/virtualkeyboard $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5VirtualKeyboard*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so \
-		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS)
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML)
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS)
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
