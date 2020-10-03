From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Oct 2020 22:00:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/supertux: fix build with RELRO
In-Reply-To: <20201003200013.228007-1-fontaine.fabrice@gmail.com>
References: <20201003200013.228007-1-fontaine.fabrice@gmail.com>
Message-ID: <20201003200013.228007-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
 - http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...MakeLists.txt-disable-building-of-sq.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/supertux/0001-CMakeLists.txt-disable-building-of-sq.patch

diff --git a/package/supertux/0001-CMakeLists.txt-disable-building-of-sq.patch b/package/supertux/0001-CMakeLists.txt-disable-building-of-sq.patch
new file mode 100644
index 0000000000..dac5943056
--- /dev/null
+++ b/package/supertux/0001-CMakeLists.txt-disable-building-of-sq.patch
@@ -0,0 +1,36 @@
+From 9268f8bee6f57a74226c1db7a9b3643506970ff8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 3 Oct 2020 16:55:46 +0200
+Subject: [PATCH] CMakeLists.txt: disable building of sq
+
+Build of sq_static raises the following build failure with RELRO:
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
+[Upstream status: https://github.com/SuperTux/supertux/issues/1536]
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/external/squirrel/CMakeLists.txt b/external/squirrel/CMakeLists.txt
+index 4a37b6a..dea4922 100644
+--- a/external/squirrel/CMakeLists.txt
++++ b/external/squirrel/CMakeLists.txt
+@@ -52,7 +52,6 @@ endif()
+ 
+ add_subdirectory(squirrel)
+ add_subdirectory(sqstdlib)
+-add_subdirectory(sq)
+ 
+ if(NOT WIN32 AND NOT DEFINED DISABLE_DYNAMIC)
+   set_target_properties(squirrel sqstdlib PROPERTIES SOVERSION 0 VERSION 0.0.0)
+-- 
+2.28.0
+
-- 
2.28.0
