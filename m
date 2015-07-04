From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  4 Jul 2015 21:06:59 +0200
Subject: [Buildroot] [PATCH v7 5/7] package/opencv: add gtk3 support
In-Reply-To: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
References: <1436036821-10073-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1436036821-10073-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fully rework the GTK support in OpenCV because it now supports gtk-2 and
gtk-3 (but only one at the time).
Note that, in the build-system, the gtk support is only available when
Qt support is disabled; so make sure the menuconfig reflects this.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v6->v7:
- update A/R/T tags
- rebase

changes v5->v6:
- update a/r/t tags
- remove unneeded "default ..." (Yann)

changes v4->v5:
- new patch
---
 package/opencv/Config.in | 16 ++++++++++++++++
 package/opencv/opencv.mk | 11 +++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 7bd11cf..e54d436 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -62,6 +62,7 @@ choice
 	  preference by the OpenCV build system):
 	  - Qt5
 	  - Qt4
+	  - gtk3
 	  - gtk2
 
 	  Note that, whatever you choose here will be used by OpenCV, even
@@ -89,6 +90,21 @@ comment "gtk2 needs X.org and a toolchain w/ wchar, threads, C++"
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
 
+config BR2_PACKAGE_OPENCV_WITH_GTK3
+	bool "gtk3"
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk3 -> cairo
+	depends on BR2_USE_MMU # libgtk3 -> libglib2
+	depends on BR2_USE_WCHAR # libgtk3 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3 -> libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBGTK3
+
+comment "gtk3 needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_USE_MMU # libgtk3 -> glib2
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk3 -> cairo
+	depends on !(BR2_USE_WCHAR || BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_INSTALL_LIBSTDCPP)
+
 config BR2_PACKAGE_OPENCV_WITH_QT
 	bool "qt4"
 	depends on BR2_PACKAGE_QT
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 79cf110..986e7b4 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -236,11 +236,18 @@ OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=OFF
 OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
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
-- 
2.4.5
