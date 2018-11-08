From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  9 Nov 2018 00:08:14 +0100
Subject: [Buildroot] [PATCH v1] valgrind: fix mips64 compile
Message-ID: <20181108230814.4773-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable gcc march mips64r2 detection (use compile flags already
set by buildroot only), avoids double setting like '-march=mips64
... -march=mips64r2 -mabi=64'.

Fixes [1]:

  error: '-mips64r2' conflicts with the other architecture options, which specify a mips64 processor

[1] http://autobuild.buildroot.net/results/34f6e2352f1559f98c724fe5394db0035b42ddb1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...disable-gcc-march-mips64r2-detection.patch | 58 +++++++++++++++++++
 package/valgrind/valgrind.mk                  |  3 +
 2 files changed, 61 insertions(+)
 create mode 100644 package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch

diff --git a/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch b/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
new file mode 100644
index 0000000000..75874fe7fd
--- /dev/null
+++ b/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
@@ -0,0 +1,58 @@
+From a4584ead274388b91b05b94bad2452a5f0ad3530 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 8 Nov 2018 23:55:30 +0100
+Subject: [PATCH] configure.ac: disable gcc march mips64r2 detection
+
+Disable gcc march mips64r2 detection, compile flags already
+set by buildroot, fixes [1]:
+
+  error: '-mips64r2' conflicts with the other architecture options, which specify a mips64 processor
+
+[1] http://autobuild.buildroot.net/results/34f6e2352f1559f98c724fe5394db0035b42ddb1
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c18ae5f2a..70bfe1bb6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1769,21 +1769,21 @@ case "${host_cpu}" in
+ 
+ 
+         # does this compiler support -march=mips64r2 (mips64r2 default) ?
+-        AC_MSG_CHECKING([if gcc accepts -march=mips64r2 -mabi=64])
++        #AC_MSG_CHECKING([if gcc accepts -march=mips64r2 -mabi=64])
+ 
+-        safe_CFLAGS=$CFLAGS
+-        CFLAGS="$CFLAGS -march=mips64r2 -mabi=64 -Werror"
++        #safe_CFLAGS=$CFLAGS
++        #CFLAGS="$CFLAGS -march=mips64r2 -mabi=64 -Werror"
+ 
+-        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
+-          return 0;
+-        ]])], [
+-        FLAG_M64="-march=mips64r2 -mabi=64"
+-        AC_MSG_RESULT([yes])
+-        ], [
++        #AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
++        #  return 0;
++        #]])], [
++        #FLAG_M64="-march=mips64r2 -mabi=64"
++        #AC_MSG_RESULT([yes])
++        #], [
+         FLAG_M64=""
+-        AC_MSG_RESULT([no])
+-        ])
+-        CFLAGS=$safe_CFLAGS
++        #AC_MSG_RESULT([no])
++        #])
++        #CFLAGS=$safe_CFLAGS
+ 
+         AC_SUBST(FLAG_M64)
+         ;;
+-- 
+2.19.1
+
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 459de4907e..67b2854f86 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -13,6 +13,9 @@ VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
 	--without-mpicc
 VALGRIND_INSTALL_STAGING = YES
+# Patch 0001-configure.ac-disable-gcc-march-mips64r2-detection.patch
+# touches configure.ac
+VALGRIND_AUTORECONF = YES
 
 # Valgrind must be compiled with no stack protection, so forcefully
 # pass -fno-stack-protector to override what Buildroot may have in
-- 
2.19.1
