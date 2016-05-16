From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 00:13:00 +0200
Subject: [Buildroot] [PATCH 7/9] toolchain: remove eglibc support
In-Reply-To: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463436782-17051-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463436782-17051-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The eglibc support has been marked deprecated since 2015.08, so it's
time to remove it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |   8 +
 package/gcc/Config.in.host                         |   2 +-
 .../2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch | 174 ---------------------
 .../glibc/2.18-svnr23787/0002-accept-make4.patch   |  33 ----
 .../glibc/2.18-svnr23787/0003-CVE-2014-6040.patch  | 141 -----------------
 .../glibc/2.18-svnr23787/0004-CVE-2014-9402.patch  |  20 ---
 .../glibc/2.18-svnr23787/0005-CVE-2015-1472.patch  |  88 -----------
 .../2.19-svnr25243/0001-CVE-2014-7817-eglibc.patch | 174 ---------------------
 .../glibc/2.19-svnr25243/0002-CVE-2014-6040.patch  | 141 -----------------
 .../glibc/2.19-svnr25243/0003-CVE-2014-9402.patch  |  20 ---
 .../glibc/2.19-svnr25243/0004-CVE-2015-1472.patch  |  88 -----------
 package/glibc/Config.in                            |  27 ----
 package/glibc/glibc.mk                             |   7 -
 toolchain/toolchain-buildroot/Config.in            |  23 ---
 14 files changed, 9 insertions(+), 937 deletions(-)
 delete mode 100644 package/glibc/2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch
 delete mode 100644 package/glibc/2.18-svnr23787/0002-accept-make4.patch
 delete mode 100644 package/glibc/2.18-svnr23787/0003-CVE-2014-6040.patch
 delete mode 100644 package/glibc/2.18-svnr23787/0004-CVE-2014-9402.patch
 delete mode 100644 package/glibc/2.18-svnr23787/0005-CVE-2015-1472.patch
 delete mode 100644 package/glibc/2.19-svnr25243/0001-CVE-2014-7817-eglibc.patch
 delete mode 100644 package/glibc/2.19-svnr25243/0002-CVE-2014-6040.patch
 delete mode 100644 package/glibc/2.19-svnr25243/0003-CVE-2014-9402.patch
 delete mode 100644 package/glibc/2.19-svnr25243/0004-CVE-2015-1472.patch

diff --git a/Config.in.legacy b/Config.in.legacy
index ff11d75..7b76f28 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
+	bool "eglibc support has been removed"
+	select BR2_LEGACY
+	help
+	  The eglibc project no longer exists, as it has been merged
+	  back into the glibc project. Therefore, support for eglibc
+	  has been removed, and glibc should be used instead.
+
 config BR2_GDB_VERSION_7_8
 	bool "gdb 7.8 has been removed"
 	select BR2_LEGACY
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6b2d046..6c2732d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -128,7 +128,7 @@ config BR2_TOOLCHAIN_BUILDROOT_FORTRAN
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
-	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC
+	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	help
 	  Enable the compiler to generate code for accessing
 	  thread local storage variables
diff --git a/package/glibc/2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch b/package/glibc/2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch
deleted file mode 100644
index da2f49d..0000000
--- a/package/glibc/2.18-svnr23787/0001-CVE-2014-7817-eglibc.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From https://bugzilla.redhat.com/show_bug.cgi?id=1157689
-Modified for eglibc.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!!
-EMBARGOED !!! EMBARGOED !!! EMARGOED !!! EMBARGOED !!! EMBARGOED !!!
-SECURITY !!! SECURITY !!! SECURITY !!! SECURITY !!! SECURITY !!!
-
-CVE-2014-7817:
-
-The function wordexp() fails to properly handle the WRDE_NOCMD
-flag when processing arithmetic inputs in the form of "$((... ``))"
-where "..." can be anything valid. The backticks in the arithmetic
-epxression are evaluated by in a shell even if WRDE_NOCMD forbade
-command substitution. This allows an attacker to attempt to pass
-dangerous commands via constructs of the above form, and bypass
-the WRDE_NOCMD flag. This patch fixes this by checking for WRDE_NOCMD
-in parse_arith(). The patch also hardens parse_backticks() and 
-parse_comm() to check for WRDE_NOCMD flag and return an error instead
-of ever running a shell.
-
-We expand the testsuite and add 3 new regression tests of roughtly
-the same form but with a couple of nested levels. 
-
-On top of the 3 new tests we add fork validation to the WRDE_NOCMD
-testing. If any forks are detected during the execution of a wordexp()
-call with WRDE_NOCMD, the test is marked as failed. This is slightly
-heuristic since vfork might be used, but it provides a higher level
-of assurance that no shells were executed as part of command substitution
-with WRDE_NOCMD in effect. In addition it doesn't require libpthread or
-libdl, instead we use the public implementation namespace function
-__register_atfork (already part of the public ABI for libpthread).
-
-Tested on x86_64 with no regressions.
-
-2014-10-27  Carlos O'Donell  <carlos@redhat.com>
-
-	* wordexp-test.c (__dso_handle): Add prototype.
-	(__register_atfork): Likewise.
-	(__app_register_atfork): New function.
-	(registered_forks): New global.
-	(register_fork): New function.
-	(test_case): Add 3 new tests for WRDE_CMDSUB.
-	(main): Call __app_register_atfork.
-	(testit): If WRDE_NOCMD set registered_forks to zero, run test, and
-	if fork count is non-zero fail the test.
-	* posix/wordexp.c (parse_arith): Return WRDE_NOCMD if WRDE_NOCMD flag
-	is set and parsing '`'. 
-	(parse_comm): Return WRDE_NOCMD if WRDE_NOCMD flag is set.
-	(parse_backtick): Return WRDE_NOCMD if WRDE_NOCMD flag is set and
-	parsing '`'.
-
-diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
-index 4957006..5ce2a1b 100644
---- a/libc/posix/wordexp-test.c
-+++ b/libc/posix/wordexp-test.c
-@@ -27,6 +27,25 @@
- 
- #define IFS " \n\t"
- 
-+extern void *__dso_handle __attribute__ ((__weak__, __visibility__ ("hidden")));
-+extern int __register_atfork (void (*) (void), void (*) (void), void (*) (void), void *);
-+
-+static int __app_register_atfork (void (*prepare) (void), void (*parent) (void), void (*child) (void))
-+{
-+  return __register_atfork (prepare, parent, child,
-+			    &__dso_handle == NULL ? NULL : __dso_handle);
-+}
-+
-+/* Number of forks seen.  */
-+static int registered_forks;
-+
-+/* For each fork increment the fork count.  */
-+static void
-+register_fork (void)
-+{
-+  registered_forks++;
-+}
-+
- struct test_case_struct
- {
-   int retval;
-@@ -206,6 +225,12 @@ struct test_case_struct
-     { WRDE_SYNTAX, NULL, "$((2+))", 0, 0, { NULL, }, IFS },
-     { WRDE_SYNTAX, NULL, "`", 0, 0, { NULL, }, IFS },
-     { WRDE_SYNTAX, NULL, "$((010+4+))", 0, 0, { NULL }, IFS },
-+    /* Test for CVE-2014-7817. We test 3 combinations of command
-+       substitution inside an arithmetic expression to make sure that
-+       no commands are executed and error is returned.  */
-+    { WRDE_CMDSUB, NULL, "$((`echo 1`))", WRDE_NOCMD, 0, { NULL, }, IFS },
-+    { WRDE_CMDSUB, NULL, "$((1+`echo 1`))", WRDE_NOCMD, 0, { NULL, }, IFS },
-+    { WRDE_CMDSUB, NULL, "$((1+$((`echo 1`))))", WRDE_NOCMD, 0, { NULL, }, IFS },
- 
-     { -1, NULL, NULL, 0, 0, { NULL, }, IFS },
-   };
-@@ -258,6 +283,15 @@ main (int argc, char *argv[])
- 	  return -1;
-     }
- 
-+  /* If we are not allowed to do command substitution, we install
-+     fork handlers to verify that no forks happened.  No forks should
-+     happen at all if command substitution is disabled.  */
-+  if (__app_register_atfork (register_fork, NULL, NULL) != 0)
-+    {
-+      printf ("Failed to register fork handler.\n");
-+      return -1;
-+    }
-+
-   for (test = 0; test_case[test].retval != -1; test++)
-     if (testit (&test_case[test]))
-       ++fail;
-@@ -367,6 +401,9 @@ testit (struct test_case_struct *tc)
- 
-   printf ("Test %d (%s): ", ++tests, tc->words);
- 
-+  if (tc->flags & WRDE_NOCMD)
-+    registered_forks = 0;
-+
-   if (tc->flags & WRDE_APPEND)
-     {
-       /* initial wordexp() call, to be appended to */
-@@ -378,6 +415,13 @@ testit (struct test_case_struct *tc)
-     }
-   retval = wordexp (tc->words, &we, tc->flags);
- 
-+  if ((tc->flags & WRDE_NOCMD)
-+      && (registered_forks > 0))
-+    {
-+      printf ("FAILED fork called for WRDE_NOCMD\n");
-+      return 1;
-+    }
-+
-   if (tc->flags & WRDE_DOOFFS)
-       start_offs = sav_we.we_offs;
- 
-diff --git a/posix/wordexp.c b/posix/wordexp.c
-index b6b65dd..d6a158f 100644
---- a/libc/posix/wordexp.c
-+++ b/libc/posix/wordexp.c
-@@ -693,6 +693,12 @@ parse_arith (char **word, size_t *word_length, size_t *max_length,
- 	  break;
- 
- 	case '`':
-+	   if (flags & WRDE_NOCMD)
-+	     {
-+	       free (expr);
-+	       return WRDE_NOCMD;
-+	     }
-+
- 	  (*offset)++;
- 	  error = parse_backtick (&expr, &expr_length, &expr_maxlen,
- 				  words, offset, flags, NULL, NULL, NULL);
-@@ -1144,6 +1150,10 @@ parse_comm (char **word, size_t *word_length, size_t *max_length,
-   size_t comm_maxlen;
-   char *comm = w_newword (&comm_length, &comm_maxlen);
- 
-+  /* Do nothing if command substitution should not succeed.  */
-+  if (flags & WRDE_NOCMD)
-+    return WRDE_CMDSUB;
-+
-   for (; words[*offset]; ++(*offset))
-     {
-       switch (words[*offset])
-@@ -2121,6 +2131,9 @@ parse_backtick (char **word, size_t *word_length, size_t *max_length,
-       switch (words[*offset])
- 	{
- 	case '`':
-+	  if (flags & WRDE_NOCMD)
-+	    return WRDE_NOCMD;
-+
- 	  /* Go -- give the script to the shell */
- 	  error = exec_comm (comm, word, word_length, max_length, flags,
- 			     pwordexp, ifs, ifs_white);
diff --git a/package/glibc/2.18-svnr23787/0002-accept-make4.patch b/package/glibc/2.18-svnr23787/0002-accept-make4.patch
deleted file mode 100644
index 4f426f2..0000000
--- a/package/glibc/2.18-svnr23787/0002-accept-make4.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Backport upstream patch (28d708c44bc47b56f6551ff285f78edcf61c208a) to accept
-make-4.0 or newer.
-We patch both configure and configure.in files so if we ever have to run
-autoreconf in the glibc source, then the fix will be propagated properly.
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-
-Index: glibc-2.18-svnr23787/libc/configure
-===================================================================
---- glibc-2.18-svnr23787.orig/libc/configure
-+++ glibc-2.18-svnr23787/libc/configure
-@@ -4772,7 +4772,7 @@ $as_echo_n "checking version of $MAKE...
-   ac_prog_version=`$MAKE --version 2>&1 | sed -n 's/^.*GNU Make[^0-9]*\([0-9][0-9.]*\).*$/\1/p'`
-   case $ac_prog_version in
-     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
--    3.79* | 3.[89]*)
-+    3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*)
-        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
-     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
- 
-Index: glibc-2.18-svnr23787/libc/configure.in
-===================================================================
---- glibc-2.18-svnr23787.orig/libc/configure.in
-+++ glibc-2.18-svnr23787/libc/configure.in
-@@ -989,7 +989,7 @@ AC_CHECK_PROG_VER(CC, ${ac_tool_prefix}g
-   critic_missing="$critic_missing gcc")
- AC_CHECK_PROG_VER(MAKE, gnumake gmake make, --version,
-   [GNU Make[^0-9]*\([0-9][0-9.]*\)],
--  [3.79* | 3.[89]*], critic_missing="$critic_missing make")
-+  [3.79* | 3.[89]* | [4-9].* | [1-9][0-9]*], critic_missing="$critic_missing make")
- 
- AC_CHECK_PROG_VER(MSGFMT, gnumsgfmt gmsgfmt msgfmt, --version,
-   [GNU gettext.* \([0-9]*\.[0-9.]*\)],
diff --git a/package/glibc/2.18-svnr23787/0003-CVE-2014-6040.patch b/package/glibc/2.18-svnr23787/0003-CVE-2014-6040.patch
deleted file mode 100644
index f447dcd..0000000
--- a/package/glibc/2.18-svnr23787/0003-CVE-2014-6040.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=41488498b6
-See https://bugzilla.redhat.com/show_bug.cgi?id=1135841
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm1364.c eglibc-2.19/libc/iconvdata/ibm1364.c
---- eglibc-2.19.orig/libc/iconvdata/ibm1364.c	2015-01-08 16:05:53.918823240 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm1364.c	2015-01-08 16:06:02.781555143 -0300
-@@ -220,7 +220,8 @@
- 	  ++rp2;							      \
- 									      \
- 	uint32_t res;							      \
--	if (__builtin_expect (ch < rp2->start, 0)			      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
-+	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = DB_TO_UCS4[ch + rp2->idx],			      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
- 	  {								      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm932.c eglibc-2.19/libc/iconvdata/ibm932.c
---- eglibc-2.19.orig/libc/iconvdata/ibm932.c	2015-01-08 16:05:53.910818967 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm932.c	2015-01-08 16:06:02.781555143 -0300
-@@ -73,11 +73,12 @@
- 	  }								      \
- 									      \
- 	ch = (ch * 0x100) + inptr[1];					      \
-+	/* ch was less than 0xfd.  */					      \
-+	assert (ch < 0xfd00);						      \
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
--	    || __builtin_expect (ch < rp2->start, 0)			      \
-+	if (__builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm932db_to_ucs4[ch + rp2->idx],		      \
- 	    __builtin_expect (res, '\1') == 0 && ch !=0))		      \
- 	  {								      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm933.c eglibc-2.19/libc/iconvdata/ibm933.c
---- eglibc-2.19.orig/libc/iconvdata/ibm933.c	2015-01-08 16:05:53.917822706 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm933.c	2015-01-08 16:06:02.781555143 -0300
-@@ -161,7 +161,7 @@
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
- 	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm933db_to_ucs4[ch + rp2->idx],		      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm935.c eglibc-2.19/libc/iconvdata/ibm935.c
---- eglibc-2.19.orig/libc/iconvdata/ibm935.c	2015-01-08 16:05:53.921824843 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm935.c	2015-01-08 16:06:02.782555677 -0300
-@@ -161,7 +161,7 @@
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
- 	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm935db_to_ucs4[ch + rp2->idx],		      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm937.c eglibc-2.19/libc/iconvdata/ibm937.c
---- eglibc-2.19.orig/libc/iconvdata/ibm937.c	2015-01-08 16:05:53.915821638 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm937.c	2015-01-08 16:06:02.782555677 -0300
-@@ -161,7 +161,7 @@
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
- 	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm937db_to_ucs4[ch + rp2->idx],		      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm939.c eglibc-2.19/libc/iconvdata/ibm939.c
---- eglibc-2.19.orig/libc/iconvdata/ibm939.c	2015-01-08 16:05:53.917822706 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm939.c	2015-01-08 16:06:02.782555677 -0300
-@@ -161,7 +161,7 @@
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
- 	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm939db_to_ucs4[ch + rp2->idx],		      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm943.c eglibc-2.19/libc/iconvdata/ibm943.c
---- eglibc-2.19.orig/libc/iconvdata/ibm943.c	2015-01-08 16:05:53.918823240 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm943.c	2015-01-08 16:06:02.782555677 -0300
-@@ -74,11 +74,12 @@
- 	  }								      \
- 									      \
- 	ch = (ch * 0x100) + inptr[1];					      \
-+	/* ch was less than 0xfd.  */					      \
-+	assert (ch < 0xfd00);						      \
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
--	    || __builtin_expect (ch < rp2->start, 0)			      \
-+	if (__builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm943db_to_ucs4[ch + rp2->idx],		      \
- 	    __builtin_expect (res, '\1') == 0 && ch !=0))		      \
- 	  {								      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/Makefile eglibc-2.19/libc/iconvdata/Makefile
---- eglibc-2.19.orig/libc/iconvdata/Makefile	2015-01-08 16:05:53.903815227 -0300
-+++ eglibc-2.19/libc/iconvdata/Makefile	2015-01-08 16:06:02.782555677 -0300
-@@ -303,6 +303,7 @@
- $(objpfx)iconv-test.out: run-iconv-test.sh $(objpfx)gconv-modules \
- 			 $(addprefix $(objpfx),$(modules.so)) \
- 			 $(common-objdir)/iconv/iconv_prog TESTS
-+	iconv_modules="$(modules)" \
- 	$(SHELL) $< $(common-objdir) '$(test-wrapper)' > $@
- 
- $(objpfx)tst-tables.out: tst-tables.sh $(objpfx)gconv-modules \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/run-iconv-test.sh eglibc-2.19/libc/iconvdata/run-iconv-test.sh
---- eglibc-2.19.orig/libc/iconvdata/run-iconv-test.sh	2015-01-08 16:05:53.894810420 -0300
-+++ eglibc-2.19/libc/iconvdata/run-iconv-test.sh	2015-01-08 16:06:02.782555677 -0300
-@@ -188,6 +188,24 @@
- 
- done < TESTS2
- 
-+# Check for crashes in decoders.
-+printf '\016\377\377\377\377\377\377\377' > $temp1
-+for from in $iconv_modules ; do
-+    echo $ac_n "test decoder $from $ac_c"
-+    PROG=`eval echo $ICONV`
-+    if $PROG < $temp1 >/dev/null 2>&1 ; then
-+	: # fall through
-+    else
-+	status=$?
-+	if test $status -gt 1 ; then
-+	    echo "/FAILED"
-+	    failed=1
-+	    continue
-+	fi
-+    fi
-+    echo "OK"
-+done
-+
- exit $failed
- # Local Variables:
- #  mode:shell-script
diff --git a/package/glibc/2.18-svnr23787/0004-CVE-2014-9402.patch b/package/glibc/2.18-svnr23787/0004-CVE-2014-9402.patch
deleted file mode 100644
index c7aa12c..0000000
--- a/package/glibc/2.18-svnr23787/0004-CVE-2014-9402.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix CVE-2014-9402 - denial of service in getnetbyname function.
-Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=11e3417af6e354f1942c68a271ae51e892b2814d
-See https://bugzilla.redhat.com/show_bug.cgi?id=1175369
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura eglibc-2.19.orig/libc/resolv/nss_dns/dns-network.c eglibc-2.19/libc/resolv/nss_dns/dns-network.c
---- eglibc-2.19.orig/libc/resolv/nss_dns/dns-network.c	2015-01-08 16:12:35.024977879 -0300
-+++ eglibc-2.19/libc/resolv/nss_dns/dns-network.c	2015-01-08 16:12:42.543992357 -0300
-@@ -398,8 +398,8 @@
- 
- 	case BYNAME:
- 	  {
--	    char **ap = result->n_aliases++;
--	    while (*ap != NULL)
-+	    char **ap;
-+	    for (ap = result->n_aliases; *ap != NULL; ++ap)
- 	      {
- 		/* Check each alias name for being of the forms:
- 		   4.3.2.1.in-addr.arpa		= net 1.2.3.4
diff --git a/package/glibc/2.18-svnr23787/0005-CVE-2015-1472.patch b/package/glibc/2.18-svnr23787/0005-CVE-2015-1472.patch
deleted file mode 100644
index a0da626..0000000
--- a/package/glibc/2.18-svnr23787/0005-CVE-2015-1472.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-Fix CVE-2015-1472 - heap buffer overflow in wscanf
-Backport from upstream:
-https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5bd80bfe9ca0d955bfbbc002781bc7b01b6bcb06
-See: https://bugzilla.redhat.com/show_bug.cgi?id=1188235
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff --git a/stdio-common/tst-sscanf.c b/stdio-common/tst-sscanf.c
-index aece3f2..8a2eb9e 100644
---- a/libc/stdio-common/tst-sscanf.c
-+++ b/libc/stdio-common/tst-sscanf.c
-@@ -233,5 +233,38 @@ main (void)
- 	}
-     }
- 
-+  /* BZ #16618
-+     The test will segfault during SSCANF if the buffer overflow
-+     is not fixed.  The size of `s` is such that it forces the use
-+     of malloc internally and this triggers the incorrect computation.
-+     Thus the value for SIZE is arbitrariy high enough that malloc
-+     is used.  */
-+  {
-+#define SIZE 131072
-+    CHAR *s = malloc ((SIZE + 1) * sizeof (*s));
-+    if (s == NULL)
-+      abort ();
-+    for (size_t i = 0; i < SIZE; i++)
-+      s[i] = L('0');
-+    s[SIZE] = L('\0');
-+    int i = 42;
-+    /* Scan multi-digit zero into `i`.  */
-+    if (SSCANF (s, L("%d"), &i) != 1)
-+      {
-+	printf ("FAIL: bug16618: SSCANF did not read one input item.\n");
-+	result = 1;
-+      }
-+    if (i != 0)
-+      {
-+	printf ("FAIL: bug16618: Value of `i` was not zero as expected.\n");
-+	result = 1;
-+      }
-+    free (s);
-+    if (result != 1)
-+      printf ("PASS: bug16618: Did not crash.\n");
-+#undef SIZE
-+  }
-+
-+
-   return result;
- }
-diff --git a/stdio-common/vfscanf.c b/stdio-common/vfscanf.c
-index cd129a8..0e204e7 100644
---- a/libc/stdio-common/vfscanf.c
-+++ b/libc/stdio-common/vfscanf.c
-@@ -272,9 +272,10 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
-       if (__glibc_unlikely (wpsize == wpmax))				      \
- 	{								    \
- 	  CHAR_T *old = wp;						    \
--	  size_t newsize = (UCHAR_MAX + 1 > 2 * wpmax			    \
--			    ? UCHAR_MAX + 1 : 2 * wpmax);		    \
--	  if (use_malloc || !__libc_use_alloca (newsize))		    \
-+	  bool fits = __glibc_likely (wpmax <= SIZE_MAX / sizeof (CHAR_T) / 2); \
-+	  size_t wpneed = MAX (UCHAR_MAX + 1, 2 * wpmax);		    \
-+	  size_t newsize = fits ? wpneed * sizeof (CHAR_T) : SIZE_MAX;	    \
-+	  if (!__libc_use_alloca (newsize))				    \
- 	    {								    \
- 	      wp = realloc (use_malloc ? wp : NULL, newsize);		    \
- 	      if (wp == NULL)						    \
-@@ -286,14 +287,13 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
- 		}							    \
- 	      if (! use_malloc)						    \
- 		MEMCPY (wp, old, wpsize);				    \
--	      wpmax = newsize;						    \
-+	      wpmax = wpneed;						    \
- 	      use_malloc = true;					    \
- 	    }								    \
- 	  else								    \
- 	    {								    \
- 	      size_t s = wpmax * sizeof (CHAR_T);			    \
--	      wp = (CHAR_T *) extend_alloca (wp, s,			    \
--					     newsize * sizeof (CHAR_T));    \
-+	      wp = (CHAR_T *) extend_alloca (wp, s, newsize);		    \
- 	      wpmax = s / sizeof (CHAR_T);				    \
- 	      if (old != NULL)						    \
- 		MEMCPY (wp, old, wpsize);				    \
--- 
-1.9.4
-
diff --git a/package/glibc/2.19-svnr25243/0001-CVE-2014-7817-eglibc.patch b/package/glibc/2.19-svnr25243/0001-CVE-2014-7817-eglibc.patch
deleted file mode 100644
index da2f49d..0000000
--- a/package/glibc/2.19-svnr25243/0001-CVE-2014-7817-eglibc.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From https://bugzilla.redhat.com/show_bug.cgi?id=1157689
-Modified for eglibc.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!!
-EMBARGOED !!! EMBARGOED !!! EMARGOED !!! EMBARGOED !!! EMBARGOED !!!
-SECURITY !!! SECURITY !!! SECURITY !!! SECURITY !!! SECURITY !!!
-
-CVE-2014-7817:
-
-The function wordexp() fails to properly handle the WRDE_NOCMD
-flag when processing arithmetic inputs in the form of "$((... ``))"
-where "..." can be anything valid. The backticks in the arithmetic
-epxression are evaluated by in a shell even if WRDE_NOCMD forbade
-command substitution. This allows an attacker to attempt to pass
-dangerous commands via constructs of the above form, and bypass
-the WRDE_NOCMD flag. This patch fixes this by checking for WRDE_NOCMD
-in parse_arith(). The patch also hardens parse_backticks() and 
-parse_comm() to check for WRDE_NOCMD flag and return an error instead
-of ever running a shell.
-
-We expand the testsuite and add 3 new regression tests of roughtly
-the same form but with a couple of nested levels. 
-
-On top of the 3 new tests we add fork validation to the WRDE_NOCMD
-testing. If any forks are detected during the execution of a wordexp()
-call with WRDE_NOCMD, the test is marked as failed. This is slightly
-heuristic since vfork might be used, but it provides a higher level
-of assurance that no shells were executed as part of command substitution
-with WRDE_NOCMD in effect. In addition it doesn't require libpthread or
-libdl, instead we use the public implementation namespace function
-__register_atfork (already part of the public ABI for libpthread).
-
-Tested on x86_64 with no regressions.
-
-2014-10-27  Carlos O'Donell  <carlos@redhat.com>
-
-	* wordexp-test.c (__dso_handle): Add prototype.
-	(__register_atfork): Likewise.
-	(__app_register_atfork): New function.
-	(registered_forks): New global.
-	(register_fork): New function.
-	(test_case): Add 3 new tests for WRDE_CMDSUB.
-	(main): Call __app_register_atfork.
-	(testit): If WRDE_NOCMD set registered_forks to zero, run test, and
-	if fork count is non-zero fail the test.
-	* posix/wordexp.c (parse_arith): Return WRDE_NOCMD if WRDE_NOCMD flag
-	is set and parsing '`'. 
-	(parse_comm): Return WRDE_NOCMD if WRDE_NOCMD flag is set.
-	(parse_backtick): Return WRDE_NOCMD if WRDE_NOCMD flag is set and
-	parsing '`'.
-
-diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
-index 4957006..5ce2a1b 100644
---- a/libc/posix/wordexp-test.c
-+++ b/libc/posix/wordexp-test.c
-@@ -27,6 +27,25 @@
- 
- #define IFS " \n\t"
- 
-+extern void *__dso_handle __attribute__ ((__weak__, __visibility__ ("hidden")));
-+extern int __register_atfork (void (*) (void), void (*) (void), void (*) (void), void *);
-+
-+static int __app_register_atfork (void (*prepare) (void), void (*parent) (void), void (*child) (void))
-+{
-+  return __register_atfork (prepare, parent, child,
-+			    &__dso_handle == NULL ? NULL : __dso_handle);
-+}
-+
-+/* Number of forks seen.  */
-+static int registered_forks;
-+
-+/* For each fork increment the fork count.  */
-+static void
-+register_fork (void)
-+{
-+  registered_forks++;
-+}
-+
- struct test_case_struct
- {
-   int retval;
-@@ -206,6 +225,12 @@ struct test_case_struct
-     { WRDE_SYNTAX, NULL, "$((2+))", 0, 0, { NULL, }, IFS },
-     { WRDE_SYNTAX, NULL, "`", 0, 0, { NULL, }, IFS },
-     { WRDE_SYNTAX, NULL, "$((010+4+))", 0, 0, { NULL }, IFS },
-+    /* Test for CVE-2014-7817. We test 3 combinations of command
-+       substitution inside an arithmetic expression to make sure that
-+       no commands are executed and error is returned.  */
-+    { WRDE_CMDSUB, NULL, "$((`echo 1`))", WRDE_NOCMD, 0, { NULL, }, IFS },
-+    { WRDE_CMDSUB, NULL, "$((1+`echo 1`))", WRDE_NOCMD, 0, { NULL, }, IFS },
-+    { WRDE_CMDSUB, NULL, "$((1+$((`echo 1`))))", WRDE_NOCMD, 0, { NULL, }, IFS },
- 
-     { -1, NULL, NULL, 0, 0, { NULL, }, IFS },
-   };
-@@ -258,6 +283,15 @@ main (int argc, char *argv[])
- 	  return -1;
-     }
- 
-+  /* If we are not allowed to do command substitution, we install
-+     fork handlers to verify that no forks happened.  No forks should
-+     happen at all if command substitution is disabled.  */
-+  if (__app_register_atfork (register_fork, NULL, NULL) != 0)
-+    {
-+      printf ("Failed to register fork handler.\n");
-+      return -1;
-+    }
-+
-   for (test = 0; test_case[test].retval != -1; test++)
-     if (testit (&test_case[test]))
-       ++fail;
-@@ -367,6 +401,9 @@ testit (struct test_case_struct *tc)
- 
-   printf ("Test %d (%s): ", ++tests, tc->words);
- 
-+  if (tc->flags & WRDE_NOCMD)
-+    registered_forks = 0;
-+
-   if (tc->flags & WRDE_APPEND)
-     {
-       /* initial wordexp() call, to be appended to */
-@@ -378,6 +415,13 @@ testit (struct test_case_struct *tc)
-     }
-   retval = wordexp (tc->words, &we, tc->flags);
- 
-+  if ((tc->flags & WRDE_NOCMD)
-+      && (registered_forks > 0))
-+    {
-+      printf ("FAILED fork called for WRDE_NOCMD\n");
-+      return 1;
-+    }
-+
-   if (tc->flags & WRDE_DOOFFS)
-       start_offs = sav_we.we_offs;
- 
-diff --git a/posix/wordexp.c b/posix/wordexp.c
-index b6b65dd..d6a158f 100644
---- a/libc/posix/wordexp.c
-+++ b/libc/posix/wordexp.c
-@@ -693,6 +693,12 @@ parse_arith (char **word, size_t *word_length, size_t *max_length,
- 	  break;
- 
- 	case '`':
-+	   if (flags & WRDE_NOCMD)
-+	     {
-+	       free (expr);
-+	       return WRDE_NOCMD;
-+	     }
-+
- 	  (*offset)++;
- 	  error = parse_backtick (&expr, &expr_length, &expr_maxlen,
- 				  words, offset, flags, NULL, NULL, NULL);
-@@ -1144,6 +1150,10 @@ parse_comm (char **word, size_t *word_length, size_t *max_length,
-   size_t comm_maxlen;
-   char *comm = w_newword (&comm_length, &comm_maxlen);
- 
-+  /* Do nothing if command substitution should not succeed.  */
-+  if (flags & WRDE_NOCMD)
-+    return WRDE_CMDSUB;
-+
-   for (; words[*offset]; ++(*offset))
-     {
-       switch (words[*offset])
-@@ -2121,6 +2131,9 @@ parse_backtick (char **word, size_t *word_length, size_t *max_length,
-       switch (words[*offset])
- 	{
- 	case '`':
-+	  if (flags & WRDE_NOCMD)
-+	    return WRDE_NOCMD;
-+
- 	  /* Go -- give the script to the shell */
- 	  error = exec_comm (comm, word, word_length, max_length, flags,
- 			     pwordexp, ifs, ifs_white);
diff --git a/package/glibc/2.19-svnr25243/0002-CVE-2014-6040.patch b/package/glibc/2.19-svnr25243/0002-CVE-2014-6040.patch
deleted file mode 100644
index f447dcd..0000000
--- a/package/glibc/2.19-svnr25243/0002-CVE-2014-6040.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=41488498b6
-See https://bugzilla.redhat.com/show_bug.cgi?id=1135841
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm1364.c eglibc-2.19/libc/iconvdata/ibm1364.c
---- eglibc-2.19.orig/libc/iconvdata/ibm1364.c	2015-01-08 16:05:53.918823240 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm1364.c	2015-01-08 16:06:02.781555143 -0300
-@@ -220,7 +220,8 @@
- 	  ++rp2;							      \
- 									      \
- 	uint32_t res;							      \
--	if (__builtin_expect (ch < rp2->start, 0)			      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
-+	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = DB_TO_UCS4[ch + rp2->idx],			      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
- 	  {								      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm932.c eglibc-2.19/libc/iconvdata/ibm932.c
---- eglibc-2.19.orig/libc/iconvdata/ibm932.c	2015-01-08 16:05:53.910818967 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm932.c	2015-01-08 16:06:02.781555143 -0300
-@@ -73,11 +73,12 @@
- 	  }								      \
- 									      \
- 	ch = (ch * 0x100) + inptr[1];					      \
-+	/* ch was less than 0xfd.  */					      \
-+	assert (ch < 0xfd00);						      \
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
--	    || __builtin_expect (ch < rp2->start, 0)			      \
-+	if (__builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm932db_to_ucs4[ch + rp2->idx],		      \
- 	    __builtin_expect (res, '\1') == 0 && ch !=0))		      \
- 	  {								      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm933.c eglibc-2.19/libc/iconvdata/ibm933.c
---- eglibc-2.19.orig/libc/iconvdata/ibm933.c	2015-01-08 16:05:53.917822706 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm933.c	2015-01-08 16:06:02.781555143 -0300
-@@ -161,7 +161,7 @@
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
- 	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm933db_to_ucs4[ch + rp2->idx],		      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm935.c eglibc-2.19/libc/iconvdata/ibm935.c
---- eglibc-2.19.orig/libc/iconvdata/ibm935.c	2015-01-08 16:05:53.921824843 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm935.c	2015-01-08 16:06:02.782555677 -0300
-@@ -161,7 +161,7 @@
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
- 	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm935db_to_ucs4[ch + rp2->idx],		      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm937.c eglibc-2.19/libc/iconvdata/ibm937.c
---- eglibc-2.19.orig/libc/iconvdata/ibm937.c	2015-01-08 16:05:53.915821638 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm937.c	2015-01-08 16:06:02.782555677 -0300
-@@ -161,7 +161,7 @@
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
- 	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm937db_to_ucs4[ch + rp2->idx],		      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm939.c eglibc-2.19/libc/iconvdata/ibm939.c
---- eglibc-2.19.orig/libc/iconvdata/ibm939.c	2015-01-08 16:05:53.917822706 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm939.c	2015-01-08 16:06:02.782555677 -0300
-@@ -161,7 +161,7 @@
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
-+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
- 	    || __builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm939db_to_ucs4[ch + rp2->idx],		      \
- 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/ibm943.c eglibc-2.19/libc/iconvdata/ibm943.c
---- eglibc-2.19.orig/libc/iconvdata/ibm943.c	2015-01-08 16:05:53.918823240 -0300
-+++ eglibc-2.19/libc/iconvdata/ibm943.c	2015-01-08 16:06:02.782555677 -0300
-@@ -74,11 +74,12 @@
- 	  }								      \
- 									      \
- 	ch = (ch * 0x100) + inptr[1];					      \
-+	/* ch was less than 0xfd.  */					      \
-+	assert (ch < 0xfd00);						      \
- 	while (ch > rp2->end)						      \
- 	  ++rp2;							      \
- 									      \
--	if (__builtin_expect (rp2 == NULL, 0)				      \
--	    || __builtin_expect (ch < rp2->start, 0)			      \
-+	if (__builtin_expect (ch < rp2->start, 0)			      \
- 	    || (res = __ibm943db_to_ucs4[ch + rp2->idx],		      \
- 	    __builtin_expect (res, '\1') == 0 && ch !=0))		      \
- 	  {								      \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/Makefile eglibc-2.19/libc/iconvdata/Makefile
---- eglibc-2.19.orig/libc/iconvdata/Makefile	2015-01-08 16:05:53.903815227 -0300
-+++ eglibc-2.19/libc/iconvdata/Makefile	2015-01-08 16:06:02.782555677 -0300
-@@ -303,6 +303,7 @@
- $(objpfx)iconv-test.out: run-iconv-test.sh $(objpfx)gconv-modules \
- 			 $(addprefix $(objpfx),$(modules.so)) \
- 			 $(common-objdir)/iconv/iconv_prog TESTS
-+	iconv_modules="$(modules)" \
- 	$(SHELL) $< $(common-objdir) '$(test-wrapper)' > $@
- 
- $(objpfx)tst-tables.out: tst-tables.sh $(objpfx)gconv-modules \
-diff -Nura eglibc-2.19.orig/libc/iconvdata/run-iconv-test.sh eglibc-2.19/libc/iconvdata/run-iconv-test.sh
---- eglibc-2.19.orig/libc/iconvdata/run-iconv-test.sh	2015-01-08 16:05:53.894810420 -0300
-+++ eglibc-2.19/libc/iconvdata/run-iconv-test.sh	2015-01-08 16:06:02.782555677 -0300
-@@ -188,6 +188,24 @@
- 
- done < TESTS2
- 
-+# Check for crashes in decoders.
-+printf '\016\377\377\377\377\377\377\377' > $temp1
-+for from in $iconv_modules ; do
-+    echo $ac_n "test decoder $from $ac_c"
-+    PROG=`eval echo $ICONV`
-+    if $PROG < $temp1 >/dev/null 2>&1 ; then
-+	: # fall through
-+    else
-+	status=$?
-+	if test $status -gt 1 ; then
-+	    echo "/FAILED"
-+	    failed=1
-+	    continue
-+	fi
-+    fi
-+    echo "OK"
-+done
-+
- exit $failed
- # Local Variables:
- #  mode:shell-script
diff --git a/package/glibc/2.19-svnr25243/0003-CVE-2014-9402.patch b/package/glibc/2.19-svnr25243/0003-CVE-2014-9402.patch
deleted file mode 100644
index c7aa12c..0000000
--- a/package/glibc/2.19-svnr25243/0003-CVE-2014-9402.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix CVE-2014-9402 - denial of service in getnetbyname function.
-Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=11e3417af6e354f1942c68a271ae51e892b2814d
-See https://bugzilla.redhat.com/show_bug.cgi?id=1175369
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura eglibc-2.19.orig/libc/resolv/nss_dns/dns-network.c eglibc-2.19/libc/resolv/nss_dns/dns-network.c
---- eglibc-2.19.orig/libc/resolv/nss_dns/dns-network.c	2015-01-08 16:12:35.024977879 -0300
-+++ eglibc-2.19/libc/resolv/nss_dns/dns-network.c	2015-01-08 16:12:42.543992357 -0300
-@@ -398,8 +398,8 @@
- 
- 	case BYNAME:
- 	  {
--	    char **ap = result->n_aliases++;
--	    while (*ap != NULL)
-+	    char **ap;
-+	    for (ap = result->n_aliases; *ap != NULL; ++ap)
- 	      {
- 		/* Check each alias name for being of the forms:
- 		   4.3.2.1.in-addr.arpa		= net 1.2.3.4
diff --git a/package/glibc/2.19-svnr25243/0004-CVE-2015-1472.patch b/package/glibc/2.19-svnr25243/0004-CVE-2015-1472.patch
deleted file mode 100644
index a0da626..0000000
--- a/package/glibc/2.19-svnr25243/0004-CVE-2015-1472.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-Fix CVE-2015-1472 - heap buffer overflow in wscanf
-Backport from upstream:
-https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5bd80bfe9ca0d955bfbbc002781bc7b01b6bcb06
-See: https://bugzilla.redhat.com/show_bug.cgi?id=1188235
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff --git a/stdio-common/tst-sscanf.c b/stdio-common/tst-sscanf.c
-index aece3f2..8a2eb9e 100644
---- a/libc/stdio-common/tst-sscanf.c
-+++ b/libc/stdio-common/tst-sscanf.c
-@@ -233,5 +233,38 @@ main (void)
- 	}
-     }
- 
-+  /* BZ #16618
-+     The test will segfault during SSCANF if the buffer overflow
-+     is not fixed.  The size of `s` is such that it forces the use
-+     of malloc internally and this triggers the incorrect computation.
-+     Thus the value for SIZE is arbitrariy high enough that malloc
-+     is used.  */
-+  {
-+#define SIZE 131072
-+    CHAR *s = malloc ((SIZE + 1) * sizeof (*s));
-+    if (s == NULL)
-+      abort ();
-+    for (size_t i = 0; i < SIZE; i++)
-+      s[i] = L('0');
-+    s[SIZE] = L('\0');
-+    int i = 42;
-+    /* Scan multi-digit zero into `i`.  */
-+    if (SSCANF (s, L("%d"), &i) != 1)
-+      {
-+	printf ("FAIL: bug16618: SSCANF did not read one input item.\n");
-+	result = 1;
-+      }
-+    if (i != 0)
-+      {
-+	printf ("FAIL: bug16618: Value of `i` was not zero as expected.\n");
-+	result = 1;
-+      }
-+    free (s);
-+    if (result != 1)
-+      printf ("PASS: bug16618: Did not crash.\n");
-+#undef SIZE
-+  }
-+
-+
-   return result;
- }
-diff --git a/stdio-common/vfscanf.c b/stdio-common/vfscanf.c
-index cd129a8..0e204e7 100644
---- a/libc/stdio-common/vfscanf.c
-+++ b/libc/stdio-common/vfscanf.c
-@@ -272,9 +272,10 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
-       if (__glibc_unlikely (wpsize == wpmax))				      \
- 	{								    \
- 	  CHAR_T *old = wp;						    \
--	  size_t newsize = (UCHAR_MAX + 1 > 2 * wpmax			    \
--			    ? UCHAR_MAX + 1 : 2 * wpmax);		    \
--	  if (use_malloc || !__libc_use_alloca (newsize))		    \
-+	  bool fits = __glibc_likely (wpmax <= SIZE_MAX / sizeof (CHAR_T) / 2); \
-+	  size_t wpneed = MAX (UCHAR_MAX + 1, 2 * wpmax);		    \
-+	  size_t newsize = fits ? wpneed * sizeof (CHAR_T) : SIZE_MAX;	    \
-+	  if (!__libc_use_alloca (newsize))				    \
- 	    {								    \
- 	      wp = realloc (use_malloc ? wp : NULL, newsize);		    \
- 	      if (wp == NULL)						    \
-@@ -286,14 +287,13 @@ _IO_vfscanf_internal (_IO_FILE *s, const char *format, _IO_va_list argptr,
- 		}							    \
- 	      if (! use_malloc)						    \
- 		MEMCPY (wp, old, wpsize);				    \
--	      wpmax = newsize;						    \
-+	      wpmax = wpneed;						    \
- 	      use_malloc = true;					    \
- 	    }								    \
- 	  else								    \
- 	    {								    \
- 	      size_t s = wpmax * sizeof (CHAR_T);			    \
--	      wp = (CHAR_T *) extend_alloca (wp, s,			    \
--					     newsize * sizeof (CHAR_T));    \
-+	      wp = (CHAR_T *) extend_alloca (wp, s, newsize);		    \
- 	      wpmax = s / sizeof (CHAR_T);				    \
- 	      if (old != NULL)						    \
- 		MEMCPY (wp, old, wpsize);				    \
--- 
-1.9.4
-
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 5b82170..75c2123 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -1,28 +1,3 @@
-if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
-
-config BR2_PACKAGE_EGLIBC
-	bool
-	default y
-	select BR2_PACKAGE_LINUX_HEADERS
-
-choice
-	prompt "eglibc version"
-	default BR2_EGLIBC_VERSION_2_18
-
-config BR2_EGLIBC_VERSION_2_18
-	bool "2.18-svnr23787"
-	# Build breakage
-	depends on !BR2_sparc
-
-config BR2_EGLIBC_VERSION_2_19
-	bool "2.19-svnr25243"
-	# Build breakage
-	depends on !BR2_powerpc_SPE
-
-endchoice
-
-endif
-
 if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 
 config BR2_PACKAGE_GLIBC
@@ -52,7 +27,5 @@ endif
 
 config BR2_GLIBC_VERSION_STRING
 	string
-	default "2.18-svnr23787" if BR2_EGLIBC_VERSION_2_18
-	default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
 	default "2.22" if BR2_GLIBC_VERSION_2_22
 	default "2.23" if BR2_GLIBC_VERSION_2_23
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 2ae9cae..db9b46b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,16 +5,9 @@
 ################################################################################
 
 GLIBC_VERSION = $(call qstrip,$(BR2_GLIBC_VERSION_STRING))
-
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
-GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc
-GLIBC_SOURCE = eglibc-$(GLIBC_VERSION).tar.bz2
-GLIBC_SRC_SUBDIR = libc
-else
 GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
 GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
 GLIBC_SRC_SUBDIR = .
-endif
 
 GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0c40801..b046a61 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -42,26 +42,6 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 	  http://uclibc.org
 
-config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
-	bool "eglibc"
-	depends on BR2_arm        || BR2_armeb    || BR2_aarch64    || \
-		   BR2_aarch64_be || BR2_i386     || BR2_mips       || \
-		   BR2_mipsel     || BR2_mips64   || BR2_mips64el   || \
-		   BR2_powerpc    || BR2_sh       || BR2_sh64       || \
-		   BR2_sparc      || BR2_x86_64   || BR2_microblaze || \
-		   BR2_powerpc64
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_DEPRECATED_SINCE_2015_08
-	select BR2_TOOLCHAIN_USES_GLIBC
-	# our eglibc.mk enables RPC support
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	help
-	  This option selects eglibc as the C library for the
-	  cross-compilation toolchain.
-
-	  http://eglibc.org
-
 config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	bool "glibc"
 	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
@@ -107,9 +87,6 @@ endchoice
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	string
 	default "uclibc" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-	# Both glibc and eglibc are handled by the package called
-	# 'glibc'
-	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
-- 
2.7.4
