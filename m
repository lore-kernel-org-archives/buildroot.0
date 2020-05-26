From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 23:22:15 +0200
Subject: [Buildroot] [git commit] package/gerbera: fix static linking with
 libmagic
Message-ID: <20200527151800.A800E91D25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9666a9892c01510a0fa59dd4449e41253805809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch was wrongly removed when bumping the version to 1.4.0 in
commit 6976f312fa84d4a9c4bbf99ed3b173085780dcd9

Fixes:
 - http://autobuild.buildroot.org/results/7a53a59dd08c043f371bea967c3b450a7bddcde8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ake-FindLibMagic-cmake-fix-static-linking.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/gerbera/0002-cmake-FindLibMagic-cmake-fix-static-linking.patch b/package/gerbera/0002-cmake-FindLibMagic-cmake-fix-static-linking.patch
new file mode 100644
index 0000000000..f6cc276e70
--- /dev/null
+++ b/package/gerbera/0002-cmake-FindLibMagic-cmake-fix-static-linking.patch
@@ -0,0 +1,63 @@
+From 7fdcabd80c823694d190e5baa8c657ffcae5e777 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 31 Jan 2020 17:14:11 +0100
+Subject: [PATCH] cmake/FindLibMagic.cmake: fix static linking
+
+libmagic can optionally depends on xz (for lzma) or bzip2 since version
+5.38 and
+https://github.com/file/file/commit/b259a07ea95827f565faa20f0316e5b2704064f7
+so use pkg-config to retrieve those static dependencies and avoid the
+following build failure:
+
+[100%] Linking CXX executable gerbera
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/br-user/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmagic.a(compress.o): in function `uncompressbuf':
+compress.c:(.text+0x69c): undefined reference to `BZ2_bzDecompressInit'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x710): undefined reference to `BZ2_bzDecompress'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x730): undefined reference to `BZ2_bzDecompressEnd'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x7bc): undefined reference to `lzma_auto_decoder'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x828): undefined reference to `lzma_code'
+/home/br-user/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: compress.c:(.text+0x848): undefined reference to `lzma_end'
+
+It should be noted that libmagic.pc is not currently provided in the
+official file package (which provides libmagic), an issue has been
+opened to add libmagic.pc: https://bugs.astron.com/view.php?id=136
+
+Fixes:
+ - http://autobuild.buildroot.org/results/37b1ef54dc41100689f311fbc31fc9300dc6ae63
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/gerbera/gerbera/commit/7fdcabd80c823694d190e5baa8c657ffcae5e777]
+---
+ cmake/FindLibMagic.cmake | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/FindLibMagic.cmake b/cmake/FindLibMagic.cmake
+index f68ab923..04995af4 100644
+--- a/cmake/FindLibMagic.cmake
++++ b/cmake/FindLibMagic.cmake
+@@ -1,11 +1,22 @@
+ INCLUDE (FindPackageHandleStandardArgs)
+ 
+-FIND_PATH(MAGIC_INCLUDE_DIR magic.h)
+-FIND_LIBRARY(MAGIC_LIBRARIES NAMES magic)
++find_package(PkgConfig QUIET)
++
++pkg_check_modules(PC_MAGIC QUIET libmagic)
++
++FIND_PATH(MAGIC_INCLUDE_DIR magic.h
++    HINTS ${PC_MAGIC_INCLUDEDIR} ${PC_MAGIC_INCLUDE_DIRS})
++FIND_LIBRARY(MAGIC_LIBRARIES NAMES magic
++    HINTS ${PC_MAGIC_LIBDIR} ${PC_MAGIC_LIBRARY_DIRS})
+ 
+ # handle the QUIETLY and REQUIRED arguments and set MAGIC_FOUND to TRUE
+ find_package_handle_standard_args(MAGIC DEFAULT_MSG MAGIC_LIBRARIES)
+ 
++if (MAGIC_FOUND)
++    set (MAGIC_LIBRARIES ${MAGIC_LIBRARY} ${PC_MAGIC_LIBRARIES})
++    set (MAGIC_INCLUDE_DIRS ${MAGIC_INCLUDE_DIR} )
++endif ()
++
+ MARK_AS_ADVANCED(
+     MAGIC_LIBRARIES
+     MAGIC_INCLUDE_DIRS )
