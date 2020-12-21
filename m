From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 12:41:30 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/qt5wayland: drop
 qt 5.6 support
Message-ID: <20201221124322.BCBE288314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3d75aed0328897447213ac2e208c8635d91c978
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7a962dacdcc3cd2f120aec1724770adb9feac64c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5wayland/qt5wayland.hash |  7 -------
 package/qt5/qt5wayland/qt5wayland.mk   | 19 +------------------
 2 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 0eadb6d309..88b85a8a17 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,6 +1,3 @@
-# hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtwayland-opensource-src-5.6.3.tar.xz.mirrorlist
-sha256 5a475278b2db73aa7fa7f3ba6d98d8d72774f5c77e172495007d79f91d09daa3 qtwayland-opensource-src-5.6.3.tar.xz
-
 # Hash from: https://download.qt.io/official_releases/qt/5.12/5.12.8/submodules/qtwayland-everywhere-src-5.12.8.tar.xz.sha256
 sha256  16dddccf0618be00f8396e6b5257e62a57022819d2db581b975258c716b9824a  qtwayland-everywhere-src-5.12.8.tar.xz
 
@@ -10,7 +7,3 @@ sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.
 sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
 sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768 LICENSE.LGPL3
 sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
-sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
-sha256 1996a36160b2158c2be264d2ddfa6148ebe0f1ececff55aca8d754a1ddcc7bb8 LICENSE.LGPLv21
-sha256 438c1f9a2b256e47dac33249f2ad6d4a9df643f1ec5312216d528a2f7ad82084 LGPL_EXCEPTION.txt
-sha256 5ceb37d1c7c1d92878b82af3c0fd5558087f3d5a08a3a4d43850bad4ad265a52 LICENSE.LGPLv3
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 4790efc660..6ea974f49a 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -18,13 +18,8 @@ ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
 QT5WAYLAND_DEPENDENCIES += libxkbcommon
 endif
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 QT5WAYLAND_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5WAYLAND_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
-else
-QT5WAYLAND_LICENSE = GPL-3.0 or LGPL-2.1 with exception or LGPL-3.0, GFDL-1.3 (docs)
-QT5WAYLAND_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.LGPLv3 LICENSE.FDL
-endif
 
 ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
 QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
@@ -43,16 +38,10 @@ define QT5WAYLAND_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 define QT5WAYLAND_INSTALL_COMPOSITOR
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandCompositor.so* $(TARGET_DIR)/usr/lib
 endef
-else
-define QT5WAYLAND_INSTALL_COMPOSITOR
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Compositor.so* $(TARGET_DIR)/usr/lib
-endef
-endif
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5WAYLAND_INSTALL_COMPOSITOR_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtWayland $(TARGET_DIR)/usr/qml/
 endef
@@ -60,17 +49,11 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
 define QT5WAYLAND_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/wayland $(TARGET_DIR)/usr/lib/qt/examples/
 endef
 endif
-else
-define QT5WAYLAND_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/wayland $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
 endif
 
 define QT5WAYLAND_INSTALL_TARGET_CMDS
