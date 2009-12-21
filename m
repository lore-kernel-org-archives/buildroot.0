From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 21 Dec 2009 07:21:05 +0000
Subject: [Buildroot] [PATCH 1/1] Update rpm
In-Reply-To: <cover.1261380062.git.nkukard@lbsd.net>
References: <cover.1261380062.git.nkukard@lbsd.net>
Message-ID: <4e1837c9c17e549a134a69f9bf8829797d879bb4.1261380062.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
---
 package/rpm/Config.in                             |   26 ++-
 package/rpm/rpm-5.1.6_exclude-some-tools.patch    |   12 -
 package/rpm/rpm-5.1.6_magic-file-fix.patch        |   40 ----
 package/rpm/rpm-5.2.0_depends-fix.patch           |   19 ++
 package/rpm/rpm-5.2.0_exclude-some-tools.patch    |   30 +++
 package/rpm/rpm-5.2.0_no-parentdirs.patch         |   14 ++
 package/rpm/rpm-5.2.0_ordering-fix.patch          |   45 ++++
 package/rpm/rpm-5.2.0_parentdir-vs-requires.patch |   37 ++++
 package/rpm/rpm-5.2.0_short-circuit-c99.patch     |  235 +++++++++++++++++++++
 package/rpm/rpm.mk                                |   21 ++-
 10 files changed, 416 insertions(+), 63 deletions(-)
 delete mode 100755 package/rpm/rpm-5.1.6_exclude-some-tools.patch
 delete mode 100755 package/rpm/rpm-5.1.6_magic-file-fix.patch
 create mode 100644 package/rpm/rpm-5.2.0_depends-fix.patch
 create mode 100644 package/rpm/rpm-5.2.0_exclude-some-tools.patch
 create mode 100644 package/rpm/rpm-5.2.0_no-parentdirs.patch
 create mode 100644 package/rpm/rpm-5.2.0_ordering-fix.patch
 create mode 100644 package/rpm/rpm-5.2.0_parentdir-vs-requires.patch
 create mode 100644 package/rpm/rpm-5.2.0_short-circuit-c99.patch

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index f4f7f90..d50a642 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,14 +1,32 @@
 config BR2_PACKAGE_RPM
 	bool "rpm"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_ZLIB
-	select BR2_PACKAGE_NEON_EXPAT 	if BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_NEON_LIBXML2	if BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NEON_EXPAT if BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_NEON_LIBXML2 if BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_NEON_SSL
 	help
 	  The RPM package management system.
 
 	  http://rpm5.org
+
+config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
+	bool "support for bzip2 payloads"
+	depends on BR2_PACKAGE_RPM
+	select BR2_PACKAGE_BZIP2
+	help
+	  Support for bzip2 payloads in RPM.
+
+config BR2_PACKAGE_RPM_XZ_PAYLOADS
+	bool "support for xz payloads"
+	depends on BR2_PACKAGE_RPM
+	depends on BR2_GCC_CROSS_CXX
+	help
+	  Support for xz payloads in RPM.
+
+comment "xz payload support requires a toolchain with c++ support"
+	depends on !BR2_GCC_CROSS_CXX
+
+
diff --git a/package/rpm/rpm-5.1.6_exclude-some-tools.patch b/package/rpm/rpm-5.1.6_exclude-some-tools.patch
deleted file mode 100755
index 04f1ccf..0000000
--- a/package/rpm/rpm-5.1.6_exclude-some-tools.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -u --new-file --recursive rpm-5.1.6_vanilla/tools/Makefile.am rpm-5.1.6_no-noncompiling-tools/tools/Makefile.am
---- rpm-5.1.6_vanilla/tools/Makefile.am	2008-06-15 08:57:25.000000000 +0000
-+++ rpm-5.1.6_no-noncompiling-tools/tools/Makefile.am	2008-11-29 19:37:55.000000000 +0000
-@@ -39,7 +39,7 @@
- 	$(top_builddir)/build/librpmbuild.la \
- 	$(RPM_LDADD_COMMON)
- 
--bin_PROGRAMS =		rpm2cpio rpmcache rpmdigest rpmmtree rpmrepo
-+bin_PROGRAMS =		rpm2cpio 
- 
- pkglibdir =		@USRLIBRPM@
- pkglib_PROGRAMS =	rpmcmp rpmdeps @WITH_LIBELF_DEBUGEDIT@
diff --git a/package/rpm/rpm-5.1.6_magic-file-fix.patch b/package/rpm/rpm-5.1.6_magic-file-fix.patch
deleted file mode 100755
index da09445..0000000
--- a/package/rpm/rpm-5.1.6_magic-file-fix.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-diff -u --new-file --recursive rpm-5.1.6_vanilla/file/magic/Magdir/audio rpm-5.1.6_magic-file-fix/file/magic/Magdir/audio
---- rpm-5.1.6_vanilla/file/magic/Magdir/audio	2007-05-31 02:19:30.000000000 +0000
-+++ rpm-5.1.6_magic-file-fix/file/magic/Magdir/audio	2008-11-29 15:45:32.000000000 +0000
-@@ -208,7 +208,7 @@
- >22	belong&0x00ffffff	x		%d Hz,
- >18	beshort		=0			no loop,
- >18	beshort		=-1			loop,
-->21	ubyte		<=127			note %d,
-+>21	ubyte		<128			note %d,
- >22	byte		=0			replay 5.485 KHz
- >22	byte		=1			replay 8.084 KHz
- >22	byte		=2			replay 10.971 Khz
-diff -u --new-file --recursive rpm-5.1.6_vanilla/file/magic/Magdir/freebsd rpm-5.1.6_magic-file-fix/file/magic/Magdir/freebsd
---- rpm-5.1.6_vanilla/file/magic/Magdir/freebsd	2003-04-15 16:58:35.000000000 +0000
-+++ rpm-5.1.6_magic-file-fix/file/magic/Magdir/freebsd	2008-11-29 15:45:32.000000000 +0000
-@@ -128,10 +128,10 @@
- # What are you laughing about?
- 0	lelong			011421044151	ld.so hints file (Little Endian
- >4	lelong			>0		\b, version %d)
-->4	belong			<=0		\b)
-+>4	belong			<1		\b)
- 0	belong			011421044151	ld.so hints file (Big Endian
- >4	belong			>0		\b, version %d)
-->4	belong			<=0		\b)
-+>4	belong			<1		\b)
- 
- #
- # Files generated by FreeBSD scrshot(1)/vidcontrol(1) utilities
-diff -u --new-file --recursive rpm-5.1.6_vanilla/file/magic/Magdir/linux rpm-5.1.6_magic-file-fix/file/magic/Magdir/linux
---- rpm-5.1.6_vanilla/file/magic/Magdir/linux	2007-05-31 02:19:30.000000000 +0000
-+++ rpm-5.1.6_magic-file-fix/file/magic/Magdir/linux	2008-11-29 15:45:32.000000000 +0000
-@@ -84,7 +84,7 @@
- # Linux kernel boot images (i386 arch) (Wolfram Kleff)
- 514	string		HdrS		Linux kernel
- >510	leshort		0xAA55		x86 boot executable
-->>518	leshort		>=0x200
-+>>518	leshort		>0x1ff
- >>529	byte		0		zImage,
- >>>529	byte		1		bzImage,
- >>>(526.s+0x200) string	>\0		version %s,
diff --git a/package/rpm/rpm-5.2.0_depends-fix.patch b/package/rpm/rpm-5.2.0_depends-fix.patch
new file mode 100644
index 0000000..4a92775
--- /dev/null
+++ b/package/rpm/rpm-5.2.0_depends-fix.patch
@@ -0,0 +1,19 @@
+Bugfix included upstream
+
+diff -u --new-file --recursive rpm-5.2.0_vanilla/lib/depends.c rpm-5.2.0_depends-fix/lib/depends.c
+--- rpm-5.2.0_vanilla/lib/depends.c	2009-05-23 01:23:46.000000000 +0000
++++ rpm-5.2.0_depends-fix/lib/depends.c	2009-09-22 06:33:37.950783501 +0000
+@@ -2371,11 +2371,11 @@
+ 
+ 	memset(selected, 0, sizeof(*selected) * ts->orderCount);
+ 
+-      if ((requires = rpmteDS(p, RPMTAG_REQUIRENAME)) != NULL) {
+-
+ 	/* Avoid narcisstic relations. */
+ 	selected[rpmtsiOc(pi)] = 1;
+ 
++      if ((requires = rpmteDS(p, RPMTAG_REQUIRENAME)) != NULL) {
++
+ 	/* T2. Next "q <- p" relation. */
+ 
+ 	/* First, do pre-requisites. */
diff --git a/package/rpm/rpm-5.2.0_exclude-some-tools.patch b/package/rpm/rpm-5.2.0_exclude-some-tools.patch
new file mode 100644
index 0000000..2cbc7cb
--- /dev/null
+++ b/package/rpm/rpm-5.2.0_exclude-some-tools.patch
@@ -0,0 +1,30 @@
+diff -ru rpm-5.2.0_vanilla/tools/Makefile.am rpm-5.2.0_exclude-some-tools/tools/Makefile.am
+--- rpm-5.2.0_vanilla/tools/Makefile.am	2009-06-03 01:24:42.000000000 +0000
++++ rpm-5.2.0_exclude-some-tools/tools/Makefile.am	2009-12-20 07:47:13.000000000 +0000
+@@ -45,9 +45,7 @@
+ bin_PROGRAMS =		rpm2cpio
+ 
+ pkgbindir =		@USRLIBRPM@/bin
+-pkgbin_PROGRAMS =	\
+-	rpmcache rpmdigest grep mtree rpmrepo rpmspecdump wget \
+-	rpmcmp rpmdeps @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
++pkgbin_PROGRAMS =	
+ dist_man_MANS =		rpmgrep.1
+ 
+ debugedit_SOURCES =	debugedit.c hashtab.c
+diff -ru rpm-5.2.0_vanilla/tools/Makefile.in rpm-5.2.0_exclude-some-tools/tools/Makefile.in
+--- rpm-5.2.0_vanilla/tools/Makefile.in	2009-07-07 21:14:06.000000000 +0000
++++ rpm-5.2.0_exclude-some-tools/tools/Makefile.in	2009-12-20 07:47:37.000000000 +0000
+@@ -39,11 +39,7 @@
+ target_triplet = @target@
+ EXTRA_PROGRAMS = rpmkey$(EXEEXT) debugedit$(EXEEXT)
+ bin_PROGRAMS = rpm2cpio$(EXEEXT)
+-pkgbin_PROGRAMS = rpmcache$(EXEEXT) rpmdigest$(EXEEXT) grep$(EXEEXT) \
+-	mtree$(EXEEXT) rpmrepo$(EXEEXT) rpmspecdump$(EXEEXT) \
+-	wget$(EXEEXT) rpmcmp$(EXEEXT) rpmdeps$(EXEEXT) \
+-	@WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@ $(am__EXEEXT_1) \
+-	$(am__EXEEXT_2)
++pkgbin_PROGRAMS = 
+ @WITH_XAR_TRUE at am__append_1 = txar
+ @WITH_DB_INTERNAL_TRUE@@WITH_DB_TOOLS_INTEGRATED_TRUE at am__append_2 = db_tool
+ @WITH_DB_INTERNAL_TRUE@@WITH_DB_RPC_TRUE@@WITH_DB_TOOLS_INTEGRATED_TRUE@am__append_3 = \
diff --git a/package/rpm/rpm-5.2.0_no-parentdirs.patch b/package/rpm/rpm-5.2.0_no-parentdirs.patch
new file mode 100644
index 0000000..d05c99a
--- /dev/null
+++ b/package/rpm/rpm-5.2.0_no-parentdirs.patch
@@ -0,0 +1,14 @@
+Reduce parentdirs we use, parentdirs are used for ordering
+Included upstream
+diff -u --new-file --recursive rpm-5.1.9_vanilla/lib/depends.c rpm-5.1.9_no-parentdirs/lib/depends.c
+--- rpm-5.1.9_vanilla/lib/depends.c	2009-04-12 19:46:17.000000000 +0000
++++ rpm-5.1.9_no-parentdirs/lib/depends.c	2009-06-13 15:21:43.504999639 +0000
+@@ -2257,7 +2257,7 @@
+ #define isAuto(_x)	((_x) & _autobits)
+ 
+ /*@unchecked@*/
+-static int slashDepth = 100;	/* #slashes pemitted in parentdir deps. */
++static int slashDepth = 2;	/* #slashes pemitted in parentdir deps. */
+ 
+ static int countSlashes(const char * dn)
+ 	/*@*/
diff --git a/package/rpm/rpm-5.2.0_ordering-fix.patch b/package/rpm/rpm-5.2.0_ordering-fix.patch
new file mode 100644
index 0000000..a618e1f
--- /dev/null
+++ b/package/rpm/rpm-5.2.0_ordering-fix.patch
@@ -0,0 +1,45 @@
+Included upstream
+--- x/lib/depends.c	2009/05/15 13:40:58	1.445
++++ y/lib/depends.c	2009/08/22 22:12:02	1.446
+@@ -2216,9 +2216,6 @@
+ {
+     rpmte q, qprev;
+ 
+-    /* Mark the package as queued. */
+-    rpmteTSI(p)->tsi_queued = 1;
+-
+     if ((*rp) == NULL) {	/* 1st element */
+ 	/*@-dependenttrans@*/ /* FIX: double indirection */
+ 	(*rp) = (*qp) = p;
+@@ -2238,6 +2235,12 @@
+ 	/* XXX Insure removed after added. */
+ 	if (rpmteType(p) == TR_REMOVED && rpmteType(p) != rpmteType(q))
+ 	    continue;
++
++	/* XXX Follow all previous generations in the queue. */
++	if (rpmteTSI(p)->tsi_queued > rpmteTSI(q)->tsi_queued)
++	    continue;
++
++	/* XXX Within a generation, queue behind more "important". */
+ 	if (rpmteTSI(q)->tsi_qcnt <= rpmteTSI(p)->tsi_qcnt)
+ 	    break;
+     }
+@@ -2521,6 +2524,9 @@
+ 
+ 	if (rpmteTSI(p)->tsi_count != 0)
+ 	    continue;
++
++	/* Mark the package as queued. */
++	rpmteTSI(p)->tsi_queued = orderingCount + 1;
+ 	rpmteTSI(p)->tsi_suc = NULL;
+ 	addQ(p, &q, &r, prefcolor);
+ 	qlen++;
+@@ -2584,6 +2590,8 @@
+ 		(void) rpmteSetParent(p, q);
+ 		(void) rpmteSetDegree(q, rpmteDegree(q)+1);
+ 
++		/* Mark the package as queued. */
++		rpmteTSI(p)->tsi_queued = orderingCount + 1;
+ 		/* XXX TODO: add control bit. */
+ 		rpmteTSI(p)->tsi_suc = NULL;
+ /*@-nullstate@*/	/* XXX FIX: rpmteTSI(q)->tsi_suc can be NULL. */
diff --git a/package/rpm/rpm-5.2.0_parentdir-vs-requires.patch b/package/rpm/rpm-5.2.0_parentdir-vs-requires.patch
new file mode 100644
index 0000000..309ab25
--- /dev/null
+++ b/package/rpm/rpm-5.2.0_parentdir-vs-requires.patch
@@ -0,0 +1,37 @@
+Avoid looking up files or directories that this package provides
+Included upstream
+diff -u --new-file --recursive rpm-5.2.0_vanilla/lib/depends.c rpm-5.2.0_parentdir-vs-requires/lib/depends.c
+--- rpm-5.2.0_vanilla/lib/depends.c	2009-05-23 01:23:46.000000000 +0000
++++ rpm-5.2.0_parentdir-vs-requires/lib/depends.c	2009-09-22 17:00:24.880956271 +0000
+@@ -2095,6 +2095,7 @@
+     rpmtsi qi; rpmte q;
+     tsortInfo tsi;
+     nsType NSType = rpmdsNSType(requires);
++    const char * N = rpmdsN(requires);
+     fnpyKey key;
+     int teType = rpmteType(p);
+     alKey pkgKey;
+@@ -2128,6 +2129,23 @@
+ 	break;
+     }
+ 
++    /* Avoid looking up files/directories that are "owned" by _THIS_ package. */
++    if (*N == '/') {
++    rpmfi fi = rpmteFI(p, RPMTAG_BASENAMES);
++    int bingo = 0;
++
++    fi = rpmfiInit(fi, 0);
++    while (rpmfiNext(fi) >= 0) {
++        const char * fn = rpmfiFN(fi);
++        if (strcmp(N, fn))
++        continue;
++        bingo = 1;
++        break;
++    }
++    if (bingo)
++        return 0;
++    }
++
+     pkgKey = RPMAL_NOMATCH;
+     key = rpmalSatisfiesDepend(al, requires, &pkgKey);
+ 
diff --git a/package/rpm/rpm-5.2.0_short-circuit-c99.patch b/package/rpm/rpm-5.2.0_short-circuit-c99.patch
new file mode 100644
index 0000000..5d7b53a
--- /dev/null
+++ b/package/rpm/rpm-5.2.0_short-circuit-c99.patch
@@ -0,0 +1,235 @@
+Buildroot specific
+diff -ru rpm-5.1.9_vanilla/xz/configure rpm-5.1.9_short-circuit-c99/xz/configure
+--- rpm-5.1.9_vanilla/xz/configure	2009-04-18 16:47:23.000000000 +0000
++++ rpm-5.1.9_short-circuit-c99/xz/configure	2009-08-04 08:25:59.000000000 +0000
+@@ -4970,214 +4970,7 @@
+   am__fastdepCC_FALSE=
+ fi
+ 
+-
+-   { $as_echo "$as_me:$LINENO: checking for $CC option to accept ISO C99" >&5
+-$as_echo_n "checking for $CC option to accept ISO C99... " >&6; }
+-if test "${ac_cv_prog_cc_c99+set}" = set; then
+-  $as_echo_n "(cached) " >&6
+-else
+-  ac_cv_prog_cc_c99=no
+-ac_save_CC=$CC
+-cat >conftest.$ac_ext <<_ACEOF
+-/* confdefs.h.  */
+-_ACEOF
+-cat confdefs.h >>conftest.$ac_ext
+-cat >>conftest.$ac_ext <<_ACEOF
+-/* end confdefs.h.  */
+-#include <stdarg.h>
+-#include <stdbool.h>
+-#include <stdlib.h>
+-#include <wchar.h>
+-#include <stdio.h>
+-
+-// Check varargs macros.  These examples are taken from C99 6.10.3.5.
+-#define debug(...) fprintf (stderr, __VA_ARGS__)
+-#define showlist(...) puts (#__VA_ARGS__)
+-#define report(test,...) ((test) ? puts (#test) : printf (__VA_ARGS__))
+-static void
+-test_varargs_macros (void)
+-{
+-  int x = 1234;
+-  int y = 5678;
+-  debug ("Flag");
+-  debug ("X = %d\n", x);
+-  showlist (The first, second, and third items.);
+-  report (x>y, "x is %d but y is %d", x, y);
+-}
+-
+-// Check long long types.
+-#define BIG64 18446744073709551615ull
+-#define BIG32 4294967295ul
+-#define BIG_OK (BIG64 / BIG32 == 4294967297ull && BIG64 % BIG32 == 0)
+-#if !BIG_OK
+-  your preprocessor is broken;
+-#endif
+-#if BIG_OK
+-#else
+-  your preprocessor is broken;
+-#endif
+-static long long int bignum = -9223372036854775807LL;
+-static unsigned long long int ubignum = BIG64;
+-
+-struct incomplete_array
+-{
+-  int datasize;
+-  double data[];
+-};
+-
+-struct named_init {
+-  int number;
+-  const wchar_t *name;
+-  double average;
+-};
+-
+-typedef const char *ccp;
+-
+-static inline int
+-test_restrict (ccp restrict text)
+-{
+-  // See if C++-style comments work.
+-  // Iterate through items via the restricted pointer.
+-  // Also check for declarations in for loops.
+-  for (unsigned int i = 0; *(text+i) != '\0'; ++i)
+-    continue;
+-  return 0;
+-}
+-
+-// Check varargs and va_copy.
+-static void
+-test_varargs (const char *format, ...)
+-{
+-  va_list args;
+-  va_start (args, format);
+-  va_list args_copy;
+-  va_copy (args_copy, args);
+-
+-  const char *str;
+-  int number;
+-  float fnumber;
+-
+-  while (*format)
+-    {
+-      switch (*format++)
+-	{
+-	case 's': // string
+-	  str = va_arg (args_copy, const char *);
+-	  break;
+-	case 'd': // int
+-	  number = va_arg (args_copy, int);
+-	  break;
+-	case 'f': // float
+-	  fnumber = va_arg (args_copy, double);
+-	  break;
+-	default:
+-	  break;
+-	}
+-    }
+-  va_end (args_copy);
+-  va_end (args);
+-}
+-
+-int
+-main ()
+-{
+-
+-  // Check bool.
+-  _Bool success = false;
+-
+-  // Check restrict.
+-  if (test_restrict ("String literal") == 0)
+-    success = true;
+-  char *restrict newvar = "Another string";
+-
+-  // Check varargs.
+-  test_varargs ("s, d' f .", "string", 65, 34.234);
+-  test_varargs_macros ();
+-
+-  // Check flexible array members.
+-  struct incomplete_array *ia =
+-    malloc (sizeof (struct incomplete_array) + (sizeof (double) * 10));
+-  ia->datasize = 10;
+-  for (int i = 0; i < ia->datasize; ++i)
+-    ia->data[i] = i * 1.234;
+-
+-  // Check named initializers.
+-  struct named_init ni = {
+-    .number = 34,
+-    .name = L"Test wide string",
+-    .average = 543.34343,
+-  };
+-
+-  ni.number = 58;
+-
+-  int dynamic_array[ni.number];
+-  dynamic_array[ni.number - 1] = 543;
+-
+-  // work around unused variable warnings
+-  return (!success || bignum == 0LL || ubignum == 0uLL || newvar[0] == 'x'
+-	  || dynamic_array[ni.number - 1] != 543);
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-for ac_arg in '' -std=gnu99 -std=c99 -c99 -AC99 -xc99=all -qlanglvl=extc99
+-do
+-  CC="$ac_save_CC $ac_arg"
+-  rm -f conftest.$ac_objext
+-if { (ac_try="$ac_compile"
+-case "(($ac_try" in
+-  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
+-  *) ac_try_echo=$ac_try;;
+-esac
+-eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
+-$as_echo "$ac_try_echo") >&5
+-  (eval "$ac_compile") 2>conftest.er1
+-  ac_status=$?
+-  grep -v '^ *+' conftest.er1 >conftest.err
+-  rm -f conftest.er1
+-  cat conftest.err >&5
+-  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+-  (exit $ac_status); } && {
+-	 test -z "$ac_c_werror_flag" ||
+-	 test ! -s conftest.err
+-       } && test -s conftest.$ac_objext; then
+-  ac_cv_prog_cc_c99=$ac_arg
+-else
+-  $as_echo "$as_me: failed program was:" >&5
+-sed 's/^/| /' conftest.$ac_ext >&5
+-
+-
+-fi
+-
+-rm -f core conftest.err conftest.$ac_objext
+-  test "x$ac_cv_prog_cc_c99" != "xno" && break
+-done
+-rm -f conftest.$ac_ext
+-CC=$ac_save_CC
+-
+-fi
+-# AC_CACHE_VAL
+-case "x$ac_cv_prog_cc_c99" in
+-  x)
+-    { $as_echo "$as_me:$LINENO: result: none needed" >&5
+-$as_echo "none needed" >&6; } ;;
+-  xno)
+-    { $as_echo "$as_me:$LINENO: result: unsupported" >&5
+-$as_echo "unsupported" >&6; } ;;
+-  *)
+-    CC="$CC $ac_cv_prog_cc_c99"
+-    { $as_echo "$as_me:$LINENO: result: $ac_cv_prog_cc_c99" >&5
+-$as_echo "$ac_cv_prog_cc_c99" >&6; } ;;
+-esac
+-
+-
+-
+-if test x$ac_cv_prog_cc_c99 = xno ; then
+-	{ { $as_echo "$as_me:$LINENO: error: No C99 compiler was found." >&5
+-$as_echo "$as_me: error: No C99 compiler was found." >&2;}
+-   { (exit 1); exit 1; }; }
+-fi
++CC="$CC -std=c99"
+ 
+ if test "x$CC" != xcc; then
+   { $as_echo "$as_me:$LINENO: checking whether $CC and cc understand -c and -o together" >&5
+diff -ru rpm-5.1.9_vanilla/xz/configure.ac rpm-5.1.9_short-circuit-c99/xz/configure.ac
+--- rpm-5.1.9_vanilla/xz/configure.ac	2009-02-16 17:07:46.000000000 +0000
++++ rpm-5.1.9_short-circuit-c99/xz/configure.ac	2009-08-04 08:25:28.000000000 +0000
+@@ -402,10 +402,7 @@
+ AM_INIT_AUTOMAKE([1.10 foreign tar-v7 filename-length-max=99])
+ AC_PROG_LN_S
+ 
+-AC_PROG_CC_C99
+-if test x$ac_cv_prog_cc_c99 = xno ; then
+-	AC_MSG_ERROR([No C99 compiler was found.])
+-fi
++CC="$CC -std=c99"
+ 
+ AM_PROG_CC_C_O
+ AM_PROG_AS
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index d3da779..cbc318b 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -3,12 +3,12 @@
 # rpm
 #
 #############################################################
-RPM_VERSION = 5.1.6
-RPM_SITE = http://rpm5.org/files/rpm/rpm-5.1/
-RPM_AUTORECONF = YES
+RPM_VERSION = 5.2.0
+RPM_SITE = http://rpm5.org/files/rpm/rpm-5.2/
+RPM_AUTORECONF = NO
 RPM_LIBTOOL_PATCH = NO
 
-RPM_DEPENDENCIES = zlib bzip2 beecrypt neon popt
+RPM_DEPENDENCIES = zlib beecrypt neon popt
 
 RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon" \
 		ac_cv_va_copy=yes
@@ -20,9 +20,16 @@ RPM_CONF_OPT = --disable-build-versionscript --disable-rpath \
 	--without-python --without-perl \
 	--with-zlib=$(STAGING_DIR) \
 	--with-libbeecrypt=$(STAGING_DIR) \
-	--with-popt=$(STAGING_DIR) \
-	--with-mutex=UNIX/fcntl \
-	--with-bzip2
+	--with-popt=$(STAGING_DIR) 
+
+ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
+RPM_CONF_OPT+=--with-xz
+endif
+
+ifeq ($(BR2_PACKAGE_RPM_BZIP2_PAYLOADS),y)
+RPM_CONF_OPT+=--with-bzip2
+RPM_DEPENDENCIES+=bzip2
+endif
 
 RPM_MAKE = $(MAKE1)
 
-- 
1.6.4
