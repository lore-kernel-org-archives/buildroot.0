From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 May 2015 17:08:46 +0200
Subject: [Buildroot] [git commit] Revert "qt: add QT_COORD_TYPE to double
	option"
Message-ID: <20150505152638.610127FAE9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=078c1c4416648eea4a3d1f116e10c8ad6071b3d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7619aba496208102e098e24454371b9513ec2f90.

This change causes a number of build issues with poppler / pinentry /
python-pyqt and Qt itself on various architectures, so lets revert it for
now and rework it for the 2015.08 cycle.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |   10 ----------
 package/qt/qt.mk     |    5 -----
 2 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 83fdeec..43f5a0f 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -120,16 +120,6 @@ config BR2_PACKAGE_QT_CONFIG_FILE
 	  This option allows to set the path of such a configuration
 	  file, which Buildroot will give to Qt at compile time.
 
-config BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE
-	bool "QT_COORD_TYPE to double"
-	help
-	  Set QT_COORD_TYPE to double. On ARM-based platforms, qreal
-	  is a typedef for float for performance reasons, but for
-	  QT_COORD_TYPE, some people may want to use a double type
-	  anyway for precision.
-
-	  If unsure say n.
-
 config BR2_PACKAGE_QT_QT3SUPPORT
 	bool "Compatibility with Qt3"
 	depends on BR2_PACKAGE_QT_GUI_MODULE
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 919137b..d1615ae 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -46,11 +46,6 @@ QT_CFLAGS += -marm
 QT_CXXFLAGS += -marm
 endif
 
-ifeq ($(BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE),y)
-QT_CFLAGS += -DQT_COORD_TYPE=double
-QT_CXXFLAGS += -DQT_COORD_TYPE=double
-endif
-
 ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
 QT_CONFIGURE_OPTS += -qt3support
 else
