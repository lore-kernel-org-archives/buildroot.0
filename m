From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 12:44:14 +0100
Subject: [Buildroot] [PATCH] package/libwebsockets: fix static build
Message-ID: <1417347854-27983-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the version was bumped, the existing patch to fix static linking
was not proprerly tested, and was missing three new locations to be
fixed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sagaert Johan <sagaert.johan@skynet.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
  - remove spurious hunk
  - fix typoes  (Baruch, Samuel)
---
 ...le-shared-library-build-when-BUILD_SHARED.patch | 32 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/libwebsockets/libwebsockets-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
index 50e9a4e..95d1ad8 100644
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
@@ -76,6 +78,30 @@ index 7978845..89853ce 100644
  	target_link_libraries(${lib} ${LIB_LIST})
  endforeach()
  
--- 
-2.1.2
-
+@@ -793,7 +800,7 @@
+ set(LWS_INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
+ 
+ # Export targets (This is used for other CMake projects to easily find the libraries and include files).
+-export(TARGETS websockets websockets_shared
++export(TARGETS ${_libs_websockets}
+         FILE "${PROJECT_BINARY_DIR}/LibwebsocketsTargets.cmake")
+ export(PACKAGE libwebsockets)
+ 
+@@ -829,7 +835,7 @@
+                 ${PROJECT_BINARY_DIR}/LibwebsocketsConfigVersion.cmake 
+                 @ONLY)
+ 
+-set_target_properties(websockets websockets_shared 
++set_target_properties(${_libs_websockets}
+ 					PROPERTIES PUBLIC_HEADER "${HDR_PUBLIC}")
+ 
+ #
+@@ -837,7 +843,7 @@
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
