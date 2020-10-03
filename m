From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Oct 2020 01:22:56 +0200
Subject: [Buildroot] [PATCHv2 2/2] package/supertux: build squirrel builtin
 library with fPIC
In-Reply-To: <20201003232256.549688-1-romain.naour@gmail.com>
References: <20201003232256.549688-1-romain.naour@gmail.com>
Message-ID: <20201003232256.549688-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ensure that squirrel is compiled with -fPIC to allow linking the static
libraries with dynamically linked programs. This is not a requirement
for most architectures but is mandatory for ARM.

Fixes:
http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Lists.txt-compile-squirrel-with-fPIC.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/supertux/0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch

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
-- 
2.25.4
