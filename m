From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  6 Oct 2014 22:19:19 +0200
Subject: [Buildroot] [PATCH v4 2/9] package/opencv: add Qt5 support
In-Reply-To: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
References: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1412626766-24683-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with the 2.4.6 release, OpenCV supports both Qt4 and Qt5,
but only one can be enable at the same time.

Since Buildroot does not support Qt4/Qt5 co-existence, we keep the Qt
support knob as a boolean, but make it depend on BR2_PACKAGE_QT or
BR2_PACKAGE_QT5, and automatically uses the enabled one.

Note that we usually use 'select ...' to express the dependencies
between packages, but in this case, we cannot since the Qt4/Qt5
co-exist`ence exclusion is not handled by a simple choice, but by a
dependency. This makes impossible using 'select ...' for the Qt
support knob without triggering a circular dependency at the kconfig
level.

Besides, we already use 'depends on ...' to express the dependencies
with some "big" packages (like xorg or libgtk2). qt or qt5* packages
are fairly big. So, I don't think it will hurt that much to use a
'depends on ...' statement in this case.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v3 -> v4:
- rebase
- rename _OPT -> _OPTS options
- rework qt backend selection (Yann)

changes v2 -> v3:
- rebase
- remove duplicate qt/qt5 dependencies (Yann)
- add missing 'depends on' to the comment about qt4

changes v1 -> v2:
- rebase
- update threads support dependency for qt5
---
 package/opencv/Config.in | 35 ++++++++++++++++++++++++++++-------
 package/opencv/opencv.mk |  4 ++--
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index d648e5e..33e2a66 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -187,16 +187,37 @@ config BR2_PACKAGE_OPENCV_WITH_PNG
 
 config BR2_PACKAGE_OPENCV_WITH_QT
 	bool "qt backend support"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_avr32 # qt
-	depends on BR2_USE_MMU # qt
-	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
-	select BR2_PACKAGE_QT
+	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
+	select BR2_PACKAGE_OPENCV_QT_BACKEND  if BR2_PACKAGE_QT
+	select BR2_PACKAGE_OPENCV_QT5_BACKEND if BR2_PACKAGE_QT5
+	help
+	  Enable Qt support for OpenCV.
+
+	  This uses whatever Qt version you enabled: Qt4 or Qt5.
+
+	  If Qt4 is already enabled, then QtTest and QtGui modules and STL support
+	  will be enabled as well.
+
+	  If Qt5 is already enabled, then the following components will be enabled
+	  as well: base, concurrent, test, gui and widgets.
+
+config BR2_PACKAGE_OPENCV_QT_BACKEND
+	bool
 	select BR2_PACKAGE_QT_STL
 	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_TEST
-	help
-	  Use Qt with QtTest module and STL support
+
+config BR2_PACKAGE_OPENCV_QT5_BACKEND
+	bool
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_CONCURRENT
+	select BR2_PACKAGE_QT5BASE_TEST
+	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+
+comment "qt backend needs either Qt4 or Qt5"
+	depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5
+	depends on !BR2_avr32
 
 config BR2_PACKAGE_OPENCV_WITH_TIFF
 	bool "tiff support"
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 271e751..b527e53 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -214,8 +214,8 @@ OPENCV_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_QT),y)
-OPENCV_CONF_OPTS += -DWITH_QT=4
-OPENCV_DEPENDENCIES += qt
+OPENCV_CONF_OPTS += -DWITH_QT=$(if $(BR2_PACKAGE_QT),4,5)
+OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_QT),qt,qt5base)
 else
 OPENCV_CONF_OPTS += -DWITH_QT=OFF
 endif
-- 
2.1.2
