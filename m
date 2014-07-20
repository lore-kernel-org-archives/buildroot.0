From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:57:45 +0200
Subject: [Buildroot] [git commit] qt5base: allow selection of OpenGL API
Message-ID: <20140720095916.F2FBB9D1E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89611dc08f53e62020cd54b070759557dbfc0f54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in          |    5 ++++
 package/qt5/qt5base/Config.in  |   46 +++++++++++++++++++++++++++++++++++++--
 package/qt5/qt5base/qt5base.mk |   18 ++++++++++++---
 3 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 1f6920a..83f02f1 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -1,3 +1,8 @@
+config BR2_PACKAGE_QT5_GL_AVAILABLE
+	bool
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+	default y
+
 config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	bool
 	# Javascript engine is only available on certain architectures
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 490ee3e..fe742f3 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -116,6 +116,45 @@ config BR2_PACKAGE_QT5BASE_WIDGETS
 	help
 	  This option enables the Qt5Widgets library.
 
+comment "OpenGL support needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT5_GL_AVAILABLE
+
+config BR2_PACKAGE_QT5BASE_OPENGL
+	bool "OpenGL support"
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	help
+	  This option enables OpenGL support.
+
+if BR2_PACKAGE_QT5BASE_OPENGL
+
+choice
+	prompt "OpenGL API"
+	help
+	  Select OpenGL API.
+
+config BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP
+	bool "Desktop OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  Use desktop OpenGL.
+
+config BR2_PACKAGE_QT5BASE_OPENGL_ES2
+	bool "OpenGL ES 2.0+"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	help
+	  Use OpenGL ES 2.0 and later versions.
+
+endchoice
+
+config BR2_PACKAGE_QT5BASE_OPENGL_LIB
+	bool "opengl module"
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+	help
+	  This option enables the Qt5OpenGL library. This library includes
+	  OpenGL support classes provided to ease porting from Qt 4.x.
+
+endif
+
 config BR2_PACKAGE_QT5BASE_LINUXFB
 	bool "linuxfb support"
 
@@ -138,11 +177,12 @@ comment "X.org XCB backend available if X.org is enabled"
 
 config BR2_PACKAGE_QT5BASE_EGLFS
 	bool "eglfs support"
+	select BR2_PACKAGE_QT5BASE_OPENGL
 	depends on BR2_PACKAGE_HAS_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBGLES
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
 
-comment "eglfs backend available if OpenGLES and EGL are enabled"
-	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
+comment "eglfs backend available if OpenGL and EGL are enabled"
+	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_QT5_GL_AVAILABLE
 
 config BR2_PACKAGE_QT5BASE_DEFAULT_QPA
 	string "Default graphical platform"
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index fecde13..712208f 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -96,12 +96,22 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-xcb
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),y)
+QT5BASE_CONFIGURE_OPTS += -opengl desktop
+QT5BASE_DEPENDENCIES   += libgl
+else ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL_ES2),y)
+QT5BASE_CONFIGURE_OPTS += -opengl es2
+QT5BASE_DEPENDENCIES   += libgles
+else
+QT5BASE_CONFIGURE_OPTS += -no-opengl
+endif
+
 QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
 QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
-QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
-QT5BASE_DEPENDENCIES   += libgles libegl
+QT5BASE_CONFIGURE_OPTS += -eglfs
+QT5BASE_DEPENDENCIES   += libegl
 ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
 QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
 	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
@@ -111,7 +121,7 @@ QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
 	$(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
 endif
 else
-QT5BASE_CONFIGURE_OPTS += -no-opengl -no-eglfs
+QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
@@ -146,7 +156,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5OpenGL
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
