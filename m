From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:22:17 +0200
Subject: [Buildroot] [git commit] package/assimp: fix static only build
Message-ID: <20200412210817.39B3A8E930@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b44b5cb265e3764169aa4856f40e8e2db55cba22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to disable internal dynamic zlib library building, fixes
compile failure for static only toolchains (and assimp links
against the static one).

Fixes:

  http://autobuild.buildroot.net/results/7c2db184ee200d1719308f38f42382bb39d8d5c6

  [13%] Linking C shared library ../../lib/libzlib.so
  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: .../host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
  __uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: __uClibc_main.c:(.text+0x160): undefined reference to `__fini_array_end'
  .../arm-buildroot-linux-uclibcgnueabi/bin/ld: final link failed: bad value
  collect2: error: ld returned 1 exit status

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rib-zlib-disable-dynamic-library-building.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch b/package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch
new file mode 100644
index 0000000000..8661311be5
--- /dev/null
+++ b/package/assimp/0003-contrib-zlib-disable-dynamic-library-building.patch
@@ -0,0 +1,31 @@
+From 2b8684aded0c383be64bac0fa59e39870252963f Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 12 Apr 2020 18:19:13 +0200
+Subject: [PATCH] contrib/zlib: disable dynamic library building
+
+Fixes compile failure for static only toolchains (and assimp
+links against the static one).
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ contrib/zlib/CMakeLists.txt | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/contrib/zlib/CMakeLists.txt b/contrib/zlib/CMakeLists.txt
+index 9d1fcc94..78346233 100644
+--- a/contrib/zlib/CMakeLists.txt
++++ b/contrib/zlib/CMakeLists.txt
+@@ -195,10 +195,7 @@ if(MINGW)
+     set(ZLIB_DLL_SRCS ${CMAKE_CURRENT_BINARY_DIR}/zlib1rc.obj)
+ endif(MINGW)
+ 
+-add_library(zlib SHARED ${ZLIB_SRCS} ${ZLIB_ASMS} ${ZLIB_DLL_SRCS} ${ZLIB_PUBLIC_HDRS} ${ZLIB_PRIVATE_HDRS})
+ add_library(zlibstatic STATIC ${ZLIB_SRCS} ${ZLIB_ASMS} ${ZLIB_PUBLIC_HDRS} ${ZLIB_PRIVATE_HDRS})
+-set_target_properties(zlib PROPERTIES DEFINE_SYMBOL ZLIB_DLL)
+-set_target_properties(zlib PROPERTIES SOVERSION 1)
+ 
+ INSTALL( TARGETS zlibstatic
+          LIBRARY DESTINATION ${ASSIMP_LIB_INSTALL_DIR}
+-- 
+2.26.0
+
