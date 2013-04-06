From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sat,  6 Apr 2013 17:20:30 +0200
Subject: [Buildroot] [PATCH] qjson: new package
Message-ID: <1365261630-17445-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/Config.in                                  |    1 +
 package/qjson/Config.in                            |    8 ++++++
 ...0.8.1-fix-Qt4-package-error-in-CMakeLists.patch |   27 ++++++++++++++++++++
 package/qjson/qjson.mk                             |   13 ++++++++++
 4 files changed, 49 insertions(+)
 create mode 100644 package/qjson/Config.in
 create mode 100644 package/qjson/qjson-0.8.1-fix-Qt4-package-error-in-CMakeLists.patch
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
index 0000000..e21a336
--- /dev/null
+++ b/package/qjson/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_QJSON
+	bool "qjson"
+    depends on BR2_PACKAGE_QT
+	help
+      QJson is a Qt-based library that maps JSON data to 
+      QVariant objects and vice versa.
+	  
+      http://qjson.sourceforge.net
diff --git a/package/qjson/qjson-0.8.1-fix-Qt4-package-error-in-CMakeLists.patch b/package/qjson/qjson-0.8.1-fix-Qt4-package-error-in-CMakeLists.patch
new file mode 100644
index 0000000..736438b
--- /dev/null
+++ b/package/qjson/qjson-0.8.1-fix-Qt4-package-error-in-CMakeLists.patch
@@ -0,0 +1,27 @@
+From 529e50939316abc3c4190f89a482b17a4d4b3355 Mon Sep 17 00:00:00 2001
+From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+Date: Sat, 6 Apr 2013 16:54:25 +0200
+Subject: [PATCH 1/1] fix Qt4 package error in CMakeLists.txt
+
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
index 0000000..ea4b875
--- /dev/null
+++ b/package/qjson/qjson.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# qjson
+#
+#############################################################
+
+QJSON_VERSION = 0.8.1
+QJSON_SITE = git://github.com/flavio/qjson.git 
+QJSON_INSTALL_STAGING = YES
+QJSON_DEPENDENCIES =  qt
+
+$(eval $(cmake-package))
+
-- 
1.7.10.4
