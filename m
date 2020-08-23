From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Aug 2020 11:04:29 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/gstreamer1/gst1-plugins-bad: fix deactivation of opencv
Message-ID: <20200823090429.2916770-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build can fail if opencv3 is built before gst1-plugins-bad because
-Dopencv=disabled does not work in meson (i.e. since commit
5d6c408e9535be4b5ba0c8a49215d2d03dcb5cd5)

Fixes:
 - http://autobuild.buildroot.org/results/19605057c4956d97e9e65068680485db637282db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Update commit log: the issue is there since the switch to meson
 - Simplify patch

 ...son-allow-the-user-to-disable-opencv.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-bad/0002-meson-allow-the-user-to-disable-opencv.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0002-meson-allow-the-user-to-disable-opencv.patch b/package/gstreamer1/gst1-plugins-bad/0002-meson-allow-the-user-to-disable-opencv.patch
new file mode 100644
index 0000000000..02e91e33ed
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0002-meson-allow-the-user-to-disable-opencv.patch
@@ -0,0 +1,31 @@
+From 1bc387f8feaab9020be72e88cf26ccc1a67a6a10 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 22 Aug 2020 23:33:48 +0200
+Subject: [PATCH] meson: allow the user to disable opencv
+
+Allow the user to really disable opencv through meson (i.e.
+-Dopencv=disabled).
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/1533]
+---
+ gst-libs/gst/opencv/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
+index 6cc4602f3..fb6c46e40 100644
+--- a/gst-libs/gst/opencv/meson.build
++++ b/gst-libs/gst/opencv/meson.build
+@@ -13,7 +13,7 @@ opencv_dep = dependency('opencv', version : '>= 3.0.0', required : false)
+ if not opencv_dep.found()
+   opencv_dep = dependency('opencv4', version : '>= 4.0.0', required : false)
+ endif
+-if opencv_dep.found()
++if not get_option('opencv').disabled() and opencv_dep.found()
+   gstopencv = library('gstopencv-' + api_version,
+     opencv_sources,
+     c_args : gst_plugins_bad_args + ['-DBUILDING_GST_OPENCV'],
+-- 
+2.28.0
+
-- 
2.28.0
