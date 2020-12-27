From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Dec 2020 15:20:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/assimp: don't install zlib
Message-ID: <20201227142003.2818138-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

assimp uses and installs its own embedded version of zlib since commit
b529a582ba4d7671597e95d7ab54ee652cbbc261.

Don't install it to avoid the following build failure when building
hiawatha:

-- Found ZLIB: optimized;/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so;debug;/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzlibstaticd.a (found version "1.2.11")

-- Looking for /home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so in optimized
CMake Error at /home/buildroot/autobuild/instance-0/output-1/build/hiawatha-10.11/CMakeFiles/CMakeTmp/CMakeLists.txt:15 (target_link_libraries):
  The "optimized" argument must be followed by a library.

Fixes:
 - http://autobuild.buildroot.org/results/9cac31962d48245a5579da692dbc9488292a397e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ib-CMakeLists.txt-don-t-install-zlib.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/assimp/0004-contrib-zlib-CMakeLists.txt-don-t-install-zlib.patch

diff --git a/package/assimp/0004-contrib-zlib-CMakeLists.txt-don-t-install-zlib.patch b/package/assimp/0004-contrib-zlib-CMakeLists.txt-don-t-install-zlib.patch
new file mode 100644
index 0000000000..3d9a03c85f
--- /dev/null
+++ b/package/assimp/0004-contrib-zlib-CMakeLists.txt-don-t-install-zlib.patch
@@ -0,0 +1,42 @@
+From 1bc628747391d7f7c7435bcd81578bf1c671ff9d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 27 Dec 2020 12:53:02 +0100
+Subject: [PATCH] contrib/zlib/CMakeLists.txt: don't install zlib
+
+assimp uses and installs its own embedded version of zlib since commit
+b529a582ba4d7671597e95d7ab54ee652cbbc261.
+
+Don't install this library to avoid the following build failure when
+building hiawatha:
+
+-- Found ZLIB: optimized;/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so;debug;/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libzlibstaticd.a (found version "1.2.11")
+
+-- Looking for /home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/libz.so in optimized
+CMake Error at /home/buildroot/autobuild/instance-0/output-1/build/hiawatha-10.11/CMakeFiles/CMakeTmp/CMakeLists.txt:15 (target_link_libraries):
+  The "optimized" argument must be followed by a library.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9cac31962d48245a5579da692dbc9488292a397e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ contrib/zlib/CMakeLists.txt | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/contrib/zlib/CMakeLists.txt b/contrib/zlib/CMakeLists.txt
+index c284656e..e78fd25d 100644
+--- a/contrib/zlib/CMakeLists.txt
++++ b/contrib/zlib/CMakeLists.txt
+@@ -197,9 +197,3 @@ if(MINGW)
+ endif(MINGW)
+ 
+ add_library(zlibstatic STATIC ${ZLIB_SRCS} ${ZLIB_ASMS} ${ZLIB_PUBLIC_HDRS} ${ZLIB_PRIVATE_HDRS})
+-
+-INSTALL( TARGETS zlibstatic
+-         LIBRARY DESTINATION ${ASSIMP_LIB_INSTALL_DIR}
+-         ARCHIVE DESTINATION ${ASSIMP_LIB_INSTALL_DIR}
+-         RUNTIME DESTINATION ${ASSIMP_BIN_INSTALL_DIR}
+-         COMPONENT ${LIBASSIMP_COMPONENT})
+-- 
+2.29.2
+
-- 
2.29.2
