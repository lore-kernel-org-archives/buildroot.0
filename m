From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 25 Jun 2015 21:59:44 +0200
Subject: [Buildroot] [PATCH v6 03/16] package/gstreamer1/gst1-plugins-bad:
	disable opencv plugin with opencv-3
In-Reply-To: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1435262397-888-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The opencv plugin uses stuff from the now removed opencv's legacy module.
Note that the configure script already correctly check the opencv version
and disable the opencv plugin with opencv-3.x.

Also remove 'select ...' to prevent kconfig from complaining about
recursive dependencies.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v5->v6:
- remove 'select ...'
- update a/r/t tags

changes v4->v5:
- new patch
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 76a601a..bc99527 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -559,19 +559,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 	bool "opencv"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_PACKAGE_OPENCV
-	# Remove the following opencv modules when gstreamer fixes the
-	# problem of including the old "cv.h" header
-	# bug: https://bugzilla.gnome.org/show_bug.cgi?id=725163
-	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
-	select BR2_PACKAGE_OPENCV_LIB_CONTRIB
-	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
-	select BR2_PACKAGE_OPENCV_LIB_FLANN
-	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV_LIB_LEGACY
-	select BR2_PACKAGE_OPENCV_LIB_ML
-	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
-	select BR2_PACKAGE_OPENCV_LIB_VIDEO
+	depends on BROKEN # gst1-plugin-opencv does not (yet) support opencv >=3.x
 	help
 	  GStreamer OpenCV Plugins
 
-- 
2.4.4
