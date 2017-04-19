From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 19 Apr 2017 12:11:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/opencv: fix static linking
In-Reply-To: <20170419101142.13051-1-bernd.kuhls@t-online.de>
References: <20170419101142.13051-1-bernd.kuhls@t-online.de>
Message-ID: <20170419101142.13051-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes ffmpeg static linking
http://autobuild.buildroot.net/results/7e6/7e67d7e6e33b52ce7fbb9cb180b2b9b19e116eee/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...enCVGenPkgconfig.cmake-fix-static-linking.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/opencv/0004-cmake-OpenCVGenPkgconfig.cmake-fix-static-linking.patch

diff --git a/package/opencv/0004-cmake-OpenCVGenPkgconfig.cmake-fix-static-linking.patch b/package/opencv/0004-cmake-OpenCVGenPkgconfig.cmake-fix-static-linking.patch
new file mode 100644
index 000000000..1f49dd8b4
--- /dev/null
+++ b/package/opencv/0004-cmake-OpenCVGenPkgconfig.cmake-fix-static-linking.patch
@@ -0,0 +1,60 @@
+From 7969a6c89a4144216654de5419999a5a04c18c64 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Wed, 19 Apr 2017 11:26:00 +0200
+Subject: [PATCH 1/1] cmake/OpenCVGenPkgconfig.cmake: fix static linking
+
+https://github.com/opencv/opencv/commit/671a630f47635ee8e44daf5ae6e94969ac4b8e0f#diff-9076fba682f6d51a018b6de8648e1cdb
+updated the code to create opencv.pc to fix build errors in buildroot.
+
+In case of static-only builds with glib-enabled qt this however creates
+a broken opencv.pc because libname gets truncated from libglib-2.0.a to
+libglib-2, same is valid for libgobject-2.0.a and libgthread-2.0.a.
+
+CMake get_filename_component removes all extensions from the filename
+https://cmake.org/cmake/help/v3.0/command/get_filename_component.html
+which is too much for our use-case.
+
+opencv.pc currently contains -lgobject-2 -lglib-2 -lgthread-2, linking
+against these libs will fail, for example in ffmpeg, because the files
+do not exist:
+http://autobuild.buildroot.net/results/7e6/7e67d7e6e33b52ce7fbb9cb180b2b9b19e116eee/build-end.log
+
+Quoting ffmpeg configure.log:
+
+i586-buildroot-linux-musl/bin/ld: cannot find -lgobject-2
+i586-buildroot-linux-musl/bin/ld: cannot find -lglib-2
+i586-buildroot-linux-musl/bin/ld: cannot find -lgthread-2
+
+Instead of using get_filename_component we need a function which only
+strips the last extension, copied from openjpeg:
+
+https://github.com/uclouvain/openjpeg/commit/820c04c6799ea38aacd4e5d637073e6ab1ec643c#diff-53c915af197ccc28c0551ce6aae49af7R53
+
+Patch sent upstream: https://github.com/opencv/opencv/pull/8611
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ cmake/OpenCVGenPkgconfig.cmake | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
+index 4c46e66f4..d4eb9b6d3 100644
+--- a/cmake/OpenCVGenPkgconfig.cmake
++++ b/cmake/OpenCVGenPkgconfig.cmake
+@@ -74,7 +74,12 @@ if(OpenCV_EXTRA_COMPONENTS)
+       list(APPEND OpenCV_LIB_COMPONENTS_ "${extra_component}")
+     elseif(extra_component MATCHES "[\\/]")
+       get_filename_component(libdir "${extra_component}" PATH)
+-      get_filename_component(libname "${extra_component}" NAME_WE)
++# cannot use longest extension function, since some libnames contain
++# multiple dots, like libglib-2.0.a.
++# Instead write out own shortest extension function:
++      get_filename_component(libname "${extra_component}" NAME)
++      string(FIND ${libname} "." SHORTEST_EXT_POS REVERSE)
++      string(SUBSTRING ${libname} 0 ${SHORTEST_EXT_POS} libname)
+       string(REGEX REPLACE "^lib" "" libname "${libname}")
+       list(APPEND OpenCV_LIB_COMPONENTS_ "-L${libdir}" "-l${libname}")
+     else()
+-- 
+2.11.0
+
-- 
2.11.0
