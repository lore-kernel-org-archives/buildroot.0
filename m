From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Jun 2015 21:59:55 +0200
Subject: [Buildroot] [PATCH v6 14/16] package/opencv: add gtk3 support
In-Reply-To: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1435262397-888-15-git-send-email-s.martin49@gmail.com>
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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v5->v6:
- update a/r/t tags
- remove unneeded "default ..." (Yann)

changes v4->v5:
- new patch
---
 package/opencv/Config.in | 22 +++++++++++++++++++---
 package/opencv/opencv.mk |  9 +++++++--
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index ac0443a..b738f71 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -215,6 +215,7 @@ choice
 	  OpenCV GUI toolkit preference (from the most to the least):
 	  - Qt5
 	  - Qt4
+	  - gtk-3
 	  - gtk-2
 
 config BR2_PACKAGE_OPENCV_GUI_NONE
@@ -222,12 +223,12 @@ config BR2_PACKAGE_OPENCV_GUI_NONE
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk2"
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on BR2_USE_MMU # libgtk2 -> libglib2
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGTK2
 
 comment "gtk2 depends on X.org and needs a toolchain w/ wchar, threads, C++"
@@ -238,6 +239,21 @@ comment "gtk2 depends on X.org and needs a toolchain w/ wchar, threads, C++"
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
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 602b59a..986e7b4 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -236,13 +236,18 @@ OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=OFF
 OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK)$(BR2_PACKAGE_OPENCV_WITH_GTK3),)
+OPENCV_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
 endif
 
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
2.4.4
