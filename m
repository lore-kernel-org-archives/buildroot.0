From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 22:58:19 +0200
Subject: [Buildroot] [git commit] i2pd: bump to version 2.19.0
Message-ID: <20180725205550.484628A3E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba0fb51352078b4d5a8e41b6ba6e26def942b3da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove first two patches (already in version)
- Rename third patch so it is now the first one

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch | 28 ---------
 ...ists.txt-don-t-install-source-and-licens.patch} |  0
 package/i2pd/0002-Install-libi2pdclient.patch      | 69 ----------------------
 package/i2pd/i2pd.hash                             |  2 +-
 package/i2pd/i2pd.mk                               |  2 +-
 5 files changed, 2 insertions(+), 99 deletions(-)

diff --git a/package/i2pd/0001-Fix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch b/package/i2pd/0001-Fix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch
deleted file mode 100644
index d30e62f4f3..0000000000
--- a/package/i2pd/0001-Fix-cmake-error-when-DBUILD_SHARED_LIBS-ON.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6d15be9a32989b0d00312a5b2589e36ba0ea7836 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 4 Mar 2018 18:29:13 +0100
-Subject: [PATCH] Fix cmake error when -DBUILD_SHARED_LIBS=ON
-
-Fixes "CMake Error: TARGETS given no LIBRARY DESTINATION for shared
-library target" by adding LIBRARY parameter to INSTALL call
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- build/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/build/CMakeLists.txt b/build/CMakeLists.txt
-index 4f875b33..a1c8957b 100644
---- a/build/CMakeLists.txt
-+++ b/build/CMakeLists.txt
-@@ -97,6 +97,7 @@ set_target_properties(libi2pd PROPERTIES PREFIX "")
- install(TARGETS libi2pd
-   EXPORT libi2pd
-   ARCHIVE DESTINATION lib
-+  LIBRARY DESTINATION lib
-   COMPONENT Libraries)
- # TODO Make libi2pd available to 3rd party projects via CMake as imported target
- # FIXME This pulls stdafx
--- 
-2.14.1
-
diff --git a/package/i2pd/0003-build-CMakeLists.txt-don-t-install-source-and-licens.patch b/package/i2pd/0001-build-CMakeLists.txt-don-t-install-source-and-licens.patch
similarity index 100%
rename from package/i2pd/0003-build-CMakeLists.txt-don-t-install-source-and-licens.patch
rename to package/i2pd/0001-build-CMakeLists.txt-don-t-install-source-and-licens.patch
diff --git a/package/i2pd/0002-Install-libi2pdclient.patch b/package/i2pd/0002-Install-libi2pdclient.patch
deleted file mode 100644
index 1774977965..0000000000
--- a/package/i2pd/0002-Install-libi2pdclient.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 1d934bd543360bfdd40e1501d16d8beb2016ccd8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 5 Mar 2018 14:55:54 +0100
-Subject: [PATCH] Install libi2pdclient
-
-When building with -DBUILD_SHARED_LIBS=ON, libi2pdclient is not
-installed on target so install it by calling install. Moreover, rename
-i2pdclient to libi2pdclient so library is installed with correct name.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- build/CMakeLists.txt | 16 +++++++++++-----
- 1 file changed, 11 insertions(+), 5 deletions(-)
-
-diff --git a/build/CMakeLists.txt b/build/CMakeLists.txt
-index a1c8957b..364c3304 100644
---- a/build/CMakeLists.txt
-+++ b/build/CMakeLists.txt
-@@ -120,7 +120,13 @@ set (CLIENT_SRC
- if(WITH_WEBSOCKETS)
-   list (APPEND CLIENT_SRC "${LIBI2PD_CLIENT_SRC_DIR}/Websocket.cpp")
- endif ()
--add_library(i2pdclient ${CLIENT_SRC})
-+add_library(libi2pdclient ${CLIENT_SRC})
-+set_target_properties(libi2pdclient PROPERTIES PREFIX "")
-+install(TARGETS libi2pdclient
-+  EXPORT libi2pdclient
-+  ARCHIVE DESTINATION lib
-+  LIBRARY DESTINATION lib
-+  COMPONENT Libraries)
- 
- set(DAEMON_SRC_DIR ../daemon)
- 
-@@ -304,7 +310,7 @@ if (WITH_PCH)
-       WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
-       )
-     target_compile_options(libi2pd PRIVATE /FIstdafx.h /Yustdafx.h /Zm155 "/Fp${CMAKE_BINARY_DIR}/stdafx.dir/$<CONFIG>/stdafx.pch")
--    target_compile_options(i2pdclient PRIVATE /FIstdafx.h /Yustdafx.h /Zm155 "/Fp${CMAKE_BINARY_DIR}/stdafx.dir/$<CONFIG>/stdafx.pch")
-+    target_compile_options(libi2pdclient PRIVATE /FIstdafx.h /Yustdafx.h /Zm155 "/Fp${CMAKE_BINARY_DIR}/stdafx.dir/$<CONFIG>/stdafx.pch")
-   else()
-     string(TOUPPER ${CMAKE_BUILD_TYPE} BTU)
-     get_directory_property(DEFS DEFINITIONS)
-@@ -313,12 +319,12 @@ if (WITH_PCH)
-       COMMAND ${CMAKE_CXX_COMPILER} ${FLAGS} -c ${CMAKE_CURRENT_SOURCE_DIR}/../libi2pd/stdafx.h -o ${CMAKE_BINARY_DIR}/stdafx.h.gch
-     )
-     target_compile_options(libi2pd PRIVATE -include libi2pd/stdafx.h)
--    target_compile_options(i2pdclient PRIVATE -include libi2pd/stdafx.h)
-+    target_compile_options(libi2pdclient PRIVATE -include libi2pd/stdafx.h)
-   endif()
-   target_link_libraries(libi2pd stdafx)
- endif()
- 
--target_link_libraries(i2pdclient libi2pd)
-+target_link_libraries(libi2pdclient libi2pd)
- 
- find_package ( Boost COMPONENTS system filesystem program_options date_time REQUIRED )
- if(NOT DEFINED Boost_INCLUDE_DIRS)
-@@ -451,7 +457,7 @@ if (WITH_BINARY)
-   if (WITH_STATIC)
-     set(DL_LIB ${CMAKE_DL_LIBS})
-   endif()
--  target_link_libraries( "${PROJECT_NAME}" libi2pd i2pdclient ${DL_LIB} ${Boost_LIBRARIES} ${OPENSSL_LIBRARIES} ${ZLIB_LIBRARY} ${CMAKE_THREAD_LIBS_INIT} ${MINGW_EXTRA} ${DL_LIB} ${CMAKE_REQUIRED_LIBRARIES})
-+  target_link_libraries( "${PROJECT_NAME}" libi2pd libi2pdclient ${DL_LIB} ${Boost_LIBRARIES} ${OPENSSL_LIBRARIES} ${ZLIB_LIBRARY} ${CMAKE_THREAD_LIBS_INIT} ${MINGW_EXTRA} ${DL_LIB} ${CMAKE_REQUIRED_LIBRARIES})
- 
-   install(TARGETS "${PROJECT_NAME}" RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT Runtime)
-   set (APPS "\${CMAKE_INSTALL_PREFIX}/bin/${PROJECT_NAME}${CMAKE_EXECUTABLE_SUFFIX}")
--- 
-2.14.1
-
diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index b7a60c9164..753df0be5a 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	8834190418de0c4e56c46eb8b9dc4422ef14f1ad7d6591e9daae99493bf7170e	i2pd-2.18.0.tar.gz
+sha256	7202497ffc3db632d0f7fed93eafaf39aa75efea199705dae7d022249b069eb9	i2pd-2.19.0.tar.gz
 sha256	d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c	LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index c79a9d0b4a..b7ebd718a5 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.18.0
+I2PD_VERSION = 2.19.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
