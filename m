From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Nov 2014 15:49:31 +0100
Subject: [Buildroot] [PATCH] package/libwebsockets: fiux static build
Message-ID: <1417272571-11129-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the version was bumped, the existing patch to fix static linking
was not proprerly tested, and was missign three new locations to be
fixed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sagaert Johan <sagaert.johan@skynet.be>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 ...le-shared-library-build-when-BUILD_SHARED.patch | 34 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
index 50e9a4e..f341047 100644
--- a/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
+++ b/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -9,6 +9,8 @@ updating libwebsockets.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
+[yann.morin.1998 at free.fr: further fix after the version bumped]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
  CMakeLists.txt | 17 ++++++++++++-----
  1 file changed, 12 insertions(+), 5 deletions(-)
@@ -76,6 +78,32 @@ index 7978845..89853ce 100644
  	target_link_libraries(${lib} ${LIB_LIST})
  endforeach()
  
--- 
-2.1.2
-
+@@ -800,9 +800,8 @@
+ set(LWS_INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
+ 
+ # Export targets (This is used for other CMake projects to easily find the libraries and include files).
+-export(TARGETS websockets websockets_shared
++export(TARGETS ${_libs_websockets}
+         FILE "${PROJECT_BINARY_DIR}/LibwebsocketsTargets.cmake")
+-export(PACKAGE libwebsockets)
+ 
+ # Generate the config file for the build-tree.
+ set(LWS__INCLUDE_DIRS 
+@@ -836,7 +835,7 @@
+                 ${PROJECT_BINARY_DIR}/LibwebsocketsConfigVersion.cmake 
+                 @ONLY)
+ 
+-set_target_properties(websockets websockets_shared 
++set_target_properties(${_libs_websockets}
+ 					PROPERTIES PUBLIC_HEADER "${HDR_PUBLIC}")
+ 
+ #
+@@ -844,7 +843,7 @@
+ #
+ 
+ # Install libs and headers.
+-install(TARGETS websockets websockets_shared
++install(TARGETS ${_libs_websockets}
+ 		EXPORT LibwebsocketsTargets
+ 		LIBRARY DESTINATION "${LWS_INSTALL_LIB_DIR}${LIB_SUFFIX}" COMPONENT libraries
+ 		ARCHIVE DESTINATION "${LWS_INSTALL_LIB_DIR}${LIB_SUFFIX}" COMPONENT libraries
-- 
1.9.1
