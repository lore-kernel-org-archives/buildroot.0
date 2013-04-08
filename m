From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Mon,  8 Apr 2013 22:35:48 +0200
Subject: [Buildroot] [PATCH resend] qjson: new package
Message-ID: <1365453348-21409-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/Config.in                                  |    1 +
 package/qjson/Config.in                            |    7 +++++
 ...qjson-fix-qt4-package-error-in-cmakelists.patch |   29 ++++++++++++++++++++
 package/qjson/qjson.mk                             |   16 +++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 package/qjson/Config.in
 create mode 100644 package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch
 create mode 100644 package/qjson/qjson.mk

diff --git a/package/Config.in b/package/Config.in
index 69d87f0..f84d8d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -143,6 +143,7 @@ if BR2_PACKAGE_QT
 comment "QT libraries and helper libraries"
 source "package/grantlee/Config.in"
 source "package/qextserialport/Config.in"
+source "package/qjson/Config.in"
 source "package/qtuio/Config.in"
 source "package/qwt/Config.in"
 endif
diff --git a/package/qjson/Config.in b/package/qjson/Config.in
new file mode 100644
index 0000000..145fc3d
--- /dev/null
+++ b/package/qjson/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QJSON
+	bool "qjson"
+	help
+	  QJson is a Qt-based library that maps JSON data to 
+	  QVariant objects and vice versa.
+	  
+	  http://qjson.sourceforge.net
diff --git a/package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch b/package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch
new file mode 100644
index 0000000..f2559e4
--- /dev/null
+++ b/package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch
@@ -0,0 +1,29 @@
+From 529e50939316abc3c4190f89a482b17a4d4b3355 Mon Sep 17 00:00:00 2001
+From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+Date: Sat, 6 Apr 2013 16:54:25 +0200
+Subject: [PATCH] fix Qt4 package error in CMakeLists.txt
+
+Avoid checking for uic executable by cmake as it results configure 
+time error if QtGui isn't installed.
+
+Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+---
+ CMakeLists.txt |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 13e65f1..447f209 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -32,7 +32,7 @@ SET(FRAMEWORK_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/Library/Frameworks"
+ SET(QT_USE_IMPORTED_TARGETS TRUE)
+ 
+ # Find Qt4
+-FIND_PACKAGE( Qt4 REQUIRED )
++find_package(Qt4 COMPONENTS QtCore REQUIRED )
+ 
+ IF (NOT WIN32)
+   SET( QT_DONT_USE_QTGUI TRUE )
+-- 
+1.7.10.4
+
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
new file mode 100644
index 0000000..e856d47
--- /dev/null
+++ b/package/qjson/qjson.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# qjson
+#
+#############################################################
+
+QJSON_VERSION = 0.8.1
+
+QJSON_SITE = http://github.com/flavio/qjson/tarball/$(QJSON_VERSION)
+QJSON_INSTALL_STAGING = YES
+QJSON_DEPENDENCIES =  qt
+QJSON_LICENSE = LGPLv2.1
+QJSON_LICENSE_FILES = COPYING.lib
+
+$(eval $(cmake-package))
+
-- 
1.7.10.4
