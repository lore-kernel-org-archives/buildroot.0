From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Nov 2015 12:54:32 +0000
Subject: [Buildroot] [PATCH] opencv: use the same logic as opencv3 for
	gstreamer support
Message-ID: <1448283272-56998-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The logic for enabling gstreamer support in opencv is not correct. We
select gstreamer-0.10 packages but then we enable gstreamer1 support in
the opencv.mk file. opencv3 has the correct logic, so let's use it in
opencv as well.

Fixes:

  http://autobuild.buildroot.net/results/f6d/f6d0a4ffe347cbb868998856aca674ba8bc2e281/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/opencv/Config.in | 27 +++++++++++++++++++++++++--
 package/opencv/opencv.mk |  9 ++++++++-
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index a5fafc1..679ce6f 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -136,8 +136,16 @@ config BR2_PACKAGE_OPENCV_WITH_FFMPEG
 	help
 	  Use ffmpeg from the target system.
 
+choice
+	prompt "gstreamer support"
+	help
+	  OpenCV prefers gstreamer-1 over gstreamer-0.10.
+
+config BR2_PACKAGE_OPENCV_WITHOUT_GSTREAMER
+	bool "none"
+
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
-	bool "gstreamer support"
+	bool "gstreamer-0.10"
 	depends on BR2_USE_MMU # gstreamer -> libglib2
 	depends on BR2_USE_WCHAR # gstreamer -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer -> libglib2
@@ -145,10 +153,25 @@ config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
 
-comment "gstreamer support needs a toolchain w/ wchar, threads"
+comment "gstreamer-0.10 support needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
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
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
+endchoice
+
 config BR2_PACKAGE_OPENCV_WITH_GTK
 	bool "gtk support"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index ee11220..21c0268 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -171,9 +171,16 @@ OPENCV_CONF_OPTS += -DWITH_FFMPEG=OFF
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
2.4.10
