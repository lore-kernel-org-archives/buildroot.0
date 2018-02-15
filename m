From: Pierre Ducroquet <pinaraf@pinaraf.info>
Date: Thu, 15 Feb 2018 21:48:11 +0100
Subject: [Buildroot] [PATCH 1/5] Introduce KDE Frameworks 5 packages
Message-ID: <20180215204815.14707-1-pinaraf@pinaraf.info>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

KDE Frameworks 5 is a set of libraries built on the Qt framework providing a
lot of powerfull classes and solutions for developers building Qt
applications.
Unlike the previous KDE libraries, they are split in tiny packages, reducing
dependencies as much as possible, making them usable even for embedded
projects.

This first commit introduce the kf5 packages folder

Signed-off-by: Pierre Ducroquet <pinaraf@pinaraf.info>
---
 DEVELOPERS            |  3 +++
 package/Config.in     |  1 +
 package/kf5/Config.in |  9 +++++++++
 package/kf5/kf5.mk    | 11 +++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/kf5/Config.in
 create mode 100644 package/kf5/kf5.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c524cb6ac5..c0e061c764 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1957,3 +1957,6 @@ F:	package/qjson/
 F:	package/quazip/
 F:	package/shapelib/
 F:	package/tinc/
+
+N:	Pierre Ducroquet <pinaraf@pinaraf.info>
+F:	package/kf5/
diff --git a/package/Config.in b/package/Config.in
index 9cd5d9c087..f9d7a6e190 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -302,6 +302,7 @@ comment "Graphic libraries"
 comment "Other GUIs"
 	source "package/qt/Config.in"
 	source "package/qt5/Config.in"
+	source "package/kf5/Config.in"
 if BR2_PACKAGE_QT || BR2_PACKAGE_QT5
 comment "QT libraries and helper libraries"
 	source "package/grantlee/Config.in"
diff --git a/package/kf5/Config.in b/package/kf5/Config.in
new file mode 100644
index 0000000000..4e6ee3a107
--- /dev/null
+++ b/package/kf5/Config.in
@@ -0,0 +1,9 @@
+menuconfig BR2_PACKAGE_KF5
+	bool "KF5"
+	depends on BR2_PACKAGE_QT5
+	help
+	  This option enables the KF5 KDE Frameworks. Sub-options allow to
+	  select which modules should be built.
+
+if BR2_PACKAGE_KF5
+endif
diff --git a/package/kf5/kf5.mk b/package/kf5/kf5.mk
new file mode 100644
index 0000000000..14cae5fb74
--- /dev/null
+++ b/package/kf5/kf5.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# kf5
+#
+################################################################################
+
+KF5_VERSION_MAJOR = 5.43
+KF5_VERSION = $(KF5_VERSION_MAJOR).0
+KF5_SITE = https://download.kde.org/stable/frameworks/$(KF5_VERSION_MAJOR)
+
+include $(sort $(wildcard package/kf5/*/*.mk))
-- 
2.16.1
