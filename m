From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Jun 2016 11:30:19 +0200
Subject: [Buildroot] [PATCH 1/5] package/qt: Add optional support for OpenGL
Message-ID: <1465723823-6113-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenGL support is only available for the desktop variant of Qt4 and not
the embedded one: http://code.qt.io/cgit/qt/qt.git/tree/configure#n6612

This patch is needed to fix a compile error with libv4l which depends
on OpenGL support if qt4 is used by libv4l as optional dependency.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/qt/Config.in | 17 +++++++++++++++++
 package/qt/qt.mk     |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 0ab8417..4aa5324 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -350,6 +350,21 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 	  Build the platform Phonon plugin.
 	  If unsure, say n.
 
+choice
+	prompt "OpenGL API"
+	help
+	  Select OpenGL API.
+
+comment "Desktop OpenGL not available (needs Qt standard (X11))"
+	depends on !BR2_PACKAGE_QT_X11
+
+config BR2_PACKAGE_QT_OPENGL_GL_DESKTOP
+	bool "Desktop OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	depends on BR2_PACKAGE_QT_X11
+	help
+	  Use desktop OpenGL.
+
 config BR2_PACKAGE_QT_OPENGL_ES
 	bool "OpenGL ES v2.x support"
 	depends on BR2_PACKAGE_HAS_LIBGLES
@@ -357,6 +372,8 @@ config BR2_PACKAGE_QT_OPENGL_ES
 	help
 	  Enable the OpenGL ES v2.x support.
 
+endchoice
+
 endif
 
 config BR2_PACKAGE_QT_DBUS
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index f29a671..d56fe7e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -336,6 +336,9 @@ QT_DEPENDENCIES += libgles libegl
 QT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
 QT_CXXFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags egl`
 QT_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs egl`
+else ifeq ($(BR2_PACKAGE_QT_OPENGL_GL_DESKTOP),y)
+QT_CONFIGURE_OPTS += -opengl desktop
+QT_DEPENDENCIES += libgl
 else
 QT_CONFIGURE_OPTS += -no-opengl
 endif
-- 
2.8.1
