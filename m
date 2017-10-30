From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon, 30 Oct 2017 19:24:56 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.09 release
Message-ID: <20171030162456.9107-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit finally bumps ARC tools to the most recent arc-2017.09 release version.

ARC GNU tools of version arc-2017.09 bring some quite significant changes like:
 * Binutils v2.29 with additonal ARC patches
 * GCC 7.1.1 with additional ARC patches 
 * glibc 2.24 with additional ARC patches

More information on this release could be found here:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2017.09-release

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com 
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host                    |  2 +-
 .../0002-ld-makefile.patch                         |  0
 .../0003-check-ldrunpath-length.patch              |  0
 .../0004-add-sysroot-fix-from-bug-3049.patch       |  0
 .../0005-poison-system-directories.patch           |  0
 package/binutils/binutils.hash                     |  2 +-
 package/binutils/binutils.mk                       |  2 +-
 package/gcc/Config.in.host                         |  2 +-
 .../0910-Update-uses-for-hw-loop-labels.patch      | 63 ----------------------
 .../0100-uclibc-conf.patch                         |  0
 .../0860-cilk-fix-build-without-wchar.patch        |  0
 .../0900-remove-selftests.patch                    |  0
 package/gcc/gcc.hash                               |  2 +-
 package/gdb/Config.in.host                         |  2 +-
 package/gdb/gdb.hash                               |  2 +-
 15 files changed, 7 insertions(+), 70 deletions(-)
 rename package/binutils/{arc-2017.09-rc1 => arc-2017.09}/0002-ld-makefile.patch (100%)
 rename package/binutils/{arc-2017.09-rc1 => arc-2017.09}/0003-check-ldrunpath-length.patch (100%)
 rename package/binutils/{arc-2017.09-rc1 => arc-2017.09}/0004-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{arc-2017.09-rc1 => arc-2017.09}/0005-poison-system-directories.patch (100%)
 delete mode 100644 package/gcc/arc-2017.09-rc1/0910-Update-uses-for-hw-loop-labels.patch
 rename package/gcc/{arc-2017.09-rc1 => arc-2017.09}/0100-uclibc-conf.patch (100%)
 rename package/gcc/{arc-2017.09-rc1 => arc-2017.09}/0860-cilk-fix-build-without-wchar.patch (100%)
 rename package/gcc/{arc-2017.09-rc1 => arc-2017.09}/0900-remove-selftests.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index da9d123..66a9ccb 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -22,7 +22,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2017.09-rc1"	if BR2_arc
+	default "arc-2017.09"	if BR2_arc
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
 	default "2.28.1"	if BR2_BINUTILS_VERSION_2_28_X
 	default "2.29.1"	if BR2_BINUTILS_VERSION_2_29_X
diff --git a/package/binutils/arc-2017.09-rc1/0002-ld-makefile.patch b/package/binutils/arc-2017.09/0002-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2017.09-rc1/0002-ld-makefile.patch
rename to package/binutils/arc-2017.09/0002-ld-makefile.patch
diff --git a/package/binutils/arc-2017.09-rc1/0003-check-ldrunpath-length.patch b/package/binutils/arc-2017.09/0003-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2017.09-rc1/0003-check-ldrunpath-length.patch
rename to package/binutils/arc-2017.09/0003-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2017.09-rc1/0004-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2017.09/0004-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2017.09-rc1/0004-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2017.09/0004-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2017.09-rc1/0005-poison-system-directories.patch b/package/binutils/arc-2017.09/0005-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2017.09-rc1/0005-poison-system-directories.patch
rename to package/binutils/arc-2017.09/0005-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 59bcbcb..d684b53 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512	dc5b6872ae01c07c12d38f3bb7ead06effc6da3265ac872e2d9c6104304f89f85f2645b02
 sha512  d748d22306477d60d921078804d21943248c23fca0707aac9b016a352c01c75ca69e82624ae37fb0bbd03af3b17088a94f60dfe1a86a7ff82e18ece3c24f0fd0  binutils-2.29.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  7017056456805c472930a13997e5d5da1031492da7534b09ecaab7c1953ea62513f2c12292c16ec5740acb63493802a30642e28e103919215d0d11e1da997bcb  binutils-arc-2017.09-rc1.tar.gz
+sha512  d5131b789ffe9b9a77006ef193d3cafad38c7af0ff5565ae24e7983b566778ad6abf7196dd67e3f58e522db52a8ba18fb2a3dd760c69aaf5426fc4ba3e962faa  binutils-arc-2017.09.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 7ab422e..656c6fd 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2017.09-rc1
+BINUTILS_VERSION = arc-2017.09
 else
 BINUTILS_VERSION = 2.28.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 89f1ee2..daf1161 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -92,7 +92,7 @@ config BR2_GCC_VERSION
 	default "5.5.0"     if BR2_GCC_VERSION_5_X
 	default "6.4.0"     if BR2_GCC_VERSION_6_X
 	default "7.2.0"     if BR2_GCC_VERSION_7_X
-	default "arc-2017.09-rc1" if BR2_GCC_VERSION_ARC
+	default "arc-2017.09" if BR2_GCC_VERSION_ARC
 	default "musl-5.4.0" if BR2_GCC_VERSION_OR1K
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/arc-2017.09-rc1/0910-Update-uses-for-hw-loop-labels.patch b/package/gcc/arc-2017.09-rc1/0910-Update-uses-for-hw-loop-labels.patch
deleted file mode 100644
index c703909..0000000
--- a/package/gcc/arc-2017.09-rc1/0910-Update-uses-for-hw-loop-labels.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From cb7f97fb860b5286d3470ccda0f623f4657780a3 Mon Sep 17 00:00:00 2001
-From: claziss <claziss@synopsys.com>
-Date: Tue, 19 Sep 2017 15:45:19 +0200
-Subject: [PATCH] [ARC][ZOL] Update uses for hw-loop labels.
-
-Make sure we mark the hw-loop labels as beeing used.
-
-gcc/
-2017-09-19  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.c (hwloop_optimize): Update hw-loop's end/start
-	labels number of usages.
-
-gcc/testsuite
-2017-09-19  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* gcc.target/arc/loop-2.cpp: New test.
----
- gcc/config/arc/arc.c                    |  3 +++
- gcc/testsuite/gcc.target/arc/arc.exp    |  2 +-
- gcc/testsuite/gcc.target/arc/loop-2.cpp | 18 ++++++++++++++++++
- 3 files changed, 22 insertions(+), 1 deletion(-)
- create mode 100644 gcc/testsuite/gcc.target/arc/loop-2.cpp
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index 5c0a872cc97..cc7fc624ff2 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -7613,6 +7613,9 @@ hwloop_optimize (hwloop_info loop)
-   /* Insert the loop end label before the last instruction of the
-      loop.  */
-   emit_label_after (end_label, loop->last_insn);
-+  /* Make sure we mark the begining and end label as used.  */
-+  LABEL_NUSES (loop->end_label)++;
-+  LABEL_NUSES (loop->start_label)++;
- 
-   return true;
- }
-diff --git a/gcc/testsuite/gcc.target/arc/loop-2.cpp b/gcc/testsuite/gcc.target/arc/loop-2.cpp
-new file mode 100644
-index 00000000000..d1dc917ba47
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/arc/loop-2.cpp
-@@ -0,0 +1,18 @@
-+/* { dg-options "-O2" } *
-+/* { dg-do assemble } */
-+
-+/* This file fails to assemble if we forgot to increase the number of
-+   uses for loop's start and end labels.  */
-+int a, c, d;
-+int *b;
-+void fn1(int p1) {
-+  if (d == 5)
-+    for (int i; i < p1; ++i)
-+      if (c)
-+        b[i] = c;
-+      else
-+        int t = a = t;
-+  else
-+    for (int i; i < p1; ++i)
-+      b[i] = 0;
-+}
-
diff --git a/package/gcc/arc-2017.09-rc1/0100-uclibc-conf.patch b/package/gcc/arc-2017.09/0100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/arc-2017.09-rc1/0100-uclibc-conf.patch
rename to package/gcc/arc-2017.09/0100-uclibc-conf.patch
diff --git a/package/gcc/arc-2017.09-rc1/0860-cilk-fix-build-without-wchar.patch b/package/gcc/arc-2017.09/0860-cilk-fix-build-without-wchar.patch
similarity index 100%
rename from package/gcc/arc-2017.09-rc1/0860-cilk-fix-build-without-wchar.patch
rename to package/gcc/arc-2017.09/0860-cilk-fix-build-without-wchar.patch
diff --git a/package/gcc/arc-2017.09-rc1/0900-remove-selftests.patch b/package/gcc/arc-2017.09/0900-remove-selftests.patch
similarity index 100%
rename from package/gcc/arc-2017.09-rc1/0900-remove-selftests.patch
rename to package/gcc/arc-2017.09/0900-remove-selftests.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index cd6fdef..f92a008 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,6 +8,6 @@ sha512  02c60e54527c7adf584798d5251f8a0b80c93d5deafce82501b2c28e6692e0bd783927bb
 sha512  f853cd6530b4055d8d8289da74687cb4c6d5f363598d386332d31852b581bac76c3adb7d61889edec3b779f63d8646f0122840f12965ce4a4389ba535dbbb6e1  gcc-7.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  c30255dc937e23f6388b4c640455114bcf86cffe923191e32d33ffcde6c4980e9d1811e85877fed3e414ed069cc3e2013993ed76331088ff0846ac50421cb426  gcc-arc-2017.09-rc1.tar.gz
+sha512  d005af073405bf793be1c1a43887bbb9ba2c211baf3ce5eeaaaa2e42c675098eca44cbb0e98ee7bd34a968ea44dd520cf88b851e394afaf59a71339247760983  gcc-arc-2017.09.tar.gz
 # Locally calculated (fetched from Github)
 sha512  841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f  gcc-musl-5.4.0.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index c2cfc34..d5e1510 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -64,7 +64,7 @@ endif
 # If cross-gdb is not enabled, the latest working version is chosen.
 config BR2_GDB_VERSION
 	string
-	default "arc-2017.09-rc1-gdb" if BR2_arc
+	default "arc-2017.09-gdb" if BR2_arc
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index d891d25..64ff543 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,4 +5,4 @@ sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7
 sha512  5eb328910033f0918058be2f92caebf1e8dfc6caa3c730d99d621627e53de3c1b43761c2f683d53555893253c2f06768cbf56cdea051a3d291ffb6cfae87b5e1	gdb-8.0.1.tar.xz
 
 # Locally calculated (fetched from Github)
-sha512  4c6f800ff8f95740b8f7f0544d332c2c36ba693c51f6d3d99a0b0ca5a617cb67bcc6f60bd481cd4b884494f9bce531ac5cb270d1c6f8fc5c067100ec77c098d8 	gdb-arc-2017.09-rc1-gdb.tar.gz
+sha512  ebcd351706284646c5e23a4fadde12116f2ef1698f1b1a505ffcfa579c74b68cdb1f32227a7fb8d36435df5e5530b8ca9f255907e22be718e1e8809ca43196b5 	gdb-arc-2017.09-gdb.tar.gz
-- 
2.9.3
