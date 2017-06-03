From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 18:43:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/exiv2: fix thread detection with
	xmp support disabled
Message-ID: <20170603164322.23694-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/46f/46f273cf46ab5050ce7c23c968fcc7ce69f32626/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...s-depend-on-threads-not-only-in-the-xmp-c.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch

diff --git a/package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch b/package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch
new file mode 100644
index 000000000..447241a94
--- /dev/null
+++ b/package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch
@@ -0,0 +1,59 @@
+From 7acb235c05089e82b16634383ac2b33721258ba1 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 3 Jun 2017 18:25:05 +0200
+Subject: [PATCH 1/1] cmake: always depend on threads, not only in the xmp case
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
-- 
2.11.0
