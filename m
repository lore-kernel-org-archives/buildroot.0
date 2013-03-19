From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 20:29:35 +0100
Subject: [Buildroot] [PATCH v4 02/21] qt5base: add eglfs graphics backend
In-Reply-To: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1363721394-14973-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in                      |   11 ++++++-
 ...nce-add-egl-to-CONFIG-to-get-correct-incl.patch |   32 ++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk                     |    9 ++++--
 3 files changed, 49 insertions(+), 3 deletions(-)
 create mode 100644 package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 801ef6f..0af5df6 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -59,7 +59,8 @@ config BR2_PACKAGE_QT5BASE_GUI
 	# linuxfb if nothing is enabled.
 	select BR2_PACKAGE_QT5BASE_LINUXFB if \
 	       !BR2_PACKAGE_QT5BASE_DIRECTFB && \
-	       !BR2_PACKAGE_QT5BASE_XCB
+	       !BR2_PACKAGE_QT5BASE_XCB && \
+	       !BR2_PACKAGE_QT5BASE_EGLFS
 	help
 	  This option enables the Qt5Gui library.
 
@@ -89,6 +90,14 @@ config BR2_PACKAGE_QT5BASE_XCB
 comment "X.org XCB backend available if X.org is enabled"
 	depends on !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_QT5BASE_EGLFS
+	bool "eglfs support"
+	depends on BR2_PACKAGE_HAS_OPENGL_EGL
+	depends on BR2_PACKAGE_HAS_OPENGL_ES
+
+comment "eglfs backend available if OpenGLES and EGL are enabled"
+	depends on !BR2_PACKAGE_HAS_OPENGL_EGL || !BR2_PACKAGE_HAS_OPENGL_ES
+
 config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	bool "print support module"
 	select BR2_PACKAGE_QT5BASE_WIDGETS
diff --git a/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch b/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
new file mode 100644
index 0000000..a85a5aa
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-eglconvenience-add-egl-to-CONFIG-to-get-correct-incl.patch
@@ -0,0 +1,32 @@
+From 588c60d0c3d11e79d19860fa62b03c935658d13a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 13 Jan 2013 14:36:48 +0100
+Subject: [PATCH qtbase] eglconvenience: add egl to CONFIG to get correct include
+ paths
+
+The eglconvenience code includes <EGL/egl.h>. Therefore, it should get
+the appropriate EGL-specific include paths from QMAKE_INCDIR_EGL,
+otherwise the build might if the EGL library has its headers in
+special locations. In order to achieve this, we simply add the "egl"
+feature to the list of features imported by eglconvenience.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ .../eglconvenience/eglconvenience.pri              |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/platformsupport/eglconvenience/eglconvenience.pri b/src/platformsupport/eglconvenience/eglconvenience.pri
+index 188eb1c..8996cea 100644
+--- a/src/platformsupport/eglconvenience/eglconvenience.pri
++++ b/src/platformsupport/eglconvenience/eglconvenience.pri
+@@ -5,6 +5,7 @@ contains(QT_CONFIG,egl) {
+     SOURCES += \
+         $$PWD/qeglconvenience.cpp \
+         $$PWD/qeglplatformcontext.cpp
++    CONFIG += egl
+ 
+     contains(QT_CONFIG,xlib) {
+         HEADERS += \
+-- 
+1.7.9.5
+
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 736965d..700bc67 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -20,9 +20,7 @@ QT5BASE_INSTALL_STAGING = YES
 #    want to use the one packaged in Buildroot
 QT5BASE_CONFIGURE_OPTS += \
 	-optimized-qmake \
-	-no-eglfs \
 	-no-kms \
-	-no-opengl \
 	-no-glib \
 	-no-cups \
 	-no-nis \
@@ -81,6 +79,13 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-xcb
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
+QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
+QT5BASE_DEPENDENCIES   += libgles libegl
+else
+QT5BASE_CONFIGURE_OPTS += -no-opengl -no-eglfs
+endif
+
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
 
-- 
1.7.9.5
