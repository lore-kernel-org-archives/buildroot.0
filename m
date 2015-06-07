From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jun 2015 12:26:37 +0200
Subject: [Buildroot] [PATCH v5 11/13] package/opencv: add gtk3 support
In-Reply-To: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1433672799-21387-12-git-send-email-s.martin49@gmail.com>
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
changes v4->v5:
- new patch
---
 package/opencv/Config.in | 38 +++++++++++++++++++++++++++++++-------
 package/opencv/opencv.mk | 10 ++++++++--
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index f4072ef..ff834b9 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -200,17 +200,41 @@ comment "gstreamer backend needs either Gstreamer-0.10 or Gstreamer-1"
 	depends on !BR2_PACKAGE_GSTREAMER && !BR2_PACKAGE_GSTREAMER1
 	depends on BR2_USE_MMU # gstreamer -> libglib2
 
+
+choice
+	prompt "gtk support"
+	# common dependencies to libgtk2 and libgtk3
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+	# GTK check is disabled when Qt support is on in the OpenCV's cmake code
+	depends on !BR2_PACKAGE_OPENCV_WITH_QT
+	default BR2_PACKAGE_OPENCV_WITHOUT_GTK
+	help
+	  GTK support is disabled if Qt support is enabled.
+
+config BR2_PACKAGE_OPENCV_WITHOUT_GTK
+	bool "none"
+
 config BR2_PACKAGE_OPENCV_WITH_GTK
-	bool "gtk support"
+	bool "libgtk2"
 	depends on BR2_PACKAGE_XORG7
-	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # libgtk2 -> glib2
-	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
-	depends on BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	select BR2_PACKAGE_LIBGTK2
 
+config BR2_PACKAGE_OPENCV_WITH_GTK3
+	bool "libgtk3"
+	select BR2_PACKAGE_LIBGTK3
+
+endchoice
+
+comment "gtk support needs wchar, threads, C++"
+	depends on !(BR2_USE_WCHAR || BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_INSTALL_LIBSTDCPP)
+	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
+
 config BR2_PACKAGE_OPENCV_WITH_JASPER
 	bool "jpeg2000 support"
 	select BR2_PACKAGE_JASPER
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 81c5544..d3a0738 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -222,11 +222,17 @@ else
 OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK)$(BR2_PACKAGE_OPENCV_WITH_GTK3),y)
+OPENCV_CONF_OPTS += -DWITH_GTK=ON
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
-OPENCV_CONF_OPTS += -DWITH_GTK=ON -DWITH_GTK_2_X=ON
+OPENCV_CONF_OPTS += -DWITH_GTK_2_X=ON
 OPENCV_DEPENDENCIES += libgtk2
 else
-OPENCV_CONF_OPTS += -DWITH_GTK=OFF
+OPENCV_CONF_OPTS += -DWITH_GTK_2_X=OFF
+OPENCV_DEPENDENCIES += libgtk3
+endif
+else
+OPENCV_CONF_OPTS += -DWITH_GTK=OFF -DWITH_GTK_2_X=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
-- 
2.4.2
