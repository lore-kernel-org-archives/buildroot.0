From: Andreas Naumann <anaumann@ultratronik.de>
Date: Fri, 22 Mar 2019 19:39:01 +0100
Subject: [Buildroot] [PATCH v4 3/6] qt5: Convert packages to qmake infra
In-Reply-To: <20190322183904.22401-1-anaumann@ultratronik.de>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
Message-ID: <20190322183904.22401-4-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In most cases the configure, build, install-staging and install-target
commands are replaced with the qmake-package generics. In some cases the
custom environment/option variables are renamed to the generic name.

The exception to this are the following cases, where the replacement was
either not straightforward or could not be tested:

qt5webengine:
Should be straightforward but is currently broken with
  ninja: build stopped: subcommand failed.
  Makefile.gn_run:326: recipe for target 'run_ninja' failed

qt5webkit:
The generic install creates QtWebProcess in /usr/libexec/ instead of /usr/bin.
The jsc binary was not copied at all. Unsure of its significance the custom
install command is kept in a post install hook.

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
 package/qextserialport/qextserialport.mk      | 22 +-----
 package/qt-webkit-kiosk/qt-webkit-kiosk.mk    | 11 +--
 package/qt5/qt53d/qt53d.mk                    | 39 +--------
 package/qt5/qt5base/qt5base.mk                | 79 +------------------
 package/qt5/qt5canvas3d/qt5canvas3d.mk        | 26 +-----
 package/qt5/qt5charts/qt5charts.mk            | 41 +---------
 .../qt5/qt5connectivity/qt5connectivity.mk    | 60 +-------------
 package/qt5/qt5declarative/qt5declarative.mk  | 48 +----------
 package/qt5/qt5enginio/qt5enginio.mk          | 39 +--------
 .../qt5graphicaleffects.mk                    | 18 +----
 .../qt5/qt5imageformats/qt5imageformats.mk    | 20 +----
 package/qt5/qt5location/qt5location.mk        | 50 +-----------
 package/qt5/qt5multimedia/qt5multimedia.mk    | 47 +----------
 .../qt5/qt5quickcontrols/qt5quickcontrols.mk  | 41 +---------
 .../qt5quickcontrols2/qt5quickcontrols2.mk    | 40 +---------
 package/qt5/qt5script/qt5script.mk            | 32 +-------
 package/qt5/qt5scxml/qt5scxml.mk              | 37 +--------
 package/qt5/qt5sensors/qt5sensors.mk          | 40 +---------
 package/qt5/qt5serialbus/qt5serialbus.mk      | 38 +--------
 package/qt5/qt5serialport/qt5serialport.mk    | 32 +-------
 package/qt5/qt5svg/qt5svg.mk                  | 40 +---------
 package/qt5/qt5tools/qt5tools.mk              |  6 +-
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk  | 63 +--------------
 package/qt5/qt5wayland/qt5wayland.mk          | 43 +---------
 package/qt5/qt5webchannel/qt5webchannel.mk    | 40 +---------
 package/qt5/qt5webengine/qt5webengine.mk      | 50 ++----------
 .../qt5webkit-examples/qt5webkit-examples.mk  | 23 +-----
 package/qt5/qt5webkit/qt5webkit.mk            | 30 ++-----
 package/qt5/qt5websockets/qt5websockets.mk    | 40 +---------
 package/qt5/qt5x11extras/qt5x11extras.mk      | 21 +----
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  | 32 +-------
 package/qt5cinex/qt5cinex.mk                  |  9 +--
 package/quazip/quazip.mk                      | 10 +--
 package/qwt/qwt.mk                            |  9 +--
 34 files changed, 56 insertions(+), 1120 deletions(-)

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
diff --git a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
index a714fca9c9..22cbf3cb87 100644
--- a/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
+++ b/package/qt-webkit-kiosk/qt-webkit-kiosk.mk
@@ -11,13 +11,8 @@ QT_WEBKIT_KIOSK_DEPENDENCIES = qt5webkit qt5multimedia
 QT_WEBKIT_KIOSK_LICENSE = LGPL-3.0
 QT_WEBKIT_KIOSK_LICENSE_FILES = doc/lgpl.html
 
-define QT_WEBKIT_KIOSK_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
-endef
-
-define QT_WEBKIT_KIOSK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
+QT_WEBKIT_KIOSK_INSTALL_STAGING = NO
+QT_WEBKIT_KIOSK_CONF_OPTS = PREFIX=/usr
 
 define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src -f Makefile.qt-webkit-kiosk \
@@ -29,4 +24,4 @@ define QT_WEBKIT_KIOSK_INSTALL_TARGET_CMDS
 		$(if $(BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS),install_sound)
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 48a931d60b..eeb1b3644c 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -17,41 +17,4 @@ endif
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a8bec84123..744c6c57ae 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -252,30 +252,6 @@ QT5BASE_CONFIGURE_OPTS += -no-gtk
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
@@ -342,10 +318,6 @@ define QT5BASE_CONFIGURE_CMDS
 	)
 endef
 
-define QT5BASE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
 # The file "qt.conf" can be used to override the hard-coded paths that are
 # compiled into the Qt library. We need it to make "qmake" relocatable.
 define QT5BASE_INSTALL_QT_CONF
@@ -353,53 +325,6 @@ define QT5BASE_INSTALL_QT_CONF
 		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
 endef
 
-define QT5BASE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
-	$(QT5BASE_INSTALL_QT_CONF)
-endef
-
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
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-define QT5BASE_INSTALL_TARGET_FONTS
-	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
-	fi
-endef
-endif
-
-define QT5BASE_INSTALL_TARGET_EXAMPLES
-	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(TARGET_DIR)/usr/lib/qt/examples ; \
-	fi
-endef
-
-ifeq ($(BR2_STATIC_LIBS),y)
-define QT5BASE_INSTALL_TARGET_CMDS
-	$(QT5BASE_INSTALL_TARGET_FONTS)
-	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
-endef
-else
-define QT5BASE_INSTALL_TARGET_CMDS
-	$(QT5BASE_INSTALL_TARGET_LIBS)
-	$(QT5BASE_INSTALL_TARGET_PLUGINS)
-	$(QT5BASE_INSTALL_TARGET_FONTS)
-	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
-endef
-endif
+QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5BASE_INSTALL_QT_CONF
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index ef5b373d02..711d0175d4 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -18,28 +18,4 @@ QT5CANVAS3D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index 9e2e6de881..40f5efc2da 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -24,43 +24,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index 6de1536b78..6648a66d4f 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -26,62 +26,4 @@ QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
-endef
-
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
index 2fe72b3be6..42c60ed3eb 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -18,50 +18,4 @@ QT5DECLARATIVE_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index 38f309646f..cb1558e4b8 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -22,41 +22,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index da0aad7961..8face619d8 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -22,52 +22,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index d044b7b96c..2f34a40178 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -34,54 +34,9 @@ ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
 QT5MULTIMEDIA_LICENSE := $(QT5MULTIMEDIA_LICENSE), LGPL-2.1+ (examples/multimedia/spectrum/3rdparty/fftreal)
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
index 4a292c95a5..e2a1bb2812 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -27,34 +27,4 @@ QT5SCRIPT_LICENSE_FILES += \
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index de9ece597c..cb6b83052f 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -16,39 +16,4 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5SCXML_LICENSE := $(QT5SCXML_LICENSE), BSD-3-Clause (examples)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index 2d5cf327a6..7a3c5b7ef5 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -22,42 +22,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index 98c4466cb8..0ee351afe2 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -13,40 +13,4 @@ QT5SERIALBUS_INSTALL_STAGING = YES
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index 2b0953586b..f08fac6002 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -18,34 +18,4 @@ QT5SERIALPORT_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index 48ff04bd75..2d8dade407 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -18,42 +18,4 @@ QT5SVG_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index a972756d3a..6351375757 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -48,10 +48,6 @@ QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPATHS) += qtpaths
 QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 
-define QT5TOOLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
 define QT5TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) sub-src-qmake_all
 	$(foreach p,$(QT5TOOLS_BUILD_DIRS_y), \
@@ -63,4 +59,4 @@ define QT5TOOLS_INSTALL_TARGET_CMDS
 		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(TARGET_DIR)/usr/bin/$(p)$(sep))
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 3f1ebdbaa4..93a69c8452 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -22,7 +22,7 @@ endif
 
 QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
 ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
 
 ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (openwnn)
@@ -30,21 +30,18 @@ QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/openwnn/NOTICE
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
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=handwriting
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+=handwriting
 QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), MIT (lipi-toolkit)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
@@ -54,59 +51,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5VIRTUALKEYBOARD_ARROW_KEY_NAVIGATION),y)
-QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=arrow-key-navigation
+QT5VIRTUALKEYBOARD_CONF_OPTS += CONFIG+=arrow-key-navigation
 endif
 
-ifdef QT5VIRTUALKEYBOARD_3RDPARTY_PARTS
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
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST):$(BR2_STATIC_LIBS),y:)
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
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index d6fb6e1888..2a1c005d37 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -27,46 +27,7 @@ QT5WAYLAND_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICE
 endif
 
 ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
-QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
+QT5WAYLAND_CONF_OTPS += CONFIG+=wayland-compositor
 endif
 
-define QT5WAYLAND_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5WAYLAND_QMAKEFLAGS))
-endef
-
-define QT5WAYLAND_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WAYLAND_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
-endef
-
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
-define QT5WAYLAND_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland* $(TARGET_DIR)/usr/lib/qt/plugins
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland* $(TARGET_DIR)/usr/lib/qt/plugins/platforms
-	$(QT5WAYLAND_INSTALL_COMPOSITOR)
-	$(QT5WAYLAND_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index f1c08532c0..6b273544d4 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -25,19 +25,6 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
 endif
 
-define QT5WEBCHANNEL_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5WEBCHANNEL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
-endef
-
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
 	$(INSTALL) -m 0644 -D $(@D)/examples/webchannel/shared/qwebchannel.js \
@@ -50,29 +37,6 @@ define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
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
-define QT5WEBCHANNEL_INSTALL_TARGET_CMDS
-	$(QT5WEBCHANNEL_INSTALL_TARGET_LIBS)
-	$(QT5WEBCHANNEL_INSTALL_TARGET_QMLS)
-	$(QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT)
-	$(QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES)
-endef
+QT5WEBCHANNEL_POST_INSTALL_TARGET_HOOKS += QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index a3cfcec26e..54fb576d91 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -7,10 +7,9 @@
 QT5WEBENGINE_VERSION = $(QT5_VERSION)
 QT5WEBENGINE_SITE = $(QT5_SITE)
 QT5WEBENGINE_SOURCE = qtwebengine-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBENGINE_VERSION).tar.xz
-QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp qt5base \
+QT5WEBENGINE_DEPENDENCIES = ffmpeg libglib2 libvpx opus webp \
 	qt5declarative qt5webchannel host-bison host-flex host-gperf \
 	host-pkgconf host-python
-QT5WEBENGINE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 include package/qt5/qt5webengine/chromium-latest.inc
@@ -30,16 +29,16 @@ ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
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
@@ -63,43 +62,6 @@ QT5WEBENGINE_PRE_CONFIGURE_HOOKS += QT5WEBENGINE_CREATE_HOST_PKG_CONFIG
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index 94153fd652..1f6058657d 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -26,29 +26,8 @@ ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
 QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
 endif
 
-define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5WEBKIT_EXAMPLES_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBKIT_EXAMPLES_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5declarative
-define QT5WEBKIT_EXAMPLES_INSTALL_QML
-	cp -dpfr $(@D)/examples/webkitqml $(TARGET_DIR)/usr/lib/qt/examples
-endef
 endif
 
-define QT5WEBKIT_EXAMPLES_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib/qt/examples
-	cp -dpfr $(@D)/examples/webkitwidgets $(TARGET_DIR)/usr/lib/qt/examples
-	$(QT5WEBKIT_EXAMPLES_INSTALL_QML)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index a0a0998d12..7878e94e6e 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -37,36 +37,20 @@ endif
 # QtWebkit's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-QT5WEBKIT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
+QT5WEBKIT_CONF_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
+QT5WEBKIT_MAKE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
 define QT5WEBKIT_PYTHON2_SYMLINK
 	mkdir -p $(@D)/host-bin
 	ln -sf $(HOST_DIR)/bin/python2 $(@D)/host-bin/python
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
-define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake WEBKIT_CONFIG+=use_system_leveldb)
-endef
-
-define QT5WEBKIT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBKIT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
-endef
+QT5WEBKIT_CONF_OPTS =  WEBKIT_CONFIG+=use_system_leveldb
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5WEBKIT_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-define QT5WEBKIT_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
+define QT5WEBKIT_INSTALL_TARGET_EXTRAS
 	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
-	$(QT5WEBKIT_INSTALL_TARGET_QMLS)
 endef
 
-$(eval $(generic-package))
+QT5WEBKIT_POST_INSTALL_TARGET_HOOKS += QT5WEBKIT_INSTALL_TARGET_EXTRAS
+
+$(eval $(qmake-package))
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index c67db198db..247031e53c 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -25,42 +25,4 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 9d54c11061..8590f543c6 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -18,23 +18,4 @@ QT5X11EXTRAS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
index 0a8b47ac53..4efbf43da7 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -21,34 +21,4 @@ ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3-Clause (examples)
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
-	$(QT5_LA_PRL_FILES_FIXUP)
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
diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index 89c38ee3f5..2b27f651d8 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -17,13 +17,6 @@ QT5CINEX_DEPENDENCIES = qt5base qt5declarative
 QT5CINEX_LICENSE = CC-BY-3.0
 QT5CINEX_LICENSE_FILES = README
 
-define QT5CINEX_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake
-endef
-
-define QT5CINEX_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
 
 # In addition to the Cinematic Experience itself, we also install a
 # wrapper shell script to /usr/bin: the Cinematic Experience binary
@@ -39,4 +32,4 @@ define QT5CINEX_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/bin/CinematicExperience-demo
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index aba8274506..eef423b58a 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -13,13 +13,7 @@ QUAZIP_DEPENDENCIES = \
 QUAZIP_LICENSE = LGPL-2.1
 QUAZIP_LICENSE_FILES = COPYING
 
-define QUAZIP_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) PREFIX=/usr)
-endef
-
-define QUAZIP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
+QUAZIP_CONF_OPTS = PREFIX=/usr
 
 define QUAZIP_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
@@ -29,4 +23,4 @@ define QUAZIP_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index f381ebbb7a..bed510c598 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -41,14 +41,11 @@ else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/QWT_CONFIG += QwtDll/'
 endif
 
-define QWT_CONFIGURE_CMDS
+define QWT_PRE_CONFIGURE_CMD
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
-define QWT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
+QWT_PRE_CONFIGURE_HOOKS += QWT_PRE_CONFIGURE_CMD
 
 # After installation, we fixup the INSTALL_PREFIX in qwtconfig.pri so
 # that when building with qmake, -L$(STAGING_DIR)/usr/lib is used and
@@ -64,4 +61,4 @@ define QWT_INSTALL_TARGET_CMDS
 	rm -Rf $(TARGET_DIR)/usr/mkspecs
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.21.0
