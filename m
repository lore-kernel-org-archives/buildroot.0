From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Jun 2018 22:24:56 +0200
Subject: [Buildroot] [PATCH 1/1] cmake: fix build with libuv 1.21.0
Message-ID: <20180623202456.21724-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Retrieve patch from
https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=229255#c1

Fixes:
 - http://autobuild.buildroot.net/results/86d67e5d30f7e3ba9a4932c06640a7924202d3f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-check-uv-version-h-for-version-detection.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch

diff --git a/package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch b/package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
new file mode 100644
index 0000000000..9abf1a538f
--- /dev/null
+++ b/package/cmake/0002-FindLibUV-Also-check-uv-version-h-for-version-detection.patch
@@ -0,0 +1,32 @@
+From 92c4b3d900a24512967a960f108d985c819fdf00 Mon Sep 17 00:00:00 2001
+From: Raphael Kubo da Costa <rakuco@FreeBSD.org>
+Date: Sat, 23 Jun 2018 20:30:07 +0200
+Subject: [PATCH] FindLibUV: Also check uv/version.h for version detection
+
+Starting with libuv 1.21.0, libuv's headers were moved into a uv/ directory.
+Make FindLibUV aware of the file's new location for configuration to work.
+
+Upstream change: https://github.com/libuv/libuv/pull/1429
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieve from: https://gitlab.kitware.com/cmake/cmake/merge_requests/2169]
+---
+ Source/Modules/FindLibUV.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Source/Modules/FindLibUV.cmake b/Source/Modules/FindLibUV.cmake
+index ba13d75f8b..0554d62c23 100644
+--- a/Source/Modules/FindLibUV.cmake
++++ b/Source/Modules/FindLibUV.cmake
+@@ -63,6 +63,8 @@ mark_as_advanced(LibUV_INCLUDE_DIR)
+ set(_LibUV_H_REGEX "#[ \t]*define[ \t]+UV_VERSION_(MAJOR|MINOR|PATCH)[ \t]+[0-9]+")
+ if(LibUV_INCLUDE_DIR AND EXISTS "${LibUV_INCLUDE_DIR}/uv-version.h")
+   file(STRINGS "${LibUV_INCLUDE_DIR}/uv-version.h" _LibUV_H REGEX "${_LibUV_H_REGEX}")
++elseif(LibUV_INCLUDE_DIR AND EXISTS "${LibUV_INCLUDE_DIR}/uv/version.h")
++  file(STRINGS "${LibUV_INCLUDE_DIR}/uv/version.h" _LibUV_H REGEX "${_LibUV_H_REGEX}")
+ elseif(LibUV_INCLUDE_DIR AND EXISTS "${LibUV_INCLUDE_DIR}/uv.h")
+   file(STRINGS "${LibUV_INCLUDE_DIR}/uv.h" _LibUV_H REGEX "${_LibUV_H_REGEX}")
+ else()
+-- 
+2.16.4
+
-- 
2.14.1
