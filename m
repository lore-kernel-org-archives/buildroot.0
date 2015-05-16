From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:00:32 +0200
Subject: [Buildroot] [git commit] package/tinyxml2: Use BUILD_SHARED_LIBS
	cmake standard
Message-ID: <20150516120130.B3255801D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22f5be171c6f9bb2611e7b87197e9faeabcaab18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport an upstream patch to fix the static build:
c8ec6fcab4eb501cc5bd328c19dcbd4b30722d52

Fixes:
http://autobuild.buildroot.net/results/e56/e568d81030087f66f8ac4ccd4f496b550930cbae/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch |   65 ++++++++++++++++++++
 1 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch b/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
new file mode 100644
index 0000000..fec1abe
--- /dev/null
+++ b/package/tinyxml2/0001-Use-BUILD_SHARED_LIBS-cmake-standard.patch
@@ -0,0 +1,65 @@
+From 69acf13fa679628259063c4d0cd17e59b8bb0b75 Mon Sep 17 00:00:00 2001
+From: xantares <xantares09@hotmail.com>
+Date: Fri, 14 Nov 2014 19:40:58 +0100
+Subject: [PATCH] Use BUILD_SHARED_LIBS cmake standard.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ CMakeLists.txt | 27 +++++++++------------------
+ 1 file changed, 9 insertions(+), 18 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 91c61a4..4375bb9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -10,8 +10,8 @@ include(GNUInstallDirs)
+ ################################
+ # set lib version here
+ 
+-set(GENERIC_LIB_VERSION "2.2.0")
+-set(GENERIC_LIB_SOVERSION "2")
++set(GENERIC_LIB_VERSION "2.2.0")
++set(GENERIC_LIB_SOVERSION "2")
+ 
+ 
+ ################################
+@@ -46,12 +46,8 @@ endif(MSVC)
+ 
+ ################################
+ # Add targets
+-set(BUILD_STATIC_LIBS ON CACHE BOOL "Set to ON to build static libraries")
+-if(BUILD_STATIC_LIBS)
+-	add_library(tinyxml2static STATIC tinyxml2.cpp tinyxml2.h)
+-	set_target_properties(tinyxml2static PROPERTIES OUTPUT_NAME tinyxml2)
+-endif(BUILD_STATIC_LIBS)
+-add_library(tinyxml2 SHARED tinyxml2.cpp tinyxml2.h)
++option(BUILD_SHARED_LIBS "build shared or static libraries" ON)
++add_library(tinyxml2 tinyxml2.cpp tinyxml2.h)
+ set_target_properties(tinyxml2 PROPERTIES
+         COMPILE_DEFINITIONS "TINYXML2_EXPORT"
+ 	VERSION "${GENERIC_LIB_VERSION}"
+@@ -63,16 +59,11 @@ add_dependencies(test ${TARGET_DATA_COPY})
+ target_link_libraries(test tinyxml2)
+ 
+ 
+-if(BUILD_STATIC_LIBS)
+-	install(TARGETS tinyxml2 tinyxml2static
+-		RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+-		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+-		ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+-else(BUILD_STATIC_LIBS)
+-	install(TARGETS tinyxml2
+-		RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+-		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
+-endif(BUILD_STATIC_LIBS)
++install(TARGETS tinyxml2
++        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
++
+ install(FILES tinyxml2.h DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
+ 
+ foreach(p LIB INCLUDE)
+-- 
+1.9.3
+
