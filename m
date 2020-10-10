From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 08:51:29 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/supertux: build
 squirrel builtin library with fPIC
Message-ID: <20201010200006.12D8A8E21A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32aaf6d8531046f2f2f521b42ad06bdf8058ac78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Ensure that squirrel is compiled with -fPIC to allow linking the static
libraries with dynamically linked programs. This is not a requirement
for most architectures but is mandatory for ARM.

Fixes:
http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4473c41941158dfc3f0b05c335c50ae94cc41e48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...CMakeLists.txt-compile-squirrel-with-fPIC.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/supertux/0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch b/package/supertux/0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch
new file mode 100644
index 0000000000..9fac20a3f8
--- /dev/null
+++ b/package/supertux/0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch
@@ -0,0 +1,35 @@
+From 23d0bb0ef0fde52d1cffe235edead09287326fb4 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 4 Oct 2020 01:11:30 +0200
+Subject: [PATCH] CMakeLists.txt: compile squirrel with -fPIC
+
+Ensure that squirrel is compiled with -fPIC to allow linking the static
+libraries with dynamically linked programs. This is not a requirement
+for most architectures but is mandatory for ARM.
+
+Fixes:
+x86_64-buildroot-linux-musl/bin/ld: CMakeFiles/sq_static.dir/sq.c.o: relocation R_X86_64_32 against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIC
+x86_64-buildroot-linux-musl/bin/ld: final link failed: nonrepresentable section on output
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8b1dafa1e..07c603cce 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -412,7 +412,8 @@ ExternalProject_Add(squirrel
+   -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
+   -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
+   -DCMAKE_INSTALL_PREFIX=${SQUIRREL_PREFIX}
+-  -DINSTALL_INC_DIR=include)
++  -DINSTALL_INC_DIR=include
++  -DCMAKE_POSITION_INDEPENDENT_CODE=ON)
+ 
+ if(WIN32)
+   add_library(squirrel_lib SHARED IMPORTED)
+-- 
+2.25.4
+
