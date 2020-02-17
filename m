From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:25 +0100
Subject: [Buildroot] [PATCH v6 03/28] qt5: Convert straightforward packages
 to qmake infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-4-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This converts all qmake packages to the new infra for which no custom
environments, option or additional hooks are needed.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qextserialport/qextserialport.mk      | 22 +------
 package/qt5/qt53d/qt53d.mk                    | 38 +-----------
 package/qt5/qt5canvas3d/qt5canvas3d.mk        | 25 +-------
 package/qt5/qt5charts/qt5charts.mk            | 40 +------------
 .../qt5/qt5connectivity/qt5connectivity.mk    | 59 +------------------
 package/qt5/qt5declarative/qt5declarative.mk  | 47 +--------------
 package/qt5/qt5enginio/qt5enginio.mk          | 38 +-----------
 .../qt5graphicaleffects.mk                    | 18 +-----
 .../qt5/qt5imageformats/qt5imageformats.mk    | 20 +------
 package/qt5/qt5location/qt5location.mk        | 49 +--------------
 package/qt5/qt5multimedia/qt5multimedia.mk    | 46 +--------------
 .../qt5/qt5quickcontrols/qt5quickcontrols.mk  | 41 +------------
 .../qt5quickcontrols2/qt5quickcontrols2.mk    | 40 +------------
 package/qt5/qt5script/qt5script.mk            | 31 +---------
 package/qt5/qt5scxml/qt5scxml.mk              | 36 +----------
 package/qt5/qt5sensors/qt5sensors.mk          | 39 +-----------
 package/qt5/qt5serialbus/qt5serialbus.mk      | 37 +-----------
 package/qt5/qt5serialport/qt5serialport.mk    | 31 +---------
 package/qt5/qt5svg/qt5svg.mk                  | 39 +-----------
 package/qt5/qt5websockets/qt5websockets.mk    | 39 +-----------
 package/qt5/qt5webview/qt5webview.mk          | 39 +-----------
 package/qt5/qt5x11extras/qt5x11extras.mk      | 20 +------
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  | 31 +---------
 23 files changed, 23 insertions(+), 802 deletions(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index ecaff21efc..6f14d21fe7 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -16,24 +16,4 @@ endif
 
 QEXTSERIALPORT_DEPENDENCIES = qt5base
 
-define QEXTSERIALPORT_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) $(QEXTSERIALPORT_CONF_OPTS)
-endef
-
-define QEXTSERIALPORT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QEXTSERIALPORT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-ifeq ($(BR2_STATIC_LIBS),y)
-QEXTSERIALPORT_INSTALL_TARGET = NO
-else
-define QEXTSERIALPORT_INSTALL_TARGET_CMDS
-	cp -a $(@D)/*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 7674b44558..eeb1b3644c 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -17,40 +17,4 @@ endif
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
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-# Available since 5.9
-define QT53D_INSTALL_TARGET_LATEST
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geometryloaders $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/renderplugins $(TARGET_DIR)/usr/lib/qt/plugins
-endef
-endif
-define QT53D_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
-	$(QT53D_INSTALL_TARGET_LATEST)
-	$(QT53D_INSTALL_TARGET_EXAMPLES)
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index b550ff00f2..711d0175d4 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -18,27 +18,4 @@ QT5CANVAS3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
 endif
 
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
index e359747503..40f5efc2da 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -24,42 +24,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
index 0ade9876de..93a5099a99 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -25,61 +25,4 @@ QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5DECLARATIVE),qt5declarativ
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
index 6210611961..42c60ed3eb 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -18,49 +18,4 @@ QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.
 QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 
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
index ebd99e4cb7..714f8c6b73 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
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
index c5011a94f0..92a3c1b8fb 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -18,20 +18,4 @@ QT5GRAPHICALEFFECTS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or L
 QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 
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
index fa13ebedaf..662215521c 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -18,22 +18,4 @@ QT5IMAGEFORMATS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-
 QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 
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
index a69e8f41a6..8face619d8 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -22,51 +22,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-define QT5LOCATION_INSTALL_TARGET_POSITION_QUICK
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5PositioningQuick.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
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
index e598140a9a..a060490c62 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -34,53 +34,9 @@ ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
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
-# since Qt5.10.1 libqgsttools was renamed to libQtMultimediaGstTools
-# and is installed by the default target install step below
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)x$(BR2_PACKAGE_GST1_PLUGINS_BASE),xy)
-define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
-	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Multimedia*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
-	$(QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB)
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
index 3e0c5effb3..d6a0d2218c 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -18,43 +18,4 @@ else
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 endif
 
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
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-define QT5QUICKCONTROLS_INSTALL_TARGET_LAYOUTS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Layouts $(TARGET_DIR)/usr/qml/QtQuick
-endef
-endif
-
-define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
-	$(QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS)
-	$(QT5QUICKCONTROLS_INSTALL_TARGET_LAYOUTS)
-	$(QT5QUICKCONTROLS_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index c2004c2ee7..51d8b60741 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -13,42 +13,4 @@ QT5QUICKCONTROLS2_INSTALL_STAGING = YES
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
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickTemplates2.so.* $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5QuickControls2.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/platform $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls.2 $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Templates.2 $(TARGET_DIR)/usr/qml/QtQuick
-	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
-endef
-else
-define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates $(TARGET_DIR)/usr/qml/Qt/labs
-	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
-endef
-endif
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index a3b8cb7e34..e2a1bb2812 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -27,33 +27,4 @@ QT5SCRIPT_LICENSE_FILES += \
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
index c0776314d5..b90ab01030 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
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
index 10498a4970..7a3c5b7ef5 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -22,41 +22,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
index be8bb8b23c..0ee351afe2 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -13,39 +13,4 @@ QT5SERIALBUS_INSTALL_STAGING = YES
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
index 5c2abd82da..f08fac6002 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -18,33 +18,4 @@ QT5SERIALPORT_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.
 QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 
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
index cb91844efd..2d8dade407 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -18,41 +18,4 @@ QT5SVG_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
 QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 
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
index 6e734a3bf3..0647ade615 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -25,41 +25,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
index 0a80dba612..db4813563a 100644
--- a/package/qt5/qt5webview/qt5webview.mk
+++ b/package/qt5/qt5webview/qt5webview.mk
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
index 6acc9462c1..8590f543c6 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -18,22 +18,4 @@ QT5X11EXTRAS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0
 QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
 endif
 
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
index 6ed247fd59..0a12bf6bdc 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -21,33 +21,4 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
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
-- 
2.25.0
