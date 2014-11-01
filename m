From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  1 Nov 2014 23:15:08 +0100
Subject: [Buildroot] [PATCH 1/4] package: prepare to support modules that
	work with Qt or Qt5
Message-ID: <1414880111-19166-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, all the Qt external modules (qtuio, qjson, etc.) can only
be compiled against Qt4. However, some of them (qjson, qextserialport
at least) can compile with either Qt4 or Qt5.

Therefore, this commit adjusts the Config.in logic to make it possible
for certain modules to be selected with either Qt4 or Qt5. We use the
same approach as the one of for Python 2 vs. Python 3 modules:

 - in package/Config.in, the package Config.in files are included
   either if BR2_PACKAGE_QT or BR2_PACKAGE_QT5 are enabled.

 - each individual package is then responsible for having a dependency
   on either BR2_PACKAGE_QT, or BR2_PACKAGE_QT5 or both depending on
   what they support. In this commit, we add a dependency on
   BR2_PACKAGE_QT to all packages, since for now, they only support
   Qt4.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          | 6 ++----
 package/grantlee/Config.in | 1 +
 package/qjson/Config.in    | 1 +
 package/qtuio/Config.in    | 2 ++
 package/qwt/Config.in      | 2 ++
 5 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3b3c372..28cf703 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -223,8 +223,8 @@ endif
 comment "Other GUIs"
 	source "package/efl/Config.in"
 	source "package/qt/Config.in"
-
-if BR2_PACKAGE_QT
+	source "package/qt5/Config.in"
+if BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 comment "QT libraries and helper libraries"
 	source "package/grantlee/Config.in"
 	source "package/qextserialport/Config.in"
@@ -232,8 +232,6 @@ comment "QT libraries and helper libraries"
 	source "package/qtuio/Config.in"
 	source "package/qwt/Config.in"
 endif
-
-	source "package/qt5/Config.in"
 	source "package/weston/Config.in"
 	source "package/x11r7/Config.in"
 
diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 09ec70c..ce1342c 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
 	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
+	depends on BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_SCRIPT
 	select BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/qjson/Config.in b/package/qjson/Config.in
index c15b12f..2dc2cc4 100644
--- a/package/qjson/Config.in
+++ b/package/qjson/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QJSON
 	bool "qjson"
+	depends on BR2_PACKAGE_QT
 	help
 	  QJson is a Qt-based library that maps JSON data to
 	  QVariant objects and vice versa.
diff --git a/package/qtuio/Config.in b/package/qtuio/Config.in
index f3f5e3c..f46f1dd 100644
--- a/package/qtuio/Config.in
+++ b/package/qtuio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QTUIO
 	bool "qtuio"
+	depends on BR2_PACKAGE_QT
 	depends on BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  Implementation of an interface connecting TUIO messages
@@ -17,4 +18,5 @@ config BR2_QTUIO_EXAMPLES
 endif
 
 comment "qtuio depends on QT gui module"
+	depends on BR2_PACKAGE_QT
 	depends on !BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/qwt/Config.in b/package/qwt/Config.in
index 7718b59..8c7bc56 100644
--- a/package/qwt/Config.in
+++ b/package/qwt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QWT
 	bool "qwt"
+	depends on BR2_PACKAGE_QT
 	depends on BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  Qwt is a graphics extension to the Qt GUI application
@@ -25,4 +26,5 @@ config BR2_PACKAGE_QWT_OPENGL
 endif
 
 comment "qwt depends on QT gui module"
+	depends on BR2_PACKAGE_QT
 	depends on !BR2_PACKAGE_QT_GUI_MODULE
-- 
2.0.0
