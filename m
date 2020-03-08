From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  8 Mar 2020 23:22:46 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/vlc: fix build with opencv3
Message-ID: <20200308222246.1392316-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/210424bd33f660aa0757f62a558e1e03faf0f371

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update patch so it does not break the build with OpenCV 2.x

 ...lter-opencv_example.cpp-fix-build-wi.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch

diff --git a/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch b/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
new file mode 100644
index 0000000000..952f9fdf51
--- /dev/null
+++ b/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
@@ -0,0 +1,42 @@
+From 57b1e723b73da4c8d42c20d4e28040ec4c0edd85 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 28 Feb 2020 14:29:47 +0100
+Subject: [PATCH] modules/video_filter/opencv_example.cpp: fix build with
+ opencv 3.4.9
+
+Use cvScalar instead of CV_RGB to avoid the following build failure with
+opencv 3.4.9:
+
+In file included from /home/naourr/work/instance-2/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/opencv2/imgproc/imgproc.hpp:48,
+                 from video_filter/opencv_example.cpp:46:
+video_filter/opencv_example.cpp: In function 'picture_t* Filter(filter_t*, picture_t*)':
+video_filter/opencv_example.cpp:200:46: error: could not convert 'cv::Scalar_<double>((double)0, (double)0, (double)0, (double)0)' from 'cv::Scalar' {aka 'cv::Scalar_<double>'} to 'CvScalar'
+             cvRectangle( p_img[0], pt1, pt2, CV_RGB(0,0,0), 3, 8, 0 );
+                                              ^~~~~~
+
+Indeed, CV_RGB is defined as cv::Scalar instead of cvScalar since
+version 3.4.2 and
+https://github.com/opencv/opencv/commit/7f9253ea0a9fe2635926379420002dbf0c3fce0f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://patches.videolan.org/patch/26655]
+---
+ modules/video_filter/opencv_example.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/video_filter/opencv_example.cpp b/modules/video_filter/opencv_example.cpp
+index 1334cd4c36..1a8d574f7a 100644
+--- a/modules/video_filter/opencv_example.cpp
++++ b/modules/video_filter/opencv_example.cpp
+@@ -202,7 +202,7 @@ static picture_t *Filter( filter_t *p_filter, picture_t *p_pic )
+             pt2.x = (r->x+r->width)*scale;
+             pt1.y = r->y*scale;
+             pt2.y = (r->y+r->height)*scale;
+-            cvRectangle( p_img[0], pt1, pt2, CV_RGB(0,0,0), 3, 8, 0 );
++            cvRectangle( p_img[0], pt1, pt2, cvScalar(0,0,0,0), 3, 8, 0 );
+ 
+             *(CvRect*)(&(p_sys->event_info.p_region[i])) = *r;
+             p_sys->event_info.p_region[i].i_id = p_sys->i_id++;
+-- 
+2.25.0
+
-- 
2.25.0
