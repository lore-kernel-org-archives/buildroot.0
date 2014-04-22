From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:33 +0200
Subject: [Buildroot] [PATCH v2 01/24] qt: add an option to install the test
	module
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-2-git-send-email-s.martin49@gmail.com>
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
changes v1 -> v2:
- rebase
- change default value to n
---
 package/qt/Config.in | 5 +++++
 package/qt/qt.mk     | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index eed25c8..9faf2cd 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -415,4 +415,9 @@ config BR2_PACKAGE_QT_DECLARATIVE
 	  Build the Qt Declarative Module for qml support
 	  if unsure, say n.
 
+config BR2_PACKAGE_QT_TEST
+	bool "Test Module"
+	help
+	  Install the Test module.
+
 endif # BR2_PACKAGE_QT
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 507e0db..bb065f3 100644
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
1.9.2
