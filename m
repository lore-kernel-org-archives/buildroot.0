From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  9 Jan 2020 14:21:56 +0100
Subject: [Buildroot] [PATCH v1] package/zxing-cpp: disable testrunner
Message-ID: <20200109132156.30722-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In case cppunit dependency is found the testrunner is build
which needs c++11 compile support enabled, avoid by building
only libzxing and zxing targets.

Fixes:
  - http://autobuild.buildroot.net/results/f7c2c03a2b5a0147a041d873c1a36143861be764

  [ 85%] Building CXX object CMakeFiles/testrunner.dir/core/tests/src/common/BitArrayTest.cpp.o
  In file included from .../host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/5.5.0/type_traits:35:0,
                   from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/tools/StringHelper.h:7,
                   from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/TestAssert.h:8,
                   from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/TestCase.h:6,
                   from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/TestCaller.h:5,
                   from .../host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/cppunit/extensions/HelperMacros.h:9,
                   from .../build/zxing-cpp-0db7f855135222becff193671faae79c083424b6/core/tests/src/common/BitArrayTest.h:24,
                   from .../build/zxing-cpp-0db7f855135222becff193671faae79c083424b6/core/tests/src/common/BitArrayTest.cpp:21:
  .../host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/5.5.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

  Alternative solution would be to enforce c++11 support for the
  testrunner target with the following CMakeLists.txt patch:

  --- a/CMakeLists.txt.orig       2020-01-09 14:13:26.177686351 +0100
  +++ b/CMakeLists.txt    2020-01-09 14:13:32.341807901 +0100
  @@ -84,6 +84,7 @@
       add_executable(testrunner ${TESTRUNNER_FILES})
       include_directories(${CPPUNIT_INCLUDE_DIR})
       target_link_libraries(testrunner libzxing  ${CPPUNIT_LIBRARIES})
  +    set_property(TARGET testrunner PROPERTY CXX_STANDARD 11)
   else()
       message(WARNING "Not building testrunner, because CppUnit is missing")
   endif()
---
 package/zxing-cpp/zxing-cpp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 7113ae2b06..885d6fc344 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -15,4 +15,7 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 ZXING_CPP_DEPENDENCIES += libiconv
 endif
 
+# build all targets except testrunner (needs c++11 support)
+ZXING_CPP_MAKE_OPTS = libzxing zxing
+
 $(eval $(cmake-package))
-- 
2.24.1
