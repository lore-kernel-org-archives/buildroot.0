From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  6 Oct 2014 22:19:21 +0200
Subject: [Buildroot] [PATCH v4 4/9] package/opencv: add Gstreamer-1 support
In-Reply-To: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
References: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1412626766-24683-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with the 2.4.10 release, OpenCV supports both Gstreamer-0.10
and Gstreamer-1, but only one can be enable at the same time.

This change adds a patch making sure the Gstreamer detection done by
OpenCV reflects the user selection.

This patch has been sent upstream [1]

[1] https://github.com/Itseez/opencv/pull/3310

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v3 -> v4:
- new patch
---
 package/opencv/Config.in                           | 30 ++++++---
 ...0002-cmake-fix-gstreamer-check-conditions.patch | 78 ++++++++++++++++++++++
 package/opencv/opencv.mk                           |  9 ++-
 3 files changed, 108 insertions(+), 9 deletions(-)
 create mode 100644 package/opencv/opencv-0002-cmake-fix-gstreamer-check-conditions.patch

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index f8c9dc1..4a4c2af 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -145,18 +145,32 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
+choice
+	prompt "gstreamer backend support"
+	depends on BR2_PACKAGE_GSTREAMER || BR2_PACKAGE_GSTREAMER1
+	help
+	  Enable Gstreamer support for OpenCV.
+
+config BR2_PACKAGE_OPENCV_WITH_GSTREAMER_NONE
+	bool "none"
+
+config BR2_PACKAGE_OPENCV_WITH_GSTREAMER1
+	bool "gtreamer-1.x"
+	depends on BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
-	bool "gstreamer support"
-	depends on BR2_USE_MMU # gstreamer -> libglib2
-	depends on BR2_USE_WCHAR # gstreamer -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
-	select BR2_PACKAGE_GSTREAMER
+	bool "gtreamer-0.10"
+	depends on BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
-comment "gstreamer support needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+endchoice
+
+comment "gstreamer backend needs either Gstreamer-0.10 or Gstreamer-1"
+	depends on !BR2_PACKAGE_GSTREAMER && !BR2_PACKAGE_GSTREAMER1
+	depends on BR2_USE_MMU # gstreamer -> libglib2
 
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
diff --git a/package/opencv/opencv-0002-cmake-fix-gstreamer-check-conditions.patch b/package/opencv/opencv-0002-cmake-fix-gstreamer-check-conditions.patch
new file mode 100644
index 0000000..fe399b2
--- /dev/null
+++ b/package/opencv/opencv-0002-cmake-fix-gstreamer-check-conditions.patch
@@ -0,0 +1,78 @@
+From fb42af185188f2fdcb3501099ed788cb086bb86f Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Mon, 6 Oct 2014 19:54:34 +0200
+Subject: [PATCH] cmake: fix gstreamer check conditions
+
+The current situation of the Gstreamer detection does not always honor
+all the configurations set by the user, among this:
+- if both WITH_GSTREAMER and WITH_GSTREAMER_0_10 are off, but
+  Gstreamer 0.10 is installed in the system, Gstreamer 0.10 support will
+  be enable;
+- if both WITH_GSTREAMER and WITH_GSTREAMER_0_10 are on, only checks for
+  Gstreamer 0.10 will be run.
+
+This patch fixes the Gstreamer detection like this:
+
+  |        -DWITH_...          | Package installed  ||    OpenCV    |
+  | GSTREAMER | GSTREAMER_0_10 | gst-1.x | gst-0.10 || gst. support |
+  +===========+================+=========+==========##==============+
+  |    OFF    |      OFF       |    -    |    -     ||     none     |
+  |    OFF    |      ON        |    -    |    no    ||     none     |
+  |    OFF    |      ON        |    -    |   yes    ||   gst-0.10   |
+  |    ON     |      OFF       |    no   |    no    ||     none     |
+  |    ON     |      OFF       |    no   |   yes    ||   gst-0.10   |
+  |    ON     |      OFF       |   yes   |    -     ||    gst-1.x   |
+  |    ON     |      ON        |   yes   |    -     ||    gst-1.x   |
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ cmake/OpenCVFindLibsVideo.cmake | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/cmake/OpenCVFindLibsVideo.cmake b/cmake/OpenCVFindLibsVideo.cmake
+index 6ac9411..ba2a3f7 100644
+--- a/cmake/OpenCVFindLibsVideo.cmake
++++ b/cmake/OpenCVFindLibsVideo.cmake
+@@ -13,7 +13,7 @@ endif(WITH_VFW)
+ # --- GStreamer ---
+ ocv_clear_vars(HAVE_GSTREAMER)
+ # try to find gstreamer 1.x first
+-if(WITH_GSTREAMER AND NOT WITH_GSTREAMER_0_10)
++if(WITH_GSTREAMER)
+   CHECK_MODULE(gstreamer-base-1.0 HAVE_GSTREAMER_BASE)
+   CHECK_MODULE(gstreamer-video-1.0 HAVE_GSTREAMER_VIDEO)
+   CHECK_MODULE(gstreamer-app-1.0 HAVE_GSTREAMER_APP)
+@@ -29,10 +29,18 @@ if(WITH_GSTREAMER AND NOT WITH_GSTREAMER_0_10)
+       set(GSTREAMER_PBUTILS_VERSION ${ALIASOF_gstreamer-pbutils-1.0_VERSION})
+   endif()
+ 
+-endif(WITH_GSTREAMER AND NOT WITH_GSTREAMER_0_10)
++endif(WITH_GSTREAMER)
+ 
+-# if gstreamer 1.x was not found, or we specified we wanted 0.10, try to find it
+-if(WITH_GSTREAMER_0_10 OR NOT HAVE_GSTREAMER)
++# gstreamer support was requested but could not find gstreamer 1.x,
++# so fallback/try to find gstreamer 0.10
++if(WITH_GSTREAMER AND NOT HAVE_GSTREAMER)
++  set(WITH_GSTREAMER_0_10 ON)
++endif()
++
++# if gstreamer 1.x was not found (fallback on gstreamer 0.10), or we specified
++# we wanted gstreamer 0.10 support,
++# then try to find it if not gstreamer support has not been found so far.
++if(WITH_GSTREAMER_0_10 AND NOT HAVE_GSTREAMER)
+   CHECK_MODULE(gstreamer-base-0.10 HAVE_GSTREAMER_BASE)
+   CHECK_MODULE(gstreamer-video-0.10 HAVE_GSTREAMER_VIDEO)
+   CHECK_MODULE(gstreamer-app-0.10 HAVE_GSTREAMER_APP)
+@@ -47,7 +55,7 @@ if(WITH_GSTREAMER_0_10 OR NOT HAVE_GSTREAMER)
+       set(GSTREAMER_RIFF_VERSION ${ALIASOF_gstreamer-riff-0.10_VERSION})
+       set(GSTREAMER_PBUTILS_VERSION ${ALIASOF_gstreamer-pbutils-0.10_VERSION})
+   endif()
+-endif(WITH_GSTREAMER_0_10 OR NOT HAVE_GSTREAMER)
++endif(WITH_GSTREAMER_0_10 AND NOT HAVE_GSTREAMER)
+ 
+ # --- unicap ---
+ ocv_clear_vars(HAVE_UNICAP)
+-- 
+2.1.2
+
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index eece04f..374f3a3 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -177,9 +177,16 @@ OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER),y)
-OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER_0_10=ON
 OPENCV_DEPENDENCIES += gstreamer gst-plugins-base
 else
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER_0_10=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV_WITH_GSTREAMER1),y)
+OPENCV_CONF_OPTS += -DWITH_GSTREAMER=ON
+OPENCV_DEPENDENCIES += gstreamer1 gst1-plugins-base
+else
 OPENCV_CONF_OPTS += -DWITH_GSTREAMER=OFF
 endif
 
-- 
2.1.2
