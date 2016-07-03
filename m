From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:28:35 +0200
Subject: [Buildroot] [git commit] package/tinyxml2: bump version to 3.0.0
Message-ID: <20160703083005.4B3CA80131@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e500cc39dda1a7e4a26e938e91b8b0e23a53914b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patches as they were applied upstream:

0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
https://github.com/leethomason/tinyxml2/commit/c8ec6fcab4eb501cc5bd328c19dcbd4b30722d52

0002-Rename-test-fixed-cmake-warning.patch
https://github.com/leethomason/tinyxml2/commit/0b2c22bd46be95b08f234b8b4cb262f72ab3f0e8

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 ...0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch | 65 ----------------------
 .../0002-Rename-test-fixed-cmake-warning.patch     | 38 -------------
 package/tinyxml2/tinyxml2.hash                     |  2 +-
 package/tinyxml2/tinyxml2.mk                       |  2 +-
 4 files changed, 2 insertions(+), 105 deletions(-)

diff --git a/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch b/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
deleted file mode 100644
index 52288c5..0000000
--- a/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 69acf13fa679628259063c4d0cd17e59b8bb0b75 Mon Sep 17 00:00:00 2001
-From: xantares <xantares09@hotmail.com>
-Date: Fri, 14 Nov 2014 19:40:58 +0100
-Subject: [PATCH] Use BUILD_SHARED_LIBS cmake standard.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- CMakeLists.txt | 27 +++++++++------------------
- 1 file changed, 9 insertions(+), 18 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 91c61a4..4375bb9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -10,8 +10,8 @@ include(GNUInstallDirs)
- ################################
- # set lib version here
- 
--set(GENERIC_LIB_VERSION "2.2.0")
--set(GENERIC_LIB_SOVERSION "2")
-+set(GENERIC_LIB_VERSION "2.2.0")
-+set(GENERIC_LIB_SOVERSION "2")
- 
- 
- ################################
-@@ -46,12 +46,8 @@ endif(MSVC)
- 
- ################################
- # Add targets
--set(BUILD_STATIC_LIBS ON CACHE BOOL "Set to ON to build static libraries")
--if(BUILD_STATIC_LIBS)
--	add_library(tinyxml2static STATIC tinyxml2.cpp tinyxml2.h)
--	set_target_properties(tinyxml2static PROPERTIES OUTPUT_NAME tinyxml2)
--endif(BUILD_STATIC_LIBS)
--add_library(tinyxml2 SHARED tinyxml2.cpp tinyxml2.h)
-+option(BUILD_SHARED_LIBS "build shared or static libraries" ON)
-+add_library(tinyxml2 tinyxml2.cpp tinyxml2.h)
- set_target_properties(tinyxml2 PROPERTIES
-         COMPILE_DEFINITIONS "TINYXML2_EXPORT"
- 	VERSION "${GENERIC_LIB_VERSION}"
-@@ -63,16 +59,11 @@ add_dependencies(test ${TARGET_DATA_COPY})
- target_link_libraries(test tinyxml2)
- 
- 
--if(BUILD_STATIC_LIBS)
--	install(TARGETS tinyxml2 tinyxml2static
--		RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
--		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
--		ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
--else(BUILD_STATIC_LIBS)
--	install(TARGETS tinyxml2
--		RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
--		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
--endif(BUILD_STATIC_LIBS)
-+install(TARGETS tinyxml2
-+        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+
- install(FILES tinyxml2.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
- 
- foreach(p LIB INCLUDE)
--- 
-1.9.3
-
diff --git a/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch b/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch
deleted file mode 100644
index 409269a..0000000
--- a/package/tinyxml2/0002-Rename-test-fixed-cmake-warning.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 77631a9cf500a578338a83bc230c419bf2a05b50 Mon Sep 17 00:00:00 2001
-From: xantares <xantares09@hotmail.com>
-Date: Fri, 14 Nov 2014 19:46:18 +0100
-Subject: [PATCH] Rename test, fixed cmake warning.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- CMakeLists.txt | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4375bb9..4a8f91d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -53,10 +53,10 @@ set_target_properties(tinyxml2 PROPERTIES
- 	VERSION "${GENERIC_LIB_VERSION}"
- 	SOVERSION "${GENERIC_LIB_SOVERSION}")
- 
--add_executable(test xmltest.cpp)
--add_dependencies(test tinyxml2)
--add_dependencies(test ${TARGET_DATA_COPY})
--target_link_libraries(test tinyxml2)
-+add_executable(xmltest xmltest.cpp)
-+add_dependencies(xmltest tinyxml2)
-+add_dependencies(xmltest ${TARGET_DATA_COPY})
-+target_link_libraries(xmltest tinyxml2)
- 
- 
- install(TARGETS tinyxml2
-@@ -76,4 +76,4 @@ endforeach()
- configure_file(tinyxml2.pc.in tinyxml2.pc @ONLY)
- install(FILES ${CMAKE_CURRENT_BINARY_DIR}/tinyxml2.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
- 
--#add_test(test ${SAMPLE_NAME} COMMAND $<TARGET_FILE:${SAMPLE_NAME}>)
-+#add_test(xmltest ${SAMPLE_NAME} COMMAND $<TARGET_FILE:${SAMPLE_NAME}>)
--- 
-1.9.3
-
diff --git a/package/tinyxml2/tinyxml2.hash b/package/tinyxml2/tinyxml2.hash
index f6064df..acbee09 100644
--- a/package/tinyxml2/tinyxml2.hash
+++ b/package/tinyxml2/tinyxml2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f891224f32e7a06bf279290619cec80cc8ddc335c13696872195ffb87f5bce67  tinyxml2-2.2.0.tar.gz
+sha256 128aa1553e88403833e0cccf1b651f45ce87bc207871f53fdcc8e7f9ec795747 tinyxml2-3.0.0.tar.gz
diff --git a/package/tinyxml2/tinyxml2.mk b/package/tinyxml2/tinyxml2.mk
index 370049b..053e46e 100644
--- a/package/tinyxml2/tinyxml2.mk
+++ b/package/tinyxml2/tinyxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYXML2_VERSION = 2.2.0
+TINYXML2_VERSION = 3.0.0
 TINYXML2_SITE = $(call github,leethomason,tinyxml2,$(TINYXML2_VERSION))
 TINYXML2_LICENSE = zlib
 TINYXML2_LICENSE_FILES = readme.md
