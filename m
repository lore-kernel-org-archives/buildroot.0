From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 23:29:42 +0100
Subject: [Buildroot] [git commit] rpm: switch to version 4.13.0
Message-ID: <20161202080021.E397381E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=701b113747167b5cc57187c4c5f220e4245c08fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch from RPM5's implementation to rpm.org's more active stream [1].

The history of RPM and the common RPM5-fork is covered in an LWN article
"Who maintains RPM?" [2]. Since rpm.org's implementation is used/
maintained on most RPM-based distributions as well as a series of other
minor details (see [3]), the switch is being made.

[1]: http://lists.buildroot.org/pipermail/buildroot/2015-August/137580.html
[2]: https://lwn.net/Articles/196523/
[3]: https://patchwork.ozlabs.org/patch/668151/

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
[Thomas: adjust licensing.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpm/0002-depends-fix.patch           |  19 ---
 package/rpm/0003-exclude-some-tools.patch    |  30 ----
 package/rpm/0004-ignore-shared-mutexes.patch |  12 --
 package/rpm/0005-no-parentdirs.patch         |  14 --
 package/rpm/0006-ordering-fix.patch          |  45 -----
 package/rpm/0007-parentdir-vs-requires.patch |  37 -----
 package/rpm/0008-short-circuit-c99.patch     | 235 ---------------------------
 package/rpm/Config.in                        |  22 +--
 package/rpm/rpm.hash                         |   7 +-
 package/rpm/rpm.mk                           |  89 +++++-----
 10 files changed, 64 insertions(+), 446 deletions(-)

diff --git a/package/rpm/0002-depends-fix.patch b/package/rpm/0002-depends-fix.patch
deleted file mode 100644
index 4a92775..0000000
--- a/package/rpm/0002-depends-fix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Bugfix included upstream
-
-diff -u --new-file --recursive rpm-5.2.0_vanilla/lib/depends.c rpm-5.2.0_depends-fix/lib/depends.c
---- rpm-5.2.0_vanilla/lib/depends.c	2009-05-23 01:23:46.000000000 +0000
-+++ rpm-5.2.0_depends-fix/lib/depends.c	2009-09-22 06:33:37.950783501 +0000
-@@ -2371,11 +2371,11 @@
- 
- 	memset(selected, 0, sizeof(*selected) * ts->orderCount);
- 
--      if ((requires = rpmteDS(p, RPMTAG_REQUIRENAME)) != NULL) {
--
- 	/* Avoid narcisstic relations. */
- 	selected[rpmtsiOc(pi)] = 1;
- 
-+      if ((requires = rpmteDS(p, RPMTAG_REQUIRENAME)) != NULL) {
-+
- 	/* T2. Next "q <- p" relation. */
- 
- 	/* First, do pre-requisites. */
diff --git a/package/rpm/0003-exclude-some-tools.patch b/package/rpm/0003-exclude-some-tools.patch
deleted file mode 100644
index 2cbc7cb..0000000
--- a/package/rpm/0003-exclude-some-tools.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-diff -ru rpm-5.2.0_vanilla/tools/Makefile.am rpm-5.2.0_exclude-some-tools/tools/Makefile.am
---- rpm-5.2.0_vanilla/tools/Makefile.am	2009-06-03 01:24:42.000000000 +0000
-+++ rpm-5.2.0_exclude-some-tools/tools/Makefile.am	2009-12-20 07:47:13.000000000 +0000
-@@ -45,9 +45,7 @@
- bin_PROGRAMS =		rpm2cpio
- 
- pkgbindir =		@USRLIBRPM@/bin
--pkgbin_PROGRAMS =	\
--	rpmcache rpmdigest grep mtree rpmrepo rpmspecdump wget \
--	rpmcmp rpmdeps @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
-+pkgbin_PROGRAMS =	
- dist_man_MANS =		rpmgrep.1
- 
- debugedit_SOURCES =	debugedit.c hashtab.c
-diff -ru rpm-5.2.0_vanilla/tools/Makefile.in rpm-5.2.0_exclude-some-tools/tools/Makefile.in
---- rpm-5.2.0_vanilla/tools/Makefile.in	2009-07-07 21:14:06.000000000 +0000
-+++ rpm-5.2.0_exclude-some-tools/tools/Makefile.in	2009-12-20 07:47:37.000000000 +0000
-@@ -39,11 +39,7 @@
- target_triplet = @target@
- EXTRA_PROGRAMS = rpmkey$(EXEEXT) debugedit$(EXEEXT)
- bin_PROGRAMS = rpm2cpio$(EXEEXT)
--pkgbin_PROGRAMS = rpmcache$(EXEEXT) rpmdigest$(EXEEXT) grep$(EXEEXT) \
--	mtree$(EXEEXT) rpmrepo$(EXEEXT) rpmspecdump$(EXEEXT) \
--	wget$(EXEEXT) rpmcmp$(EXEEXT) rpmdeps$(EXEEXT) \
--	@WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@ $(am__EXEEXT_1) \
--	$(am__EXEEXT_2)
-+pkgbin_PROGRAMS = 
- @WITH_XAR_TRUE at am__append_1 = txar
- @WITH_DB_INTERNAL_TRUE@@WITH_DB_TOOLS_INTEGRATED_TRUE at am__append_2 = db_tool
- @WITH_DB_INTERNAL_TRUE@@WITH_DB_RPC_TRUE@@WITH_DB_TOOLS_INTEGRATED_TRUE@am__append_3 = \
diff --git a/package/rpm/0004-ignore-shared-mutexes.patch b/package/rpm/0004-ignore-shared-mutexes.patch
deleted file mode 100644
index f19d6b6..0000000
--- a/package/rpm/0004-ignore-shared-mutexes.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -ru rpm-5.2.0_vanilla/db/env/env_open.c rpm-5.2.0_test/db/env/env_open.c
---- rpm-5.2.0_vanilla/db/env/env_open.c	2008-05-28 01:23:27.000000000 +0000
-+++ rpm-5.2.0_test/db/env/env_open.c	2009-12-24 14:54:55.000000000 +0000
-@@ -124,7 +124,7 @@
- 		}
- 	}
- 
--#ifdef HAVE_MUTEX_THREAD_ONLY
-+#ifdef NK_HAVE_MUTEX_THREAD_ONLY
- 	/*
- 	 * Currently we support one kind of mutex that is intra-process only,
- 	 * POSIX 1003.1 pthreads, because a variety of systems don't support
diff --git a/package/rpm/0005-no-parentdirs.patch b/package/rpm/0005-no-parentdirs.patch
deleted file mode 100644
index d05c99a..0000000
--- a/package/rpm/0005-no-parentdirs.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Reduce parentdirs we use, parentdirs are used for ordering
-Included upstream
-diff -u --new-file --recursive rpm-5.1.9_vanilla/lib/depends.c rpm-5.1.9_no-parentdirs/lib/depends.c
---- rpm-5.1.9_vanilla/lib/depends.c	2009-04-12 19:46:17.000000000 +0000
-+++ rpm-5.1.9_no-parentdirs/lib/depends.c	2009-06-13 15:21:43.504999639 +0000
-@@ -2257,7 +2257,7 @@
- #define isAuto(_x)	((_x) & _autobits)
- 
- /*@unchecked@*/
--static int slashDepth = 100;	/* #slashes pemitted in parentdir deps. */
-+static int slashDepth = 2;	/* #slashes pemitted in parentdir deps. */
- 
- static int countSlashes(const char * dn)
- 	/*@*/
diff --git a/package/rpm/0006-ordering-fix.patch b/package/rpm/0006-ordering-fix.patch
deleted file mode 100644
index a618e1f..0000000
--- a/package/rpm/0006-ordering-fix.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Included upstream
---- x/lib/depends.c	2009/05/15 13:40:58	1.445
-+++ y/lib/depends.c	2009/08/22 22:12:02	1.446
-@@ -2216,9 +2216,6 @@
- {
-     rpmte q, qprev;
- 
--    /* Mark the package as queued. */
--    rpmteTSI(p)->tsi_queued = 1;
--
-     if ((*rp) == NULL) {	/* 1st element */
- 	/*@-dependenttrans@*/ /* FIX: double indirection */
- 	(*rp) = (*qp) = p;
-@@ -2238,6 +2235,12 @@
- 	/* XXX Insure removed after added. */
- 	if (rpmteType(p) == TR_REMOVED && rpmteType(p) != rpmteType(q))
- 	    continue;
-+
-+	/* XXX Follow all previous generations in the queue. */
-+	if (rpmteTSI(p)->tsi_queued > rpmteTSI(q)->tsi_queued)
-+	    continue;
-+
-+	/* XXX Within a generation, queue behind more "important". */
- 	if (rpmteTSI(q)->tsi_qcnt <= rpmteTSI(p)->tsi_qcnt)
- 	    break;
-     }
-@@ -2521,6 +2524,9 @@
- 
- 	if (rpmteTSI(p)->tsi_count != 0)
- 	    continue;
-+
-+	/* Mark the package as queued. */
-+	rpmteTSI(p)->tsi_queued = orderingCount + 1;
- 	rpmteTSI(p)->tsi_suc = NULL;
- 	addQ(p, &q, &r, prefcolor);
- 	qlen++;
-@@ -2584,6 +2590,8 @@
- 		(void) rpmteSetParent(p, q);
- 		(void) rpmteSetDegree(q, rpmteDegree(q)+1);
- 
-+		/* Mark the package as queued. */
-+		rpmteTSI(p)->tsi_queued = orderingCount + 1;
- 		/* XXX TODO: add control bit. */
- 		rpmteTSI(p)->tsi_suc = NULL;
- /*@-nullstate@*/	/* XXX FIX: rpmteTSI(q)->tsi_suc can be NULL. */
diff --git a/package/rpm/0007-parentdir-vs-requires.patch b/package/rpm/0007-parentdir-vs-requires.patch
deleted file mode 100644
index 309ab25..0000000
--- a/package/rpm/0007-parentdir-vs-requires.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Avoid looking up files or directories that this package provides
-Included upstream
-diff -u --new-file --recursive rpm-5.2.0_vanilla/lib/depends.c rpm-5.2.0_parentdir-vs-requires/lib/depends.c
---- rpm-5.2.0_vanilla/lib/depends.c	2009-05-23 01:23:46.000000000 +0000
-+++ rpm-5.2.0_parentdir-vs-requires/lib/depends.c	2009-09-22 17:00:24.880956271 +0000
-@@ -2095,6 +2095,7 @@
-     rpmtsi qi; rpmte q;
-     tsortInfo tsi;
-     nsType NSType = rpmdsNSType(requires);
-+    const char * N = rpmdsN(requires);
-     fnpyKey key;
-     int teType = rpmteType(p);
-     alKey pkgKey;
-@@ -2128,6 +2129,23 @@
- 	break;
-     }
- 
-+    /* Avoid looking up files/directories that are "owned" by _THIS_ package. */
-+    if (*N == '/') {
-+    rpmfi fi = rpmteFI(p, RPMTAG_BASENAMES);
-+    int bingo = 0;
-+
-+    fi = rpmfiInit(fi, 0);
-+    while (rpmfiNext(fi) >= 0) {
-+        const char * fn = rpmfiFN(fi);
-+        if (strcmp(N, fn))
-+        continue;
-+        bingo = 1;
-+        break;
-+    }
-+    if (bingo)
-+        return 0;
-+    }
-+
-     pkgKey = RPMAL_NOMATCH;
-     key = rpmalSatisfiesDepend(al, requires, &pkgKey);
- 
diff --git a/package/rpm/0008-short-circuit-c99.patch b/package/rpm/0008-short-circuit-c99.patch
deleted file mode 100644
index 5d7b53a..0000000
--- a/package/rpm/0008-short-circuit-c99.patch
+++ /dev/null
@@ -1,235 +0,0 @@
-Buildroot specific
-diff -ru rpm-5.1.9_vanilla/xz/configure rpm-5.1.9_short-circuit-c99/xz/configure
---- rpm-5.1.9_vanilla/xz/configure	2009-04-18 16:47:23.000000000 +0000
-+++ rpm-5.1.9_short-circuit-c99/xz/configure	2009-08-04 08:25:59.000000000 +0000
-@@ -4970,214 +4970,7 @@
-   am__fastdepCC_FALSE=
- fi
- 
--
--   { $as_echo "$as_me:$LINENO: checking for $CC option to accept ISO C99" >&5
--$as_echo_n "checking for $CC option to accept ISO C99... " >&6; }
--if test "${ac_cv_prog_cc_c99+set}" = set; then
--  $as_echo_n "(cached) " >&6
--else
--  ac_cv_prog_cc_c99=no
--ac_save_CC=$CC
--cat >conftest.$ac_ext <<_ACEOF
--/* confdefs.h.  */
--_ACEOF
--cat confdefs.h >>conftest.$ac_ext
--cat >>conftest.$ac_ext <<_ACEOF
--/* end confdefs.h.  */
--#include <stdarg.h>
--#include <stdbool.h>
--#include <stdlib.h>
--#include <wchar.h>
--#include <stdio.h>
--
--// Check varargs macros.  These examples are taken from C99 6.10.3.5.
--#define debug(...) fprintf (stderr, __VA_ARGS__)
--#define showlist(...) puts (#__VA_ARGS__)
--#define report(test,...) ((test) ? puts (#test) : printf (__VA_ARGS__))
--static void
--test_varargs_macros (void)
--{
--  int x = 1234;
--  int y = 5678;
--  debug ("Flag");
--  debug ("X = %d\n", x);
--  showlist (The first, second, and third items.);
--  report (x>y, "x is %d but y is %d", x, y);
--}
--
--// Check long long types.
--#define BIG64 18446744073709551615ull
--#define BIG32 4294967295ul
--#define BIG_OK (BIG64 / BIG32 == 4294967297ull && BIG64 % BIG32 == 0)
--#if !BIG_OK
--  your preprocessor is broken;
--#endif
--#if BIG_OK
--#else
--  your preprocessor is broken;
--#endif
--static long long int bignum = -9223372036854775807LL;
--static unsigned long long int ubignum = BIG64;
--
--struct incomplete_array
--{
--  int datasize;
--  double data[];
--};
--
--struct named_init {
--  int number;
--  const wchar_t *name;
--  double average;
--};
--
--typedef const char *ccp;
--
--static inline int
--test_restrict (ccp restrict text)
--{
--  // See if C++-style comments work.
--  // Iterate through items via the restricted pointer.
--  // Also check for declarations in for loops.
--  for (unsigned int i = 0; *(text+i) != '\0'; ++i)
--    continue;
--  return 0;
--}
--
--// Check varargs and va_copy.
--static void
--test_varargs (const char *format, ...)
--{
--  va_list args;
--  va_start (args, format);
--  va_list args_copy;
--  va_copy (args_copy, args);
--
--  const char *str;
--  int number;
--  float fnumber;
--
--  while (*format)
--    {
--      switch (*format++)
--	{
--	case 's': // string
--	  str = va_arg (args_copy, const char *);
--	  break;
--	case 'd': // int
--	  number = va_arg (args_copy, int);
--	  break;
--	case 'f': // float
--	  fnumber = va_arg (args_copy, double);
--	  break;
--	default:
--	  break;
--	}
--    }
--  va_end (args_copy);
--  va_end (args);
--}
--
--int
--main ()
--{
--
--  // Check bool.
--  _Bool success = false;
--
--  // Check restrict.
--  if (test_restrict ("String literal") == 0)
--    success = true;
--  char *restrict newvar = "Another string";
--
--  // Check varargs.
--  test_varargs ("s, d' f .", "string", 65, 34.234);
--  test_varargs_macros ();
--
--  // Check flexible array members.
--  struct incomplete_array *ia =
--    malloc (sizeof (struct incomplete_array) + (sizeof (double) * 10));
--  ia->datasize = 10;
--  for (int i = 0; i < ia->datasize; ++i)
--    ia->data[i] = i * 1.234;
--
--  // Check named initializers.
--  struct named_init ni = {
--    .number = 34,
--    .name = L"Test wide string",
--    .average = 543.34343,
--  };
--
--  ni.number = 58;
--
--  int dynamic_array[ni.number];
--  dynamic_array[ni.number - 1] = 543;
--
--  // work around unused variable warnings
--  return (!success || bignum == 0LL || ubignum == 0uLL || newvar[0] == 'x'
--	  || dynamic_array[ni.number - 1] != 543);
--
--  ;
--  return 0;
--}
--_ACEOF
--for ac_arg in '' -std=gnu99 -std=c99 -c99 -AC99 -xc99=all -qlanglvl=extc99
--do
--  CC="$ac_save_CC $ac_arg"
--  rm -f conftest.$ac_objext
--if { (ac_try="$ac_compile"
--case "(($ac_try" in
--  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
--  *) ac_try_echo=$ac_try;;
--esac
--eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
--$as_echo "$ac_try_echo") >&5
--  (eval "$ac_compile") 2>conftest.er1
--  ac_status=$?
--  grep -v '^ *+' conftest.er1 >conftest.err
--  rm -f conftest.er1
--  cat conftest.err >&5
--  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
--  (exit $ac_status); } && {
--	 test -z "$ac_c_werror_flag" ||
--	 test ! -s conftest.err
--       } && test -s conftest.$ac_objext; then
--  ac_cv_prog_cc_c99=$ac_arg
--else
--  $as_echo "$as_me: failed program was:" >&5
--sed 's/^/| /' conftest.$ac_ext >&5
--
--
--fi
--
--rm -f core conftest.err conftest.$ac_objext
--  test "x$ac_cv_prog_cc_c99" != "xno" && break
--done
--rm -f conftest.$ac_ext
--CC=$ac_save_CC
--
--fi
--# AC_CACHE_VAL
--case "x$ac_cv_prog_cc_c99" in
--  x)
--    { $as_echo "$as_me:$LINENO: result: none needed" >&5
--$as_echo "none needed" >&6; } ;;
--  xno)
--    { $as_echo "$as_me:$LINENO: result: unsupported" >&5
--$as_echo "unsupported" >&6; } ;;
--  *)
--    CC="$CC $ac_cv_prog_cc_c99"
--    { $as_echo "$as_me:$LINENO: result: $ac_cv_prog_cc_c99" >&5
--$as_echo "$ac_cv_prog_cc_c99" >&6; } ;;
--esac
--
--
--
--if test x$ac_cv_prog_cc_c99 = xno ; then
--	{ { $as_echo "$as_me:$LINENO: error: No C99 compiler was found." >&5
--$as_echo "$as_me: error: No C99 compiler was found." >&2;}
--   { (exit 1); exit 1; }; }
--fi
-+CC="$CC -std=c99"
- 
- if test "x$CC" != xcc; then
-   { $as_echo "$as_me:$LINENO: checking whether $CC and cc understand -c and -o together" >&5
-diff -ru rpm-5.1.9_vanilla/xz/configure.ac rpm-5.1.9_short-circuit-c99/xz/configure.ac
---- rpm-5.1.9_vanilla/xz/configure.ac	2009-02-16 17:07:46.000000000 +0000
-+++ rpm-5.1.9_short-circuit-c99/xz/configure.ac	2009-08-04 08:25:28.000000000 +0000
-@@ -402,10 +402,7 @@
- AM_INIT_AUTOMAKE([1.10 foreign tar-v7 filename-length-max=99])
- AC_PROG_LN_S
- 
--AC_PROG_CC_C99
--if test x$ac_cv_prog_cc_c99 = xno ; then
--	AC_MSG_ERROR([No C99 compiler was found.])
--fi
-+CC="$CC -std=c99"
- 
- AM_PROG_CC_C_O
- AM_PROG_AS
diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 2be646a..8b7705d 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,28 +1,20 @@
 comment "rpm needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-
-comment "rpm needs a toolchain w/ gcc >= 5"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_RPM
 	bool "rpm"
-	# triggers internal compiler error
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_sh
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	select BR2_PACKAGE_BEECRYPT
+	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_FILE
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_NEON
-	select BR2_PACKAGE_NEON_SSL
-	select BR2_PACKAGE_NEON_XML
-	select BR2_PACKAGE_NEON_ZLIB
-	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
 	help
-	  The RPM package management system.
+	  The RPM Package Manager (RPM).
 
-	  http://rpm5.org
+	  http://www.rpm.org/
diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index 0665746..c9c4d65 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,2 +1,5 @@
-# Locally calculated
-sha256	34a959c0ed670cadcdc52c6025e822fac6f5d1015e3b75123f53ebe53b923e98	rpm-5.2.0.tar.gz
+# From http://rpm.org/wiki/Releases/4.13.0
+sha1	c6ce4f879ca6a75340921093105e5ef9d33381d3	rpm-4.13.0.tar.bz2
+# Locally computed
+sha256	a3e5568d721737a24141737e6036bb39ba9dfbeaa03fa4a51cc7881a243e0c5d b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch
+sha256	7ab0e08e143bb2d43d5b0553ee22ea34da15a611c597860a6110745467d20fa8 c810a0aca3f1148d2072d44b91b8cc9caeb4cf19.patch
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 7f346b2..accb625 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,61 +4,76 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 5.2
-RPM_VERSION = $(RPM_VERSION_MAJOR).0
-RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)
-RPM_DEPENDENCIES = host-pkgconf zlib beecrypt neon popt openssl
-RPM_LICENSE = LGPLv2.1
-RPM_LICENSE_FILES = COPYING.LIB
+RPM_VERSION = 4.13.0
+RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
+RPM_SITE = https://github.com/rpm-software-management/rpm/releases/download/rpm-$(RPM_VERSION)-release
+RPM_DEPENDENCIES = host-pkgconf berkeleydb file popt zlib
+RPM_LICENSE = GPLv2 or LGPLv2 (library only)
+RPM_LICENSE_FILES = COPYING
+RPM_PATCH = \
+	https://github.com/rpm-software-management/rpm/commit/b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch \
+	https://github.com/rpm-software-management/rpm/commit/c810a0aca3f1148d2072d44b91b8cc9caeb4cf19.patch
 
-RPM_CONF_ENV = \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
-	ac_cv_va_copy=yes
+# b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch
+# c810a0aca3f1148d2072d44b91b8cc9caeb4cf19.patch
+RPM_AUTORECONF = YES
 
 RPM_CONF_OPTS = \
-	--disable-build-versionscript \
+	--disable-python \
 	--disable-rpath \
-	--without-selinux \
-	--without-python \
-	--without-perl \
-	--with-openssl=external \
-	--with-zlib=external \
-	--with-libbeecrypt=$(STAGING_DIR) \
-	--with-popt=external
+	--with-external-db \
+	--with-gnu-ld \
+	--without-cap \
+	--without-hackingdocs \
+	--without-lua
 
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-RPM_DEPENDENCIES += gettext
+ifeq ($(BR2_PACKAGE_ACL),y)
+RPM_DEPENDENCIES += acl
+RPM_CONF_OPTS += --with-acl
+else
+RPM_CONF_OPTS += --without-acl
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-RPM_DEPENDENCIES += pcre
-RPM_CONF_OPTS += --with-pcre=external
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+RPM_DEPENDENCIES += libnss
+RPM_CONF_OPTS += --without-beecrypt
+RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/nss -I$(STAGING_DIR)/usr/include/nspr
 else
-RPM_CONF_OPTS += --with-pcre=none
+RPM_DEPENDENCIES += beecrypt
+RPM_CONF_OPTS += --with-beecrypt
+RPM_CFLAGS += -I$(STAGING_DIR)/usr/include/beecrypt
 endif
 
-ifeq ($(BR2_PACKAGE_FILE),y)
-RPM_DEPENDENCIES += file
-RPM_CONF_OPTS += --with-file=external
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+RPM_DEPENDENCIES += gettext
+RPM_CONF_OPTS += --with-libintl-prefix=$(STAGING_DIR)/usr
 else
-RPM_CONF_OPTS += --with-file=none
+RPM_CONF_OPTS += --without-libintl-prefix
 endif
 
-# xz payload support needs a toolchain w/ C++
-ifeq ($(BR2_PACKAGE_XZ)$(BR2_INSTALL_LIBSTDCPP),yy)
-RPM_DEPENDENCIES += xz
-RPM_CONF_OPTS += --with-xz=external
+ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
+RPM_DEPENDENCIES += libarchive
+RPM_CONF_OPTS += --with-archive
 else
-RPM_CONF_OPTS += --with-xz=none
+RPM_CONF_OPTS += --without-archive
 endif
 
-ifeq ($(BR2_PACKAGE_BZIP2),y)
-RPM_CONF_OPTS += --with-bzip2
-RPM_DEPENDENCIES += bzip2
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+RPM_DEPENDENCIES += libselinux
+RPM_CONF_OPTS += --with-selinux
+else
+RPM_CONF_OPTS += --without-selinux
 endif
 
-RPM_MAKE = $(MAKE1)
+# RPM, when using NLS, requires GNU gettext's _nl_msg_cat_cntr, which is not
+# provided in musl.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+RPM_CONF_OPTS += --disable-nls
+endif
 
-RPM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) program_transform_name= install
+# ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
+RPM_CONF_ENV = \
+	ac_cv_prog_cc_c99='-std=gnu99' \
+	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)"
 
 $(eval $(autotools-package))
