From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  7 Feb 2020 15:50:22 +0100
Subject: [Buildroot] [PATCH 07/10] package/opencv3: drop gstreamer 0.10.x
 support
In-Reply-To: <20200207145026.28384-1-peter@korsgaard.com>
References: <20200207145026.28384-1-peter@korsgaard.com>
Message-ID: <20200207145026.28384-8-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the upcoming removal of gstreamer 0.10, the logic for building opencv3
with support for it must go as well.

As there is now a single option for gstreamer (1.x) support, convert the
gstreamer support choice to a normal option for simplicity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy           |  7 +++++++
 package/opencv3/Config.in  | 27 +++------------------------
 package/opencv3/opencv3.mk |  8 +-------
 3 files changed, 11 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 20cf568be9..34f99b54de 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER
+	bool "opencv3 gstreamer 0.10.x support removed"
+	select BR2_LEGACY
+	help
+	  Gstreamer 0.10.x is no longer available in Buildroot, so
+	  neither is the support in opencv3.
+
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "opencv gstreamer 0.10.x support removed"
 	select BR2_LEGACY
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index fdd7152ee6..d4b17b6acf 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -249,27 +249,6 @@ config BR2_PACKAGE_OPENCV3_WITH_FFMPEG
 	help
 	  Use ffmpeg from the target system.
 
-choice
-	prompt "gstreamer support"
-	help
-	  OpenCV prefers gstreamer-1 over gstreamer-0.10.
-
-config BR2_PACKAGE_OPENCV3_WITHOUT_GSTREAMER
-	bool "none"
-
-config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER
-	bool "gstreamer-0.10"
-	depends on BR2_USE_MMU # gstreamer -> libglib2
-	depends on BR2_USE_WCHAR # gstreamer -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
-	select BR2_PACKAGE_GSTREAMER
-	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
-
-comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-
 config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1
 	bool "gstreamer-1.x"
 	depends on BR2_USE_MMU # gstreamer1 -> libglib2
@@ -278,13 +257,13 @@ config BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1
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
 config BR2_PACKAGE_OPENCV3_WITH_JASPER
 	bool "jpeg2000 support"
 	select BR2_PACKAGE_JASPER
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index c99e84a29f..2c5d6b041d 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -206,6 +206,7 @@ OPENCV3_CONF_OPTS += \
 	-DWITH_EIGEN=OFF \
 	-DWITH_GDAL=OFF \
 	-DWITH_GPHOTO2=OFF \
+	-DWITH_GSTREAMER_0_10=OFF \
 	-DWITH_LAPACK=OFF \
 	-DWITH_MATLAB=OFF \
 	-DWITH_OPENCL=OFF \
@@ -229,13 +230,6 @@ else
 OPENCV3_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GSTREAMER),y)
-OPENCV3_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
-OPENCV3_DEPENDENCIES += gstreamer gst-plugins-base
-else
-OPENCV3_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_GSTREAMER1),y)
 OPENCV3_CONF_OPTS += -DWITH_GSTREAMER=ON
 OPENCV3_DEPENDENCIES += gstreamer1 gst1-plugins-base
-- 
2.20.1
