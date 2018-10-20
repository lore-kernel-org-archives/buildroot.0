From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Oct 2018 20:30:32 +0200
Subject: [Buildroot] [git commit] xerces: fix build without pthread
Message-ID: <20181020182909.5491087FF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4313544486c9606aa112cf7b06837a35802d6959
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't fail when pthreads is not available

Fixes:
 - http://autobuild.buildroot.org/results/63cc4d3d69db19d0c639437d6996f881888a926b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...checks-to-fail-and-fall-back-to-nothreads.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/xerces/0001-cmake-Allow-thread-checks-to-fail-and-fall-back-to-nothreads.patch b/package/xerces/0001-cmake-Allow-thread-checks-to-fail-and-fall-back-to-nothreads.patch
new file mode 100644
index 0000000000..8bed7711c4
--- /dev/null
+++ b/package/xerces/0001-cmake-Allow-thread-checks-to-fail-and-fall-back-to-nothreads.patch
@@ -0,0 +1,38 @@
+From c9bfe786331647237b90f5f9e35b4d2cad7aaa69 Mon Sep 17 00:00:00 2001
+From: Roger Leigh <rleigh@apache.org>
+Date: Fri, 12 Oct 2018 12:02:58 +0000
+Subject: [PATCH] cmake: Allow thread checks to fail and fall back to nothreads
+
+Closes: #2155
+
+
+git-svn-id: https://svn.apache.org/repos/asf/xerces/c/trunk at 1843653 13f79535-47bb-0310-9956-ffa450edef68
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from: https://github.com/apache/xerces-c/commit/c9bfe786331647237b90f5f9e35b4d2cad7aaa69]
+---
+ cmake/XercesMutexMgrSelection.cmake | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/cmake/XercesMutexMgrSelection.cmake b/cmake/XercesMutexMgrSelection.cmake
+index 2f1d71c50..ad698840d 100644
+--- a/cmake/XercesMutexMgrSelection.cmake
++++ b/cmake/XercesMutexMgrSelection.cmake
+@@ -19,11 +19,15 @@
+ 
+ # mutexmgr selection
+ 
+-option(threads "Threading support" ON)
++set(xerces_thread_default ON)
++find_package(Threads)
++if(NOT TARGET Threads::Threads)
++  set(xerces_thread_default ON)
++endif()
+ 
+-include(CheckCXXSourceCompiles)
++option(threads "Threading support" ${xerces_thread_default})
+ 
+-find_package(Threads REQUIRED)
++include(CheckCXXSourceCompiles)
+ 
+ function(thread_test outvar)
+   set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
