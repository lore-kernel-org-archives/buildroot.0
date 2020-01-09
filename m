From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  9 Jan 2020 20:20:49 +0100
Subject: [Buildroot] [PATCH 2/2] package/zxing-cpp: add optional opencv
 dependency
In-Reply-To: <20200109192049.3718440-1-fontaine.fabrice@gmail.com>
References: <20200109192049.3718440-1-fontaine.fabrice@gmail.com>
Message-ID: <20200109192049.3718440-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping to version 0db7f85 in commit
ad9c5bbfa7ee355b9f6120358cde08ae866537ac included the following upstream
commit:
https://github.com/glassechidna/zxing-cpp/commit/bccad40551573d150fbe8e295636e6277dcf6889

This commit adds an optional dependency on opencv so add it and fix it
through two patches

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...bs-private-not-exported-to-the-users.patch | 43 +++++++++++++++++++
 ...akeLists-txt-add-BUILD_OPENCV-option.patch | 39 +++++++++++++++++
 package/zxing-cpp/zxing-cpp.mk                |  7 +++
 3 files changed, 89 insertions(+)
 create mode 100644 package/zxing-cpp/0001-Link-library-with-OpenCV-make-libs-private-not-exported-to-the-users.patch
 create mode 100644 package/zxing-cpp/0002-CMakeLists-txt-add-BUILD_OPENCV-option.patch

diff --git a/package/zxing-cpp/0001-Link-library-with-OpenCV-make-libs-private-not-exported-to-the-users.patch b/package/zxing-cpp/0001-Link-library-with-OpenCV-make-libs-private-not-exported-to-the-users.patch
new file mode 100644
index 0000000000..90b2320384
--- /dev/null
+++ b/package/zxing-cpp/0001-Link-library-with-OpenCV-make-libs-private-not-exported-to-the-users.patch
@@ -0,0 +1,43 @@
+From 9e5dfa57f3b998bc3049bfa893b20e81dea656df Mon Sep 17 00:00:00 2001
+From: Yuri <yuri@rawbw.com>
+Date: Sat, 20 Apr 2019 07:28:26 -0700
+Subject: [PATCH] Link library with OpenCV, not only the executable, make libs
+ PRIVATE.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/glassechidna/zxing-cpp/pull/86]
+---
+ CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 738f4e1..efe3aee 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -60,10 +60,12 @@ include_directories(core/src)
+ add_library(libzxing ${LIBZXING_FILES})
+ set_target_properties(libzxing PROPERTIES PREFIX "")
+ 
++set(libzxing_LIBS "")
++
+ find_package(Iconv)
+ if(ICONV_FOUND)
+     include_directories(${ICONV_INCLUDE_DIR})
+-    target_link_libraries(libzxing ${ICONV_LIBRARIES})
++    set(libzxing_LIBS ${libzxing_LIBS} ${ICONV_LIBRARIES})
+ else()
+     add_definitions(-DNO_ICONV=1)
+ endif()
+@@ -75,9 +77,12 @@ if(OpenCV_FOUND)
+         "./opencv-cli/src/*.h"
+     )
+     add_executable(zxing-cv ${OPENCV_ZXING_FILES})
++    set(libzxing_LIBS ${libzxing_LIBS} ${OpenCV_LIBRARIES})
+     target_link_libraries(zxing-cv libzxing ${OpenCV_LIBRARIES})
+ endif()
+ 
++target_link_libraries(libzxing PRIVATE ${libzxing_LIBS})
++
+ # Add cli executable.
+ file(GLOB_RECURSE ZXING_FILES
+     "./cli/src/*.cpp"
diff --git a/package/zxing-cpp/0002-CMakeLists-txt-add-BUILD_OPENCV-option.patch b/package/zxing-cpp/0002-CMakeLists-txt-add-BUILD_OPENCV-option.patch
new file mode 100644
index 0000000000..31753d7c24
--- /dev/null
+++ b/package/zxing-cpp/0002-CMakeLists-txt-add-BUILD_OPENCV-option.patch
@@ -0,0 +1,39 @@
+From fe740316af970f57ec511cdeafb512510e4842a9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Nov 2019 17:21:13 +0100
+Subject: [PATCH] CMakeLists.txt: add BUILD_OPENCV option
+
+Add BUILD_OPENCV option to allow the user to disable OpenCV. It is
+especially useful as opencv library can be built without highgui support
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/glassechidna/zxing-cpp/pull/90]
+---
+ CMakeLists.txt | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 738f4e1..12913cd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,6 +3,7 @@ cmake_minimum_required(VERSION 3.0)
+ project(zxing)
+ 
+ option(BUILD_TESTING "Enable generation of test targets" OFF)
++option(BUILD_OPENCV "Enable OpenCV classes and OpenCV cli executable" ON)
+ 
+ set(CMAKE_LIBRARY_PATH /opt/local/lib ${CMAKE_LIBRARY_PATH})
+ 
+@@ -44,8 +45,10 @@ else()
+     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
+ endif()
+ 
+-# OpenCV classes
+-find_package(OpenCV)
++if (BUILD_OPENCV)
++    # OpenCV classes
++    find_package(OpenCV)
++endif()
+ if(OpenCV_FOUND)
+     list(APPEND LIBZXING_FILES
+         opencv/src/zxing/MatSource.cpp
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 6b26c20e00..c138c925bb 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -16,4 +16,11 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 ZXING_CPP_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),y)
+ZXING_CPP_DEPENDENCIES += opencv
+ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
+else
+ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.24.1
