From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 16 Jul 2014 17:58:51 +0200
Subject: [Buildroot] [PATCH v2] qt5: Add an option to select default platform
Message-ID: <1405526331-31440-1-git-send-email-jezz@sysmic.org>
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
v2:
  * Use a string instead of a choice
  * Improve help message


 package/qt5/qt5base/Config.in  | 11 +++++++++++
 package/qt5/qt5base/qt5base.mk |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 24e5902..632711c 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -144,6 +144,17 @@ config BR2_PACKAGE_QT5BASE_EGLFS
 comment "eglfs backend available if OpenGLES and EGL are enabled"
 	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGLES
 
+config BR2_PACKAGE_QT5BASE_DEFAULT_QPA
+	string "Default graphical platform"
+	help
+	  Choose the default platform abstraction to use for graphical
+	  application (e.g xcb, linuxfb, eglfs, ...). If this is empty, the
+	  default for your architecture will be used (usually this is eglfs).
+
+	  You can get a list of supported platform by running a Qt application
+	  with the option "-platform help" on your target. You can choose a
+	  different platform at runtime with the -platform option.
+
 config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	bool "print support module"
 	select BR2_PACKAGE_QT5BASE_WIDGETS
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 618251e..fecde13 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -96,6 +96,9 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-xcb
 endif
 
+QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
+QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
+
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -opengl es2 -eglfs
 QT5BASE_DEPENDENCIES   += libgles libegl
-- 
2.0.1
