From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2015 14:47:11 +0200
Subject: [Buildroot] [PATCH 3/4] Revert
	"package/gstreamer1/gst1-plugins-bad: disable opencv plugin
	with opencv-3"
In-Reply-To: <cover.1440420122.git.yann.morin.1998@free.fr>
References: <cover.1440420122.git.yann.morin.1998@free.fr>
Message-ID: <d3ec94dc8266d9b1b233fc2fb16ed79154df4748.1440420122.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This (partially) reverts commit 5e238a87eacf2a0c62736c4123961651afb1ba87.

The dependency is changed from a 'select' to a 'depends on' to avoid a
circular dependency caused by the introduction of OpenCV-3. This means
we can also drop the threads and C++ dependencies, since they are now
inherited via the depends on OpenCV.

Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: fix dependencies]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v2 -> v3;
  - used 'depends on' instead of 'select' to avoid circular deps (Samuel)
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index bc99527..d268fc6 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -557,14 +557,24 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	bool "opencv"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BROKEN # gst1-plugin-opencv does not (yet) support opencv >=3.x
+	depends on BR2_PACKAGE_OPENCV
+	# Remove the following opencv modules when gstreamer fixes the
+	# problem of including the old "cv.h" header
+	# bug: https://bugzilla.gnome.org/show_bug.cgi?id=725163
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_CONTRIB
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_FLANN
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_LEGACY
+	select BR2_PACKAGE_OPENCV_LIB_ML
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
 	help
 	  GStreamer OpenCV Plugins
 
-comment "opencv plugin needs a toolchain w/ C++, NPTL"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "opencv plugin needs OpenCV-2.4"
+	depends on !BR2_PACKAGE_OPENCV
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 	bool "opus"
-- 
1.9.1
