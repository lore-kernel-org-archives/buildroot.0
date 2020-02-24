From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Feb 2020 23:20:30 +0100
Subject: [Buildroot] [PATCH 13/36] package/qt5quickcontrols: drop qt 5.6
 support
In-Reply-To: <20200224222054.2686-1-peter@korsgaard.com>
References: <20200224222054.2686-1-peter@korsgaard.com>
Message-ID: <20200224222054.2686-13-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5quickcontrols/Config.in             |  5 -----
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  6 ------
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk   | 12 ------------
 3 files changed, 23 deletions(-)

diff --git a/package/qt5/qt5quickcontrols/Config.in b/package/qt5/qt5quickcontrols/Config.in
index 59f6ca4114..56fcaf7053 100644
--- a/package/qt5/qt5quickcontrols/Config.in
+++ b/package/qt5/qt5quickcontrols/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_QT5QUICKCONTROLS
 	bool "qt5quickcontrols"
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT5_VERSION_LATEST
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
@@ -12,7 +11,3 @@ config BR2_PACKAGE_QT5QUICKCONTROLS
 	  that can be used to build complete interfaces in Qt Quick.
 
 	  http://doc.qt.io/qt-5/qtquickcontrols-index.html
-
-comment "qt5quickcontrols needs an OpenGL-capable backend"
-	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE && !BR2_PACKAGE_QT5_VERSION_LATEST
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 9ae6ac76d7..a0f8dab10b 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,13 +1,7 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 31bb0fc8f21b855af6ff02c415be3246128b523d0ef7c05e248e92281ab0db8e qtquickcontrols-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.7/submodules/qtquickcontrols-everywhere-src-5.12.7.tar.xz.sha256
 sha256 1038bbc76bba53f9634f40cd9c8ebf0ed8ae82e791f727b228bd81bdcf1859e5 qtquickcontrols-everywhere-src-5.12.7.tar.xz
 
 # Hashes for license files:
-sha256 edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253 LICENSE.GPLv2
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 3e0c5effb3..a3b3a3f64a 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -11,12 +11,7 @@ QT5QUICKCONTROLS_DEPENDENCIES = qt5base qt5declarative
 QT5QUICKCONTROLS_INSTALL_STAGING = YES
 
 QT5QUICKCONTROLS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
-
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.LGPL3 LICENSE.FDL
-else
-QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
@@ -42,18 +37,11 @@ define QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-define QT5QUICKCONTROLS_INSTALL_TARGET_LAYOUTS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Layouts $(TARGET_DIR)/usr/qml/QtQuick
-endef
-endif
-
 define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
 	$(QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS)
-	$(QT5QUICKCONTROLS_INSTALL_TARGET_LAYOUTS)
 	$(QT5QUICKCONTROLS_INSTALL_TARGET_EXAMPLES)
 endef
 
-- 
2.20.1
