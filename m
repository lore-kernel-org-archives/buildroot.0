From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 15:44:08 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/supertux: fix
 build with RELRO
Message-ID: <20200929134928.2E76B862EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38535c68427478d4cdc897bee38b6be93a752f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Disable static building of external/squirrel to fix the following build
failure with RELRO:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: CMakeFiles/sq_static.dir/sq.c.o: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIC
/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: final link failed: nonrepresentable section on output
collect2: error: ld returned 1 exit status

Fixes:
 - http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
 - http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 80be040817e008a021219bf4423df7550723d912)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...txt-pass-DISABLE_STATIC-to-external-squir.patch | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/package/supertux/0001-CMakeLists.txt-pass-DISABLE_STATIC-to-external-squir.patch b/package/supertux/0001-CMakeLists.txt-pass-DISABLE_STATIC-to-external-squir.patch
new file mode 100644
index 0000000000..43652d0906
--- /dev/null
+++ b/package/supertux/0001-CMakeLists.txt-pass-DISABLE_STATIC-to-external-squir.patch
@@ -0,0 +1,52 @@
+From 95590485d7cd95611eeac1fc06226d45f235c63a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 13 Sep 2020 22:09:49 +0200
+Subject: [PATCH] CMakeLists.txt: pass DISABLE_STATIC to external/squirrel
+
+external/squirrel will always build a static binary and library except
+if DISABLE_STATIC is defined so define it to avoid the following build
+failure with RELRO_FULL:
+
+/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: CMakeFiles/sq_static.dir/sq.c.o: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIC
+/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: final link failed: nonrepresentable section on output
+collect2: error: ld returned 1 exit status
+
+Fixes:
+ - http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
+ - http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1ae0d653b..bb4358b01 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -411,6 +411,7 @@ ExternalProject_Add(squirrel
+   -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
+   -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
+   -DCMAKE_INSTALL_PREFIX=${SQUIRREL_PREFIX}
++  -DDISABLE_STATIC=ON
+   -DINSTALL_INC_DIR=include)
+ 
+ if(WIN32)
+@@ -424,10 +425,10 @@ if(WIN32)
+   #For debug run purposes
+   configure_file("${CMAKE_CURRENT_SOURCE_DIR}/mk/msvc/run_supertux.bat.in" "${PROJECT_BINARY_DIR}/run_supertux.bat")
+ else()
+-  add_library(squirrel_lib STATIC IMPORTED)
+-  set_target_properties(squirrel_lib PROPERTIES IMPORTED_LOCATION "${SQUIRREL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}squirrel_static${CMAKE_STATIC_LIBRARY_SUFFIX}")
+-  add_library(sqstdlib_lib STATIC IMPORTED)
+-  set_target_properties(sqstdlib_lib PROPERTIES IMPORTED_LOCATION "${SQUIRREL_PREFIX}/lib/${CMAKE_STATIC_LIBRARY_PREFIX}sqstdlib_static${CMAKE_STATIC_LIBRARY_SUFFIX}")
++  add_library(squirrel_lib SHARED IMPORTED)
++  set_target_properties(squirrel_lib PROPERTIES IMPORTED_LOCATION "${SQUIRREL_PREFIX}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}squirrel${CMAKE_SHARED_LIBRARY_SUFFIX}")
++  add_library(sqstdlib_lib SHARED IMPORTED)
++  set_target_properties(sqstdlib_lib PROPERTIES IMPORTED_LOCATION "${SQUIRREL_PREFIX}/lib/${CMAKE_SHARED_LIBRARY_PREFIX}sqstdlib${CMAKE_SHARED_LIBRARY_SUFFIX}")
+ endif()
+ 
+ include_directories(SYSTEM ${SQUIRREL_PREFIX}/include)
+-- 
+2.28.0
+
