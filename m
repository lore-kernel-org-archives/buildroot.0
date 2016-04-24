From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:26:34 +0200
Subject: [Buildroot] [git commit] package/yajl: fix build when explicit link
	with libm is needed
Message-ID: <20160424212642.6CCEC8198C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=302563539dacb284576a443401cdfd061eb2e1e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds another fix to the yajl build-system code.
This patch checks for isnan function in libc, and if not, it makes sure
libm is passed to the linker flags.

This change fixes build failure looking like:

  make[3]: Entering directory `/home/peko/autobuild/instance-2/output/build/yajl-2.1.0'
  [ 81%] Building C object example/CMakeFiles/parse_config.dir/parse_config.c.o
  ../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isnan'
  ../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isinf'
  collect2: error: ld returned 1 exit status
  make[3]: *** [verify/json_verify] Error 1

Fixes:
  http://autobuild.buildroot.org/results/312/31268e4d20aa34bb90c09aa771b1923f979578ab/
  and many others

Cc: Beno??t Mauduit <bmauduit@beneth.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...l-_s-with-libm-when-isnan-is-not-brought-.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/package/yajl/0004-Link-libyajl-_s-with-libm-when-isnan-is-not-brought-.patch b/package/yajl/0004-Link-libyajl-_s-with-libm-when-isnan-is-not-brought-.patch
new file mode 100644
index 0000000..71cf295
--- /dev/null
+++ b/package/yajl/0004-Link-libyajl-_s-with-libm-when-isnan-is-not-brought-.patch
@@ -0,0 +1,64 @@
+From b47f6a50925efb8c8707b1faed5561a4b66ffdb1 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 24 Apr 2016 18:45:27 +0200
+Subject: [PATCH] Link libyajl{,_s} with libm when isnan is not brought by the
+ libc
+
+Check whether isnan is provided by the libc library, otherwise make sure
+yajl libraries are link against libm.
+
+Note that setting libm as PUBLIC link libraries enable the transitivity
+[1, 2]; therefore it will be automatically passed to target linking
+against libyajl{,_s}.
+
+This patch also makes sure the link libraries will appear in the yajl.pc
+file.
+
+[1] https://cmake.org/cmake/help/v3.5/command/target_link_libraries.html
+[2] https://cmake.org/cmake/help/v3.5/manual/cmake-buildsystem.7.html#target-usage-requirements
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ src/CMakeLists.txt | 10 ++++++++++
+ src/yajl.pc.cmake  |  2 +-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index b487bfd..a88698f 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -35,11 +35,21 @@ SET (shareDir ${CMAKE_CURRENT_BINARY_DIR}/../${YAJL_DIST_NAME}/share/pkgconfig)
+ # set the output path for libraries
+ SET(LIBRARY_OUTPUT_PATH ${libDir})
+ 
++SET(yajl_lib_link)
++INCLUDE(CheckLibraryExists)
++CHECK_LIBRARY_EXISTS(c isnan "" HAVE_LIBC_ISNAN)
++
++IF(NOT HAVE_LIBC_ISNAN)
++  LIST(APPEND yajl_lib_link "-lm")
++ENDIF(NOT HAVE_LIBC_ISNAN)
++
+ ADD_LIBRARY(yajl_s STATIC ${SRCS} ${HDRS} ${PUB_HDRS})
+ SET_TARGET_PROPERTIES(yajl_s PROPERTIES OUTPUT_NAME yajl)
++TARGET_LINK_LIBRARIES(yajl_s PUBLIC ${yajl_lib_link})
+ 
+ IF(BUILD_SHARED_LIBS)
+ ADD_LIBRARY(yajl SHARED ${SRCS} ${HDRS} ${PUB_HDRS})
++TARGET_LINK_LIBRARIES(yajl PUBLIC ${yajl_lib_link})
+ 
+ #### setup shared library version number
+ SET_TARGET_PROPERTIES(yajl PROPERTIES
+diff --git a/src/yajl.pc.cmake b/src/yajl.pc.cmake
+index 6eaca14..4681dd4 100644
+--- a/src/yajl.pc.cmake
++++ b/src/yajl.pc.cmake
+@@ -6,4 +6,4 @@ Name: Yet Another JSON Library
+ Description: A Portable JSON parsing and serialization library in ANSI C
+ Version: ${YAJL_MAJOR}.${YAJL_MINOR}.${YAJL_MICRO}
+ Cflags: -I${dollar}{includedir}
+-Libs: -L${dollar}{libdir} -lyajl
++Libs: -L${dollar}{libdir} -lyajl ${yajl_lib_link}
+-- 
+2.8.0
+
