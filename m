From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 23:05:58 +0200
Subject: [Buildroot] [git commit] qt: add an option to install the test
	module
Message-ID: <20140503211218.A54AC9CAD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cd9830e7388700e2b42659538307e9c6e4764b3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |    5 +++++
 package/qt/qt.mk     |    3 +++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 8d67e37..0a21e93 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -416,4 +416,9 @@ config BR2_PACKAGE_QT_DECLARATIVE
 	  Build the Qt Declarative Module for qml support
 	  if unsure, say n.
 
+config BR2_PACKAGE_QT_TEST
+	bool "Test Module"
+	help
+	  Install the Test module.
+
 endif # BR2_PACKAGE_QT
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index f54b6e6..6d01023 100644
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
 
