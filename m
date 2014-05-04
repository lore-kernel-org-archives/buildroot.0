From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 May 2014 09:10:55 +0200
Subject: [Buildroot] [git commit] clapack: new package
Message-ID: <20140504071203.6D5939CA6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd5dbe627f4d66603e03ae2fdb09d4fe34d34dc7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides BLAS and LAPACK libraries.

Though it is common to find implementation of these two libraries in
Fortran, this package provides a C-implementation for both, because:
- Fortran support has been deprecated in Buildroot since the 2013.11
  release;
- most of the external toolchains do not provide a Fortran compiler.

Often BLAS build-systems build some test programs and run them to
generate some source files or adjust some build optimizations, naively
assuming they are building the library for the build-machine. This does
not play well when cross-compiling.

This implementation has this defect too, by building and running a tool
generating a header.
However, the build-system allows to pass an empty header.
So, we have to patch the CMake to build the generator (but never
install it) and correctly support building with and without this header
provided by the user.

Also, some CMake patches are needed to fix the build and install rules.

[Peter: needs largefile, fix _LICENSE_FILES, tweak patch desc]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                  |    1 +
 package/clapack/Config.in                          |   22 ++++++
 ...ce-libf2c-to-be-built-as-a-static-library.patch |   32 ++++++++
 ...ake-test-build-sensitive-to-BUILD_TESTING.patch |   80 ++++++++++++++++++++
 ...t-try-to-run-arithchk-when-cross-compilin.patch |   70 +++++++++++++++++
 ...blas-add-library-and-header-install-rules.patch |   23 ++++++
 ...pack-add-library-and-header-install-rules.patch |   24 ++++++
 package/clapack/clapack.mk                         |   23 ++++++
 8 files changed, 275 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4430241..a39887f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -771,6 +771,7 @@ source "package/apr/Config.in"
 source "package/apr-util/Config.in"
 source "package/argp-standalone/Config.in"
 source "package/boost/Config.in"
+source "package/clapack/Config.in"
 source "package/classpath/Config.in"
 source "package/cppcms/Config.in"
 source "package/eigen/Config.in"
diff --git a/package/clapack/Config.in b/package/clapack/Config.in
new file mode 100644
index 0000000..a77094f
--- /dev/null
+++ b/package/clapack/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_CLAPACK
+	bool "cblas/clapack"
+	depends on BR2_LARGEFILE
+	help
+	  BLAS and LAPACK C implementation (f2c'ed version of).
+
+	  http://www.netlib.org/clapack/
+
+config BR2_PACKAGE_CLAPACK_ARITH_H
+	string "Custom BLAS arith.h"
+	depends on BR2_PACKAGE_CLAPACK
+	help
+	  To optimize BLAS library for the hardware, an 'arith.h' header should
+	  be provided.
+
+	  If empty, the library will not be optimized by the compiler.
+
+	  In any case an 'arithchk' program is built (but not installed), to be run
+	  on the target to generate this arith.h header.
+
+comment "cblas/clapack needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
diff --git a/package/clapack/clapack-0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch b/package/clapack/clapack-0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
new file mode 100644
index 0000000..8fede9d
--- /dev/null
+++ b/package/clapack/clapack-0001-cmake-force-libf2c-to-be-built-as-a-static-library.patch
@@ -0,0 +1,32 @@
+From 4fe2f454e454d9e6b1e83b2ea67581990461ed36 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 11 Jan 2014 22:05:25 +0100
+Subject: [PATCH 1/6] cmake: force libf2c to be built as a static library
+
+As stated in INSTALL/LAPACK_version.c, liblapack requires to be linked
+against the static library of libf2c.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ F2CLIBS/libf2c/CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/F2CLIBS/libf2c/CMakeLists.txt b/F2CLIBS/libf2c/CMakeLists.txt
+index 43d7b3f..f98d66a 100644
+--- a/F2CLIBS/libf2c/CMakeLists.txt
++++ b/F2CLIBS/libf2c/CMakeLists.txt
+@@ -58,5 +58,10 @@ if(WIN32)
+ endif()
+ include_directories(${CLAPACK_SOURCE_DIR}/F2CLIBS/libf2c)
+ include_directories(${CLAPACK_BINARY_DIR}/F2CLIBS/libf2c)
+-add_library(f2c ${OFILES} ${CMAKE_CURRENT_BINARY_DIR}/arith.h)
++add_library(f2c STATIC ${OFILES} ${CMAKE_CURRENT_BINARY_DIR}/arith.h)
+ set_property(TARGET f2c PROPERTY PREFIX lib)
++# Set fPIC on the library when build shared libraries is enabled, because
++# libf2c.a will most likely be included by some shared libraries in such cases.
++if(UNIX AND BUILD_SHARED_LIBS)
++  set_target_properties(f2c PROPERTIES COMPILE_FLAGS "-fPIC")
++endif()
+-- 
+1.8.5.3
+
diff --git a/package/clapack/clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch b/package/clapack/clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
new file mode 100644
index 0000000..eac4164
--- /dev/null
+++ b/package/clapack/clapack-0002-cmake-make-test-build-sensitive-to-BUILD_TESTING.patch
@@ -0,0 +1,80 @@
+From 834c221936d9c460b44e3a65b6fedfb3193f491b Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 11 Jan 2014 21:33:12 +0100
+Subject: [PATCH 2/6] cmake: make test build sensitive to BUILD_TESTING
+
+This patch prevent from wasting time building the tests if it's our
+wish.
+
+The test build takes a significant amount of time, and the binaries
+are not installed.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ BLAS/TESTING/CMakeLists.txt | 3 +++
+ CMakeLists.txt              | 9 ++++++---
+ TESTING/CMakeLists.txt      | 4 ++++
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/BLAS/TESTING/CMakeLists.txt b/BLAS/TESTING/CMakeLists.txt
+index ec2c587..e7dc0b7 100644
+--- a/BLAS/TESTING/CMakeLists.txt
++++ b/BLAS/TESTING/CMakeLists.txt
+@@ -25,6 +25,9 @@
+ #       make single FRC=FRC
+ #
+ #######################################################################
++if(NOT BUILD_TESTING)
++  return()
++endif()
+ 
+ macro(add_blas_test name src)
+   get_filename_component(baseNAME ${src} NAME_WE)
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 320ccc6..0a362c0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,5 @@
+ cmake_minimum_required(VERSION 2.6)
+ project(CLAPACK C)
+-enable_testing()
+ include(CTest)
+ 
+ if(WIN32 AND NOT CYGWIN)
+@@ -11,7 +10,9 @@ else()
+   set(SECOND_SRC  ${CLAPACK_SOURCE_DIR}/INSTALL/second.c)
+   set(DSECOND_SRC  ${CLAPACK_SOURCE_DIR}/INSTALL/dsecnd.c)
+ endif()
+-enable_testing()
++if(NOT BUILD_TESTING)
++  enable_testing()
++endif()
+ option(USE_BLAS_WRAP "pre-pend f2c_ to each function in blas" OFF)
+ if(NOT USE_BLAS_WRAP)
+ # _zrotg_ seems to be missing in the wrap header
+@@ -21,7 +22,9 @@ include_directories(${CLAPACK_SOURCE_DIR}/INCLUDE)
+ add_subdirectory(F2CLIBS)
+ add_subdirectory(BLAS)
+ add_subdirectory(SRC)
+-add_subdirectory(TESTING)
++if(NOT BUILD_TESTING)
++  add_subdirectory(TESTING)
++endif()
+ set(CLAPACK_VERSION 3.2.1)
+ set(CPACK_PACKAGE_VERSION_MAJOR 3)
+ set(CPACK_PACKAGE_VERSION_MINOR 2)
+diff --git a/TESTING/CMakeLists.txt b/TESTING/CMakeLists.txt
+index d59359d..f6b083a 100644
+--- a/TESTING/CMakeLists.txt
++++ b/TESTING/CMakeLists.txt
+@@ -1,3 +1,7 @@
++if(NOT BUILD_TESTING)
++  return()
++endif()
++
+ if(MSVC_VERSION)
+ #  string(REPLACE "/STACK:10000000" "/STACK:900000000000000000"
+ #    CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}")
+-- 
+1.8.5.3
+
diff --git a/package/clapack/clapack-0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch b/package/clapack/clapack-0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
new file mode 100644
index 0000000..cd9828f
--- /dev/null
+++ b/package/clapack/clapack-0003-cmake-do-not-try-to-run-arithchk-when-cross-compilin.patch
@@ -0,0 +1,70 @@
+From a2f0669fac1f8e7183b15cf7d14f0e99a2d8b012 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 11 Jan 2014 21:47:39 +0100
+Subject: [PATCH 3/6] cmake: do not try to run arithchk when cross-compiling to
+ generate sources
+
+Instead, use a predefined arith.h if provided, or generate a default one.
+
+The arithchk binary is still built (but not installed) to allow the user to
+run it on its target and use it; so then allowing to build an optimized
+blas library.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ F2CLIBS/libf2c/CMakeLists.txt | 38 ++++++++++++++++++++++++++++----------
+ 1 file changed, 28 insertions(+), 10 deletions(-)
+
+diff --git a/F2CLIBS/libf2c/CMakeLists.txt b/F2CLIBS/libf2c/CMakeLists.txt
+index f98d66a..45a0804 100644
+--- a/F2CLIBS/libf2c/CMakeLists.txt
++++ b/F2CLIBS/libf2c/CMakeLists.txt
+@@ -38,17 +38,35 @@ set(TIME dtime_.c etime_.c)
+ 
+ # For INTEGER*8 support (which requires system-dependent adjustments to
+ # f2c.h), add ${QINT} to the OFILES  assignment below...
+-add_executable(arithchk arithchk.c)
+-if(UNIX)
+-  target_link_libraries(arithchk m)
++if(CMAKE_CROSSCOMPILING)
++  if(ARITH_H)
++    message(STATUS "Using the user-defined '${ARITH_H}' as arith.h header.")
++    configure_file("${ARITH_H}" "${CMAKE_CURRENT_BINARY_DIR}/arith.h" COPYONLY)
++  else()
++    message(STATUS "No user-defined arith.h header.")
++    if(NOT EXISTS "${CMAKE_CURRENT_BINARY_DIR}/arith.h")
++      message(WARNING "Generating the default non-optimized 'arith.h' header.
++
++To generate and provide a custom arith.h header:
++run the cross-compiled arithchk binary on your target,
++and use its output to fill your custom arith.h header.")
++      file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/arith.h"
++        "/* default, not optimized arith.h */")
++    endif()
++  endif()
++else()
++  add_executable(arithchk arithchk.c)
++  if(UNIX)
++    target_link_libraries(arithchk m)
++  endif()
++  set_target_properties(arithchk PROPERTIES COMPILE_DEFINITIONS
++    "NO_FPINIT;NO_LONG_LONG")
++  ADD_CUSTOM_COMMAND(
++     OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/arith.h
++     COMMAND arithchk > ${CMAKE_CURRENT_BINARY_DIR}/arith.h
++     DEPENDS arithchk
++     )
+ endif()
+-set_target_properties(arithchk PROPERTIES COMPILE_DEFINITIONS 
+-  "NO_FPINIT;NO_LONG_LONG")
+-ADD_CUSTOM_COMMAND(
+-   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/arith.h
+-   COMMAND arithchk > ${CMAKE_CURRENT_BINARY_DIR}/arith.h
+-   DEPENDS arithchk
+-   )
+ 
+ 
+ set(OFILES  ${MISC} ${POW} ${CX} ${DCX} ${REAL} ${DBL} ${INT} 
+-- 
+1.8.5.3
+
diff --git a/package/clapack/clapack-0004-cmake-blas-add-library-and-header-install-rules.patch b/package/clapack/clapack-0004-cmake-blas-add-library-and-header-install-rules.patch
new file mode 100644
index 0000000..e83b066
--- /dev/null
+++ b/package/clapack/clapack-0004-cmake-blas-add-library-and-header-install-rules.patch
@@ -0,0 +1,23 @@
+From 675111e8ffc179276a7e4950fe4a4eda4d38a703 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 11 Jan 2014 21:48:32 +0100
+Subject: [PATCH 4/6] cmake: blas: add library and header install rules
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ BLAS/SRC/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/BLAS/SRC/CMakeLists.txt b/BLAS/SRC/CMakeLists.txt
+index d1caff8..a5de5a1 100644
+--- a/BLAS/SRC/CMakeLists.txt
++++ b/BLAS/SRC/CMakeLists.txt
+@@ -141,3 +141,5 @@ if(UNIX)
+   target_link_libraries(blas m)
+ endif()
+ target_link_libraries(blas f2c)
++install(TARGETS blas LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
++install(FILES "${CLAPACK_SOURCE_DIR}/INCLUDE/blaswrap.h" DESTINATION include)
+-- 
+1.8.5.3
+
diff --git a/package/clapack/clapack-0005-cmake-lapack-add-library-and-header-install-rules.patch b/package/clapack/clapack-0005-cmake-lapack-add-library-and-header-install-rules.patch
new file mode 100644
index 0000000..abba460
--- /dev/null
+++ b/package/clapack/clapack-0005-cmake-lapack-add-library-and-header-install-rules.patch
@@ -0,0 +1,24 @@
+From 9dfac0d55a31be59a856bad9d3a5071d65176597 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 11 Jan 2014 21:49:22 +0100
+Subject: [PATCH 5/6] cmake: lapack: add library and header install rules
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ SRC/CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/SRC/CMakeLists.txt b/SRC/CMakeLists.txt
+index ac4cce3..aa60555 100644
+--- a/SRC/CMakeLists.txt
++++ b/SRC/CMakeLists.txt
+@@ -377,4 +377,5 @@ if(BUILD_COMPLEX16)
+ endif()
+ add_library(lapack ${ALLOBJ} ${ALLXOBJ})
+ target_link_libraries(lapack blas)
+-
++install(TARGETS lapack LIBRARY DESTINATION lib ARCHIVE DESTINATION lib)
++install(FILES "${CLAPACK_SOURCE_DIR}/INCLUDE/clapack.h" DESTINATION include)
+-- 
+1.8.5.3
+
diff --git a/package/clapack/clapack.mk b/package/clapack/clapack.mk
new file mode 100644
index 0000000..0a284a6
--- /dev/null
+++ b/package/clapack/clapack.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# clapack
+#
+################################################################################
+
+CLAPACK_VERSION = 3.2.1
+CLAPACK_SOURCE = clapack-$(CLAPACK_VERSION)-CMAKE.tgz
+# This package provides 3 libraries:
+# - libf2c.a (not installed)
+# - libblas (statically linked with libf2c.a)
+# - liblapack (statically linked with libf2c.a)
+CLAPACK_LICENSE = HPND (libf2c), BSD-3c (libblas and liblapack)
+CLAPACK_LICENSE_FILES = F2CLIBS/libf2c/Notice COPYING
+CLAPACK_SITE = http://www.netlib.org/clapack
+CLAPACK_INSTALL_STAGING = YES
+CLAPACK_CONF_OPT = -DBUILDTESTING=OFF
+
+ifneq ($(BR2_PACKAGE_CLAPACK_ARITH_H),)
+CLAPACK_CONF_OPT += -DARITH_H=$(BR2_PACKAGE_CLAPACK_ARITH_H)
+endif
+
+$(eval $(cmake-package))
