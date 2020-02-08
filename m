From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 8 Feb 2020 22:42:51 +0100
Subject: [Buildroot] [git commit] package/opencv: drop gstreamer 0.10.x
 support
Message-ID: <20200208214332.0E54F8D667@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0220ad8b138da666fd546d749674dcbde1ecb12a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the upcoming removal of gstreamer 0.10, the logic for building opencv
with support for it must go as well.

As there is now a single option for gstreamer (1.x) support, convert the
gstreamer support choice to a normal option for simplicity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy         |  7 +++++++
 package/opencv/Config.in | 31 ++++---------------------------
 package/opencv/opencv.mk |  8 +-------
 3 files changed, 12 insertions(+), 34 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4d81a2a09a..20cf568be9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
+	bool "opencv gstreamer 0.10.x support removed"
+	select BR2_LEGACY
+	help
+	  Gstreamer 0.10.x is no longer available in Buildroot, so
+	  neither is the support in opencv.
+
 config BR2_PACKAGE_LIBPLAYER
 	bool "libplayer package was removed"
 	select BR2_LEGACY
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index c74dfd9572..836f5c96e8 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -195,44 +195,21 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	help
 	  Use ffmpeg from the target system.
 
-choice
-	prompt "gstreamer support"
-	help
-	  OpenCV prefers gstreamer-1 over gstreamer-0.10.
-
-config BR2_PACKAGE_OPENCV_WITHOUT_GSTREAMER
-	bool "none"
-
-config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
-	bool "gstreamer-0.10"
-	depends on BR2_USE_MMU # gstreamer -> libglib2
-	depends on BR2_USE_WCHAR # gstreamer -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
-	depends on !BR2_STATIC_LIBS # gstreamer
-	select BR2_PACKAGE_GSTREAMER
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
-
-comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
-
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
-	bool "gstreamer-1.x"
+	bool "gstreamer support"
 	depends on BR2_USE_MMU # gstreamer1 -> libglib2
 	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	help
+	  Enable gstreamer support.
 
-comment "gstreamer-1.x support needs a toolchain w/ wchar, threads"
+comment "gstreamer support needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
-endchoice
-
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 4c15075fe0..939058e4ed 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -155,6 +155,7 @@ OPENCV_CONF_OPTS += \
 OPENCV_CONF_OPTS += \
 	-DWITH_1394=OFF \
 	-DWITH_EIGEN=OFF \
+	-DWITH_GSTREAMER_0_10=OFF \
 	-DWITH_IMAGEIO=OFF \
 	-DWITH_OPENCL=OFF \
 	-DWITH_OPENEXR=OFF \
@@ -178,13 +179,6 @@ else
 OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
-OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
-else
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),y)
 OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
 OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
