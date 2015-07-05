From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 14:50:52 +0200
Subject: [Buildroot] [git commit] package/opencv: add gstreamer-1.x support
Message-ID: <20150705125130.7642B80DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc71d52724e181aa6e02295ec867d1864c89a9cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with the 2.4.10 release, OpenCV supports both Gstreamer-0.10
and Gstreamer-1, but only one can be enabled at the same time (OpenCV
chooses Gstreamer-1 over Gstreamer-0.10 when both are available).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/Config.in |   15 +++++++++++++++
 package/opencv/opencv.mk |   11 +++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 4838a0c..079730e 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -175,6 +175,8 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 
 choice
 	prompt "gstreamer support"
+	help
+	  OpenCV prefers gstreamer-1 over gstreamer-0.10.
 
 config BR2_PACKAGE_OPENCV_WITHOUT_GSTREAMER
 	bool "none"
@@ -192,6 +194,19 @@ comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
+config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
+	bool "gstreamer-1.x"
+	depends on BR2_USE_MMU # gstreamer1 -> libglib2
+	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+
+comment "gstreamer-1.x support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
 endchoice
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 633c2bf..0e5cf77 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -223,10 +223,17 @@ OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON -DWITH_GSTREAMER_0_10=ON
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
 OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
 else
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF -DWITH_GSTREAMER_0_10=OFF
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),y)
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
+OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GTK),y)
