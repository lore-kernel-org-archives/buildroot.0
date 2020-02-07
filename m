From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Feb 2020 15:54:02 +0100
Subject: [Buildroot] [git commit] package/libftdi1: fix python support
Message-ID: <20200207144412.D94648D4D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df734533cfeab86951436b6d0e19e8294e271b35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstreamed patch that reorders find_package() commands.
This way Python interpreter will be detected first and based on
it the Python libraries can be found.

Fixes the following CMake error:

Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-CMake-reorder-Python-detection.patch      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/libftdi1/0004-CMake-reorder-Python-detection.patch b/package/libftdi1/0004-CMake-reorder-Python-detection.patch
new file mode 100644
index 0000000000..c6c2b28c46
--- /dev/null
+++ b/package/libftdi1/0004-CMake-reorder-Python-detection.patch
@@ -0,0 +1,32 @@
+From 640c2b3c0c72d5194d422ff7dda086c4533fba00 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 13 Jan 2020 14:08:44 +0100
+Subject: [PATCH] CMake: reorder Python detection
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
