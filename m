From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 18 Sep 2016 22:56:18 +0200
Subject: [Buildroot] [PATCH 1/2] Openjpeg: Add patch to enable finding
	pthreads library by default
In-Reply-To: <1474232179-19811-1-git-send-email-olivier.schonken@gmail.com>
References: <1474232179-19811-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1474232179-19811-2-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 ...eLists-to-include-finding-of-pthreads-by-.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/openjpeg/0001-Modify-CmakeLists-to-include-finding-of-pthreads-by-.patch

diff --git a/package/openjpeg/0001-Modify-CmakeLists-to-include-finding-of-pthreads-by-.patch b/package/openjpeg/0001-Modify-CmakeLists-to-include-finding-of-pthreads-by-.patch
new file mode 100644
index 0000000..c31ad06
--- /dev/null
+++ b/package/openjpeg/0001-Modify-CmakeLists-to-include-finding-of-pthreads-by-.patch
@@ -0,0 +1,49 @@
+From 0465bc4be814f01073cd31bbd6ad1f3a87a599c1 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Sun, 18 Sep 2016 22:23:06 +0200
+Subject: [PATCH] Modify CmakeLists to include finding of pthreads by default
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ CMakeLists.txt             | 8 ++++----
+ src/bin/jp2/CMakeLists.txt | 2 +-
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 229da1e..66cf631 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -219,13 +219,13 @@ OPJ_TEST_LARGE_FILES(OPJ_HAVE_LARGEFILES)
+ 
+ #-----------------------------------------------------------------------------
+ # Build Library
++find_package(Threads REQUIRED)
++if(NOT CMAKE_USE_PTHREADS_INIT)
++  message(FATAL_ERROR "Only pthread are supported")
++endif()
+ if(BUILD_JPIP_SERVER)
+   find_package(CURL REQUIRED)
+   find_package(FCGI REQUIRED)
+-  find_package(Threads REQUIRED)
+-  if(NOT CMAKE_USE_PTHREADS_INIT)
+-    message(FATAL_ERROR "Only pthread are supported")
+-  endif()
+ endif()
+ add_subdirectory(src/lib)
+ 
+diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt
+index 1c2ef39..ae35f0c 100644
+--- a/src/bin/jp2/CMakeLists.txt
++++ b/src/bin/jp2/CMakeLists.txt
+@@ -32,7 +32,7 @@ endif()
+ foreach(exe opj_decompress opj_compress opj_dump)
+   add_executable(${exe} ${exe}.c ${common_SRCS})
+   target_link_libraries(${exe} ${OPENJPEG_LIBRARY_NAME}
+-    ${PNG_LIBNAME} ${TIFF_LIBNAME} ${LCMS_LIBNAME}
++    ${PNG_LIBNAME} ${TIFF_LIBNAME} ${LCMS_LIBNAME} ${CMAKE_THREAD_LIBS_INIT}
+     )
+   # To support universal exe:
+   if(ZLIB_FOUND AND APPLE)
+-- 
+2.7.4
+
-- 
2.7.4
