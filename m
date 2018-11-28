From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 15:23:57 +0100
Subject: [Buildroot] [git commit] valgrind: fix mips64 compile
Message-ID: <20181128142046.2784888D11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac2b5849de68129d13718ab43061b372086402d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable gcc march mips64r2 detection (use compile flags already
set by buildroot only), avoids double setting like '-march=mips64
... -march=mips64r2 -mabi=64'.

Fixes [1]:

  error: '-mips64r2' conflicts with the other architecture options, which specify a mips64 processor

[1] http://autobuild.buildroot.net/results/34f6e2352f1559f98c724fe5394db0035b42ddb1

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e.ac-disable-gcc-march-mips64r2-detection.patch | 49 ++++++++++++++++++++++
 package/valgrind/valgrind.mk                       |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch b/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
new file mode 100644
index 0000000000..a5573d518d
--- /dev/null
+++ b/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
@@ -0,0 +1,49 @@
+From 1fd5a3d2adf04bad6ae6e9eef9caead7d46d9307 Mon Sep 17 00:00:00 2001
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
+[Thomas: remove code instead of commenting it]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac | 15 ---------------
+ 1 file changed, 15 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 289514ff1..18cf97ffe 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1768,22 +1768,7 @@ case "${host_cpu}" in
+         AC_SUBST(FLAG_M32)
+ 
+ 
+-        # does this compiler support -march=mips64r2 (mips64r2 default) ?
+-        AC_MSG_CHECKING([if gcc accepts -march=mips64r2 -mabi=64])
+-
+-        safe_CFLAGS=$CFLAGS
+-        CFLAGS="$CFLAGS -march=mips64r2 -mabi=64 -Werror"
+-
+-        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
+-          return 0;
+-        ]])], [
+-        FLAG_M64="-march=mips64r2 -mabi=64"
+-        AC_MSG_RESULT([yes])
+-        ], [
+         FLAG_M64=""
+-        AC_MSG_RESULT([no])
+-        ])
+-        CFLAGS=$safe_CFLAGS
+ 
+         AC_SUBST(FLAG_M64)
+         ;;
+-- 
+2.19.1
+
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 459de4907e..cae14f79b9 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -13,6 +13,9 @@ VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
 	--without-mpicc
 VALGRIND_INSTALL_STAGING = YES
+# Patch 0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
+# touches configure.ac
+VALGRIND_AUTORECONF = YES
 
 # Valgrind must be compiled with no stack protection, so forcefully
 # pass -fno-stack-protector to override what Buildroot may have in
