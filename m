From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jun 2017 10:43:17 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/exiv2: fix gettext detection,
	part II
Message-ID: <20170604084317.29214-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems getting the gettext stuff right on all platforms is not that
easy, this patch bumps exiv2 to include all gettext (and pthreads)
patches applied upstream.

To reproduce the problem gettext has to be built before exiv2 so we
make gettext an optional dependency when NLS support is used.

Fixes
http://autobuild.buildroot.net/results/a56/a56c8a8a4c76b7c359ca7f5252be93fd70c6a4c1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bumped to latest git head

 package/exiv2/0001-cmake-fix-gettext-support.patch | 72 ----------------------
 ...s-depend-on-threads-not-only-in-the-xmp-c.patch | 59 ------------------
 package/exiv2/exiv2.hash                           |  4 +-
 package/exiv2/exiv2.mk                             |  8 ++-
 4 files changed, 6 insertions(+), 137 deletions(-)
 delete mode 100644 package/exiv2/0001-cmake-fix-gettext-support.patch
 delete mode 100644 package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch

diff --git a/package/exiv2/0001-cmake-fix-gettext-support.patch b/package/exiv2/0001-cmake-fix-gettext-support.patch
deleted file mode 100644
index 435e08ac6..000000000
--- a/package/exiv2/0001-cmake-fix-gettext-support.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 3af0d1a6b2c12b7f62a293d19bdf235db75d6b07 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 3 Jun 2017 17:18:24 +0200
-Subject: [PATCH] cmake: fix gettext support
-
-Building exiv2 with uclibc and gettext fails currently as detected
-by the buildroot autobuilders:
-http://autobuild.buildroot.net/results/def/defcdd3dd57b031c31bb16c0075f079a482bf52d/build-end.log
-
-Patch sent upstream: https://github.com/Exiv2/exiv2/pull/6
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- config/CMakeChecks.txt | 12 ++++++++++--
- src/CMakeLists.txt     |  6 +++---
- 2 files changed, 13 insertions(+), 5 deletions(-)
-
-diff --git a/config/CMakeChecks.txt b/config/CMakeChecks.txt
-index b3a888f2..f7621a92 100644
---- a/config/CMakeChecks.txt
-+++ b/config/CMakeChecks.txt
-@@ -95,8 +95,16 @@ ELSE( EXIV2_ENABLE_SHARED )
- ENDIF( EXIV2_ENABLE_SHARED )
- 
- IF( EXIV2_ENABLE_NLS )
--    #FIND_PACKAGE(Intl REQUIRED)
--    #INCLUDE_DIRECTORIES(${Intl_INCLUDE_DIRS})
-+    FIND_PACKAGE(Intl)
-+    if(Intl_FOUND)
-+        INCLUDE_DIRECTORIES(${Intl_INCLUDE_DIRS})
-+        find_library(LIBINTL_LIBRARY NAMES intl libintl)
-+        if(libintl_FOUND)
-+            SET(LIBINTL_LIBRARIES ${LIBINTL_LIBRARY})
-+        else(libintl_FOUND)
-+            SET(LIBINTL_LIBRARIES)
-+        endif()
-+    endif()
-     IF( NOT LOCALEDIR )
-         SET( LOCALEDIR "${CMAKE_INSTALL_LOCALEDIR}" )
-         IF( WIN32 )
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index aecd6215..e2904c6f 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -316,13 +316,13 @@ msvc_runtime_configure(${EXIV2_ENABLE_SHARED} ${EXIV2_ENABLE_DYNAMIC_RUNTIME})
- # ******************************************************************************
- # exiv2 application
- ADD_EXECUTABLE( exiv2 ${EXIV2_SRC}  ${EXIV2_HDR} )
--TARGET_LINK_LIBRARIES( exiv2 exiv2lib )
-+TARGET_LINK_LIBRARIES( exiv2 exiv2lib ${LIBINTL_LIBRARIES} )
- INSTALL( TARGETS exiv2 ${INSTALL_TARGET_STANDARD_ARGS} )
- 
- # ******************************************************************************
- # connection test application
- ADD_EXECUTABLE( conntest ${CONNTEST} )
--TARGET_LINK_LIBRARIES( conntest ${PRIVATE_VAR}  exiv2lib ${CURL_LIBRARIES} ${SSH_LIBRARIES})
-+TARGET_LINK_LIBRARIES( conntest ${PRIVATE_VAR}  exiv2lib ${CURL_LIBRARIES} ${SSH_LIBRARIES} ${LIBINTL_LIBRARIES} )
- 
- # ******************************************************************************
- # exifprint application
-@@ -332,7 +332,7 @@ TARGET_LINK_LIBRARIES( conntest ${PRIVATE_VAR}  exiv2lib ${CURL_LIBRARIES} ${SSH
- # ******************************************************************************
- # remotetest application
- ADD_EXECUTABLE( remotetest ${REMOTETEST} )
--TARGET_LINK_LIBRARIES( remotetest exiv2lib )
-+TARGET_LINK_LIBRARIES( remotetest exiv2lib ${LIBINTL_LIBRARIES} )
- 
- # ******************************************************************************
- # Headers
--- 
-2.11.0
-
diff --git a/package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch b/package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch
deleted file mode 100644
index 96b966f94..000000000
--- a/package/exiv2/0002-cmake-always-depend-on-threads-not-only-in-the-xmp-c.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 7acb235c05089e82b16634383ac2b33721258ba1 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 3 Jun 2017 18:25:05 +0200
-Subject: [PATCH] cmake: always depend on threads, not only in the xmp case
-
-Patch sent upstream: https://github.com/Exiv2/exiv2/pull/7
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- CMakeLists.txt         | 1 -
- config/CMakeChecks.txt | 2 ++
- src/CMakeLists.txt     | 2 ++
- 3 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7034bb67..64604c6f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -120,7 +120,6 @@ IF( EXIV2_ENABLE_XMP )
-     IF (NOT MINGW)
-         set(THREADS_PREFER_PTHREAD_FLAG ON)
-     ENDIF()
--    find_package(Threads REQUIRED)
- ENDIF( EXIV2_ENABLE_XMP )
- 
- INCLUDE( config/CMakeChecks.txt )
-diff --git a/config/CMakeChecks.txt b/config/CMakeChecks.txt
-index b3a888f2..e0557642 100644
---- a/config/CMakeChecks.txt
-+++ b/config/CMakeChecks.txt
-@@ -51,6 +51,8 @@ INCLUDE_DIRECTORIES( ${CMAKE_INCLUDE_PATH} ${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_C
- LINK_DIRECTORIES( ${CMAKE_LIBRARY_PATH} )
- SET( CMAKE_REQUIRED_INCLUDES ${CMAKE_INCLUDE_PATH} )
- 
-+find_package(Threads REQUIRED)
-+
- IF( EXIV2_ENABLE_PNG )
-     FIND_PACKAGE( ZLIB REQUIRED )
-     INCLUDE_DIRECTORIES( ${ZLIB_INCLUDE_DIR} )
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index aecd6215..15d521c5 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -268,10 +268,12 @@ else()
-         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} dl ${EXPAT_LIBRARIES} )
-         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} dl ${CURL_LIBRARIES} )
-         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} dl ${SSH_LIBRARIES} )
-+        TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} dl ${CMAKE_THREAD_LIBS_INIT} )
-     else()
-         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} ${EXPAT_LIBRARIES} )
-         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} ${CURL_LIBRARIES} )
-         TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} ${SSH_LIBRARIES} )
-+        TARGET_LINK_LIBRARIES( exiv2lib ${PRIVATE_VAR} ${CMAKE_THREAD_LIBS_INIT} )
-     endif()
- endif()
- 
--- 
-2.11.0
-
diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index cdd840c22..e30cbfaa5 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,4 +1,2 @@
-# From http://www.exiv2.org/download.html
-md5 f936d2ca5cbe1e18c71ca2baa5e84fb4 exiv2-0.26-trunk.tar.gz
 # Locally calculated
-sha256 0c625cbeb494aa1b9221280a5b053b54d0c9720d48fa9120cef7c6f93efd4dc3 exiv2-0.26-trunk.tar.gz
+sha256 290cb6208f143b9bd5074d790fc8924409f28e5813356c143d739a3311d8ad76  exiv2-910f3507795e1930ae216c9febee0bf9a88e99c0.tar.gz
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index bdd40f7f4..6bc88482c 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.26
-EXIV2_SITE = http://www.exiv2.org/builds
-EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-trunk.tar.gz
+EXIV2_VERSION = 910f3507795e1930ae216c9febee0bf9a88e99c0
+EXIV2_SITE = $(call github,Exiv2,exiv2,$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
@@ -45,6 +44,9 @@ endif
 
 ifeq ($(BR2_ENABLE_LOCALE),y)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_NLS=ON
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+EXIV2_DEPENDENCIES += gettext
+endif
 else
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_NLS=OFF
 endif
-- 
2.11.0
