From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 18:30:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/exiv2: fix gettext support
Message-ID: <20170603163012.21169-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/def/defcdd3dd57b031c31bb16c0075f079a482bf52d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exiv2/0001-cmake-fix-gettext-support.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/exiv2/0001-cmake-fix-gettext-support.patch

diff --git a/package/exiv2/0001-cmake-fix-gettext-support.patch b/package/exiv2/0001-cmake-fix-gettext-support.patch
new file mode 100644
index 000000000..874553d9a
--- /dev/null
+++ b/package/exiv2/0001-cmake-fix-gettext-support.patch
@@ -0,0 +1,72 @@
+From 3af0d1a6b2c12b7f62a293d19bdf235db75d6b07 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 3 Jun 2017 17:18:24 +0200
+Subject: [PATCH 1/1] cmake: fix gettext support
+
+Building exiv2 with uclibc and gettext fails currently as detected
+by the buildroot autobuilders:
+http://autobuild.buildroot.net/results/def/defcdd3dd57b031c31bb16c0075f079a482bf52d/build-end.log
+
+Patch sent upstream: https://github.com/Exiv2/exiv2/pull/6
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ config/CMakeChecks.txt | 12 ++++++++++--
+ src/CMakeLists.txt     |  6 +++---
+ 2 files changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/config/CMakeChecks.txt b/config/CMakeChecks.txt
+index b3a888f2..f7621a92 100644
+--- a/config/CMakeChecks.txt
++++ b/config/CMakeChecks.txt
+@@ -95,8 +95,16 @@ ELSE( EXIV2_ENABLE_SHARED )
+ ENDIF( EXIV2_ENABLE_SHARED )
+ 
+ IF( EXIV2_ENABLE_NLS )
+-    #FIND_PACKAGE(Intl REQUIRED)
+-    #INCLUDE_DIRECTORIES(${Intl_INCLUDE_DIRS})
++    FIND_PACKAGE(Intl)
++    if(Intl_FOUND)
++        INCLUDE_DIRECTORIES(${Intl_INCLUDE_DIRS})
++        find_library(LIBINTL_LIBRARY NAMES intl libintl)
++        if(libintl_FOUND)
++            SET(LIBINTL_LIBRARIES ${LIBINTL_LIBRARY})
++        else(libintl_FOUND)
++            SET(LIBINTL_LIBRARIES)
++        endif()
++    endif()
+     IF( NOT LOCALEDIR )
+         SET( LOCALEDIR "${CMAKE_INSTALL_LOCALEDIR}" )
+         IF( WIN32 )
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index aecd6215..e2904c6f 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -316,13 +316,13 @@ msvc_runtime_configure(${EXIV2_ENABLE_SHARED} ${EXIV2_ENABLE_DYNAMIC_RUNTIME})
+ # ******************************************************************************
+ # exiv2 application
+ ADD_EXECUTABLE( exiv2 ${EXIV2_SRC}  ${EXIV2_HDR} )
+-TARGET_LINK_LIBRARIES( exiv2 exiv2lib )
++TARGET_LINK_LIBRARIES( exiv2 exiv2lib ${LIBINTL_LIBRARIES} )
+ INSTALL( TARGETS exiv2 ${INSTALL_TARGET_STANDARD_ARGS} )
+ 
+ # ******************************************************************************
+ # connection test application
+ ADD_EXECUTABLE( conntest ${CONNTEST} )
+-TARGET_LINK_LIBRARIES( conntest ${PRIVATE_VAR}  exiv2lib ${CURL_LIBRARIES} ${SSH_LIBRARIES})
++TARGET_LINK_LIBRARIES( conntest ${PRIVATE_VAR}  exiv2lib ${CURL_LIBRARIES} ${SSH_LIBRARIES} ${LIBINTL_LIBRARIES} )
+ 
+ # ******************************************************************************
+ # exifprint application
+@@ -332,7 +332,7 @@ TARGET_LINK_LIBRARIES( conntest ${PRIVATE_VAR}  exiv2lib ${CURL_LIBRARIES} ${SSH
+ # ******************************************************************************
+ # remotetest application
+ ADD_EXECUTABLE( remotetest ${REMOTETEST} )
+-TARGET_LINK_LIBRARIES( remotetest exiv2lib )
++TARGET_LINK_LIBRARIES( remotetest exiv2lib ${LIBINTL_LIBRARIES} )
+ 
+ # ******************************************************************************
+ # Headers
+-- 
+2.11.0
+
-- 
2.11.0
