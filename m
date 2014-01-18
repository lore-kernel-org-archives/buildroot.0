From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 18 Jan 2014 20:23:42 +0100
Subject: [Buildroot] [PATCH 05/10] qt: add an option to install the test
	module
In-Reply-To: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
References: <1390073027-14239-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390073027-14239-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building Qt in a minimal configuration, a couple of Qt modules
(QtNetwork, QtSql, QtTest and QtXml) are built in addition to QtCore,
so they are installed in the sysroot but they are not copied into the
target tree.

Among these modules that could be built but optionally installed, only
QtTest had no option to allow being installed in the target fs.

Thus, programs linking against QtTest would successfully build, but
would miserably fail at runtime due to this missing dependency.

So far, the only package triggering this issue is OpenCV (the highgui
module built with Qt support).

A followup patch will add this missing dependency in OpenCV using this
new option.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/qt/Config.in | 7 +++++++
 package/qt/qt.mk     | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 926d54c..bd6496c 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -413,4 +413,11 @@ config BR2_PACKAGE_QT_DECLARATIVE
 	  Build the Qt Declarative Module for qml support
 	  if unsure, say n.
 
+config BR2_PACKAGE_QT_TEST
+	bool "Test Module"
+	default y
+	help
+	  Install the Test module.
+	  if unsure, say y
+
 endif # BR2_PACKAGE_QT
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 867b798..b63fa6f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -586,6 +586,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_GFX_POWERVR),y)
 QT_INSTALL_LIBS    += pvrQWSWSEGL
 endif
+ifeq ($(BR2_PACKAGE_QT_TEST),y)
+QT_INSTALL_LIBS    += QtTest
+endif
 
 QT_CONF_FILE=$(HOST_DIR)/usr/bin/qt.conf
 
-- 
1.8.5.3
