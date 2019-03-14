From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:13 +0100
Subject: [Buildroot] [PATCH v2 02/13] qt5: Convert to generic target install
 command
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <20190314094024.1961-3-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This converts the numerous and complex target install steps of almost all Qt5
related packages to a single rsync call with a pre-filtered list of files from
the packages staging to the target path.
The list is created from files in which were created, or have changed, in staging
after the .stamp_built was made. In order to avoid useless files in target, all
*.prl, *.la files and the folders /usr/include and /usr/lib/cmake and /usr/doc
are ignored.

Of course this only works for packages which do install into staging at all.
Custom install steps also have to remain in cases where a certain buildroot
option has no corresponding setting in the packages configuration options.

Getting rid of the explicit conditionals is possible because the Qt configure
system already defines the correct install steps for the most common
conditionals like examples-yes/no, static/dynamic-libs, quick-support and so on.

Following is a list where the replacement was not straightforward or could not be
tested.

qt5base:
Kept only the font install step of Qt 5.6. Not tested.

qt5webengine:
Should be straightforward but is currently broken with
  ninja: build stopped: subcommand failed.
  Makefile.gn_run:326: recipe for target 'run_ninja' failed

qt5webkit:
The generic install creates QtWebProcess in /usr/libexec/ instead of /usr/bin.
The jsc binary was not be copied at all. I dont know if it's need, so for safety
keeping the respective custom install command.

qt5webkit-examples:
Should be straightforward but build is currently broken with
make[5]: *** No rule to make target 'QtWebKit/QWebView', needed by '.uic/ui_formextractor.h'.  Stop.
(OE even removed it because apparently nobody cares).

qt5webchannel:
A custom install of javascript has to remain

qt5cinex:
Custom logic because no staging install

qt5tools:
custom logic

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qextserialport/qextserialport.mk      |  6 +-
 package/qt5/qt5.mk                            |  8 +++
 package/qt5/qt53d/qt53d.mk                    | 20 +------
 package/qt5/qt5base/qt5base.mk                | 55 +------------------
 package/qt5/qt5canvas3d/qt5canvas3d.mk        |  9 +--
 package/qt5/qt5charts/qt5charts.mk            | 23 +-------
 .../qt5/qt5connectivity/qt5connectivity.mk    | 43 +--------------
 package/qt5/qt5declarative/qt5declarative.mk  | 31 +----------
 package/qt5/qt5enginio/qt5enginio.mk          | 22 +-------
 .../qt5graphicaleffects.mk                    |  2 +-
 .../qt5/qt5imageformats/qt5imageformats.mk    |  4 +-
 package/qt5/qt5location/qt5location.mk        | 33 +----------
 package/qt5/qt5multimedia/qt5multimedia.mk    | 30 +---------
 .../qt5/qt5quickcontrols/qt5quickcontrols.mk  | 25 +--------
 .../qt5quickcontrols2/qt5quickcontrols2.mk    | 24 +-------
 package/qt5/qt5script/qt5script.mk            | 15 +----
 package/qt5/qt5scxml/qt5scxml.mk              | 20 +------
 package/qt5/qt5sensors/qt5sensors.mk          | 23 +-------
 package/qt5/qt5serialbus/qt5serialbus.mk      | 21 +------
 package/qt5/qt5serialport/qt5serialport.mk    | 15 +----
 package/qt5/qt5svg/qt5svg.mk                  | 23 +-------
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk  | 34 +-----------
 package/qt5/qt5wayland/qt5wayland.mk          | 24 +-------
 package/qt5/qt5webchannel/qt5webchannel.mk    | 22 +-------
 package/qt5/qt5webengine/qt5webengine.mk      | 24 +-------
 .../qt5webkit-examples/qt5webkit-examples.mk  |  7 +--
 package/qt5/qt5webkit/qt5webkit.mk            |  9 +--
 package/qt5/qt5websockets/qt5websockets.mk    | 23 +-------
 package/qt5/qt5x11extras/qt5x11extras.mk      |  4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  | 15 +----
 30 files changed, 37 insertions(+), 577 deletions(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index ecaff21efc..8c838e2835 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -28,12 +28,8 @@ define QEXTSERIALPORT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-ifeq ($(BR2_STATIC_LIBS),y)
-QEXTSERIALPORT_INSTALL_TARGET = NO
-else
 define QEXTSERIALPORT_INSTALL_TARGET_CMDS
-	cp -a $(@D)/*.so.* $(TARGET_DIR)/usr/lib
+	$(QT5_INSTALL_TARGET)
 endef
-endif
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d8012a913d..5acbbf2ef3 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -32,5 +32,13 @@ define QT5_LA_PRL_FILES_FIXUP
 	done
 endef
 
+define QT5_INSTALL_TARGET
+	cd $(STAGING_DIR)/usr; find . -cnewer $(@D)/.stamp_built \
+		! -name *.la ! -name *.prl \
+		! -path "./include/*" ! -path "./lib/cmake/*" ! -path "./doc*" \
+		-type f,l \
+		| rsync -arv --files-from=- $(STAGING_DIR)/usr $(TARGET_DIR)/usr
+endef
+
 # Variable for other Qt applications to use
 QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 48a931d60b..eb8da66d11 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -30,27 +30,9 @@ define QT53D_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT53D_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/qt3d $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
 ifeq ($(BR2_STATIC_LIBS),)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-# Available since 5.9
-define QT53D_INSTALL_TARGET_LATEST
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/geometryloaders $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/renderplugins $(TARGET_DIR)/usr/lib/qt/plugins
-endef
-endif
 define QT53D_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
-	$(QT53D_INSTALL_TARGET_LATEST)
-	$(QT53D_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 endif
 
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a0492418be..74f6c8d7d3 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -254,30 +254,6 @@ QT5BASE_CONFIGURE_OPTS += -no-gtk
 endif
 endif
 
-# Build the list of libraries to be installed on the target
-QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XCB)        += Qt5XcbQpa
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
-endif
-else
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
-endif
-
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
-
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
-
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
@@ -361,19 +337,6 @@ define QT5BASE_INSTALL_STAGING_CMDS
 	$(QT5BASE_INSTALL_QT_CONF)
 endef
 
-define QT5BASE_INSTALL_TARGET_LIBS
-	for lib in $(QT5BASE_INSTALL_LIBS_y); do \
-		cp -dpf $(STAGING_DIR)/usr/lib/lib$${lib}.so.* $(TARGET_DIR)/usr/lib || exit 1 ; \
-	done
-endef
-
-define QT5BASE_INSTALL_TARGET_PLUGINS
-	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins ; \
-	fi
-endef
-
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 define QT5BASE_INSTALL_TARGET_FONTS
 	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
@@ -383,25 +346,9 @@ define QT5BASE_INSTALL_TARGET_FONTS
 endef
 endif
 
-define QT5BASE_INSTALL_TARGET_EXAMPLES
-	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(TARGET_DIR)/usr/lib/qt/examples ; \
-	fi
-endef
-
-ifeq ($(BR2_STATIC_LIBS),y)
 define QT5BASE_INSTALL_TARGET_CMDS
+	$(QT5_INSTALL_TARGET)
 	$(QT5BASE_INSTALL_TARGET_FONTS)
-	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
-else
-define QT5BASE_INSTALL_TARGET_CMDS
-	$(QT5BASE_INSTALL_TARGET_LIBS)
-	$(QT5BASE_INSTALL_TARGET_PLUGINS)
-	$(QT5BASE_INSTALL_TARGET_FONTS)
-	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
-endef
-endif
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index ef5b373d02..006d3d964e 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -31,15 +31,8 @@ define QT5CANVAS3D_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5CANVAS3D_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/canvas3d $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
 define QT5CANVAS3D_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtCanvas3D $(TARGET_DIR)/usr/qml/
-	$(QT5CANVAS3D_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 9e2e6de881..d11a301a86 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -37,30 +37,9 @@ define QT5CHARTS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 
 define QT5CHARTS_INSTALL_TARGET_CMDS
-	$(QT5CHARTS_INSTALL_TARGET_LIBS)
-	$(QT5CHARTS_INSTALL_TARGET_QMLS)
-	$(QT5CHARTS_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 6de1536b78..e96014b64b 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -39,49 +39,8 @@ define QT5CONNECTIVITY_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-ifneq ($(BR2_PACKAGE_BLUEZ_UTILS)$(BR2_PACKAGE_BLUEZ5_UTILS),)
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
-ifneq ($(BR2_PACKAGE_BLUEZ_UTILS)$(BR2_PACKAGE_BLUEZ5_UTILS),)
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
 define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
-	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_QMLS)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC_QMLS)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_BLUETOOTH_EXAMPLES)
-	$(QT5CONNECTIVITY_INSTALL_TARGET_NFC_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 2fe72b3be6..ef18553d0b 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -31,37 +31,8 @@ define QT5DECLARATIVE_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5DECLARATIVE_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/bin/qml* $(TARGET_DIR)/usr/bin
-	cp -dpfr $(STAGING_DIR)/usr/qml $(TARGET_DIR)/usr
-	$(QT5DECLARATIVE_INSTALL_TARGET_EXAMPLES)
-	$(QT5DECLARATIVE_INSTALL_TARGET_LIBS)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 38f309646f..b39d2eb097 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -35,28 +35,8 @@ define QT5ENGINIO_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5ENGINIO_INSTALL_TARGET_CMDS
-	$(QT5ENGINIO_INSTALL_TARGET_LIBS)
-	$(QT5ENGINIO_INSTALL_TARGET_QMLS)
-	$(QT5ENGINIO_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index c5011a94f0..f399787d8f 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -31,7 +31,7 @@ define QT5GRAPHICALEFFECTS_INSTALL_STAGING_CMDS
 endef
 
 define QT5GRAPHICALEFFECTS_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtGraphicalEffects $(TARGET_DIR)/usr/qml
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index fa13ebedaf..a7db819268 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -30,10 +30,8 @@ define QT5IMAGEFORMATS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-ifeq ($(BR2_STATIC_LIBS),)
 define QT5IMAGEFORMATS_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/*.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
+	$(QT5_INSTALL_TARGET)
 endef
-endif
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index da0aad7961..d4b4ffe41b 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -35,39 +35,8 @@ define QT5LOCATION_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5LOCATION_INSTALL_TARGET_CMDS
-	$(QT5LOCATION_INSTALL_TARGET_POSITION)
-	$(QT5LOCATION_INSTALL_TARGET_POSITION_QUICK)
-	$(QT5LOCATION_INSTALL_TARGET_LOCATION)
-	$(QT5LOCATION_INSTALL_TARGET_QMLS)
-	$(QT5LOCATION_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index d044b7b96c..9f7342adfb 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -47,41 +47,13 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 QT5MULTIMEDIA_LICENSE := $(QT5MULTIMEDIA_LICENSE), LGPL-2.1+ (examples/multimedia/spectrum/3rdparty/fftreal)
 QT5MULTIMEDIA_LICENSE_FILES += examples/multimedia/spectrum/3rdparty/fftreal/license.txt
-define QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/multimedia* $(TARGET_DIR)/usr/lib/qt/examples/
-endef
 endif
 
 define QT5MULTIMEDIA_INSTALL_TARGET_CMDS
-	$(QT5MULTIMEDIA_INSTALL_TARGET_LIBS)
-	$(QT5MULTIMEDIA_INSTALL_TARGET_QMLS)
-	$(QT5MULTIMEDIA_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 3e0c5effb3..faa109bc6f 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -30,31 +30,8 @@ define QT5QUICKCONTROLS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
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
 define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
-	$(QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS)
-	$(QT5QUICKCONTROLS_INSTALL_TARGET_LAYOUTS)
-	$(QT5QUICKCONTROLS_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index c2004c2ee7..950153ae4b 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -25,30 +25,8 @@ define QT5QUICKCONTROLS2_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
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
 define QT5QUICKCONTROLS2_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5LabsTemplates.so.* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/controls $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/calendar $(TARGET_DIR)/usr/qml/Qt/labs
-	cp -dpfr $(STAGING_DIR)/usr/qml/Qt/labs/templates $(TARGET_DIR)/usr/qml/Qt/labs
-	$(QT5QUICKCONTROLS2_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
-endif
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 4a292c95a5..9f70a87d41 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -40,21 +40,8 @@ define QT5SCRIPT_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5SCRIPT_INSTALL_TARGET_CMDS
-	$(QT5SCRIPT_INSTALL_TARGET_LIBS)
-	$(QT5SCRIPT_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index de9ece597c..ce3cd650a7 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -29,26 +29,8 @@ define QT5SCXML_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5SCXML_INSTALL_TARGET_CMDS
-	$(QT5SCXML_INSTALL_TARGET_LIBS)
-	$(QT5SCXML_INSTALL_TARGET_QMLS)
-	$(QT5SCXML_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 2d5cf327a6..2cd6e0d5fb 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -35,29 +35,8 @@ define QT5SENSORS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5SENSORS_INSTALL_TARGET_CMDS
-	$(QT5SENSORS_INSTALL_TARGET_LIBS)
-	$(QT5SENSORS_INSTALL_TARGET_QMLS)
-	$(QT5SENSORS_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 98c4466cb8..2841172fb7 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -26,27 +26,8 @@ define QT5SERIALBUS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5SERIALBUS_INSTALL_TARGET_CMDS
-	$(QT5SERIALBUS_INSTALL_TARGET_LIBS)
-	$(QT5SERIALBUS_INSTALL_TARGET_EXAMPLES)
-	$(INSTALL) -m 0755 -D $(@D)/bin/canbusutil \
-		$(TARGET_DIR)/usr/bin/canbusutil
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 2b0953586b..9059443073 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -31,21 +31,8 @@ define QT5SERIALPORT_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5SERIALPORT_INSTALL_TARGET_CMDS
-	$(QT5SERIALPORT_INSTALL_TARGET_LIBS)
-	$(QT5SERIALPORT_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 48ff04bd75..800a9fbdd1 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -31,29 +31,8 @@ define QT5SVG_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5SVG_INSTALL_TARGET_CMDS
-	$(QT5SVG_INSTALL_TARGET_LIBS)
-	$(QT5SVG_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 8ce3169774..8377e1d8b8 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -30,20 +30,17 @@ QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/openwnn/NOTICE
 endif
 
 ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (pinyin)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
 endif
 
 ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (tcime), BSD-3-Clause (tcime)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING),y)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=handwriting
 QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), MIT (lipi-toolkit)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
@@ -57,12 +54,6 @@ ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION),y)
 QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=arrow-key-navigation
 endif
 
-ifdef QT5VIRTUALKEYBOARD_3RDPARTY_PARTS
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS
-	cp -dpfr $(STAGING_DIR)/usr/qtvirtualkeyboard $(TARGET_DIR)/usr
-endef
-endif
-
 define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5VIRTUALKEYBOARD_QMAKEFLAGS))
 endef
@@ -75,31 +66,8 @@ define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
-	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick/Enterprise
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Enterprise/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/Enterprise/
-endef
-else
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
-	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/virtualkeyboard $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
 define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so \
-		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML)
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS)
-	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index d6fb6e1888..c5365198ba 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -43,30 +43,8 @@ define QT5WAYLAND_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-define QT5WAYLAND_INSTALL_COMPOSITOR
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandCompositor.so* $(TARGET_DIR)/usr/lib
-endef
-else
-define QT5WAYLAND_INSTALL_COMPOSITOR
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Compositor.so* $(TARGET_DIR)/usr/lib
-endef
-endif
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5WAYLAND_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/wayland $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
 define QT5WAYLAND_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland* $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland* $(TARGET_DIR)/usr/lib/qt/plugins/platforms
-	$(QT5WAYLAND_INSTALL_COMPOSITOR)
-	$(QT5WAYLAND_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index f1c08532c0..8e62e9c6f0 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -50,29 +50,9 @@ define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5WEBCHANNEL_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebChannel $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webchannel $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifneq ($(BR2_STATIC_LIBS),y)
-define QT5WEBCHANNEL_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebChannel.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
 define QT5WEBCHANNEL_INSTALL_TARGET_CMDS
-	$(QT5WEBCHANNEL_INSTALL_TARGET_LIBS)
-	$(QT5WEBCHANNEL_INSTALL_TARGET_QMLS)
+	$(QT5_INSTALL_TARGET)
 	$(QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT)
-	$(QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index a3cfcec26e..09cb8c135f 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -76,30 +76,8 @@ define QT5WEBENGINE_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5WEBENGINE_INSTALL_TARGET_CMDS
-	$(QT5WEBENGINE_INSTALL_TARGET_LIBS)
-	$(QT5WEBENGINE_INSTALL_TARGET_QMLS)
-	$(QT5WEBENGINE_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index 94153fd652..7e041a5c75 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -40,15 +40,10 @@ endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5declarative
-define QT5WEBKIT_EXAMPLES_INSTALL_QML
-	cp -dpfr $(@D)/examples/webkitqml $(TARGET_DIR)/usr/lib/qt/examples
-endef
 endif
 
 define QT5WEBKIT_EXAMPLES_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib/qt/examples
-	cp -dpfr $(@D)/examples/webkitwidgets $(TARGET_DIR)/usr/lib/qt/examples
-	$(QT5WEBKIT_EXAMPLES_INSTALL_QML)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index a0a0998d12..739372af9e 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -57,16 +57,9 @@ define QT5WEBKIT_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5WEBKIT_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
-endef
-endif
-
 define QT5WEBKIT_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
+	$(QT5_INSTALL_TARGET)
 	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
-	$(QT5WEBKIT_INSTALL_TARGET_QMLS)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index c67db198db..2b0e2bf284 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -38,29 +38,8 @@ define QT5WEBSOCKETS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5WEBSOCKETS_INSTALL_TARGET_CMDS
-	$(QT5WEBSOCKETS_INSTALL_TARGET_LIBS)
-	$(QT5WEBSOCKETS_INSTALL_TARGET_QMLS)
-	$(QT5WEBSOCKETS_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 9d54c11061..55c8e741ab 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -31,10 +31,8 @@ define QT5X11EXTRAS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
-ifeq ($(BR2_STATIC_LIBS),)
 define QT5X11EXTRAS_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5X11Extras.so.* $(TARGET_DIR)/usr/lib
+	$(QT5_INSTALL_TARGET)
 endef
-endif
 
 $(eval $(generic-package))
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 0a8b47ac53..98096a6157 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -34,21 +34,8 @@ define QT5XMLPATTERNS_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
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
 define QT5XMLPATTERNS_INSTALL_TARGET_CMDS
-	$(QT5XMLPATTERNS_INSTALL_TARGET_LIBS)
-	$(QT5XMLPATTERNS_INSTALL_TARGET_EXAMPLES)
+	$(QT5_INSTALL_TARGET)
 endef
 
 $(eval $(generic-package))
-- 
2.21.0
