From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Nov 2019 16:23:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: disable tests
Message-ID: <20191109152332.21363-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch containing CMake improvements and especially a new
BUILD_TESTING option that is off by default and disable the cppunit
dependency that needs C++11

Fixes:
 - http://autobuild.buildroot.org/results/8c675300aa7e7f2a5a2f0a2ac0f191b8d2ff8c42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Disable tests instead of trying to fix build with cppunit as this
   will add a dependency on gcc >= 4.8

 .../zxing-cpp/0001-CMake-improvements.patch   | 632 ++++++++++++++++++
 1 file changed, 632 insertions(+)
 create mode 100644 package/zxing-cpp/0001-CMake-improvements.patch

diff --git a/package/zxing-cpp/0001-CMake-improvements.patch b/package/zxing-cpp/0001-CMake-improvements.patch
new file mode 100644
index 0000000000..59e635fcbb
--- /dev/null
+++ b/package/zxing-cpp/0001-CMake-improvements.patch
@@ -0,0 +1,632 @@
+From 4e2b4fe1668c60d73e7649b0d3d5888912878392 Mon Sep 17 00:00:00 2001
+From: Robert Dailey <rcdailey@gmail.com>
+Date: Fri, 8 Sep 2017 15:25:26 -0500
+Subject: [PATCH] CMake improvements
+
+* Installation working as a configuration package
+* Fix source listing to not use GLOB per CMake recommendation. Files
+  are listed explicitly in `source_files.cmake` so that if file listing
+  changes, CMake can detect it and regenerate as needed.
+* Added debug postfix for libs for side-by-side installation of different
+  build variants (`libzxing.lib` and `libzxing-debug.lib` on Windows)
+
+[Retrieved (and backported) from:
+https://github.com/glassechidna/zxing-cpp/commit/4e2b4fe1668c60d73e7649b0d3d5888912878392]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt                      |  86 ++++++-----
+ cmake/FindCPPUNIT.cmake             |  54 -------
+ cmake/FindIconv.cmake               |  57 -------
+ cmake/FindModules/FindCPPUNIT.cmake |  54 +++++++
+ cmake/FindModules/FindIconv.cmake   |  57 +++++++
+ cmake/zxing-config.cmake.in         |   1 +
+ source_files.cmake                  | 231 ++++++++++++++++++++++++++++
+ 7 files changed, 388 insertions(+), 152 deletions(-)
+ delete mode 100644 cmake/FindCPPUNIT.cmake
+ delete mode 100644 cmake/FindIconv.cmake
+ create mode 100644 cmake/FindModules/FindCPPUNIT.cmake
+ create mode 100644 cmake/FindModules/FindIconv.cmake
+ create mode 100644 cmake/zxing-config.cmake.in
+ create mode 100644 source_files.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 19068b9..dbabad9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,9 +1,8 @@
+-#
+-# CMake listfile to specify the build process, see:
+-# http://www.cmake.org/cmake/help/documentation.html
+-#
++cmake_minimum_required(VERSION 3.0)
++
+ project(zxing)
+-cmake_minimum_required(VERSION 2.8.0)
++
++option(BUILD_TESTING "Enable generation of test targets" OFF)
+ 
+ set(CMAKE_LIBRARY_PATH /opt/local/lib ${CMAKE_LIBRARY_PATH})
+ 
+@@ -27,30 +26,22 @@ if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
+ endif()
+ 
+ # Adjust CMake's module path.
+-set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/)
++list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/FindModules)
+ 
+ # Suppress MSVC CRT warnings.
+ if(MSVC)
+     add_definitions(-D_CRT_SECURE_NO_WARNINGS)
+     add_definitions(/Za)
++    add_definitions(/MP) # multi-core builds
+ endif()
+ 
+-# Add libzxing library.
+-file(GLOB_RECURSE LIBZXING_FILES
+-    "./core/src/*.cpp"
+-    "./core/src/*.h"
+-    "./core/src/*.cc"
+-    "./core/src/*.hh"
+-)
++include(source_files.cmake)
++
+ if(WIN32)
+-    file(GLOB LIBZXING_WIN32_FILES
+-        "./core/lib/win32/*.c"
+-        "./core/lib/win32/*.h"
+-    )
+-    set(LIBZXING_FILES ${LIBZXING_FILES} ${LIBZXING_WIN32_FILES})
+-    include_directories(SYSTEM "./core/lib/win32/")
++    include_directories(core/lib/win32)
++    set(CMAKE_DEBUG_POSTFIX -debug)
+ endif()
+-include_directories("./core/src/")
++include_directories(core/src)
+ add_library(libzxing ${LIBZXING_FILES})
+ set_target_properties(libzxing PROPERTIES PREFIX "")
+ 
+@@ -93,22 +84,35 @@ file(GLOB_RECURSE ZXING_FILES
+ 
+ add_executable(zxing ${ZXING_FILES})
+ target_link_libraries(zxing libzxing)
+-install(TARGETS zxing libzxing
++
++install(TARGETS zxing libzxing EXPORT zxing-targets
+ 	LIBRARY DESTINATION lib
+ 	RUNTIME DESTINATION bin
+-	ARCHIVE DESTINATION lib)
+-install(DIRECTORY core/src/zxing/ DESTINATION include/zxing FILES_MATCHING PATTERN "*.h")
+-
+-# Add testrunner executable.
+-find_package(CPPUNIT)
+-if(CPPUNIT_FOUND)
+-    file(GLOB_RECURSE TESTRUNNER_FILES
+-        "./core/tests/src/*.cpp"
+-        "./core/tests/src/*.h"
+-    )
+-    add_executable(testrunner ${TESTRUNNER_FILES})
+-    include_directories(${CPPUNIT_INCLUDE_DIR})
+-    target_link_libraries(testrunner libzxing  ${CPPUNIT_LIBRARIES})
+-else()
+-    message(WARNING "Not building testrunner, because CppUnit is missing")
++	ARCHIVE DESTINATION lib
++    INCLUDES DESTINATION include
++)
++
++install(EXPORT zxing-targets DESTINATION lib/zxing/cmake NAMESPACE zxing::)
++
++install(
++    DIRECTORY core/src/zxing/
++    DESTINATION include/zxing
++    FILES_MATCHING PATTERN "*.h"
++)
++
++configure_file(cmake/zxing-config.cmake.in zxing-config.cmake @ONLY)
++install(FILES ${CMAKE_BINARY_DIR}/zxing-config.cmake DESTINATION lib/zxing/cmake)
++
++if(BUILD_TESTING)
++    # Add testrunner executable.
++    find_package(CPPUNIT)
++    if(CPPUNIT_FOUND)
++        file(GLOB_RECURSE TESTRUNNER_FILES
++            "./core/tests/src/*.cpp"
++            "./core/tests/src/*.h"
++        )
++        add_executable(testrunner ${TESTRUNNER_FILES})
++        include_directories(${CPPUNIT_INCLUDE_DIR})
++        target_link_libraries(testrunner libzxing  ${CPPUNIT_LIBRARIES})
++    endif()
+ endif()
+diff --git a/cmake/FindCPPUNIT.cmake b/cmake/FindCPPUNIT.cmake
+deleted file mode 100644
+index 4ee0094..0000000
+--- a/cmake/FindCPPUNIT.cmake
++++ /dev/null
+@@ -1,54 +0,0 @@
+-#
+-# Find the CppUnit includes and library
+-#
+-# This module defines
+-# CPPUNIT_INCLUDE_DIR, where to find tiff.h, etc.
+-# CPPUNIT_LIBRARIES, the libraries to link against to use CppUnit.
+-# CPPUNIT_FOUND, If false, do not try to use CppUnit.
+-
+-# also defined, but not for general use are
+-# CPPUNIT_LIBRARY, where to find the CppUnit library.
+-# CPPUNIT_DEBUG_LIBRARY, where to find the CppUnit library in debug
+-# mode.
+-
+-SET(CPPUNIT_FOUND "NO")
+-
+-FIND_PATH(CPPUNIT_INCLUDE_DIR cppunit/TestCase.h /usr/local/include /usr/include)
+-
+-# With Win32, important to have both
+-IF(WIN32)
+-  FIND_LIBRARY(CPPUNIT_LIBRARY cppunit
+-               ${CPPUNIT_INCLUDE_DIR}/../lib
+-               /usr/local/lib
+-               /usr/lib)
+-  FIND_LIBRARY(CPPUNIT_DEBUG_LIBRARY cppunitd
+-               ${CPPUNIT_INCLUDE_DIR}/../lib
+-               /usr/local/lib
+-               /usr/lib)
+-ELSE(WIN32)
+-  # On unix system, debug and release have the same name
+-  FIND_LIBRARY(CPPUNIT_LIBRARY cppunit
+-               ${CPPUNIT_INCLUDE_DIR}/../lib
+-               /usr/local/lib
+-               /usr/lib)
+-  FIND_LIBRARY(CPPUNIT_DEBUG_LIBRARY cppunit
+-               ${CPPUNIT_INCLUDE_DIR}/../lib
+-               /usr/local/lib
+-               /usr/lib)
+-ENDIF(WIN32)
+-
+-IF(CPPUNIT_INCLUDE_DIR)
+-  IF(CPPUNIT_LIBRARY)
+-    SET(CPPUNIT_FOUND "YES")
+-    SET(CPPUNIT_LIBRARIES ${CPPUNIT_LIBRARY} ${CMAKE_DL_LIBS})
+-    SET(CPPUNIT_DEBUG_LIBRARIES ${CPPUNIT_DEBUG_LIBRARY} ${CMAKE_DL_LIBS})
+-  ELSE (CPPUNIT_LIBRARY)
+-    IF (CPPUNIT_FIND_REQUIRED)
+-      MESSAGE(SEND_ERROR "Could not find library CppUnit.")
+-    ENDIF (CPPUNIT_FIND_REQUIRED)
+-  ENDIF(CPPUNIT_LIBRARY)
+-ELSE(CPPUNIT_INCLUDE_DIR)
+-  IF (CPPUNIT_FIND_REQUIRED)
+-    MESSAGE(SEND_ERROR "Could not find library CppUnit.")
+-  ENDIF(CPPUNIT_FIND_REQUIRED)
+-ENDIF(CPPUNIT_INCLUDE_DIR)
+diff --git a/cmake/FindIconv.cmake b/cmake/FindIconv.cmake
+deleted file mode 100644
+index f2cc0df..0000000
+--- a/cmake/FindIconv.cmake
++++ /dev/null
+@@ -1,57 +0,0 @@
+-# - Try to find Iconv 
+-# Once done this will define 
+-# 
+-#  ICONV_FOUND - system has Iconv 
+-#  ICONV_INCLUDE_DIR - the Iconv include directory 
+-#  ICONV_LIBRARIES - Link these to use Iconv 
+-#  ICONV_SECOND_ARGUMENT_IS_CONST - the second argument for iconv() is const
+-# 
+-include(CheckCXXSourceCompiles)
+-
+-IF (ICONV_INCLUDE_DIR)
+-  # Already in cache, be silent
+-  SET(ICONV_FIND_QUIETLY TRUE)
+-ENDIF (ICONV_INCLUDE_DIR)
+-
+-FIND_PATH(ICONV_INCLUDE_DIR iconv.h) 
+- 
+-FIND_LIBRARY(ICONV_LIBRARIES NAMES iconv libiconv libiconv-2 c)
+- 
+-IF(ICONV_INCLUDE_DIR) 
+-   SET(ICONV_FOUND TRUE) 
+-ENDIF(ICONV_INCLUDE_DIR) 
+-
+-set(CMAKE_REQUIRED_INCLUDES ${ICONV_INCLUDE_DIR})
+-set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBRARIES})
+-IF(ICONV_FOUND)
+-  check_cxx_source_compiles("
+-  #include <iconv.h>
+-  int main(){
+-    iconv_t conv = 0;
+-    char* in = 0;
+-    size_t ilen = 0;
+-    char* out = 0;
+-    size_t olen = 0;
+-    iconv(conv, &in, &ilen, &out, &olen);
+-    return 0;
+-  }
+-" ICONV_SECOND_ARGUMENT_IS_CONST )
+-ENDIF(ICONV_FOUND)
+-set(CMAKE_REQUIRED_INCLUDES)
+-set(CMAKE_REQUIRED_LIBRARIES)
+-
+-IF(ICONV_FOUND) 
+-  IF(NOT ICONV_FIND_QUIETLY) 
+-    MESSAGE(STATUS "Found Iconv: ${ICONV_LIBRARIES}") 
+-  ENDIF(NOT ICONV_FIND_QUIETLY) 
+-ELSE(ICONV_FOUND) 
+-  IF(Iconv_FIND_REQUIRED) 
+-    MESSAGE(FATAL_ERROR "Could not find Iconv") 
+-  ENDIF(Iconv_FIND_REQUIRED) 
+-ENDIF(ICONV_FOUND)
+-
+-MARK_AS_ADVANCED(
+-  ICONV_INCLUDE_DIR
+-  ICONV_LIBRARIES
+-  ICONV_SECOND_ARGUMENT_IS_CONST
+-)
+diff --git a/cmake/FindModules/FindCPPUNIT.cmake b/cmake/FindModules/FindCPPUNIT.cmake
+new file mode 100644
+index 0000000..4ee0094
+--- /dev/null
++++ b/cmake/FindModules/FindCPPUNIT.cmake
+@@ -0,0 +1,54 @@
++#
++# Find the CppUnit includes and library
++#
++# This module defines
++# CPPUNIT_INCLUDE_DIR, where to find tiff.h, etc.
++# CPPUNIT_LIBRARIES, the libraries to link against to use CppUnit.
++# CPPUNIT_FOUND, If false, do not try to use CppUnit.
++
++# also defined, but not for general use are
++# CPPUNIT_LIBRARY, where to find the CppUnit library.
++# CPPUNIT_DEBUG_LIBRARY, where to find the CppUnit library in debug
++# mode.
++
++SET(CPPUNIT_FOUND "NO")
++
++FIND_PATH(CPPUNIT_INCLUDE_DIR cppunit/TestCase.h /usr/local/include /usr/include)
++
++# With Win32, important to have both
++IF(WIN32)
++  FIND_LIBRARY(CPPUNIT_LIBRARY cppunit
++               ${CPPUNIT_INCLUDE_DIR}/../lib
++               /usr/local/lib
++               /usr/lib)
++  FIND_LIBRARY(CPPUNIT_DEBUG_LIBRARY cppunitd
++               ${CPPUNIT_INCLUDE_DIR}/../lib
++               /usr/local/lib
++               /usr/lib)
++ELSE(WIN32)
++  # On unix system, debug and release have the same name
++  FIND_LIBRARY(CPPUNIT_LIBRARY cppunit
++               ${CPPUNIT_INCLUDE_DIR}/../lib
++               /usr/local/lib
++               /usr/lib)
++  FIND_LIBRARY(CPPUNIT_DEBUG_LIBRARY cppunit
++               ${CPPUNIT_INCLUDE_DIR}/../lib
++               /usr/local/lib
++               /usr/lib)
++ENDIF(WIN32)
++
++IF(CPPUNIT_INCLUDE_DIR)
++  IF(CPPUNIT_LIBRARY)
++    SET(CPPUNIT_FOUND "YES")
++    SET(CPPUNIT_LIBRARIES ${CPPUNIT_LIBRARY} ${CMAKE_DL_LIBS})
++    SET(CPPUNIT_DEBUG_LIBRARIES ${CPPUNIT_DEBUG_LIBRARY} ${CMAKE_DL_LIBS})
++  ELSE (CPPUNIT_LIBRARY)
++    IF (CPPUNIT_FIND_REQUIRED)
++      MESSAGE(SEND_ERROR "Could not find library CppUnit.")
++    ENDIF (CPPUNIT_FIND_REQUIRED)
++  ENDIF(CPPUNIT_LIBRARY)
++ELSE(CPPUNIT_INCLUDE_DIR)
++  IF (CPPUNIT_FIND_REQUIRED)
++    MESSAGE(SEND_ERROR "Could not find library CppUnit.")
++  ENDIF(CPPUNIT_FIND_REQUIRED)
++ENDIF(CPPUNIT_INCLUDE_DIR)
+diff --git a/cmake/FindModules/FindIconv.cmake b/cmake/FindModules/FindIconv.cmake
+new file mode 100644
+index 0000000..f2cc0df
+--- /dev/null
++++ b/cmake/FindModules/FindIconv.cmake
+@@ -0,0 +1,57 @@
++# - Try to find Iconv 
++# Once done this will define 
++# 
++#  ICONV_FOUND - system has Iconv 
++#  ICONV_INCLUDE_DIR - the Iconv include directory 
++#  ICONV_LIBRARIES - Link these to use Iconv 
++#  ICONV_SECOND_ARGUMENT_IS_CONST - the second argument for iconv() is const
++# 
++include(CheckCXXSourceCompiles)
++
++IF (ICONV_INCLUDE_DIR)
++  # Already in cache, be silent
++  SET(ICONV_FIND_QUIETLY TRUE)
++ENDIF (ICONV_INCLUDE_DIR)
++
++FIND_PATH(ICONV_INCLUDE_DIR iconv.h) 
++ 
++FIND_LIBRARY(ICONV_LIBRARIES NAMES iconv libiconv libiconv-2 c)
++ 
++IF(ICONV_INCLUDE_DIR) 
++   SET(ICONV_FOUND TRUE) 
++ENDIF(ICONV_INCLUDE_DIR) 
++
++set(CMAKE_REQUIRED_INCLUDES ${ICONV_INCLUDE_DIR})
++set(CMAKE_REQUIRED_LIBRARIES ${ICONV_LIBRARIES})
++IF(ICONV_FOUND)
++  check_cxx_source_compiles("
++  #include <iconv.h>
++  int main(){
++    iconv_t conv = 0;
++    char* in = 0;
++    size_t ilen = 0;
++    char* out = 0;
++    size_t olen = 0;
++    iconv(conv, &in, &ilen, &out, &olen);
++    return 0;
++  }
++" ICONV_SECOND_ARGUMENT_IS_CONST )
++ENDIF(ICONV_FOUND)
++set(CMAKE_REQUIRED_INCLUDES)
++set(CMAKE_REQUIRED_LIBRARIES)
++
++IF(ICONV_FOUND) 
++  IF(NOT ICONV_FIND_QUIETLY) 
++    MESSAGE(STATUS "Found Iconv: ${ICONV_LIBRARIES}") 
++  ENDIF(NOT ICONV_FIND_QUIETLY) 
++ELSE(ICONV_FOUND) 
++  IF(Iconv_FIND_REQUIRED) 
++    MESSAGE(FATAL_ERROR "Could not find Iconv") 
++  ENDIF(Iconv_FIND_REQUIRED) 
++ENDIF(ICONV_FOUND)
++
++MARK_AS_ADVANCED(
++  ICONV_INCLUDE_DIR
++  ICONV_LIBRARIES
++  ICONV_SECOND_ARGUMENT_IS_CONST
++)
+diff --git a/cmake/zxing-config.cmake.in b/cmake/zxing-config.cmake.in
+new file mode 100644
+index 0000000..da467d4
+--- /dev/null
++++ b/cmake/zxing-config.cmake.in
+@@ -0,0 +1 @@
++include(${CMAKE_CURRENT_LIST_DIR}/zxing-targets.cmake)
+diff --git a/source_files.cmake b/source_files.cmake
+new file mode 100644
+index 0000000..59e70f1
+--- /dev/null
++++ b/source_files.cmake
+@@ -0,0 +1,231 @@
++set(LIBZXING_FILES
++    core/src/bigint/BigInteger.cc
++    core/src/bigint/BigInteger.cc
++    core/src/bigint/BigInteger.hh
++    core/src/bigint/BigInteger.hh
++    core/src/bigint/BigIntegerAlgorithms.cc
++    core/src/bigint/BigIntegerAlgorithms.cc
++    core/src/bigint/BigIntegerAlgorithms.hh
++    core/src/bigint/BigIntegerAlgorithms.hh
++    core/src/bigint/BigIntegerLibrary.hh
++    core/src/bigint/BigIntegerLibrary.hh
++    core/src/bigint/BigIntegerUtils.cc
++    core/src/bigint/BigIntegerUtils.cc
++    core/src/bigint/BigIntegerUtils.hh
++    core/src/bigint/BigIntegerUtils.hh
++    core/src/bigint/BigUnsigned.cc
++    core/src/bigint/BigUnsigned.cc
++    core/src/bigint/BigUnsigned.hh
++    core/src/bigint/BigUnsigned.hh
++    core/src/bigint/BigUnsignedInABase.cc
++    core/src/bigint/BigUnsignedInABase.cc
++    core/src/bigint/BigUnsignedInABase.hh
++    core/src/bigint/BigUnsignedInABase.hh
++    core/src/bigint/NumberlikeArray.hh
++    core/src/bigint/NumberlikeArray.hh
++    core/src/zxing/aztec/AztecDetectorResult.cpp
++    core/src/zxing/aztec/AztecDetectorResult.h
++    core/src/zxing/aztec/AztecReader.cpp
++    core/src/zxing/aztec/AztecReader.h
++    core/src/zxing/aztec/decoder/Decoder.cpp
++    core/src/zxing/aztec/decoder/Decoder.h
++    core/src/zxing/aztec/detector/Detector.cpp
++    core/src/zxing/aztec/detector/Detector.h
++    core/src/zxing/BarcodeFormat.cpp
++    core/src/zxing/BarcodeFormat.h
++    core/src/zxing/Binarizer.cpp
++    core/src/zxing/Binarizer.h
++    core/src/zxing/BinaryBitmap.cpp
++    core/src/zxing/BinaryBitmap.h
++    core/src/zxing/ChecksumException.cpp
++    core/src/zxing/ChecksumException.h
++    core/src/zxing/common/Array.h
++    core/src/zxing/common/BitArray.cpp
++    core/src/zxing/common/BitArray.h
++    core/src/zxing/common/BitArrayIO.cpp
++    core/src/zxing/common/BitMatrix.cpp
++    core/src/zxing/common/BitMatrix.h
++    core/src/zxing/common/BitSource.cpp
++    core/src/zxing/common/BitSource.h
++    core/src/zxing/common/CharacterSetECI.cpp
++    core/src/zxing/common/CharacterSetECI.h
++    core/src/zxing/common/Counted.h
++    core/src/zxing/common/DecoderResult.cpp
++    core/src/zxing/common/DecoderResult.h
++    core/src/zxing/common/detector/JavaMath.h
++    core/src/zxing/common/detector/MathUtils.h
++    core/src/zxing/common/detector/MonochromeRectangleDetector.cpp
++    core/src/zxing/common/detector/MonochromeRectangleDetector.h
++    core/src/zxing/common/detector/WhiteRectangleDetector.cpp
++    core/src/zxing/common/detector/WhiteRectangleDetector.h
++    core/src/zxing/common/DetectorResult.cpp
++    core/src/zxing/common/DetectorResult.h
++    core/src/zxing/common/GlobalHistogramBinarizer.cpp
++    core/src/zxing/common/GlobalHistogramBinarizer.h
++    core/src/zxing/common/GreyscaleLuminanceSource.cpp
++    core/src/zxing/common/GreyscaleLuminanceSource.h
++    core/src/zxing/common/GreyscaleRotatedLuminanceSource.cpp
++    core/src/zxing/common/GreyscaleRotatedLuminanceSource.h
++    core/src/zxing/common/GridSampler.cpp
++    core/src/zxing/common/GridSampler.h
++    core/src/zxing/common/HybridBinarizer.cpp
++    core/src/zxing/common/HybridBinarizer.h
++    core/src/zxing/common/IllegalArgumentException.cpp
++    core/src/zxing/common/IllegalArgumentException.h
++    core/src/zxing/common/PerspectiveTransform.cpp
++    core/src/zxing/common/PerspectiveTransform.h
++    core/src/zxing/common/Point.h
++    core/src/zxing/common/reedsolomon/GenericGF.cpp
++    core/src/zxing/common/reedsolomon/GenericGF.h
++    core/src/zxing/common/reedsolomon/GenericGFPoly.cpp
++    core/src/zxing/common/reedsolomon/GenericGFPoly.h
++    core/src/zxing/common/reedsolomon/ReedSolomonDecoder.cpp
++    core/src/zxing/common/reedsolomon/ReedSolomonDecoder.h
++    core/src/zxing/common/reedsolomon/ReedSolomonException.cpp
++    core/src/zxing/common/reedsolomon/ReedSolomonException.h
++    core/src/zxing/common/Str.cpp
++    core/src/zxing/common/Str.h
++    core/src/zxing/common/StringUtils.cpp
++    core/src/zxing/common/StringUtils.h
++    core/src/zxing/datamatrix/DataMatrixReader.cpp
++    core/src/zxing/datamatrix/DataMatrixReader.h
++    core/src/zxing/datamatrix/decoder/BitMatrixParser.cpp
++    core/src/zxing/datamatrix/decoder/BitMatrixParser.h
++    core/src/zxing/datamatrix/decoder/DataBlock.cpp
++    core/src/zxing/datamatrix/decoder/DataBlock.h
++    core/src/zxing/datamatrix/decoder/DecodedBitStreamParser.cpp
++    core/src/zxing/datamatrix/decoder/DecodedBitStreamParser.h
++    core/src/zxing/datamatrix/decoder/Decoder.cpp
++    core/src/zxing/datamatrix/decoder/Decoder.h
++    core/src/zxing/datamatrix/detector/CornerPoint.cpp
++    core/src/zxing/datamatrix/detector/CornerPoint.h
++    core/src/zxing/datamatrix/detector/Detector.cpp
++    core/src/zxing/datamatrix/detector/Detector.h
++    core/src/zxing/datamatrix/detector/DetectorException.cpp
++    core/src/zxing/datamatrix/detector/DetectorException.h
++    core/src/zxing/datamatrix/Version.cpp
++    core/src/zxing/datamatrix/Version.h
++    core/src/zxing/DecodeHints.cpp
++    core/src/zxing/DecodeHints.h
++    core/src/zxing/Exception.cpp
++    core/src/zxing/Exception.h
++    core/src/zxing/FormatException.cpp
++    core/src/zxing/FormatException.h
++    core/src/zxing/IllegalStateException.h
++    core/src/zxing/InvertedLuminanceSource.cpp
++    core/src/zxing/InvertedLuminanceSource.h
++    core/src/zxing/LuminanceSource.cpp
++    core/src/zxing/LuminanceSource.h
++    core/src/zxing/multi/ByQuadrantReader.cpp
++    core/src/zxing/multi/ByQuadrantReader.h
++    core/src/zxing/multi/GenericMultipleBarcodeReader.cpp
++    core/src/zxing/multi/GenericMultipleBarcodeReader.h
++    core/src/zxing/multi/MultipleBarcodeReader.cpp
++    core/src/zxing/multi/MultipleBarcodeReader.h
++    core/src/zxing/multi/qrcode/detector/MultiDetector.cpp
++    core/src/zxing/multi/qrcode/detector/MultiDetector.h
++    core/src/zxing/multi/qrcode/detector/MultiFinderPatternFinder.cpp
++    core/src/zxing/multi/qrcode/detector/MultiFinderPatternFinder.h
++    core/src/zxing/multi/qrcode/QRCodeMultiReader.cpp
++    core/src/zxing/multi/qrcode/QRCodeMultiReader.h
++    core/src/zxing/MultiFormatReader.cpp
++    core/src/zxing/MultiFormatReader.h
++    core/src/zxing/NotFoundException.h
++    core/src/zxing/oned/CodaBarReader.cpp
++    core/src/zxing/oned/CodaBarReader.h
++    core/src/zxing/oned/Code128Reader.cpp
++    core/src/zxing/oned/Code128Reader.h
++    core/src/zxing/oned/Code39Reader.cpp
++    core/src/zxing/oned/Code39Reader.h
++    core/src/zxing/oned/Code93Reader.cpp
++    core/src/zxing/oned/Code93Reader.h
++    core/src/zxing/oned/EAN13Reader.cpp
++    core/src/zxing/oned/EAN13Reader.h
++    core/src/zxing/oned/EAN8Reader.cpp
++    core/src/zxing/oned/EAN8Reader.h
++    core/src/zxing/oned/ITFReader.cpp
++    core/src/zxing/oned/ITFReader.h
++    core/src/zxing/oned/MultiFormatOneDReader.cpp
++    core/src/zxing/oned/MultiFormatOneDReader.h
++    core/src/zxing/oned/MultiFormatUPCEANReader.cpp
++    core/src/zxing/oned/MultiFormatUPCEANReader.h
++    core/src/zxing/oned/OneDReader.cpp
++    core/src/zxing/oned/OneDReader.h
++    core/src/zxing/oned/OneDResultPoint.cpp
++    core/src/zxing/oned/OneDResultPoint.h
++    core/src/zxing/oned/UPCAReader.cpp
++    core/src/zxing/oned/UPCAReader.h
++    core/src/zxing/oned/UPCEANReader.cpp
++    core/src/zxing/oned/UPCEANReader.h
++    core/src/zxing/oned/UPCEReader.cpp
++    core/src/zxing/oned/UPCEReader.h
++    core/src/zxing/pdf417/decoder/BitMatrixParser.cpp
++    core/src/zxing/pdf417/decoder/BitMatrixParser.h
++    core/src/zxing/pdf417/decoder/DecodedBitStreamParser.cpp
++    core/src/zxing/pdf417/decoder/DecodedBitStreamParser.h
++    core/src/zxing/pdf417/decoder/Decoder.cpp
++    core/src/zxing/pdf417/decoder/Decoder.h
++    core/src/zxing/pdf417/decoder/ec/ErrorCorrection.cpp
++    core/src/zxing/pdf417/decoder/ec/ErrorCorrection.h
++    core/src/zxing/pdf417/decoder/ec/ModulusGF.cpp
++    core/src/zxing/pdf417/decoder/ec/ModulusGF.h
++    core/src/zxing/pdf417/decoder/ec/ModulusPoly.cpp
++    core/src/zxing/pdf417/decoder/ec/ModulusPoly.h
++    core/src/zxing/pdf417/detector/Detector.cpp
++    core/src/zxing/pdf417/detector/Detector.h
++    core/src/zxing/pdf417/detector/LinesSampler.cpp
++    core/src/zxing/pdf417/detector/LinesSampler.h
++    core/src/zxing/pdf417/PDF417Reader.cpp
++    core/src/zxing/pdf417/PDF417Reader.h
++    core/src/zxing/qrcode/decoder/BitMatrixParser.cpp
++    core/src/zxing/qrcode/decoder/BitMatrixParser.h
++    core/src/zxing/qrcode/decoder/DataBlock.cpp
++    core/src/zxing/qrcode/decoder/DataBlock.h
++    core/src/zxing/qrcode/decoder/DataMask.cpp
++    core/src/zxing/qrcode/decoder/DataMask.h
++    core/src/zxing/qrcode/decoder/DecodedBitStreamParser.cpp
++    core/src/zxing/qrcode/decoder/DecodedBitStreamParser.h
++    core/src/zxing/qrcode/decoder/Decoder.cpp
++    core/src/zxing/qrcode/decoder/Decoder.h
++    core/src/zxing/qrcode/decoder/Mode.cpp
++    core/src/zxing/qrcode/decoder/Mode.h
++    core/src/zxing/qrcode/detector/AlignmentPattern.cpp
++    core/src/zxing/qrcode/detector/AlignmentPattern.h
++    core/src/zxing/qrcode/detector/AlignmentPatternFinder.cpp
++    core/src/zxing/qrcode/detector/AlignmentPatternFinder.h
++    core/src/zxing/qrcode/detector/Detector.cpp
++    core/src/zxing/qrcode/detector/Detector.h
++    core/src/zxing/qrcode/detector/FinderPattern.cpp
++    core/src/zxing/qrcode/detector/FinderPattern.h
++    core/src/zxing/qrcode/detector/FinderPatternFinder.cpp
++    core/src/zxing/qrcode/detector/FinderPatternFinder.h
++    core/src/zxing/qrcode/detector/FinderPatternInfo.cpp
++    core/src/zxing/qrcode/detector/FinderPatternInfo.h
++    core/src/zxing/qrcode/ErrorCorrectionLevel.cpp
++    core/src/zxing/qrcode/ErrorCorrectionLevel.h
++    core/src/zxing/qrcode/FormatInformation.cpp
++    core/src/zxing/qrcode/FormatInformation.h
++    core/src/zxing/qrcode/QRCodeReader.cpp
++    core/src/zxing/qrcode/QRCodeReader.h
++    core/src/zxing/qrcode/Version.cpp
++    core/src/zxing/qrcode/Version.h
++    core/src/zxing/Reader.cpp
++    core/src/zxing/Reader.h
++    core/src/zxing/ReaderException.h
++    core/src/zxing/Result.cpp
++    core/src/zxing/Result.h
++    core/src/zxing/ResultIO.cpp
++    core/src/zxing/ResultPoint.cpp
++    core/src/zxing/ResultPoint.h
++    core/src/zxing/ResultPointCallback.cpp
++    core/src/zxing/ResultPointCallback.h
++    core/src/zxing/ZXing.h
++)
++
++if(WIN32)
++    list(APPEND LIBZXING_FILES
++        #core/src/win32/zxing/iconv.h
++        #core/src/win32/zxing/stdint.h
++        #core/src/win32/zxing/win_iconv.c
++    )
++endif()
+-- 
+2.23.0
+
-- 
2.23.0
