From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Jan 2020 17:12:33 +0100
Subject: [Buildroot] [git commit] package/zxing-cpp: disable testrunner
Message-ID: <20200109160240.995CA87786@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3cdd2b7753dfb5725c2ec91039de70d34f49883
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
