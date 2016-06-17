From: Ben Boeckel <mathstuf@gmail.com>
Date: Thu, 16 Jun 2016 22:08:36 -0400
Subject: [Buildroot] [PATCH 1/1] taskd: support linking against static
	gnutls and uuid
Message-ID: <20160617020836.9765-1-mathstuf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The FindGnuTLS module shipped with CMake does not expose the information
required for proper linking if it is a static library.

Similarly, the code which searches for the uuid library is insufficient
for such a task.

Also, find_package(Threads) was missing, so pthreads was not properly
linked.

Do not send this patch to taskwarrior upstream; it is not a proper fix.

Fixes:
http://autobuild.buildroot.net/results/67f574af0cc4348ffe2bce026c44766e49c29124/
Signed-off-by: Ben Boeckel <mathstuf@gmail.com>
---
 ...ix-linking-against-deps-statically-on-arc.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/taskd/0001-buildroot-fix-linking-against-deps-statically-on-arc.patch

diff --git a/package/taskd/0001-buildroot-fix-linking-against-deps-statically-on-arc.patch b/package/taskd/0001-buildroot-fix-linking-against-deps-statically-on-arc.patch
new file mode 100644
index 0000000..56f9dfc
--- /dev/null
+++ b/package/taskd/0001-buildroot-fix-linking-against-deps-statically-on-arc.patch
@@ -0,0 +1,52 @@
+From b916016eaf3a3bdb555de11610c0b7964d52da96 Mon Sep 17 00:00:00 2001
+From: Ben Boeckel <mathstuf@gmail.com>
+Date: Thu, 16 Jun 2016 21:58:47 -0400
+Subject: [PATCH] buildroot: fix linking against deps statically on arc
+
+Also find the Threads package so that CMAKE_THREAD_LIBS_INIT is actually
+set.
+
+Explicitly not signing this off because it should not go to taskwarrior
+upstream; deeper fixes are required.
+---
+ CMakeLists.txt     | 4 ++--
+ src/CMakeLists.txt | 1 +
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9a049b0..09f3209 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -49,7 +49,7 @@ find_package (GnuTLS REQUIRED)
+ if (GNUTLS_FOUND)
+   set (HAVE_LIBGNUTLS true)
+   set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${GNUTLS_INCLUDE_DIR})
+-  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${GNUTLS_LIBRARIES})
++  set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${PC_GNUTLS_STATIC_LIBRARIES})
+ endif (GNUTLS_FOUND)
+ 
+ check_function_exists (timegm          HAVE_TIMEGM)
+@@ -68,7 +68,7 @@ else (DARWIN OR FREEBSD OR OPENBSD)
+   find_library (UUID_LIBRARY NAMES uuid)
+   if (UUID_INCLUDE_DIR AND UUID_LIBRARY)
+     set (TASKD_INCLUDE_DIRS ${TASKD_INCLUDE_DIRS} ${UUID_INCLUDE_DIR})
+-    set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${UUID_LIBRARY})
++    set (TASKD_LIBRARIES    ${TASKD_LIBRARIES}    ${UUID_LIBRARY} -lintl)
+     # Look for uuid_unparse_lower
+     set (CMAKE_REQUIRED_INCLUDES  ${CMAKE_REQUIRED_INCLUDES}  ${UUID_INCLUDE_DIR})
+     set (CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${UUID_LIBRARY})
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 5820392..243b0f9 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -35,6 +35,7 @@ add_library (taskd admin.cpp
+                    util.cpp       util.h
+                    wcwidth6.cpp)
+ 
++find_package(Threads REQUIRED)
+ add_executable (taskd_executable taskd.cpp)
+ target_link_libraries (taskd_executable taskd ${TASKD_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
+ set_property (TARGET taskd_executable PROPERTY OUTPUT_NAME "taskd")
+-- 
+2.9.0
+
-- 
2.9.0
