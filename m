From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 11:50:00 +0200
Subject: [Buildroot] [git commit] package/opencv: add gtk3 support
Message-ID: <20150706095005.C38B87FC2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70c7d468937b1c56be46504fdc8aa4d9146d2f84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenCV now also supports gtk3 as a GUI toolkit, in addition to gtk2,
but only one may be enabled at a time.

So, add gtk3 in the choice to select the GUI toolkit.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: drop the superfluous depends-on for the
 kconfig symbol, since they're no longer needed now we depend-on rather
 than select]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |    9 +++++++++
 package/opencv/opencv.mk |   11 +++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 5e8f189..6ae74b4 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -70,6 +70,15 @@ comment "gtk2 support needs libgtk2"
 	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
 	depends on !BR2_PACKAGE_LIBGTK2
 
+config BR2_PACKAGE_OPENCV_WITH_GTK3
+	bool "gtk3"
+	depends on BR2_PACKAGE_LIBGTK3
+
+comment "gtk3 support needs libgtk3"
+	depends on BR2_USE_MMU # libgtk3 -> glib2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk3 -> cairo
+	depends on !BR2_PACKAGE_LIBGTK3
+
 config BR2_PACKAGE_OPENCV_WITH_QT
 	bool "qt4"
 	depends on BR2_PACKAGE_QT
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 98e1614..c788aeb 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -236,11 +236,18 @@ else
 OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK)$(BR2_PACKAGE_OPENCV_WITH_GTK3),)
+OPENCV_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
 OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
 OPENCV_DEPENDENCIES += libgtk2
-else
-OPENCV_CONF_OPTS += -DWITH_GTK=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK3),y)
+OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=OFF
+OPENCV_DEPENDENCIES += libgtk3
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
