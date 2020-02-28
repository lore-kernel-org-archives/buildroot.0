From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Feb 2020 14:38:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/vlc: fix build with opencv3
Message-ID: <20200228133809.687495-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/210424bd33f660aa0757f62a558e1e03faf0f371

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...lter-opencv_example.cpp-fix-build-wi.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch

diff --git a/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch b/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
new file mode 100644
index 0000000000..04c9958298
--- /dev/null
+++ b/package/vlc/0010-modules-video_filter-opencv_example.cpp-fix-build-wi.patch
@@ -0,0 +1,38 @@
+From 67244e60fc1d8c7a9350bac30611f56c398761e5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 28 Feb 2020 14:29:47 +0100
+Subject: [PATCH] modules/video_filter/opencv_example.cpp: fix build with
+ opencv 3.4.9
+
+Convert CV_RGB to cvScalar to avoid the following build failure with
+opencv 3.4.9:
+
+In file included from /home/naourr/work/instance-2/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/opencv2/imgproc/imgproc.hpp:48,
+                 from video_filter/opencv_example.cpp:46:
+video_filter/opencv_example.cpp: In function 'picture_t* Filter(filter_t*, picture_t*)':
+video_filter/opencv_example.cpp:200:46: error: could not convert 'cv::Scalar_<double>((double)0, (double)0, (double)0, (double)0)' from 'cv::Scalar' {aka 'cv::Scalar_<double>'} to 'CvScalar'
+             cvRectangle( p_img[0], pt1, pt2, CV_RGB(0,0,0), 3, 8, 0 );
+                                              ^~~~~~
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to vlc-devel at videolan.org]
+---
+ modules/video_filter/opencv_example.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/video_filter/opencv_example.cpp b/modules/video_filter/opencv_example.cpp
+index 1334cd4c36..292f24b257 100644
+--- a/modules/video_filter/opencv_example.cpp
++++ b/modules/video_filter/opencv_example.cpp
+@@ -202,7 +202,7 @@ static picture_t *Filter( filter_t *p_filter, picture_t *p_pic )
+             pt2.x = (r->x+r->width)*scale;
+             pt1.y = r->y*scale;
+             pt2.y = (r->y+r->height)*scale;
+-            cvRectangle( p_img[0], pt1, pt2, CV_RGB(0,0,0), 3, 8, 0 );
++            cvRectangle( p_img[0], pt1, pt2, cvScalar(CV_RGB(0,0,0)), 3, 8, 0 );
+ 
+             *(CvRect*)(&(p_sys->event_info.p_region[i])) = *r;
+             p_sys->event_info.p_region[i].i_id = p_sys->i_id++;
+-- 
+2.25.0
+
-- 
2.25.0
