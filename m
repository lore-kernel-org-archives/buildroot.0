From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:29:48 +0200
Subject: [Buildroot] [git commit] valgrind: remove default flags -mips32 and
	-mips64 from Makefile.all.am
Message-ID: <20140403193019.E49FC9A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd7bfc0ca865218c22a358dfab126f5e59b9ccb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During configuration of Valgrind we check does the compiler support
-march=mips32 and -march=mips64. If compiler supports these flags we are
using them as default flags for mips32 and mips64.

"VALGRIND_AUTORECONF = YES" needs to be added to valgrind.mk because
this patch modifies the configure.ac.

Original upstream patch:
   https://github.com/svn2github/valgrind/commit/fdf6c5aea4671c3c43c90230510735d215dd1e1c

Fixes:
   http://autobuild.buildroot.net/results/213/21352bcbe1b309fef0f996c275cdfcda08619d96/

[Thomas: add reference to the upstream patch into the patch itself, in
addition to the commit log.]

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../valgrind-0004-remove-default-mips-flags.patch  |   93 ++++++++++++++++++++
 package/valgrind/valgrind.mk                       |    1 +
 2 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/package/valgrind/valgrind-0004-remove-default-mips-flags.patch b/package/valgrind/valgrind-0004-remove-default-mips-flags.patch
new file mode 100644
index 0000000..14a493b
--- /dev/null
+++ b/package/valgrind/valgrind-0004-remove-default-mips-flags.patch
@@ -0,0 +1,93 @@
+From 374743e6faa9d3fc2fba1489e2ead8ea8ebd1f62 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Mon, 31 Mar 2014 12:00:39 +0100
+Subject: [PATCH] mips32/64: Remove default flags -mips32 and -mips64 from Makefile.all.am
+
+During configuration of Valgrind we check does the compiler support
+-march=mips32 and -march=mips64. If compiler supports these flags we are
+using them as default flags for mips32 and mips64.
+
+Original upstream patch:
+   https://github.com/svn2github/valgrind/commit/fdf6c5aea4671c3c43c90230510735d215dd1e1c
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ Makefile.all.am |    8 ++++----
+ configure.ac    |   40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 44 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.all.am b/Makefile.all.am
+index 1f69802..405f11f 100644
+--- a/Makefile.all.am
++++ b/Makefile.all.am
+@@ -173,12 +173,12 @@ AM_CFLAGS_S390X_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE) -fomit-frame-pointer
+ AM_CCASFLAGS_S390X_LINUX  = @FLAG_M64@ -g -mzarch -march=z900
+ 
+ AM_FLAG_M3264_MIPS32_LINUX = @FLAG_M32@
+-AM_CFLAGS_MIPS32_LINUX     = @FLAG_M32@ $(AM_CFLAGS_BASE) -mips32
+-AM_CCASFLAGS_MIPS32_LINUX  = @FLAG_M32@ -mips32 -g
++AM_CFLAGS_MIPS32_LINUX     = @FLAG_M32@ $(AM_CFLAGS_BASE) @FLAG_MIPS32@
++AM_CCASFLAGS_MIPS32_LINUX  = @FLAG_M32@ -g @FLAG_MIPS32@
+ 
+ AM_FLAG_M3264_MIPS64_LINUX = @FLAG_M64@
+-AM_CFLAGS_MIPS64_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE) -mips64
+-AM_CCASFLAGS_MIPS64_LINUX  = @FLAG_M64@ -mips64 -g
++AM_CFLAGS_MIPS64_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE) @FLAG_MIPS64@
++AM_CCASFLAGS_MIPS64_LINUX  = @FLAG_M64@ -g @FLAG_MIPS64@
+ 
+ # Flags for the primary target.  These must be used to build the
+ # regtests and performance tests.  In fact, these must be used to
+diff --git a/configure.ac b/configure.ac
+index 229ab98..0e3884c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1450,6 +1450,46 @@ CFLAGS=$safe_CFLAGS
+ AC_SUBST(FLAG_M64)
+ 
+ 
++# does this compiler support -march=mips32 (mips32 default) ?
++AC_MSG_CHECKING([if gcc accepts -march=mips32])
++
++safe_CFLAGS=$CFLAGS
++CFLAGS="$CFLAGS -march=mips32"
++
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
++  return 0;
++]])], [
++FLAG_MIPS32="-march=mips32"
++AC_MSG_RESULT([yes])
++], [
++FLAG_MIPS32=""
++AC_MSG_RESULT([no])
++])
++CFLAGS=$safe_CFLAGS
++
++AC_SUBST(FLAG_MIPS32)
++
++
++# does this compiler support -march=mips64 (mips64 default) ?
++AC_MSG_CHECKING([if gcc accepts -march=mips64])
++
++safe_CFLAGS=$CFLAGS
++CFLAGS="$CFLAGS -march=mips64"
++
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
++  return 0;
++]])], [
++FLAG_MIPS64="-march=mips64"
++AC_MSG_RESULT([yes])
++], [
++FLAG_MIPS64=""
++AC_MSG_RESULT([no])
++])
++CFLAGS=$safe_CFLAGS
++
++AC_SUBST(FLAG_MIPS64)
++
++
+ # does this compiler support -mmmx ?
+ AC_MSG_CHECKING([if gcc accepts -mmmx])
+ 
+-- 
+1.7.1
+
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index cef67b0..b9aa019 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -10,6 +10,7 @@ VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CONF_OPT = --disable-tls
+VALGRIND_AUTORECONF = YES
 
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
 # host tuple to determine whether it's being built for ARMv7 or
