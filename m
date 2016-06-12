From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 22:25:59 +0200
Subject: [Buildroot] [git commit] package/qt: Add optional support for OpenGL
Message-ID: <20160612202630.BAF9C8050F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1662f7dc58d31c81a5d34d17b965ac7bf9f29a8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenGL support is only available for the desktop variant of Qt4 and not
the embedded one: http://code.qt.io/cgit/qt/qt.git/tree/configure#n6612

This patch is needed to fix a compile error with libv4l which depends
on OpenGL support if qt4 is used by libv4l as optional dependency.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in | 20 ++++++++++++++++++++
 package/qt/qt.mk     |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 0ab8417..14b13ce 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -350,6 +350,24 @@ config BR2_PACKAGE_QT_PHONON_BACKEND
 	  Build the platform Phonon plugin.
 	  If unsure, say n.
 
+choice
+	prompt "OpenGL API"
+	help
+	  Select OpenGL API.
+
+config BR2_PACKAGE_QT_OPENGL_NONE
+	bool "No OpenGL support"
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
@@ -357,6 +375,8 @@ config BR2_PACKAGE_QT_OPENGL_ES
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
