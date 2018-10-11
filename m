From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Oct 2018 22:27:10 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: fix build without pthread
Message-ID: <20181011202710.9575-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If threads is set to OFF, do not fail when pthreads is not available

Fixes:
 - http://autobuild.buildroot.org/results/63cc4d3d69db19d0c639437d6996f881888a926b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-without-pthread.patch      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/xerces/0001-fix-build-without-pthread.patch

diff --git a/package/xerces/0001-fix-build-without-pthread.patch b/package/xerces/0001-fix-build-without-pthread.patch
new file mode 100644
index 0000000000..f84049c357
--- /dev/null
+++ b/package/xerces/0001-fix-build-without-pthread.patch
@@ -0,0 +1,51 @@
+From d6a1e80b4dd36c138f5ee9163ff69a90b743ee49 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Oct 2018 22:11:54 +0200
+Subject: [PATCH] fix build without pthread
+
+If threads is set to OFF, do not fail when pthreads is not available
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://issues.apache.org/jira/browse/XERCESC-2155]
+---
+ cmake/XercesMutexMgrSelection.cmake | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/cmake/XercesMutexMgrSelection.cmake b/cmake/XercesMutexMgrSelection.cmake
+index 2f1d71c50..7502c3719 100644
+--- a/cmake/XercesMutexMgrSelection.cmake
++++ b/cmake/XercesMutexMgrSelection.cmake
+@@ -23,12 +23,13 @@ option(threads "Threading support" ON)
+ 
+ include(CheckCXXSourceCompiles)
+ 
+-find_package(Threads REQUIRED)
++if(threads)
++  find_package(Threads REQUIRED)
+ 
+-function(thread_test outvar)
+-  set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
++  function(thread_test outvar)
++    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
+ 
+-  check_cxx_source_compiles(
++    check_cxx_source_compiles(
+ "#include <thread>
+ #include <mutex>
+ #include <iostream>
+@@ -57,10 +58,9 @@ int main() {
+ }"
+ ${outvar})
+ 
+-  set(${outvar} ${${outvar}} PARENT_SCOPE)
+-endfunction(thread_test)
++    set(${outvar} ${${outvar}} PARENT_SCOPE)
++  endfunction(thread_test)
+ 
+-if(threads)
+   set(THREADS_PREFER_PTHREAD_FLAG ON)
+   add_definitions(-D_THREAD_SAFE=1)
+   find_package(Threads)
+-- 
+2.17.1
+
-- 
2.17.1
