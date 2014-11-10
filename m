From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 10 Nov 2014 14:00:40 +0100
Subject: [Buildroot] [PATCH] qt-gstreamer: new package
Message-ID: <1415624440-16907-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QtGStreamer is a set of libraries providing C++ bindings for GStreamer
with a Qt-style API, plus some helper classes and elements for
integrating GStreamer better in Qt applications.

Notice that in order to be compatible with gstreamer 0.10 and 1.x, this
patch add support for either qt-gstreamer 0.10 and 1.x. I hesitated to
split these two versions in two separate packages. Finaly, I noticed if I
made two packages there would be a lot of code duplication (even patches
are exactly sames).

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/Config.in                                  |  1 +
 package/qt-gstreamer/Config.in                     | 24 ++++++
 .../qt-gstreamer-0001-install-examples.patch       | 50 +++++++++++++
 ...eamer-0002-fix-quick1-module-install-path.patch | 12 +++
 package/qt-gstreamer/qt-gstreamer.mk               | 87 ++++++++++++++++++++++
 5 files changed, 174 insertions(+)
 create mode 100644 package/qt-gstreamer/Config.in
 create mode 100644 package/qt-gstreamer/qt-gstreamer-0001-install-examples.patch
 create mode 100644 package/qt-gstreamer/qt-gstreamer-0002-fix-quick1-module-install-path.patch
 create mode 100644 package/qt-gstreamer/qt-gstreamer.mk

diff --git a/package/Config.in b/package/Config.in
index 28cf703..09df62d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -26,6 +26,7 @@ menu "Audio and video applications"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
 	source "package/pulseaudio/Config.in"
+	source "package/qt-gstreamer/Config.in"
 	source "package/sox/Config.in"
 	source "package/tidsp-binaries/Config.in"
 	source "package/tstools/Config.in"
diff --git a/package/qt-gstreamer/Config.in b/package/qt-gstreamer/Config.in
new file mode 100644
index 0000000..81572e2
--- /dev/null
+++ b/package/qt-gstreamer/Config.in
@@ -0,0 +1,24 @@
+comment "qt-gstreamer need Qt (4 or 5) and gstreamer (0.10 or 1.0)"
+	depends on !(BR2_PACKAGE_QT5 || BR2_PACKAGE_QT4)
+	depends on !(BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1)
+
+config BR2_PACKAGE_QT_GSTREAMER
+	bool "qt-gstreamer"
+	select BR2_PACKAGE_BOOST
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT4
+	depends on BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1
+	help
+	  QtGStreamer is a set of libraries providing C++ bindings for GStreamer
+	  with a Qt-style API, plus some helper classes and elements for
+	  integrating GStreamer better in Qt applications.
+
+	  http://gstreamer.freedesktop.org/modules/qt-gstreamer.html
+
+if BR2_PACKAGE_QT_GSTREAMER
+
+config BR2_PACKAGE_QT_GSTREAMER_EXAMPLES
+	bool "Install exemples"
+	help
+	  Compile and install exemples on target
+
+endif
diff --git a/package/qt-gstreamer/qt-gstreamer-0001-install-examples.patch b/package/qt-gstreamer/qt-gstreamer-0001-install-examples.patch
new file mode 100644
index 0000000..13e3f30
--- /dev/null
+++ b/package/qt-gstreamer/qt-gstreamer-0001-install-examples.patch
@@ -0,0 +1,50 @@
+diff -ru a/examples/appsink-src/CMakeLists.txt b/examples/appsink-src/CMakeLists.txt
+--- a/examples/appsink-src/CMakeLists.txt	2013-10-14 08:44:40.000000000 +0000
++++ b/examples/appsink-src/CMakeLists.txt	2014-10-21 08:55:56.993360084 +0000
+@@ -20,3 +20,6 @@
+ add_executable(appsink-src main.cpp)
+ target_link_libraries(appsink-src ${QTGSTREAMER_UTILS_LIBRARIES})
+ qt4or5_use_modules(appsink-src Core)
++install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/appsink-src
++        DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt/examples/qt-gstreamer/appsink-src)
++
+diff -ru a/examples/player/CMakeLists.txt b/examples/player/CMakeLists.txt
+--- a/examples/player/CMakeLists.txt	2013-10-14 08:44:40.000000000 +0000
++++ b/examples/player/CMakeLists.txt	2014-10-21 08:56:14.602434867 +0000
+@@ -21,3 +21,6 @@
+ add_executable(player ${player_SOURCES})
+ target_link_libraries(player ${QTGSTREAMER_UI_LIBRARIES})
+ qt4or5_use_modules(player Core Gui Widgets)
++install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/player
++        DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt/examples/qt-gstreamer/player)
++
+diff -ru a/examples/qmlplayer/CMakeLists.txt b/examples/qmlplayer/CMakeLists.txt
+--- a/examples/qmlplayer/CMakeLists.txt	2013-10-14 08:44:40.000000000 +0000
++++ b/examples/qmlplayer/CMakeLists.txt	2014-10-21 08:57:27.894908328 +0000
+@@ -48,3 +48,6 @@
+ if (Qt4or5_OpenGL_FOUND AND (OPENGL_FOUND OR OPENGLES2_FOUND))
+     qt4or5_use_modules(qmlplayer OpenGL)
+ endif()
++install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/qmlplayer
++        DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt/examples/qt-gstreamer/qmlplayer)
++
+diff -ru a/examples/recorder/CMakeLists.txt b/examples/recorder/CMakeLists.txt
+--- a/examples/recorder/CMakeLists.txt	2013-10-14 08:44:40.000000000 +0000
++++ b/examples/recorder/CMakeLists.txt	2014-10-21 08:58:53.024104251 +0000
+@@ -20,3 +20,6 @@
+ add_executable(recorder main.cpp ${recorder_UI_SRCS})
+ target_link_libraries(recorder ${QTGSTREAMER_LIBRARIES})
+ qt4or5_use_modules(recorder Core Gui Widgets)
++install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/recorder
++        DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt/examples/qt-gstreamer/recorder)
++
+diff -ru a/examples/voip/CMakeLists.txt b/examples/voip/CMakeLists.txt
+--- a/examples/voip/CMakeLists.txt	2013-10-14 08:44:40.000000000 +0000
++++ b/examples/voip/CMakeLists.txt	2014-10-21 08:59:22.321892464 +0000
+@@ -20,3 +20,6 @@
+ add_executable(voip main.cpp ${voip_UI_SRCS})
+ target_link_libraries(voip ${QTGSTREAMER_UI_LIBRARIES})
+ qt4or5_use_modules(voip Core Gui Widgets)
++install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/voip
++        DESTINATION ${CMAKE_INSTALL_LIBDIR}/qt/examples/qt-gstreamer/voip)
++
diff --git a/package/qt-gstreamer/qt-gstreamer-0002-fix-quick1-module-install-path.patch b/package/qt-gstreamer/qt-gstreamer-0002-fix-quick1-module-install-path.patch
new file mode 100644
index 0000000..6d5d3c5
--- /dev/null
+++ b/package/qt-gstreamer/qt-gstreamer-0002-fix-quick1-module-install-path.patch
@@ -0,0 +1,12 @@
+diff -ru a/qt-gstreamer-0.10.3/CMakeLists.txt b/qt-gstreamer-0.10.3/CMakeLists.txt
+--- a/CMakeLists.txt	2013-10-14 08:44:40.000000000 +0000
++++ b/CMakeLists.txt	2014-10-21 12:19:49.475542801 +0000
+@@ -161,6 +161,8 @@
+         set(QTGSTREAMER_QTQUICK1_INSTALL_DIR ${CMAKE_INSTALL_LIBDIR}/qt4/imports)
+     endif()
+ endif()
++set(QTGSTREAMER_QTQUICK1_INSTALL_DIR ${QTGSTREAMER_QTQUICK1_INSTALL_DIR} CACHE PATH "Installation path QtQuick1 modules")
++set(QTGSTREAMER_QTQUICK2_INSTALL_DIR ${QTGSTREAMER_QTQUICK2_INSTALL_DIR} CACHE PATH "Installation path QtQuick2 modules")
+ 
+ 
+ if (QTGSTREAMER_CODEGEN AND FLEX_FOUND AND BISON_FOUND)
diff --git a/package/qt-gstreamer/qt-gstreamer.mk b/package/qt-gstreamer/qt-gstreamer.mk
new file mode 100644
index 0000000..777c71a
--- /dev/null
+++ b/package/qt-gstreamer/qt-gstreamer.mk
@@ -0,0 +1,87 @@
+################################################################################
+#
+# qt-gstreamer
+#
+################################################################################
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+QT_GSTREAMER_VERSION = 1.2.0
+QT_GSTREAMER_SOURCE = qt-gstreamer-$(QT_GSTREAMER_VERSION).tar.xz
+else
+QT_GSTREAMER_VERSION = 0.10.3
+QT_GSTREAMER_SOURCE = qt-gstreamer-$(QT_GSTREAMER_VERSION).tar.gz
+endif
+QT_GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/qt-gstreamer
+QT_GSTREAMER_DEPENDENCIES = boost
+QT_GSTREAMER_LICENSE = LGPLv2.1
+QT_GSTREAMER_LICENSE_FILES = COPYING
+QT_GSTREAMER_INSTALL_STAGING = YES
+QT_GSTREAMER_CONF_OPTS = -DUSE_GST_PLUGIN_DIR=ON -DUSE_QT_PLUGIN_DIR=ON \
+	-DQTGSTREAMER_QTQUICK1_INSTALL_DIR=/usr/imports -DQTGSTREAMER_QTQUICK2_INSTALL_DIR=/usr/qml
+
+ifeq ($(BR2_PREFER_STATIC),y)
+QT_GSTREAMER_CONF_OPTS += -DQTGSTREAMER_STATIC=ON
+endif
+
+ifeq ($(BR2_PACKAGE_QT_GSTREAMER_EXAMPLES),y)
+QT_GSTREAMER_CONF_OPTS += -DQTGSTREAMER_EXAMPLES=ON
+endif
+
+ifeq ($(BR2_PACKAGE_QT5QUICK1),y)
+QT_GSTREAMER_DEPENDENCIES += qt5quick1
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT_GSTREAMER_DEPENDENCIES += qt5declarative
+endif
+
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+QT_GSTREAMER_DEPENDENCIES += qt5base
+QT_GSTREAMER_CONF_OPTS += -DQT_VERSION=5
+else
+ifeq ($(BR2_PACKAGE_QT),y)
+QT_GSTREAMER_DEPENDENCIES += qt
+QT_GSTREAMER_CONF_OPTS += -DQT_VERSION=4
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+QT_GSTREAMER_DEPENDENCIES += gst1-plugins-base
+QT_GSTREAMER_GST_VERSION = gstreamer-1.0
+else
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+QT_GSTREAMER_DEPENDENCIES += gst-plugins-base
+QT_GSTREAMER_GST_VERSION = gstreamer-0.10
+endif
+endif
+
+# QtQuick2 is only support in Qt-Gstreamer 1.2
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
+define QT_GSTREAMER_INSTALL_TARGET_QML
+	cp -a $(STAGING_DIR)/usr/qml/QtGStreamer $(TARGET_DIR)/usr/qml
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_QT5QUICK1),y)
+define QT_GSTREAMER_INSTALL_TARGET_QUICK
+	cp -a $(STAGING_DIR)/usr/imports/QtGStreamer $(TARGET_DIR)/usr/imports
+endef
+endif
+
+define QT_GSTREAMER_INSTALL_TARGET_LIBS
+	cp -a $(STAGING_DIR)/usr/lib/$(QT_GSTREAMER_GST_VERSION)/libgstqt5videosink* $(TARGET_DIR)/usr/lib/$(QT_GSTREAMER_GST_VERSION)
+	cp -a $(STAGING_DIR)/usr/lib/libQt5GLib* $(TARGET_DIR)/usr/lib
+	cp -a $(STAGING_DIR)/usr/lib/libQt5GStreamer* $(TARGET_DIR)/usr/lib
+	cp -a $(STAGING_DIR)/usr/lib/libQt5GStreamerUi* $(TARGET_DIR)/usr/lib
+	cp -a $(STAGING_DIR)/usr/lib/libQt5GStreamerUtils* $(TARGET_DIR)/usr/lib
+endef
+
+define QT_GSTREAMER_INSTALL_TARGET_CMDS
+	$(QT_GSTREAMER_INSTALL_TARGET_LIBS)
+	$(QT_GSTREAMER_INSTALL_TARGET_QML)
+	$(QT_GSTREAMER_INSTALL_TARGET_QUICK)
+	$(call QT5_INSTALL_TARGET_EXAMPLES,qt-gstreamer)
+endef
+
+$(eval $(cmake-package))
+
-- 
1.9.1
