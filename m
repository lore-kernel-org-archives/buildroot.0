From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 14:50:30 +0200
Subject: [Buildroot] [git commit] package/libftdi1: bump to version 1.5
Message-ID: <20200714125030.B6D8580FFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adb4051f0bd91fc610296a82b322823a73ae06d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update first patch
- Drop second patch, not needed since
  http://developer.intra2net.com/git/?p=libftdi;a=commitdiff;h=0209a3633dc877a577af07d883eb5059e22f6a91
- Drop third, fourth and fifth patches (already in version)

http://developer.intra2net.com/git/?p=libftdi;a=blob;f=ChangeLog;hb=HEAD

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...he-standard-CMake-flag-to-drive-the-share.patch | 89 +++++++++++-----------
 ...o-not-check-for-g-when-FTDIPP-is-disabled.patch | 46 -----------
 package/libftdi1/0003-cmake-find-swig.patch        | 29 -------
 .../0004-CMake-reorder-Python-detection.patch      | 32 --------
 ...5-swig-python-fix-unresolved-symbol-issue.patch | 31 --------
 package/libftdi1/libftdi1.hash                     |  4 +-
 package/libftdi1/libftdi1.mk                       |  2 +-
 7 files changed, 46 insertions(+), 187 deletions(-)

diff --git a/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
index 487fc28215..8c45b8811c 100644
--- a/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
+++ b/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
@@ -1,67 +1,64 @@
 From 7e57ff280b55b45e74329b9988279e8831d32eab Mon Sep 17 00:00:00 2001
 From: Samuel Martin <s.martin49@gmail.com>
 Date: Sun, 25 Jan 2015 09:45:04 +0100
-Subject: [PATCH 1/2] cmake: use the standard CMake flag to drive the shared
+Subject: [PATCH] cmake: use the standard CMake flag to drive the shared
  object build
 
 Remove the STATICLIBS CMake option (and the code handling it) and let
 the standard CMake flags drive the shared object build.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Fabrice: update for 1.5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
- CMakeLists.txt        |  2 --
- ftdipp/CMakeLists.txt | 15 +--------------
+ CMakeOptions.txt      |  1 -
+ ftdipp/CMakeLists.txt | 14 +-------------
  src/CMakeLists.txt    | 13 +------------
- 3 files changed, 2 insertions(+), 28 deletions(-)
+ 3 files changed, 2 insertions(+), 26 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 74f80f4..0ba0b08 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -46,8 +46,6 @@ set(CPACK_COMPONENT_SHAREDLIBS_GROUP "Development")
- set(CPACK_COMPONENT_STATICLIBS_GROUP "Development")
- set(CPACK_COMPONENT_HEADERS_GROUP    "Development")
- 
+diff --git a/CMakeOptions.txt b/CMakeOptions.txt
+index 07b5887..b780ffd 100644
+--- a/CMakeOptions.txt
++++ b/CMakeOptions.txt
+@@ -1,4 +1,3 @@
 -option ( STATICLIBS "Build static libraries" ON )
--
- # guess LIB_SUFFIX, don't take debian multiarch into account 
- if ( NOT DEFINED LIB_SUFFIX )
-   if( CMAKE_SYSTEM_NAME MATCHES "Linux"
+ option ( BUILD_TESTS "Build unit tests with Boost Unit Test framework" OFF )
+ option ( DOCUMENTATION "Generate API documentation with Doxygen" OFF )
+ option ( EXAMPLES "Build example programs" ON )
 diff --git a/ftdipp/CMakeLists.txt b/ftdipp/CMakeLists.txt
-index 7500211..27e7884 100644
+index fac5bcc..a06edf1 100644
 --- a/ftdipp/CMakeLists.txt
 +++ b/ftdipp/CMakeLists.txt
-@@ -23,8 +23,7 @@ if (FTDIPP)
-     set(FTDI_BUILD_CPP True PARENT_SCOPE)
-     message(STATUS "Building libftdi1++")
+@@ -12,7 +12,7 @@ include_directories(BEFORE ${CMAKE_CURRENT_BINARY_DIR}
+ include_directories(${Boost_INCLUDE_DIRS})
  
--    # Shared library
--    add_library(ftdipp1 SHARED ${cpp_sources})
-+    add_library(ftdipp1 ${cpp_sources})
+ # Shared library
+-add_library(ftdipp1 SHARED ${cpp_sources})
++add_library(ftdipp1 ${cpp_sources})
  
-     math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatiblity with previous releases
-     set_target_properties(ftdipp1 PROPERTIES VERSION ${VERSION_FIXUP}.${MINOR_VERSION}.0 SOVERSION 2)
-@@ -41,18 +40,6 @@ if (FTDIPP)
-               LIBRARY DESTINATION lib${LIB_SUFFIX}
-               ARCHIVE DESTINATION lib${LIB_SUFFIX}
-             )
--            
--    # Static library
--    if ( STATICLIBS )
--      add_library(ftdipp1-static STATIC ${cpp_sources})
--      set_target_properties(ftdipp1-static PROPERTIES OUTPUT_NAME "ftdipp1")
--      set_target_properties(ftdipp1-static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
--
--      install ( TARGETS ftdipp1-static
--                ARCHIVE DESTINATION lib${LIB_SUFFIX}
--                COMPONENT staticlibs
--              )
--    endif ()
+ math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatibility with previous releases
+ set_target_properties(ftdipp1 PROPERTIES VERSION ${VERSION_FIXUP}.${MINOR_VERSION}.0 SOVERSION 3)
+@@ -29,18 +29,6 @@ install ( TARGETS ftdipp1
+ 					ARCHIVE DESTINATION lib${LIB_SUFFIX}
+ 				)
  
-     install ( FILES ${cpp_headers}
-               DESTINATION include/${PROJECT_NAME}
+-# Static library
+-if ( STATICLIBS )
+-	add_library(ftdipp1-static STATIC ${cpp_sources})
+-	set_target_properties(ftdipp1-static PROPERTIES OUTPUT_NAME "ftdipp1")
+-	set_target_properties(ftdipp1-static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
+-
+-	install ( TARGETS ftdipp1-static
+-						ARCHIVE DESTINATION lib${LIB_SUFFIX}
+-						COMPONENT staticlibs
+-					)
+-endif ()
+-
+ install ( FILES ${cpp_headers}
+ 					DESTINATION include/${PROJECT_NAME}
+ 					COMPONENT headers
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 9fd86a6..501d4a8 100644
+index 17b3617..ae4fc61 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
 @@ -21,7 +21,7 @@ configure_file(ftdi_version_i.h.in "${CMAKE_CURRENT_BINARY_DIR}/ftdi_version_i.h
@@ -71,7 +68,7 @@ index 9fd86a6..501d4a8 100644
 -add_library(ftdi1 SHARED ${c_sources})
 +add_library(ftdi1 ${c_sources})
  
- math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatiblity with previous releases
+ math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatibility with previous releases
  set_target_properties(ftdi1 PROPERTIES VERSION ${VERSION_FIXUP}.${MINOR_VERSION}.0 SOVERSION 2)
 @@ -38,17 +38,6 @@ install ( TARGETS ftdi1
            ARCHIVE DESTINATION lib${LIB_SUFFIX}
@@ -92,5 +89,5 @@ index 9fd86a6..501d4a8 100644
            DESTINATION include/${PROJECT_NAME}
            COMPONENT headers
 -- 
-2.2.2
+2.27.0
 
diff --git a/package/libftdi1/0002-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch b/package/libftdi1/0002-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
deleted file mode 100644
index be0913de4a..0000000000
--- a/package/libftdi1/0002-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c215d5ecd985b57700e817920d0e99112b4a571b Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 25 Jan 2015 13:35:24 +0100
-Subject: [PATCH] cmake: do not check for g++ when FTDIPP is disabled
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- CMakeLists.txt        | 6 ++++--
- ftdipp/CMakeLists.txt | 1 +
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0ba0b08..e880211 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
- # Project
--project(libftdi1)
-+project(libftdi1 C)
- set(MAJOR_VERSION 1)
- set(MINOR_VERSION 2)
- set(PACKAGE libftdi1)
-@@ -145,7 +145,9 @@ else(DOCUMENTATION AND DOXYGEN_FOUND)
- endif(DOCUMENTATION AND DOXYGEN_FOUND)
- 
- add_subdirectory(src)
--add_subdirectory(ftdipp)
-+if(FTDIPP)
-+  add_subdirectory(ftdipp)
-+endif()
- add_subdirectory(python)
- add_subdirectory(ftdi_eeprom)
- add_subdirectory(examples)
-diff --git a/ftdipp/CMakeLists.txt b/ftdipp/CMakeLists.txt
-index 27e7884..2d080f4 100644
---- a/ftdipp/CMakeLists.txt
-+++ b/ftdipp/CMakeLists.txt
-@@ -1,4 +1,5 @@
- # Check
-+project(libftdipp1 C CXX)
- set(FTDI_BUILD_CPP False PARENT_SCOPE)
- 
- option ( FTDIPP "Build C++ binding library libftdi1++" ON )
--- 
-2.2.2
-
diff --git a/package/libftdi1/0003-cmake-find-swig.patch b/package/libftdi1/0003-cmake-find-swig.patch
deleted file mode 100644
index cf787a6806..0000000000
--- a/package/libftdi1/0003-cmake-find-swig.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From fcda9c6a208d3a7fe651ef661b2eb6e462a89c17 Mon Sep 17 00:00:00 2001
-From: Eneas U de Queiroz <cote2004-github@yahoo.com>
-Date: Tue, 31 Jul 2018 17:44:57 -0300
-Subject: [PATCH] CMake: use find_package (SWIG) for cmake >= 3.0.0
-
-There's a workaround for a bug (fixed in cmake 3.0.0) that does not
-work in CMake 3.12.  Only use the workaround with cmake < 3.0.0.
-
-Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
-[Mark: patch retrieved and updated from
-http://developer.intra2net.com/git/?p=libftdi;a=commit;h=fcda9c6a208d3a7fe651ef661b2eb6e462a89c17]
-Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
-[Update patch to make it work with cmake < 3.7:
-http://developer.intra2net.com/mailarchive/html/libftdi/2019/msg00009.html]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
-diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
-index 31ef1c6..eefc344 100644
---- a/python/CMakeLists.txt
-+++ b/python/CMakeLists.txt
-@@ -3,7 +3,7 @@ option ( LINK_PYTHON_LIBRARY "Link against python libraries" ON )
- 
- if ( PYTHON_BINDINGS )
-   # workaround for cmake bug #0013449
--  if ( NOT DEFINED CMAKE_FIND_ROOT_PATH )
-+  if ( NOT DEFINED CMAKE_FIND_ROOT_PATH OR NOT CMAKE_VERSION VERSION_LESS 3.0.0 )
-     find_package ( SWIG )
-   else ()
-     find_program ( SWIG_EXECUTABLE NAMES swig2.0 swig )
diff --git a/package/libftdi1/0004-CMake-reorder-Python-detection.patch b/package/libftdi1/0004-CMake-reorder-Python-detection.patch
deleted file mode 100644
index c6c2b28c46..0000000000
--- a/package/libftdi1/0004-CMake-reorder-Python-detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 640c2b3c0c72d5194d422ff7dda086c4533fba00 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Mon, 13 Jan 2020 14:08:44 +0100
-Subject: [PATCH] CMake: reorder Python detection
-
-PythonInterp should be detected before PythonLibs otherwise
-CMake exits with the following message:
-
-Could NOT find PythonLibs (missing: PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- python/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
-index 90811ca..368bb7e 100644
---- a/python/CMakeLists.txt
-+++ b/python/CMakeLists.txt
-@@ -12,8 +12,8 @@ if ( PYTHON_BINDINGS )
-       set ( SWIG_FOUND TRUE )
-     endif ()
-   endif ()
--  find_package ( PythonLibs )
-   find_package ( PythonInterp )
-+  find_package ( PythonLibs )
- endif ()
- 
- if ( SWIG_FOUND AND PYTHONLIBS_FOUND AND PYTHONINTERP_FOUND )
--- 
-2.17.0
-
diff --git a/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch b/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
deleted file mode 100644
index bd13d24d21..0000000000
--- a/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e12e592e982fe71b2761da0de7b19e93f67ed22c Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 6 Aug 2019 13:42:06 +0200
-Subject: [PATCH] swig: python: fix unresolved symbol issue
-
-GCC later than 5.x produce _fdti1.so file with an undefined
-symbol str2charp_size due to C99 inline semantics change. So
-remove this keyword.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-[Backport from upstream 3eca5150db07262c1c6eb737e12149201f631d47]
----
- python/ftdi1.i | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/python/ftdi1.i b/python/ftdi1.i
-index 93793f8..0d150cb 100644
---- a/python/ftdi1.i
-+++ b/python/ftdi1.i
-@@ -19,7 +19,7 @@ inline PyObject* charp2str(const char *v_, long len)
- #endif
- }
- 
--inline char * str2charp_size(PyObject* pyObj, int * size)
-+char * str2charp_size(PyObject* pyObj, int * size)
- {
-   char * v_ = 0;
- #if PY_MAJOR_VERSION >= 3
--- 
-2.17.0
-
diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index f17543fa03..6b825e8d88 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking the signature
-# https://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.4.tar.bz2.sig
-sha256  ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681cb31b74  libftdi1-1.4.tar.bz2
+# https://www.intra2net.com/en/developer/libftdi/download/libftdi1-1.5.tar.bz2.sig
+sha256  7c7091e9c86196148bd41177b4590dccb1510bfe6cea5bf7407ff194482eb049  libftdi1-1.5.tar.bz2
 
 # Hash for license files:
 sha256  524f46428bf72bb8c6acfeca4909551fd2e0bdbb5305406d38382f4056095c56  LICENSE
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 9c3bafdbc0..6688694b47 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFTDI1_VERSION = 1.4
+LIBFTDI1_VERSION = 1.5
 LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
 LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI1_INSTALL_STAGING = YES
