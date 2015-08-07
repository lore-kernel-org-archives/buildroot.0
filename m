From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Aug 2015 10:37:33 -0300
Subject: [Buildroot] [PATCH next 4/5] glibc: add version 2.22
In-Reply-To: <1438954654-11777-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438954654-11777-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438954654-11777-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch default to version 2.21 and drop 2.20.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glibc/2.20/0001-CVE-2014-7817.patch | 173 ----------------------------
 package/glibc/2.20/0002-CVE-2014-9402.patch |  24 ----
 package/glibc/2.20/0003-CVE-2015-1472.patch |  88 --------------
 package/glibc/Config.in                     |  14 +--
 package/glibc/glibc.hash                    |   2 +-
 5 files changed, 7 insertions(+), 294 deletions(-)
 delete mode 100644 package/glibc/2.20/0001-CVE-2014-7817.patch
 delete mode 100644 package/glibc/2.20/0002-CVE-2014-9402.patch
 delete mode 100644 package/glibc/2.20/0003-CVE-2015-1472.patch

diff --git a/package/glibc/2.20/0001-CVE-2014-7817.patch b/package/glibc/2.20/0001-CVE-2014-7817.patch
deleted file mode 100644
index cd20c42..0000000
--- a/package/glibc/2.20/0001-CVE-2014-7817.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-Patch from https://bugzilla.redhat.com/show_bug.cgi?id=1157689
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
---- a/posix/wordexp-test.c
-+++ b/posix/wordexp-test.c
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
---- a/posix/wordexp.c
-+++ b/posix/wordexp.c
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
diff --git a/package/glibc/2.20/0002-CVE-2014-9402.patch b/package/glibc/2.20/0002-CVE-2014-9402.patch
deleted file mode 100644
index d6d753e..0000000
--- a/package/glibc/2.20/0002-CVE-2014-9402.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix CVE-2014-9402 - denial of service in getnetbyname function.
-Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=11e3417af6e354f1942c68a271ae51e892b2814d
-See https://bugzilla.redhat.com/show_bug.cgi?id=1175369
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff --git a/resolv/nss_dns/dns-network.c b/resolv/nss_dns/dns-network.c
-index 0a77c8b..08cf0a6 100644
---- a/resolv/nss_dns/dns-network.c
-+++ b/resolv/nss_dns/dns-network.c
-@@ -398,8 +398,8 @@ getanswer_r (const querybuf *answer, int anslen, struct netent *result,
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
--- 
-1.7.1
-
diff --git a/package/glibc/2.20/0003-CVE-2015-1472.patch b/package/glibc/2.20/0003-CVE-2015-1472.patch
deleted file mode 100644
index b2f8e49..0000000
--- a/package/glibc/2.20/0003-CVE-2015-1472.patch
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
---- a/stdio-common/tst-sscanf.c
-+++ b/stdio-common/tst-sscanf.c
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
---- a/stdio-common/vfscanf.c
-+++ b/stdio-common/vfscanf.c
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
index 8cc8cce..72fd3df 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -32,17 +32,15 @@ config BR2_PACKAGE_GLIBC
 
 choice
 	prompt "glibc version"
-	default BR2_GLIBC_VERSION_2_20
-
-config BR2_GLIBC_VERSION_2_20
-	depends on !BR2_nios2
-	# Broken see https://bugs.busybox.net/show_bug.cgi?id=7941
-	depends on !BR2_sparc
-	bool "2.20"
+	default BR2_GLIBC_VERSION_2_21
 
 config BR2_GLIBC_VERSION_2_21
 	bool "2.21"
 
+config BR2_GLIBC_VERSION_2_22
+	bool "2.22"
+	depends on !BR2_sparc # broken
+
 endchoice
 
 endif
@@ -51,5 +49,5 @@ config BR2_GLIBC_VERSION_STRING
 	string
 	default "2.18-svnr23787" if BR2_EGLIBC_VERSION_2_18
 	default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
-	default "2.20" if BR2_GLIBC_VERSION_2_20
 	default "2.21" if BR2_GLIBC_VERSION_2_21
+	default "2.22" if BR2_GLIBC_VERSION_2_22
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 525a5ed..979202e 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -4,5 +4,5 @@ md5	b395b021422a027d89884992e91734fc	eglibc-2.18-svnr23787.tar.bz2
 sha1	224d9e655e8f0ad04ffde47b97a11c64e2255b56	eglibc-2.18-svnr23787.tar.bz2
 md5	197836c2ba42fb146e971222647198dd	eglibc-2.19-svnr25243.tar.bz2
 sha1	8013c1935b46fd50d2d1fbfad3b0af362b75fb28	eglibc-2.19-svnr25243.tar.bz2
-sha256	f84b6d42aecc288d593c397b0a3d02260a33ee686bce0c634eb9b32798f36ba5	glibc-2.20.tar.xz
 sha256  aeeb362437965a5d3f40b151094ca79def04a115bd363fdd4a9a0c69482923b8  glibc-2.21.tar.xz
+sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
-- 
2.4.6
