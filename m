From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 21:23:35 +0200
Subject: [Buildroot] [git commit] package/valgrind: bump to version 3.15.0
Message-ID: <20190424191938.6160E82926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba8a74675607daacb5a5283382b1f58e9e20492e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Additionally, backport an upstream patch with which valgrind can now
be compiled for MIPS32r6/MIPS64r6 and reenable valgrind for those
architectures in the Config.in file.

Moreover, remove a patch which is not needed anymore since
https://bugs.kde.org/show_bug.cgi?id=400975 has been resolved, also
making AUTORECONF = YES no longer necessary.

Signed-off-by: Stefan Maksimovic <stefan.maksimovic@rt-rk.com>
[Thomas: improve commit log, add reference to upstream commit]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e.ac-disable-gcc-march-mips64r2-detection.patch | 49 ---------------------
 ...x-mips32r6-and-mips64r6-compilation-issue.patch | 51 ++++++++++++++++++++++
 package/valgrind/Config.in                         |  7 +--
 package/valgrind/valgrind.hash                     |  2 +-
 package/valgrind/valgrind.mk                       |  5 +--
 5 files changed, 54 insertions(+), 60 deletions(-)

diff --git a/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch b/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
deleted file mode 100644
index a5573d518d..0000000000
--- a/package/valgrind/0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 1fd5a3d2adf04bad6ae6e9eef9caead7d46d9307 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 8 Nov 2018 23:55:30 +0100
-Subject: [PATCH] configure.ac: disable gcc march mips64r2 detection
-
-Disable gcc march mips64r2 detection, compile flags already
-set by buildroot, fixes [1]:
-
-  error: '-mips64r2' conflicts with the other architecture options, which specify a mips64 processor
-
-[1] http://autobuild.buildroot.net/results/34f6e2352f1559f98c724fe5394db0035b42ddb1
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[Thomas: remove code instead of commenting it]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac | 15 ---------------
- 1 file changed, 15 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 289514ff1..18cf97ffe 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1768,22 +1768,7 @@ case "${host_cpu}" in
-         AC_SUBST(FLAG_M32)
- 
- 
--        # does this compiler support -march=mips64r2 (mips64r2 default) ?
--        AC_MSG_CHECKING([if gcc accepts -march=mips64r2 -mabi=64])
--
--        safe_CFLAGS=$CFLAGS
--        CFLAGS="$CFLAGS -march=mips64r2 -mabi=64 -Werror"
--
--        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
--          return 0;
--        ]])], [
--        FLAG_M64="-march=mips64r2 -mabi=64"
--        AC_MSG_RESULT([yes])
--        ], [
-         FLAG_M64=""
--        AC_MSG_RESULT([no])
--        ])
--        CFLAGS=$safe_CFLAGS
- 
-         AC_SUBST(FLAG_M64)
-         ;;
--- 
-2.19.1
-
diff --git a/package/valgrind/0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch b/package/valgrind/0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch
new file mode 100644
index 0000000000..da8c655f00
--- /dev/null
+++ b/package/valgrind/0003-mips-fix-mips32r6-and-mips64r6-compilation-issue.patch
@@ -0,0 +1,51 @@
+From 50dd9600ab1ad8933704ee85289191d9c65ba444 Mon Sep 17 00:00:00 2001
+From: Petar Jovanovic <mips32r2@gmail.com>
+Date: Fri, 19 Apr 2019 14:04:26 +0000
+Subject: [PATCH] mips: fix mips32r6 and mips64r6 compilation issue
+
+Add missing variable declarations.
+Modify local_sys_write_stderr to use movn if available, and use
+seleqz/selnez instructions otherwise.
+
+Backported from upstream commit
+50dd9600ab1ad8933704ee85289191d9c65ba444.
+
+Signed-off-by: Stefan Maksimovic <stefan.maksimovic@rt-rk.com>
+---
+ VEX/priv/guest_mips_toIR.c | 1 +
+ coregrind/m_debuglog.c     | 6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/VEX/priv/guest_mips_toIR.c b/VEX/priv/guest_mips_toIR.c
+index eb437ec..6e91329 100755
+--- a/VEX/priv/guest_mips_toIR.c
++++ b/VEX/priv/guest_mips_toIR.c
+@@ -20241,6 +20241,7 @@ static UInt disInstr_MIPS_WRK_00(UInt cins, const VexArchInfo* archinfo,
+ #elif defined(__mips__) && ((defined(__mips_isa_rev) && __mips_isa_rev >= 6))
+ 
+       case 0x08: { /* BEQZALC, BEQC, BOVC */
++         IRTemp t1, t2, t3, t4;
+          if (rs == 0) { /* BEQZALC */
+             DIP("beqzalc r%u, %u", rt, imm);
+ 
+diff --git a/coregrind/m_debuglog.c b/coregrind/m_debuglog.c
+index 456a711..289f275 100644
+--- a/coregrind/m_debuglog.c
++++ b/coregrind/m_debuglog.c
+@@ -452,7 +452,13 @@ static UInt local_sys_write_stderr ( const HChar* buf, Int n )
+    __asm__ volatile (
+       "syscall            \n\t"
+       "addiu   $4, $0, -1 \n\t"
++      #if ((defined(__mips_isa_rev) && __mips_isa_rev >= 6))
++      "selnez  $4, $4, $7 \n\t"
++      "seleqz  $2, $2, $7 \n\t"
++      "or      $2, $2, $4 \n\t"
++      #else
+       "movn    $2, $4, $7 \n\t"
++      #endif
+      : "+d" (v0), "+d" (a0), "+d" (a1), "+d" (a2)
+      :
+      : "$1", "$3", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15",
+-- 
+2.7.4
+
diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index c09be8629a..56e4af21fa 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -2,12 +2,7 @@ config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_ARM_CPU_ARMV7A
-	# MIPS32 R6 is unsupported
-	default y if BR2_mips && !BR2_mips_32r6
-	default y if BR2_mipsel && !BR2_mips_32r6
-	# MIPS64 R6 is unsupported
-	default y if BR2_mips64 && !BR2_mips_64r6
-	default y if BR2_mips64el && !BR2_mips_64r6
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_MIPS_SOFT_FLOAT
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index 87fb496857..3c7b98ef2b 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,5 +1,5 @@
 # From http://valgrind.org/downloads/current.html
-md5 74175426afa280184b62591b58c671b3 valgrind-3.14.0.tar.bz2
+md5 46e5fbdcbc3502a5976a317a0860a975 valgrind-3.15.0.tar.bz2
 
 # License files
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index cae14f79b9..41b2625191 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.14.0
+VALGRIND_VERSION = 3.15.0
 VALGRIND_SITE = ftp://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
@@ -13,9 +13,6 @@ VALGRIND_CONF_OPTS = \
 	--disable-ubsan \
 	--without-mpicc
 VALGRIND_INSTALL_STAGING = YES
-# Patch 0003-configure.ac-disable-gcc-march-mips64r2-detection.patch
-# touches configure.ac
-VALGRIND_AUTORECONF = YES
 
 # Valgrind must be compiled with no stack protection, so forcefully
 # pass -fno-stack-protector to override what Buildroot may have in
