From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jun 2017 19:09:20 +0200
Subject: [Buildroot] [git commit] package/exiv2: fix thread detection with
	xmp support disabled
Message-ID: <20170603170943.D9B50826FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfc90a5621c680000f8b19e8afea944da5c2a469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/46f273cf46ab5050ce7c23c968fcc7ce69f32626/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...s-depend-on-threads-not-only-in-the-xmp-c.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch b/package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch
new file mode 100644
index 0000000..96b966f
--- /dev/null
+++ b/package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch
@@ -0,0 +1,59 @@
+From 7acb235c05089e82b16634383ac2b33721258ba1 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 3 Jun 2017 18:25:05 +0200
+Subject: [PATCH] cmake: always depend on threads, not only in the xmp case
+
+Patch sent upstream: https://github.com/Exiv2/exiv2/pull/7
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt         | 1 -
+ config/CMakeChecks.txt | 2 ++
+ src/CMakeLists.txt     | 2 ++
+ 3 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7034bb67..64604c6f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -120,7 +120,6 @@ IF( EXIV2_ENABLE_XMP )
+     IF (NOT MINGW)
+         set(THREADS_PREFER_PTHREAD_FLAG ON)
+     ENDIF()
+-    find_package(Threads REQUIRED)
+ ENDIF( EXIV2_ENABLE_XMP )
+ 
+ INCLUDE( config/CMakeChecks.txt )
+diff --git a/config/CMakeChecks.txt b/config/CMakeChecks.txt
+index b3a888f2..e0557642 100644
+--- a/config/CMakeChecks.txt
++++ b/config/CMakeChecks.txt
+@@ -51,6 +51,8 @@ INCLUDE_DIRECTORIES( ${CMAKE_INCLUDE_PATH} ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_C
+ LINK_DIRECTORIES( ${CMAKE_LIBRARY_PATH} )
+ SET( CMAKE_REQUIRED_INCLUDES ${CMAKE_INCLUDE_PATH} )
+ 
++find_package(Threads REQUIRED)
++
+ IF( EXIV2_ENABLE_PNG )
+     FIND_PACKAGE( ZLIB REQUIRED )
+     INCLUDE_DIRECTORIES( ${ZLIB_INCLUDE_DIR} )
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index aecd6215..15d521c5 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -268,10 +268,12 @@ else()
+         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} dl ${EXPAT_LIBRARIES} )
+         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} dl ${CURL_LIBRARIES} )
+         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} dl ${SSH_LIBRARIES} )
++        TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} dl ${CMAKE_THREAD_LIBS_INIT} )
+     else()
+         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} ${EXPAT_LIBRARIES} )
+         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} ${CURL_LIBRARIES} )
+         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} ${SSH_LIBRARIES} )
++        TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} ${CMAKE_THREAD_LIBS_INIT} )
+     endif()
+ endif()
+ 
+-- 
+2.11.0
+
