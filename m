From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Aug 2020 00:04:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad: fix
 deactivation of opencv
Message-ID: <20200822220411.2823899-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build can fail if opencv3 is built before gst1-plugins-bad because
-Dopencv=disabled does not work since
https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/commit/22c6a4085f8792d8af0cdabfe1664d55ca2dee11

Fixes:
 - http://autobuild.buildroot.org/results/19605057c4956d97e9e65068680485db637282db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...s-gst-opencv-meson.build-fix-disable.patch | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-bad/0002-gst-libs-gst-opencv-meson.build-fix-disable.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0002-gst-libs-gst-opencv-meson.build-fix-disable.patch b/package/gstreamer1/gst1-plugins-bad/0002-gst-libs-gst-opencv-meson.build-fix-disable.patch
new file mode 100644
index 0000000000..c5227077cb
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0002-gst-libs-gst-opencv-meson.build-fix-disable.patch
@@ -0,0 +1,73 @@
+From 507594ab8f21d6217446bb52c29a602318602246 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 22 Aug 2020 23:33:48 +0200
+Subject: [PATCH] gst-libs/gst/opencv/meson.build: fix disable
+
+opencv can't be disabled since commit
+22c6a4085f8792d8af0cdabfe1664d55ca2dee11
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/1533]
+---
+ gst-libs/gst/opencv/meson.build | 56 +++++++++++++++++----------------
+ 1 file changed, 29 insertions(+), 27 deletions(-)
+
+diff --git a/gst-libs/gst/opencv/meson.build b/gst-libs/gst/opencv/meson.build
+index 6cc4602f3..716ceaabf 100644
+--- a/gst-libs/gst/opencv/meson.build
++++ b/gst-libs/gst/opencv/meson.build
+@@ -9,27 +9,29 @@ opencv_headers = [
+   'gstopencvvideofilter.h',
+ ]
+ 
+-opencv_dep = dependency('opencv', version : '>= 3.0.0', required : false)
+-if not opencv_dep.found()
+-  opencv_dep = dependency('opencv4', version : '>= 4.0.0', required : false)
+-endif
+-if opencv_dep.found()
++if not get_option('opencv').disabled()
++  opencv_dep = dependency('opencv', version : '>= 3.0.0', required : false)
++  if not opencv_dep.found()
++    opencv_dep = dependency('opencv4', version : '>= 4.0.0', required : false)
++  endif
++  if opencv_dep.found()
+-  gstopencv = library('gstopencv-' + api_version,
+-    opencv_sources,
+-    c_args : gst_plugins_bad_args + ['-DBUILDING_GST_OPENCV'],
+-    include_directories : [configinc, libsinc],
+-    version : libversion,
+-    soversion : soversion,
+-  darwin_versions : osxversion,
+-    install : true,
+-    dependencies : [gstbase_dep, gstvideo_dep, opencv_dep],
+-  )
++    gstopencv = library('gstopencv-' + api_version,
++      opencv_sources,
++      c_args : gst_plugins_bad_args + ['-DBUILDING_GST_OPENCV'],
++      include_directories : [configinc, libsinc],
++      version : libversion,
++      soversion : soversion,
++    darwin_versions : osxversion,
++      install : true,
++      dependencies : [gstbase_dep, gstvideo_dep, opencv_dep],
++    )
+ 
+-  gstopencv_dep = declare_dependency(link_with: gstopencv,
+-    include_directories : [libsinc],
+-    dependencies : [gstvideo_dep, opencv_dep])
++    gstopencv_dep = declare_dependency(link_with: gstopencv,
++      include_directories : [libsinc],
++      dependencies : [gstvideo_dep, opencv_dep])
+ 
+-  install_headers(opencv_headers, subdir : 'gstreamer-1.0/gst/opencv')
+-elif get_option('opencv').enabled()
+-  error('OpenCV support enabled but required dependencies were not found.')
++    install_headers(opencv_headers, subdir : 'gstreamer-1.0/gst/opencv')
++  elif get_option('opencv').enabled()
++    error('OpenCV support enabled but required dependencies were not found.')
++  endif
+ endif
+-- 
+2.28.0
+
-- 
2.28.0
