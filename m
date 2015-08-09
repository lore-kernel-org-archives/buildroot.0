From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Aug 2015 18:14:56 +0200
Subject: [Buildroot] [PATCH 3/4 v2] Revert
	"package/gstreamer1/gst1-plugins-bad: disable opencv plugin
	with opencv-3"
In-Reply-To: <cover.1439136753.git.yann.morin.1998@free.fr>
References: <cover.1439136753.git.yann.morin.1998@free.fr>
Message-ID: <5d317246d236dfca1405ba303f28293738572614.1439136753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Samuel Martin <s.martin49@gmail.com>

This reverts commit 5e238a87eacf2a0c62736c4123961651afb1ba87.

Also update the dependencies.

Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: fix dependencies at the same time]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index bc99527..494a282 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -557,9 +557,22 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NEON
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	bool "opencv"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on BROKEN # gst1-plugin-opencv does not (yet) support opencv >=3.x
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # opencv
+	depends on BR2_INSTALL_LIBSTDCPP # opencv
+	depends on BR2_USE_WCHAR # opencv
+	select BR2_PACKAGE_OPENCV
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
 
-- 
1.9.1
