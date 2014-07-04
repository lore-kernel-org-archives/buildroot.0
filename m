From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  4 Jul 2014 11:36:11 +0200
Subject: [Buildroot] [PATCH] qt5: Add an option to select default platform
Message-ID: <1404466571-27586-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Whithout this path, default platform is automaticaly set (generally
set to "eglfs" as defined in
qt5base/mkspecs/devices/common/linux_device_pre.conf:1). This choice
is not always what the user would like. Thus, user have to manually
appends "-platform <BACKEND>" to command line when running any qt5
application.

This patch allows user to choose default platform explicitly.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/qt5/qt5base/Config.in  | 43 ++++++++++++++++++++++++++++++++++++++++++
 package/qt5/qt5base/qt5base.mk |  6 ++++++
 2 files changed, 49 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 70ddcd3..5fa7c02 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -144,6 +144,49 @@ config BR2_PACKAGE_QT5BASE_EGLFS
 comment "eglfs backend available if OpenGLES and EGL are enabled"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
 
+choice
+	prompt "default graphical platform"
+	default BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL
+	help
+	  Notice you may choose platform at runtime using -platform (-platform
+	  help to get list of compiled platforms).
+
+config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL
+	bool "minimal"
+
+config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_OFFSCREEN
+	bool "offscreen"
+
+config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_LINUXFB
+	bool "linuxfb"
+	depends on BR2_PACKAGE_QT5BASE_LINUXFB
+
+comment 'linuxfb needs linuxfb support enabled'
+	depends on !BR2_PACKAGE_QT5BASE_LINUXFB
+
+config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_DIRECTFB
+	bool "directfb"
+	depends on BR2_PACKAGE_QT5BASE_DIRECTFB
+
+comment 'directfb needs directfb support enabled'
+	depends on !BR2_PACKAGE_QT5BASE_DIRECTFB
+
+config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_XCB
+	bool "xcb"
+	depends on BR2_PACKAGE_QT5BASE_XCB
+
+comment 'xcb needs X.org XCB support enabled'
+	depends on !BR2_PACKAGE_QT5BASE_XCB
+
+config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_EGLFS
+	bool "eglfs"
+	depends on BR2_PACKAGE_QT5BASE_EGLFS
+
+comment 'eglfs needs eglfs support enabled'
+	depends on !BR2_PACKAGE_QT5BASE_EGLFS
+
+endchoice
+
 config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	bool "print support module"
 	select BR2_PACKAGE_QT5BASE_WIDGETS
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 618251e..9018ff8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -96,6 +96,12 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-xcb
 endif
 
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL),-qpa minimalb)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_OFFSCREEN),-qpa offscreen)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_LINUXFB),-qpa linuxfb)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_XCB),-qpa xcb)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_EGLFS),-qpa eglfs)
+
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
 QT5BASE_DEPENDENCIES   += libgles libegl
-- 
2.0.0
