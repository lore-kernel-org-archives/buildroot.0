From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 23:57:58 +0200
Subject: [Buildroot] [git commit] package/taglib: add upstream patch to fix
 taglib-config
Message-ID: <20190610221729.AF3FB8F656@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad29cd6224f3ac3317f36b243a8ba8e1623c679c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current taglib-config program does not work when cross-compiling as it only
returns paths to the host, which breaks building programs which link against
taglib.

For example gerbera uses `taglib-config` and it fails with:

```
[..]
-- Found TagLib: -L/usr/lib -ltag
[..]
arm-linux-gnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '-L/usr/lib'
```

Before the patch the output of `taglib-config` is:
```
$ ./output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/taglib-config --libs
-L/usr/lib -ltag
```

Add a patch from upstream which fixes taglib-config.

After applying the fix, the pkg-config file is correct:
```
$ ./output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/bin/taglib-config --libs
-L/home/joerg/Development/git/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib -ltag
```

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...aglib-config-file-for-cross-compiling-906.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/taglib/0001-fix-taglib-config-file-for-cross-compiling-906.patch b/package/taglib/0001-fix-taglib-config-file-for-cross-compiling-906.patch
new file mode 100644
index 0000000000..2c6ebd74db
--- /dev/null
+++ b/package/taglib/0001-fix-taglib-config-file-for-cross-compiling-906.patch
@@ -0,0 +1,66 @@
+From 7470f92a67375d00e53b3785a88fa7b26ad6f1da Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 17 May 2019 13:13:35 +0200
+Subject: [PATCH] fix taglib-config file for cross compiling (#906)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The current taglib-config program does not work for cross-compiling as it only
+returns the paths to the host, which breaks building programs which uses
+`taglib-config` to link against taglib.
+
+Fix this by passing sysroot to the `prefix` and `exec_prefix` fields.
+
+Backported from: 7470f92a67375d00e53b3785a88fa7b26ad6f1da
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ CMakeLists.txt      |  2 +-
+ taglib-config.cmake | 10 +++++-----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2de06324..1a0302c4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -105,7 +105,7 @@ math(EXPR TAGLIB_SOVERSION_PATCH "${TAGLIB_SOVERSION_REVISION}")
+ include(ConfigureChecks.cmake)
+ 
+ if(NOT WIN32)
+-  configure_file("${CMAKE_CURRENT_SOURCE_DIR}/taglib-config.cmake" "${CMAKE_CURRENT_BINARY_DIR}/taglib-config")
++  configure_file("${CMAKE_CURRENT_SOURCE_DIR}/taglib-config.cmake" "${CMAKE_CURRENT_BINARY_DIR}/taglib-config" @ONLY)
+   install(PROGRAMS "${CMAKE_CURRENT_BINARY_DIR}/taglib-config" DESTINATION "${BIN_INSTALL_DIR}")
+ endif()
+ 
+diff --git a/taglib-config.cmake b/taglib-config.cmake
+index 2bc2811a..96ef6883 100644
+--- a/taglib-config.cmake
++++ b/taglib-config.cmake
+@@ -14,10 +14,10 @@ EOH
+ 	exit 1;
+ }
+ 
+-prefix=${CMAKE_INSTALL_PREFIX}
+-exec_prefix=${CMAKE_INSTALL_PREFIX}
+-libdir=${LIB_INSTALL_DIR}
+-includedir=${INCLUDE_INSTALL_DIR}
++prefix=@CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@
++exec_prefix=@CMAKE_SYSROOT@@CMAKE_INSTALL_PREFIX@
++libdir=${exec_prefix}/lib
++includedir=${prefix}/include
+ 
+ flags=""
+ 
+@@ -35,7 +35,7 @@ do
+ 	  flags="$flags -I$includedir/taglib"
+ 	  ;;
+     --version)
+-	  echo ${TAGLIB_LIB_VERSION_STRING}
++	  echo @TAGLIB_LIB_VERSION_STRING@
+ 	  ;;
+     --prefix)
+ 	  echo $prefix
+-- 
+2.22.0
+
