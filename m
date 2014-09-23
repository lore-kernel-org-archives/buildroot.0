From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 23 Sep 2014 11:45:42 +0200
Subject: [Buildroot] [PATCH 3/8] valgrind: bump to version 3.10
In-Reply-To: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
References: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
Message-ID: <1411465547-6847-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches status:

  valgrind-0001-workaround-SIGSEGV-on-PPC: Don't know. In doubt, I
     prefer to keep it.

  valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC:
     Seems still necessary

  valgrind-0003-Add-replacement-for-a.out.h: Upstreamed

  valgrind-0004-remove-default-mips-flags: Upstreamed

  valgrind-0005-glibc-2.19: Upstream now support glibc up to 2.20

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 .../valgrind-0001-workaround-SIGSEGV-on-PPC.patch  |  8 +-
 ...e-largefile-support-unconditionally-on-uC.patch | 14 ++--
 ...valgrind-0003-Add-replacement-for-a.out.h.patch | 58 --------------
 .../valgrind-0004-remove-default-mips-flags.patch  | 93 ----------------------
 package/valgrind/valgrind-0005-glibc-2.19.patch    | 32 --------
 package/valgrind/valgrind.mk                       |  2 +-
 6 files changed, 12 insertions(+), 195 deletions(-)
 delete mode 100644 package/valgrind/valgrind-0003-Add-replacement-for-a.out.h.patch
 delete mode 100644 package/valgrind/valgrind-0004-remove-default-mips-flags.patch
 delete mode 100644 package/valgrind/valgrind-0005-glibc-2.19.patch

diff --git a/package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch
index 9e891be..1c5966b 100644
--- a/package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch
+++ b/package/valgrind/valgrind-0001-workaround-SIGSEGV-on-PPC.patch
@@ -1,7 +1,7 @@
-From 872ade34d6af973ca88d5accd9e819216ecb94ba Mon Sep 17 00:00:00 2001
+From bd9d2af89e45081132c150e5e4bdf9a12dfca693 Mon Sep 17 00:00:00 2001
 From: Pierre Habouzit <madcoder@debian.org>
 Date: Tue, 10 May 2011 23:11:45 +0200
-Subject: [PATCH 1/3] workaround SIGSEGV on PPC.
+Subject: [PATCH 1/2] workaround SIGSEGV on PPC.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -13,7 +13,7 @@ Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
  1 file changed, 4 insertions(+)
 
 diff --git a/coregrind/m_machine.c b/coregrind/m_machine.c
-index 28a180e..8426551 100644
+index 42d8ce8..3c9900f 100644
 --- a/coregrind/m_machine.c
 +++ b/coregrind/m_machine.c
 @@ -27,6 +27,10 @@
@@ -28,5 +28,5 @@ index 28a180e..8426551 100644
  #include "pub_core_vki.h"
  #include "pub_core_libcsetjmp.h"   // setjmp facilities
 -- 
-1.8.3.2
+1.9.1
 
diff --git a/package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch b/package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
index 1df318a..57ab2c3 100644
--- a/package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
+++ b/package/valgrind/valgrind-0002-don-t-enable-largefile-support-unconditionally-on-uC.patch
@@ -1,7 +1,7 @@
-From 271d855c0ad94a2ec164e20173257a06cd83288d Mon Sep 17 00:00:00 2001
+From 6bb94d51e25b394bc9c52699f744a7cc06ffca15 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
 Date: Thu, 2 Jan 2014 16:00:06 +0100
-Subject: [PATCH 2/3] don't enable largefile support unconditionally on uClibc
+Subject: [PATCH 2/2] don't enable largefile support unconditionally on uClibc
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -19,7 +19,7 @@ Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
  3 files changed, 12 insertions(+)
 
 diff --git a/coregrind/m_initimg/initimg-linux.c b/coregrind/m_initimg/initimg-linux.c
-index 9bcc05c..ffee30f 100644
+index a8e7d27..fa670cb 100644
 --- a/coregrind/m_initimg/initimg-linux.c
 +++ b/coregrind/m_initimg/initimg-linux.c
 @@ -55,7 +55,11 @@
@@ -35,10 +35,10 @@ index 9bcc05c..ffee30f 100644
  #include <elf.h>
  /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
 diff --git a/coregrind/m_main.c b/coregrind/m_main.c
-index 35c11e1..0372946 100644
+index e7159a8..4371a1f 100644
 --- a/coregrind/m_main.c
 +++ b/coregrind/m_main.c
-@@ -2997,7 +2997,11 @@ asm(
+@@ -3143,7 +3143,11 @@ asm(
  
  /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
  #define _GNU_SOURCE
@@ -51,7 +51,7 @@ index 35c11e1..0372946 100644
  #include <elf.h>
  /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
 diff --git a/coregrind/m_ume/elf.c b/coregrind/m_ume/elf.c
-index b5b30e5..0766c74 100644
+index 4615da3..06992a4 100644
 --- a/coregrind/m_ume/elf.c
 +++ b/coregrind/m_ume/elf.c
 @@ -48,7 +48,11 @@
@@ -67,5 +67,5 @@ index b5b30e5..0766c74 100644
  #include <elf.h>
  /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
 -- 
-1.8.3.2
+1.9.1
 
diff --git a/package/valgrind/valgrind-0003-Add-replacement-for-a.out.h.patch b/package/valgrind/valgrind-0003-Add-replacement-for-a.out.h.patch
deleted file mode 100644
index f538d3c..0000000
--- a/package/valgrind/valgrind-0003-Add-replacement-for-a.out.h.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From d560106f300dd2547c659511c8668d88a50eb577 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
-Date: Thu, 2 Jan 2014 16:00:49 +0100
-Subject: [PATCH 3/3] Add replacement for <a.out.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Valgrind includes <a.out.h> to get the definition of 'struct
-nlist'. However, while glibc directly defines 'struct nlist' in
-<a.out.h>, uClibc relies on it being defined by kernel headers (i.e
-<a.out.h> simply includes <linux/a.out.h>). This works for most
-architectures, but not for PowerPC, on which the a.out binary format
-has never been supported, and therefore the <linux/a.out.h> kernel
-header does not exist.
-
-One solution would have been to use the <nlist.h> header, but this one
-is only available in glibc, and it also has a slightly different
-definition than the one in <a.out.h>. So, for the time being, the
-easiest solution is to just replace the #include <a.out.h> in Valgrind
-code by a copy/paste of the 'struct nlist' definition.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
----
- coregrind/m_debuginfo/readstabs.c | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/coregrind/m_debuginfo/readstabs.c b/coregrind/m_debuginfo/readstabs.c
-index 70ad319..47f5bc7 100644
---- a/coregrind/m_debuginfo/readstabs.c
-+++ b/coregrind/m_debuginfo/readstabs.c
-@@ -54,7 +54,21 @@
- 
- /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
- #if defined(VGO_linux)
--#  include <a.out.h> /* stabs defns */
-+/* Copied from a.out.h, because it is otherwise not available on
-+   PowerPC/uClibc */
-+struct nlist
-+{
-+  union
-+    {
-+      char *n_name;
-+      struct nlist *n_next;
-+      long n_strx;
-+    } n_un;
-+  unsigned char n_type;
-+  char n_other;
-+  short n_desc;
-+  unsigned long n_value;
-+};
- #elif defined(VGO_darwin)
- #  include <mach-o/nlist.h>
- #  define n_other n_sect
--- 
-1.8.3.2
-
diff --git a/package/valgrind/valgrind-0004-remove-default-mips-flags.patch b/package/valgrind/valgrind-0004-remove-default-mips-flags.patch
deleted file mode 100644
index 14a493b..0000000
--- a/package/valgrind/valgrind-0004-remove-default-mips-flags.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 374743e6faa9d3fc2fba1489e2ead8ea8ebd1f62 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Mon, 31 Mar 2014 12:00:39 +0100
-Subject: [PATCH] mips32/64: Remove default flags -mips32 and -mips64 from Makefile.all.am
-
-During configuration of Valgrind we check does the compiler support
--march=mips32 and -march=mips64. If compiler supports these flags we are
-using them as default flags for mips32 and mips64.
-
-Original upstream patch:
-   https://github.com/svn2github/valgrind/commit/fdf6c5aea4671c3c43c90230510735d215dd1e1c
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- Makefile.all.am |    8 ++++----
- configure.ac    |   40 ++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 44 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.all.am b/Makefile.all.am
-index 1f69802..405f11f 100644
---- a/Makefile.all.am
-+++ b/Makefile.all.am
-@@ -173,12 +173,12 @@ AM_CFLAGS_S390X_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE) -fomit-frame-pointer
- AM_CCASFLAGS_S390X_LINUX  = @FLAG_M64@ -g -mzarch -march=z900
- 
- AM_FLAG_M3264_MIPS32_LINUX = @FLAG_M32@
--AM_CFLAGS_MIPS32_LINUX     = @FLAG_M32@ $(AM_CFLAGS_BASE) -mips32
--AM_CCASFLAGS_MIPS32_LINUX  = @FLAG_M32@ -mips32 -g
-+AM_CFLAGS_MIPS32_LINUX     = @FLAG_M32@ $(AM_CFLAGS_BASE) @FLAG_MIPS32@
-+AM_CCASFLAGS_MIPS32_LINUX  = @FLAG_M32@ -g @FLAG_MIPS32@
- 
- AM_FLAG_M3264_MIPS64_LINUX = @FLAG_M64@
--AM_CFLAGS_MIPS64_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE) -mips64
--AM_CCASFLAGS_MIPS64_LINUX  = @FLAG_M64@ -mips64 -g
-+AM_CFLAGS_MIPS64_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE) @FLAG_MIPS64@
-+AM_CCASFLAGS_MIPS64_LINUX  = @FLAG_M64@ -g @FLAG_MIPS64@
- 
- # Flags for the primary target.  These must be used to build the
- # regtests and performance tests.  In fact, these must be used to
-diff --git a/configure.ac b/configure.ac
-index 229ab98..0e3884c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1450,6 +1450,46 @@ CFLAGS=$safe_CFLAGS
- AC_SUBST(FLAG_M64)
- 
- 
-+# does this compiler support -march=mips32 (mips32 default) ?
-+AC_MSG_CHECKING([if gcc accepts -march=mips32])
-+
-+safe_CFLAGS=$CFLAGS
-+CFLAGS="$CFLAGS -march=mips32"
-+
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
-+  return 0;
-+]])], [
-+FLAG_MIPS32="-march=mips32"
-+AC_MSG_RESULT([yes])
-+], [
-+FLAG_MIPS32=""
-+AC_MSG_RESULT([no])
-+])
-+CFLAGS=$safe_CFLAGS
-+
-+AC_SUBST(FLAG_MIPS32)
-+
-+
-+# does this compiler support -march=mips64 (mips64 default) ?
-+AC_MSG_CHECKING([if gcc accepts -march=mips64])
-+
-+safe_CFLAGS=$CFLAGS
-+CFLAGS="$CFLAGS -march=mips64"
-+
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[
-+  return 0;
-+]])], [
-+FLAG_MIPS64="-march=mips64"
-+AC_MSG_RESULT([yes])
-+], [
-+FLAG_MIPS64=""
-+AC_MSG_RESULT([no])
-+])
-+CFLAGS=$safe_CFLAGS
-+
-+AC_SUBST(FLAG_MIPS64)
-+
-+
- # does this compiler support -mmmx ?
- AC_MSG_CHECKING([if gcc accepts -mmmx])
- 
--- 
-1.7.1
-
diff --git a/package/valgrind/valgrind-0005-glibc-2.19.patch b/package/valgrind/valgrind-0005-glibc-2.19.patch
deleted file mode 100644
index e386a79..0000000
--- a/package/valgrind/valgrind-0005-glibc-2.19.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Enable valgrind for glibc 2.19 targets, and update the error from 2.17
-to 2.19 (which in reality was 2.18).
-Status: upstream.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura valgrind-3.9.0.orig/configure.ac valgrind-3.9.0/configure.ac
---- valgrind-3.9.0.orig/configure.ac	2014-06-18 19:06:39.212571710 -0300
-+++ valgrind-3.9.0/configure.ac	2014-06-18 19:08:37.385557736 -0300
-@@ -918,6 +918,13 @@
- 	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
- 	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
- 	;;
-+     2.19)
-+        AC_MSG_RESULT(2.19 family)
-+	AC_DEFINE([GLIBC_2_19], 1, [Define to 1 if you're using glibc 2.19.x])
-+	DEFAULT_SUPP="glibc-2.X.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.34567-NPTL-helgrind.supp ${DEFAULT_SUPP}"
-+	DEFAULT_SUPP="glibc-2.X-drd.supp ${DEFAULT_SUPP}"
-+	;;
-      darwin)
- 	AC_MSG_RESULT(Darwin)
- 	AC_DEFINE([DARWIN_LIBC], 1, [Define to 1 if you're using Darwin])
-@@ -931,7 +938,7 @@
- 
-      *)
- 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
--	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.17])
-+	AC_MSG_ERROR([Valgrind requires glibc version 2.2 - 2.19])
- 	AC_MSG_ERROR([or Darwin libc])
- 	;;
- esac
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index aee7c9d..24d0290 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.9.0
+VALGRIND_VERSION = 3.10.0
 VALGRIND_SITE    = http://valgrind.org/downloads
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
-- 
1.9.1
