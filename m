From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  6 Feb 2020 10:54:21 +0100
Subject: [Buildroot] [PATCH] package/libftdi1: fix python support
Message-ID: <20200206095421.12987-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add an upstreamed patch that reorders find_package() commands.
This way Python interpreter will be detected first and based on
it the Python libraries can be found.

Fixes the following CMake error:

Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0004-CMake-reorder-Python-detection.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libftdi1/0004-CMake-reorder-Python-detection.patch

diff --git a/package/libftdi1/0004-CMake-reorder-Python-detection.patch b/package/libftdi1/0004-CMake-reorder-Python-detection.patch
new file mode 100644
index 0000000000..b0eedf07d4
--- /dev/null
+++ b/package/libftdi1/0004-CMake-reorder-Python-detection.patch
@@ -0,0 +1,32 @@
+From 640c2b3c0c72d5194d422ff7dda086c4533fba00 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 13 Jan 2020 14:08:44 +0100
+Subject: [PATCH 4/4] CMake: reorder Python detection
+
+PythonInterp should be detected before PythonLibs otherwise
+CMake exits with the following message:
+
+Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ python/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
+index 90811ca..368bb7e 100644
+--- a/python/CMakeLists.txt
++++ b/python/CMakeLists.txt
+@@ -12,8 +12,8 @@ if ( PYTHON_BINDINGS )
+       set ( SWIG_FOUND TRUE )
+     endif ()
+   endif ()
+-  find_package ( PythonLibs )
+   find_package ( PythonInterp )
++  find_package ( PythonLibs )
+ endif ()
+ 
+ if ( SWIG_FOUND AND PYTHONLIBS_FOUND AND PYTHONINTERP_FOUND )
+-- 
+2.17.0
+
-- 
2.17.0
