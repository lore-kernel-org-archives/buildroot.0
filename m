From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 22:39:13 +0100
Subject: [Buildroot] [git commit] package/qt5: convert straightforward
 packages to qmake infra
Message-ID: <20200309215540.A6B88802A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1bdceb5d735aad5fbf32b35e3a7f573ecb727e20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This converts all qmake packages to the new infra for which no custom
environments, option or additional hooks are needed.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt53d/qt53d.mk                         | 34 +-----------
 package/qt5/qt5canvas3d/qt5canvas3d.mk             | 27 +---------
 package/qt5/qt5charts/qt5charts.mk                 | 41 +--------------
 package/qt5/qt5connectivity/qt5connectivity.mk     | 60 +---------------------
 package/qt5/qt5declarative/qt5declarative.mk       | 49 +-----------------
 package/qt5/qt5enginio/qt5enginio.mk               | 40 +--------------
 .../qt5/qt5graphicaleffects/qt5graphicaleffects.mk | 20 +-------
 package/qt5/qt5imageformats/qt5imageformats.mk     | 21 +-------
 package/qt5/qt5location/qt5location.mk             | 48 +----------------
 package/qt5/qt5multimedia/qt5multimedia.mk         | 38 +-------------
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   | 36 +------------
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk | 32 +-----------
 package/qt5/qt5script/qt5script.mk                 | 32 +-----------
 package/qt5/qt5scxml/qt5scxml.mk                   | 38 +-------------
 package/qt5/qt5sensors/qt5sensors.mk               | 40 +--------------
 package/qt5/qt5serialbus/qt5serialbus.mk           | 39 +-------------
 package/qt5/qt5serialport/qt5serialport.mk         | 32 +-----------
 package/qt5/qt5svg/qt5svg.mk                       | 40 +--------------
 package/qt5/qt5websockets/qt5websockets.mk         | 40 +--------------
 package/qt5/qt5webview/qt5webview.mk               | 41 +--------------
 package/qt5/qt5x11extras/qt5x11extras.mk           | 21 +-------
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk       | 32 +-----------
 22 files changed, 32 insertions(+), 769 deletions(-)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 1028dd6a65..f3eff9edf0 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -7,7 +7,7 @@
 QT53D_VERSION = $(QT5_VERSION)
 QT53D_SITE = $(QT5_SITE)
 QT53D_SOURCE = qt3d-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT53D_VERSION).tar.xz
-QT53D_DEPENDENCIES = qt5base qt5declarative
+QT53D_DEPENDENCIES = qt5declarative
 QT53D_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
@@ -17,34 +17,4 @@ endif
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
 
-define QT53D_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT53D_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT53D_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT53D_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/qt3d $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT53D_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geometryloaders $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/renderplugins $(TARGET_DIR)/usr/lib/qt/plugins
-	$(QT53D_INSTALL_TARGET_EXAMPLES)
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 2366afb352..532903b446 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -7,33 +7,10 @@
 QT5CANVAS3D_VERSION = $(QT5_VERSION)
 QT5CANVAS3D_SITE = $(QT5_SITE)
 QT5CANVAS3D_SOURCE = qtcanvas3d-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CANVAS3D_VERSION).tar.xz
-QT5CANVAS3D_DEPENDENCIES = qt5base qt5declarative
+QT5CANVAS3D_DEPENDENCIES = qt5declarative
 QT5CANVAS3D_INSTALL_STAGING = YES
 
 QT5CANVAS3D_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
 QT5CANVAS3D_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
 
-define QT5CANVAS3D_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5CANVAS3D_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5CANVAS3D_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5CANVAS3D_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/canvas3d $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5CANVAS3D_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtCanvas3D $(TARGET_DIR)/usr/qml/
-	$(QT5CANVAS3D_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index f7adcc1cd5..2c40ac1c89 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -7,7 +7,6 @@
 QT5CHARTS_VERSION = $(QT5_VERSION)
 QT5CHARTS_SITE = $(QT5_SITE)
 QT5CHARTS_SOURCE = qtcharts-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CHARTS_VERSION).tar.xz
-QT5CHARTS_DEPENDENCIES = qt5base
 QT5CHARTS_INSTALL_STAGING = YES
 
 QT5CHARTS_LICENSE = GPL-3.0
@@ -17,42 +16,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5CHARTS_DEPENDENCIES += qt5declarative
 endif
 
-define QT5CHARTS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5CHARTS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5CHARTS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5CHARTS_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Charts*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
-endef
-endif
-
-# this is only built with quick support enabled
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5CHARTS_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtCharts $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5CHARTS_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/charts* $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5CHARTS_INSTALL_TARGET_CMDS
-	$(QT5CHARTS_INSTALL_TARGET_LIBS)
-	$(QT5CHARTS_INSTALL_TARGET_QMLS)
-	$(QT5CHARTS_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index eb9f0141c3..6402b505bf 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -7,7 +7,6 @@
 QT5CONNECTIVITY_VERSION = $(QT5_VERSION)
 QT5CONNECTIVITY_SITE = $(QT5_SITE)
 QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5CONNECTIVITY_VERSION).tar.xz
-QT5CONNECTIVITY_DEPENDENCIES = qt5base
 QT5CONNECTIVITY_INSTALL_STAGING = YES
 
 QT5CONNECTIVITY_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
@@ -21,61 +20,4 @@ QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5DECLARATIVE),qt5declarativ
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_NEARD),neard)
 
-define QT5CONNECTIVITY_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5CONNECTIVITY_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5CONNECTIVITY_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-ifneq ($(BR2_PACKAGE_BLUEZ5_UTILS),)
-define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtBluetooth $(TARGET_DIR)/usr/qml/
-endef
-endif
-ifeq ($(BR2_PACKAGE_NEARD),y)
-define QT5CONNECTIVITY_INSTALL_TARGET_NFC_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtNfc $(TARGET_DIR)/usr/qml/
-endef
-endif
-endif
-
-ifneq ($(BR2_PACKAGE_BLUEZ5_UTILS),)
-define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Bluetooth.so.* $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/bin/sdpscanner $(TARGET_DIR)/usr/bin
-endef
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/bluetooth $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_NEARD),y)
-define QT5CONNECTIVITY_INSTALL_TARGET_NFC
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Nfc.so.* $(TARGET_DIR)/usr/lib
-endef
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5CONNECTIVITY_INSTALL_TARGET_NFC_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/nfc $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-endif
-
-define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
-	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC_QMLS)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_EXAMPLES)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index e9b86701bb..42024c4a13 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -7,55 +7,10 @@
 QT5DECLARATIVE_VERSION = $(QT5_VERSION)
 QT5DECLARATIVE_SITE = $(QT5_SITE)
 QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5DECLARATIVE_VERSION).tar.xz
-QT5DECLARATIVE_DEPENDENCIES = qt5base qt5xmlpatterns
+QT5DECLARATIVE_DEPENDENCIES = qt5xmlpatterns
 QT5DECLARATIVE_INSTALL_STAGING = YES
 
 QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 
-define QT5DECLARATIVE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5DECLARATIVE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5DECLARATIVE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5DECLARATIVE_INSTALL_TARGET_QUICK_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* $(TARGET_DIR)/usr/lib
-endef
-define QT5DECLARATIVE_INSTALL_TARGET_QUICK_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/quick/ $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5DECLARATIVE_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Qml*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/qml* $(TARGET_DIR)/usr/lib/qt/plugins
-	$(QT5DECLARATIVE_INSTALL_TARGET_QUICK_LIBS)
-endef
-
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5DECLARATIVE_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/qml* $(TARGET_DIR)/usr/lib/qt/examples/
-	$(QT5DECLARATIVE_INSTALL_TARGET_QUICK_EXAMPLES)
-endef
-endif
-
-define QT5DECLARATIVE_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/bin/qml* $(TARGET_DIR)/usr/bin
-	cp -dpfr $(STAGING_DIR)/usr/qml $(TARGET_DIR)/usr
-	$(QT5DECLARATIVE_INSTALL_TARGET_EXAMPLES)
-	$(QT5DECLARATIVE_INSTALL_TARGET_LIBS)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index ebd99e4cb7..a9572db28b 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -9,7 +9,7 @@
 QT5ENGINIO_VERSION = 1.6.3
 QT5ENGINIO_SITE = https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules
 QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
-QT5ENGINIO_DEPENDENCIES = openssl qt5base
+QT5ENGINIO_DEPENDENCIES = openssl
 QT5ENGINIO_INSTALL_STAGING = YES
 
 QT5ENGINIO_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
@@ -22,40 +22,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5ENGINIO_DEPENDENCIES += qt5declarative
 endif
 
-define QT5ENGINIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5ENGINIO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5ENGINIO_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5ENGINIO_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/Enginio $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5ENGINIO_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/enginio $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifneq ($(BR2_STATIC_LIBS),y)
-define QT5ENGINIO_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libEnginio.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-define QT5ENGINIO_INSTALL_TARGET_CMDS
-	$(QT5ENGINIO_INSTALL_TARGET_LIBS)
-	$(QT5ENGINIO_INSTALL_TARGET_QMLS)
-	$(QT5ENGINIO_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 2961c89fcb..a9ddff454e 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -7,26 +7,10 @@
 QT5GRAPHICALEFFECTS_VERSION = $(QT5_VERSION)
 QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)
 QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5GRAPHICALEFFECTS_VERSION).tar.xz
-QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5base qt5declarative
+QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5declarative
 QT5GRAPHICALEFFECTS_INSTALL_STAGING = YES
 
 QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 
-define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5GRAPHICALEFFECTS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5GRAPHICALEFFECTS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-define QT5GRAPHICALEFFECTS_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtGraphicalEffects $(TARGET_DIR)/usr/qml
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index b8e581c489..ffb094d566 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -7,28 +7,9 @@
 QT5IMAGEFORMATS_VERSION = $(QT5_VERSION)
 QT5IMAGEFORMATS_SITE = $(QT5_SITE)
 QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5IMAGEFORMATS_VERSION).tar.xz
-QT5IMAGEFORMATS_DEPENDENCIES = qt5base
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
 
 QT5IMAGEFORMATS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.GPL3-EXCEPT LICENSE.LGPLv3 LICENSE.FDL
 
-define QT5IMAGEFORMATS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5IMAGEFORMATS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5IMAGEFORMATS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5IMAGEFORMATS_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/*.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 5edb9170a6..ea741d0df6 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -7,7 +7,6 @@
 QT5LOCATION_VERSION = $(QT5_VERSION)
 QT5LOCATION_SITE = $(QT5_SITE)
 QT5LOCATION_SOURCE = qtlocation-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5LOCATION_VERSION).tar.xz
-QT5LOCATION_DEPENDENCIES = qt5base
 QT5LOCATION_INSTALL_STAGING = YES
 
 QT5LOCATION_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
@@ -17,49 +16,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5LOCATION_DEPENDENCIES += qt5declarative
 endif
 
-define QT5LOCATION_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5LOCATION_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5LOCATION_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5LOCATION_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtPositioning $(TARGET_DIR)/usr/qml/
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtLocation $(TARGET_DIR)/usr/qml/
-endef
-define QT5LOCATION_INSTALL_TARGET_LOCATION
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Location.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geoservices $(TARGET_DIR)/usr/lib/qt/plugins/
-endef
-define QT5LOCATION_INSTALL_TARGET_POSITION_QUICK
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5PositioningQuick.so.* $(TARGET_DIR)/usr/lib
-endef
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5LOCATION_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/location $(TARGET_DIR)/usr/lib/qt/examples/
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/positioning $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-endif
-
-define QT5LOCATION_INSTALL_TARGET_POSITION
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Positioning.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/position $(TARGET_DIR)/usr/lib/qt/plugins/
-endef
-
-define QT5LOCATION_INSTALL_TARGET_CMDS
-	$(QT5LOCATION_INSTALL_TARGET_POSITION)
-	$(QT5LOCATION_INSTALL_TARGET_POSITION_QUICK)
-	$(QT5LOCATION_INSTALL_TARGET_LOCATION)
-	$(QT5LOCATION_INSTALL_TARGET_QMLS)
-	$(QT5LOCATION_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 0e9a6b97c9..39eddc3afc 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -7,7 +7,6 @@
 QT5MULTIMEDIA_VERSION = $(QT5_VERSION)
 QT5MULTIMEDIA_SITE = $(QT5_SITE)
 QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5MULTIMEDIA_VERSION).tar.xz
-QT5MULTIMEDIA_DEPENDENCIES = qt5base
 QT5MULTIMEDIA_INSTALL_STAGING = YES
 
 QT5MULTIMEDIA_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
@@ -29,44 +28,9 @@ ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
 endif
 
-define QT5MULTIMEDIA_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5MULTIMEDIA_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Multimedia*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
-endef
-endif # !BR2_STATIC_LIBS
-
-# this is only built with quick/opengl support enabled
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5_GL_AVAILABLE),yy)
-define QT5MULTIMEDIA_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtMultimedia $(TARGET_DIR)/usr/qml/
-endef
-endif
-
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5MULTIMEDIA_LICENSE += , LGPL-2.1+ (examples/multimedia/spectrum/3rdparty/fftreal)
 QT5MULTIMEDIA_LICENSE_FILES += examples/multimedia/spectrum/3rdparty/fftreal/license.txt
-define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
-endef
 endif
 
-define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
-	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
-	$(QT5MULTIMEDIA_INSTALL_TARGET_QMLS)
-	$(QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index a3b3a3f64a..1ac8689d6e 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -7,42 +7,10 @@
 QT5QUICKCONTROLS_VERSION = $(QT5_VERSION)
 QT5QUICKCONTROLS_SITE = $(QT5_SITE)
 QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5QUICKCONTROLS_VERSION).tar.xz
-QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
+QT5QUICKCONTROLS_DEPENDENCIES = qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
 QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.LGPL3 LICENSE.FDL
 
-define QT5QUICKCONTROLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5QUICKCONTROLS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5QUICKCONTROLS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5QUICKCONTROLS_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/quickcontrols $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5BASE_WIDGETS),yy)
-define QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets $(TARGET_DIR)/usr/qml/QtQuick
-endef
-endif
-
-define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
-	$(QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS)
-	$(QT5QUICKCONTROLS_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index 632bc47205..2f6dcd1f2f 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -7,38 +7,10 @@
 QT5QUICKCONTROLS2_VERSION = $(QT5_VERSION)
 QT5QUICKCONTROLS2_SITE = $(QT5_SITE)
 QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5QUICKCONTROLS2_VERSION).tar.xz
-QT5QUICKCONTROLS2_DEPENDENCIES = qt5base qt5declarative
+QT5QUICKCONTROLS2_DEPENDENCIES = qt5declarative
 QT5QUICKCONTROLS2_INSTALL_STAGING = YES
 
 QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
-define QT5QUICKCONTROLS2_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5QUICKCONTROLS2_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5QUICKCONTROLS2_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/quickcontrols2 $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickTemplates2.so.* $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickControls2.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/platform $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls.2 $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Templates.2 $(TARGET_DIR)/usr/qml/QtQuick
-	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 641af6f62c..77254fec0f 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -7,7 +7,6 @@
 QT5SCRIPT_VERSION = $(QT5_VERSION)
 QT5SCRIPT_SITE = $(QT5_SITE)
 QT5SCRIPT_SOURCE = qtscript-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SCRIPT_VERSION).tar.xz
-QT5SCRIPT_DEPENDENCIES = qt5base
 QT5SCRIPT_INSTALL_STAGING = YES
 
 # JavaScriptCore contains files under BSD-2-Clause, BSD-3-Clause, and LGPL-2+.
@@ -22,33 +21,4 @@ QT5SCRIPT_LICENSE_FILES += \
 	src/3rdparty/javascriptcore/JavaScriptCore/COPYING.LIB \
 	src/3rdparty/javascriptcore/JavaScriptCore/pcre/COPYING
 
-define QT5SCRIPT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5SCRIPT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5SCRIPT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5SCRIPT_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Script*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5SCRIPT_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/script $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5SCRIPT_INSTALL_TARGET_CMDS
-	$(QT5SCRIPT_INSTALL_TARGET_LIBS)
-	$(QT5SCRIPT_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index c0776314d5..186a2d381b 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -7,7 +7,7 @@
 QT5SCXML_VERSION = $(QT5_VERSION)
 QT5SCXML_SITE = $(QT5_SITE)
 QT5SCXML_SOURCE = qtscxml-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SCXML_VERSION).tar.xz
-QT5SCXML_DEPENDENCIES = qt5base qt5declarative
+QT5SCXML_DEPENDENCIES = qt5declarative
 QT5SCXML_INSTALL_STAGING = YES
 
 QT5SCXML_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
@@ -16,38 +16,4 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5SCXML_LICENSE += , BSD-3-Clause (examples)
 endif
 
-define QT5SCXML_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5SCXML_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5SCXML_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5SCXML_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Scxml*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-define QT5SCXML_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtScxml/ $(TARGET_DIR)/usr/qml/
-endef
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5SCXML_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/scxml $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5SCXML_INSTALL_TARGET_CMDS
-	$(QT5SCXML_INSTALL_TARGET_LIBS)
-	$(QT5SCXML_INSTALL_TARGET_QMLS)
-	$(QT5SCXML_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 21fc3203b2..f928aad1c1 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -7,7 +7,6 @@
 QT5SENSORS_VERSION = $(QT5_VERSION)
 QT5SENSORS_SITE = $(QT5_SITE)
 QT5SENSORS_SOURCE = qtsensors-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SENSORS_VERSION).tar.xz
-QT5SENSORS_DEPENDENCIES = qt5base
 QT5SENSORS_INSTALL_STAGING = YES
 QT5SENSORS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SENSORS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
@@ -16,41 +15,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5SENSORS_DEPENDENCIES += qt5declarative
 endif
 
-define QT5SENSORS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5SENSORS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5SENSORS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5SENSORS_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Sensors.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sensor* $(TARGET_DIR)/usr/lib/qt/plugins
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5SENSORS_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtSensors $(TARGET_DIR)/usr/qml
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5SENSORS_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/sensors $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5SENSORS_INSTALL_TARGET_CMDS
-	$(QT5SENSORS_INSTALL_TARGET_LIBS)
-	$(QT5SENSORS_INSTALL_TARGET_QMLS)
-	$(QT5SENSORS_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index be8bb8b23c..412a255612 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -7,45 +7,10 @@
 QT5SERIALBUS_VERSION = $(QT5_VERSION)
 QT5SERIALBUS_SITE = $(QT5_SITE)
 QT5SERIALBUS_SOURCE = qtserialbus-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SERIALBUS_VERSION).tar.xz
-QT5SERIALBUS_DEPENDENCIES = qt5base qt5serialport
+QT5SERIALBUS_DEPENDENCIES = qt5serialport
 QT5SERIALBUS_INSTALL_STAGING = YES
 
 QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
-define QT5SERIALBUS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5SERIALBUS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5SERIALBUS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5SERIALBUS_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5SerialBus.so.* \
-		$(TARGET_DIR)/usr/lib
-	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/canbus
-	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/canbus/*.so \
-		$(TARGET_DIR)/usr/lib/qt/plugins/canbus
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES)$(BR2_PACKAGE_QT5BASE_WIDGETS),yy)
-define QT5SERIALBUS_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/serialbus $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5SERIALBUS_INSTALL_TARGET_CMDS
-	$(QT5SERIALBUS_INSTALL_TARGET_LIBS)
-	$(QT5SERIALBUS_INSTALL_TARGET_EXAMPLES)
-	$(INSTALL) -m 0755 -D $(@D)/bin/canbusutil \
-		$(TARGET_DIR)/usr/bin/canbusutil
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 3f88ebf58e..902967c757 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -7,38 +7,8 @@
 QT5SERIALPORT_VERSION = $(QT5_VERSION)
 QT5SERIALPORT_SITE = $(QT5_SITE)
 QT5SERIALPORT_SOURCE = qtserialport-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SERIALPORT_VERSION).tar.xz
-QT5SERIALPORT_DEPENDENCIES = qt5base
 QT5SERIALPORT_INSTALL_STAGING = YES
 QT5SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 
-define QT5SERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5SERIALPORT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5SERIALPORT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5SERIALPORT_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5SerialPort.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5SERIALPORT_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/serialport $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5SERIALPORT_INSTALL_TARGET_CMDS
-	$(QT5SERIALPORT_INSTALL_TARGET_LIBS)
-	$(QT5SERIALPORT_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index f91c75694e..d4b31c231e 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -7,46 +7,8 @@
 QT5SVG_VERSION = $(QT5_VERSION)
 QT5SVG_SITE = $(QT5_SITE)
 QT5SVG_SOURCE = qtsvg-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5SVG_VERSION).tar.xz
-QT5SVG_DEPENDENCIES = qt5base
 QT5SVG_INSTALL_STAGING = YES
 QT5SVG_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
-define QT5SVG_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5SVG_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5SVG_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
-define QT5SVG_INSTALL_ICONENGINES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/iconengines $(TARGET_DIR)/usr/lib/qt/plugins
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5SVG_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/svg $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5SVG_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Svg*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/libqsvg.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
-	$(QT5SVG_INSTALL_ICONENGINES)
-endef
-endif
-
-define QT5SVG_INSTALL_TARGET_CMDS
-	$(QT5SVG_INSTALL_TARGET_LIBS)
-	$(QT5SVG_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index bd4d49940a..a35cdc5799 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -7,7 +7,6 @@
 QT5WEBSOCKETS_VERSION = $(QT5_VERSION)
 QT5WEBSOCKETS_SITE = $(QT5_SITE)
 QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBSOCKETS_VERSION).tar.xz
-QT5WEBSOCKETS_DEPENDENCIES = qt5base
 QT5WEBSOCKETS_INSTALL_STAGING = YES
 QT5WEBSOCKETS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools)
 QT5WEBSOCKETS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3
@@ -20,41 +19,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
 endif
 
-define QT5WEBSOCKETS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5WEBSOCKETS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBSOCKETS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5WEBSOCKETS_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/WebSockets $(TARGET_DIR)/usr/qml/Qt/
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebSockets $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/websockets $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifneq ($(BR2_STATIC_LIBS),y)
-define QT5WEBSOCKETS_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebSockets.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-define QT5WEBSOCKETS_INSTALL_TARGET_CMDS
-	$(QT5WEBSOCKETS_INSTALL_TARGET_LIBS)
-	$(QT5WEBSOCKETS_INSTALL_TARGET_QMLS)
-	$(QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
index 0a80dba612..0f37f3eb85 100644
--- a/package/qt5/qt5webview/qt5webview.mk
+++ b/package/qt5/qt5webview/qt5webview.mk
@@ -7,7 +7,7 @@
 QT5WEBVIEW_VERSION = $(QT5_VERSION)
 QT5WEBVIEW_SITE = $(QT5_SITE)
 QT5WEBVIEW_SOURCE = qtwebview-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBVIEW_VERSION).tar.xz
-QT5WEBVIEW_DEPENDENCIES = qt5base qt5webengine
+QT5WEBVIEW_DEPENDENCIES = qt5webengine
 QT5WEBVIEW_INSTALL_STAGING = YES
 QT5WEBVIEW_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0, GFDL-1.3 (docs)
 QT5WEBVIEW_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
@@ -16,41 +16,4 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5WEBVIEW_LICENSE += , BSD-3-Clause (examples)
 endif
 
-define QT5WEBVIEW_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5WEBVIEW_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBVIEW_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5WEBVIEW_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebView $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5WEBVIEW_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webview $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifneq ($(BR2_STATIC_LIBS),y)
-define QT5WEBVIEW_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebView.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/webview $(TARGET_DIR)/usr/lib/qt/plugins
-endef
-endif
-
-define QT5WEBVIEW_INSTALL_TARGET_CMDS
-	$(QT5WEBVIEW_INSTALL_TARGET_LIBS)
-	$(QT5WEBVIEW_INSTALL_TARGET_QMLS)
-	$(QT5WEBVIEW_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 5d6e564c05..075d36dcd8 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -7,27 +7,8 @@
 QT5X11EXTRAS_VERSION = $(QT5_VERSION)
 QT5X11EXTRAS_SITE = $(QT5_SITE)
 QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5X11EXTRAS_VERSION).tar.xz
-QT5X11EXTRAS_DEPENDENCIES = qt5base
 QT5X11EXTRAS_INSTALL_STAGING = YES
 QT5X11EXTRAS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
 
-define QT5X11EXTRAS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5X11EXTRAS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5X11EXTRAS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5X11EXTRAS_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5X11Extras.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 42338afa07..8552869925 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -7,7 +7,6 @@
 QT5XMLPATTERNS_VERSION = $(QT5_VERSION)
 QT5XMLPATTERNS_SITE = $(QT5_SITE)
 QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5XMLPATTERNS_VERSION).tar.xz
-QT5XMLPATTERNS_DEPENDENCIES = qt5base
 QT5XMLPATTERNS_INSTALL_STAGING = YES
 QT5XMLPATTERNS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5XMLPATTERNS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
@@ -16,33 +15,4 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5XMLPATTERNS_LICENSE += , BSD-3-Clause (examples)
 endif
 
-define QT5XMLPATTERNS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5XMLPATTERNS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5XMLPATTERNS_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),)
-define QT5XMLPATTERNS_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5XmlPatterns*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5XMLPATTERNS_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/xmlpatterns $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-define QT5XMLPATTERNS_INSTALL_TARGET_CMDS
-	$(QT5XMLPATTERNS_INSTALL_TARGET_LIBS)
-	$(QT5XMLPATTERNS_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
