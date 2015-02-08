From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Feb 2015 11:18:09 +0100
Subject: [Buildroot] [PATCH] glibc: bump version to 2.21
In-Reply-To: <1423333238-47401-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1423333238-47401-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150208101809.GA4028@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-02-07 18:20 +0000, Vicente Olivert Riera spake thusly:
> - Bump version to 2.21
> - Set version 2.20 as default
> - Remove version 2.19
> - Update the hash file

I would prefer this be done in separate patches;
  - add glibc-2.21
  - switch default to 2.20
  - remove 2.19

Regards,
Yann E. MORIN.

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/glibc/2.19/0001-CVE-2014-7817.patch |  173 ---------------------------
>  package/glibc/2.19/0002-CVE-2014-6040.patch |  141 ----------------------
>  package/glibc/2.19/0003-CVE-2014-9402.patch |   24 ----
>  package/glibc/Config.in                     |   10 +-
>  package/glibc/glibc.hash                    |   12 +-
>  5 files changed, 11 insertions(+), 349 deletions(-)
>  delete mode 100644 package/glibc/2.19/0001-CVE-2014-7817.patch
>  delete mode 100644 package/glibc/2.19/0002-CVE-2014-6040.patch
>  delete mode 100644 package/glibc/2.19/0003-CVE-2014-9402.patch
> 
> diff --git a/package/glibc/2.19/0001-CVE-2014-7817.patch b/package/glibc/2.19/0001-CVE-2014-7817.patch
> deleted file mode 100644
> index cd20c42..0000000
> --- a/package/glibc/2.19/0001-CVE-2014-7817.patch
> +++ /dev/null
> @@ -1,173 +0,0 @@
> -Patch from https://bugzilla.redhat.com/show_bug.cgi?id=1157689
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!! WARNING !!!
> -EMBARGOED !!! EMBARGOED !!! EMARGOED !!! EMBARGOED !!! EMBARGOED !!!
> -SECURITY !!! SECURITY !!! SECURITY !!! SECURITY !!! SECURITY !!!
> -
> -CVE-2014-7817:
> -
> -The function wordexp() fails to properly handle the WRDE_NOCMD
> -flag when processing arithmetic inputs in the form of "$((... ``))"
> -where "..." can be anything valid. The backticks in the arithmetic
> -epxression are evaluated by in a shell even if WRDE_NOCMD forbade
> -command substitution. This allows an attacker to attempt to pass
> -dangerous commands via constructs of the above form, and bypass
> -the WRDE_NOCMD flag. This patch fixes this by checking for WRDE_NOCMD
> -in parse_arith(). The patch also hardens parse_backticks() and 
> -parse_comm() to check for WRDE_NOCMD flag and return an error instead
> -of ever running a shell.
> -
> -We expand the testsuite and add 3 new regression tests of roughtly
> -the same form but with a couple of nested levels. 
> -
> -On top of the 3 new tests we add fork validation to the WRDE_NOCMD
> -testing. If any forks are detected during the execution of a wordexp()
> -call with WRDE_NOCMD, the test is marked as failed. This is slightly
> -heuristic since vfork might be used, but it provides a higher level
> -of assurance that no shells were executed as part of command substitution
> -with WRDE_NOCMD in effect. In addition it doesn't require libpthread or
> -libdl, instead we use the public implementation namespace function
> -__register_atfork (already part of the public ABI for libpthread).
> -
> -Tested on x86_64 with no regressions.
> -
> -2014-10-27  Carlos O'Donell  <carlos@redhat.com>
> -
> -	* wordexp-test.c (__dso_handle): Add prototype.
> -	(__register_atfork): Likewise.
> -	(__app_register_atfork): New function.
> -	(registered_forks): New global.
> -	(register_fork): New function.
> -	(test_case): Add 3 new tests for WRDE_CMDSUB.
> -	(main): Call __app_register_atfork.
> -	(testit): If WRDE_NOCMD set registered_forks to zero, run test, and
> -	if fork count is non-zero fail the test.
> -	* posix/wordexp.c (parse_arith): Return WRDE_NOCMD if WRDE_NOCMD flag
> -	is set and parsing '`'. 
> -	(parse_comm): Return WRDE_NOCMD if WRDE_NOCMD flag is set.
> -	(parse_backtick): Return WRDE_NOCMD if WRDE_NOCMD flag is set and
> -	parsing '`'.
> -
> -diff --git a/posix/wordexp-test.c b/posix/wordexp-test.c
> -index 4957006..5ce2a1b 100644
> ---- a/posix/wordexp-test.c
> -+++ b/posix/wordexp-test.c
> -@@ -27,6 +27,25 @@
> - 
> - #define IFS " \n\t"
> - 
> -+extern void *__dso_handle __attribute__ ((__weak__, __visibility__ ("hidden")));
> -+extern int __register_atfork (void (*) (void), void (*) (void), void (*) (void), void *);
> -+
> -+static int __app_register_atfork (void (*prepare) (void), void (*parent) (void), void (*child) (void))
> -+{
> -+  return __register_atfork (prepare, parent, child,
> -+			    &__dso_handle == NULL ? NULL : __dso_handle);
> -+}
> -+
> -+/* Number of forks seen.  */
> -+static int registered_forks;
> -+
> -+/* For each fork increment the fork count.  */
> -+static void
> -+register_fork (void)
> -+{
> -+  registered_forks++;
> -+}
> -+
> - struct test_case_struct
> - {
> -   int retval;
> -@@ -206,6 +225,12 @@ struct test_case_struct
> -     { WRDE_SYNTAX, NULL, "$((2+))", 0, 0, { NULL, }, IFS },
> -     { WRDE_SYNTAX, NULL, "`", 0, 0, { NULL, }, IFS },
> -     { WRDE_SYNTAX, NULL, "$((010+4+))", 0, 0, { NULL }, IFS },
> -+    /* Test for CVE-2014-7817. We test 3 combinations of command
> -+       substitution inside an arithmetic expression to make sure that
> -+       no commands are executed and error is returned.  */
> -+    { WRDE_CMDSUB, NULL, "$((`echo 1`))", WRDE_NOCMD, 0, { NULL, }, IFS },
> -+    { WRDE_CMDSUB, NULL, "$((1+`echo 1`))", WRDE_NOCMD, 0, { NULL, }, IFS },
> -+    { WRDE_CMDSUB, NULL, "$((1+$((`echo 1`))))", WRDE_NOCMD, 0, { NULL, }, IFS },
> - 
> -     { -1, NULL, NULL, 0, 0, { NULL, }, IFS },
> -   };
> -@@ -258,6 +283,15 @@ main (int argc, char *argv[])
> - 	  return -1;
> -     }
> - 
> -+  /* If we are not allowed to do command substitution, we install
> -+     fork handlers to verify that no forks happened.  No forks should
> -+     happen at all if command substitution is disabled.  */
> -+  if (__app_register_atfork (register_fork, NULL, NULL) != 0)
> -+    {
> -+      printf ("Failed to register fork handler.\n");
> -+      return -1;
> -+    }
> -+
> -   for (test = 0; test_case[test].retval != -1; test++)
> -     if (testit (&test_case[test]))
> -       ++fail;
> -@@ -367,6 +401,9 @@ testit (struct test_case_struct *tc)
> - 
> -   printf ("Test %d (%s): ", ++tests, tc->words);
> - 
> -+  if (tc->flags & WRDE_NOCMD)
> -+    registered_forks = 0;
> -+
> -   if (tc->flags & WRDE_APPEND)
> -     {
> -       /* initial wordexp() call, to be appended to */
> -@@ -378,6 +415,13 @@ testit (struct test_case_struct *tc)
> -     }
> -   retval = wordexp (tc->words, &we, tc->flags);
> - 
> -+  if ((tc->flags & WRDE_NOCMD)
> -+      && (registered_forks > 0))
> -+    {
> -+      printf ("FAILED fork called for WRDE_NOCMD\n");
> -+      return 1;
> -+    }
> -+
> -   if (tc->flags & WRDE_DOOFFS)
> -       start_offs = sav_we.we_offs;
> - 
> -diff --git a/posix/wordexp.c b/posix/wordexp.c
> -index b6b65dd..d6a158f 100644
> ---- a/posix/wordexp.c
> -+++ b/posix/wordexp.c
> -@@ -693,6 +693,12 @@ parse_arith (char **word, size_t *word_length, size_t *max_length,
> - 	  break;
> - 
> - 	case '`':
> -+	   if (flags & WRDE_NOCMD)
> -+	     {
> -+	       free (expr);
> -+	       return WRDE_NOCMD;
> -+	     }
> -+
> - 	  (*offset)++;
> - 	  error = parse_backtick (&expr, &expr_length, &expr_maxlen,
> - 				  words, offset, flags, NULL, NULL, NULL);
> -@@ -1144,6 +1150,10 @@ parse_comm (char **word, size_t *word_length, size_t *max_length,
> -   size_t comm_maxlen;
> -   char *comm = w_newword (&comm_length, &comm_maxlen);
> - 
> -+  /* Do nothing if command substitution should not succeed.  */
> -+  if (flags & WRDE_NOCMD)
> -+    return WRDE_CMDSUB;
> -+
> -   for (; words[*offset]; ++(*offset))
> -     {
> -       switch (words[*offset])
> -@@ -2121,6 +2131,9 @@ parse_backtick (char **word, size_t *word_length, size_t *max_length,
> -       switch (words[*offset])
> - 	{
> - 	case '`':
> -+	  if (flags & WRDE_NOCMD)
> -+	    return WRDE_NOCMD;
> -+
> - 	  /* Go -- give the script to the shell */
> - 	  error = exec_comm (comm, word, word_length, max_length, flags,
> - 			     pwordexp, ifs, ifs_white);
> diff --git a/package/glibc/2.19/0002-CVE-2014-6040.patch b/package/glibc/2.19/0002-CVE-2014-6040.patch
> deleted file mode 100644
> index d107b32..0000000
> --- a/package/glibc/2.19/0002-CVE-2014-6040.patch
> +++ /dev/null
> @@ -1,141 +0,0 @@
> -Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commit;h=41488498b6
> -See https://bugzilla.redhat.com/show_bug.cgi?id=1135841
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -diff -Nura glibc-2.19.orig/iconvdata/ibm1364.c glibc-2.19/iconvdata/ibm1364.c
> ---- glibc-2.19.orig/iconvdata/ibm1364.c	2015-01-08 16:02:54.370960818 -0300
> -+++ glibc-2.19/iconvdata/ibm1364.c	2015-01-08 16:02:57.607688939 -0300
> -@@ -220,7 +220,8 @@
> - 	  ++rp2;							      \
> - 									      \
> - 	uint32_t res;							      \
> --	if (__builtin_expect (ch < rp2->start, 0)			      \
> -+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
> -+	    || __builtin_expect (ch < rp2->start, 0)			      \
> - 	    || (res = DB_TO_UCS4[ch + rp2->idx],			      \
> - 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
> - 	  {								      \
> -diff -Nura glibc-2.19.orig/iconvdata/ibm932.c glibc-2.19/iconvdata/ibm932.c
> ---- glibc-2.19.orig/iconvdata/ibm932.c	2015-01-08 16:02:54.357953873 -0300
> -+++ glibc-2.19/iconvdata/ibm932.c	2015-01-08 16:02:57.608689473 -0300
> -@@ -73,11 +73,12 @@
> - 	  }								      \
> - 									      \
> - 	ch = (ch * 0x100) + inptr[1];					      \
> -+	/* ch was less than 0xfd.  */					      \
> -+	assert (ch < 0xfd00);						      \
> - 	while (ch > rp2->end)						      \
> - 	  ++rp2;							      \
> - 									      \
> --	if (__builtin_expect (rp2 == NULL, 0)				      \
> --	    || __builtin_expect (ch < rp2->start, 0)			      \
> -+	if (__builtin_expect (ch < rp2->start, 0)			      \
> - 	    || (res = __ibm932db_to_ucs4[ch + rp2->idx],		      \
> - 	    __builtin_expect (res, '\1') == 0 && ch !=0))		      \
> - 	  {								      \
> -diff -Nura glibc-2.19.orig/iconvdata/ibm933.c glibc-2.19/iconvdata/ibm933.c
> ---- glibc-2.19.orig/iconvdata/ibm933.c	2015-01-08 16:02:54.369960284 -0300
> -+++ glibc-2.19/iconvdata/ibm933.c	2015-01-08 16:02:57.608689473 -0300
> -@@ -161,7 +161,7 @@
> - 	while (ch > rp2->end)						      \
> - 	  ++rp2;							      \
> - 									      \
> --	if (__builtin_expect (rp2 == NULL, 0)				      \
> -+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
> - 	    || __builtin_expect (ch < rp2->start, 0)			      \
> - 	    || (res = __ibm933db_to_ucs4[ch + rp2->idx],		      \
> - 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
> -diff -Nura glibc-2.19.orig/iconvdata/ibm935.c glibc-2.19/iconvdata/ibm935.c
> ---- glibc-2.19.orig/iconvdata/ibm935.c	2015-01-08 16:02:54.373962421 -0300
> -+++ glibc-2.19/iconvdata/ibm935.c	2015-01-08 16:02:57.608689473 -0300
> -@@ -161,7 +161,7 @@
> - 	while (ch > rp2->end)						      \
> - 	  ++rp2;							      \
> - 									      \
> --	if (__builtin_expect (rp2 == NULL, 0)				      \
> -+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
> - 	    || __builtin_expect (ch < rp2->start, 0)			      \
> - 	    || (res = __ibm935db_to_ucs4[ch + rp2->idx],		      \
> - 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
> -diff -Nura glibc-2.19.orig/iconvdata/ibm937.c glibc-2.19/iconvdata/ibm937.c
> ---- glibc-2.19.orig/iconvdata/ibm937.c	2015-01-08 16:02:54.368959749 -0300
> -+++ glibc-2.19/iconvdata/ibm937.c	2015-01-08 16:02:57.608689473 -0300
> -@@ -161,7 +161,7 @@
> - 	while (ch > rp2->end)						      \
> - 	  ++rp2;							      \
> - 									      \
> --	if (__builtin_expect (rp2 == NULL, 0)				      \
> -+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
> - 	    || __builtin_expect (ch < rp2->start, 0)			      \
> - 	    || (res = __ibm937db_to_ucs4[ch + rp2->idx],		      \
> - 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
> -diff -Nura glibc-2.19.orig/iconvdata/ibm939.c glibc-2.19/iconvdata/ibm939.c
> ---- glibc-2.19.orig/iconvdata/ibm939.c	2015-01-08 16:02:54.369960284 -0300
> -+++ glibc-2.19/iconvdata/ibm939.c	2015-01-08 16:02:57.609690007 -0300
> -@@ -161,7 +161,7 @@
> - 	while (ch > rp2->end)						      \
> - 	  ++rp2;							      \
> - 									      \
> --	if (__builtin_expect (rp2 == NULL, 0)				      \
> -+	if (__builtin_expect (rp2->start == 0xffff, 0)			      \
> - 	    || __builtin_expect (ch < rp2->start, 0)			      \
> - 	    || (res = __ibm939db_to_ucs4[ch + rp2->idx],		      \
> - 		__builtin_expect (res, L'\1') == L'\0' && ch != '\0'))	      \
> -diff -Nura glibc-2.19.orig/iconvdata/ibm943.c glibc-2.19/iconvdata/ibm943.c
> ---- glibc-2.19.orig/iconvdata/ibm943.c	2015-01-08 16:02:54.370960818 -0300
> -+++ glibc-2.19/iconvdata/ibm943.c	2015-01-08 16:02:57.609690007 -0300
> -@@ -74,11 +74,12 @@
> - 	  }								      \
> - 									      \
> - 	ch = (ch * 0x100) + inptr[1];					      \
> -+	/* ch was less than 0xfd.  */					      \
> -+	assert (ch < 0xfd00);						      \
> - 	while (ch > rp2->end)						      \
> - 	  ++rp2;							      \
> - 									      \
> --	if (__builtin_expect (rp2 == NULL, 0)				      \
> --	    || __builtin_expect (ch < rp2->start, 0)			      \
> -+	if (__builtin_expect (ch < rp2->start, 0)			      \
> - 	    || (res = __ibm943db_to_ucs4[ch + rp2->idx],		      \
> - 	    __builtin_expect (res, '\1') == 0 && ch !=0))		      \
> - 	  {								      \
> -diff -Nura glibc-2.19.orig/iconvdata/Makefile glibc-2.19/iconvdata/Makefile
> ---- glibc-2.19.orig/iconvdata/Makefile	2015-01-08 16:02:54.344946929 -0300
> -+++ glibc-2.19/iconvdata/Makefile	2015-01-08 16:03:21.748578005 -0300
> -@@ -299,6 +299,7 @@
> - $(objpfx)iconv-test.out: run-iconv-test.sh $(objpfx)gconv-modules \
> - 			 $(addprefix $(objpfx),$(modules.so)) \
> - 			 $(common-objdir)/iconv/iconv_prog TESTS
> -+	iconv_modules="$(modules)" \
> - 	$(SHELL) $< $(common-objdir) '$(test-wrapper)' > $@
> - 
> - $(objpfx)tst-tables.out: tst-tables.sh $(objpfx)gconv-modules \
> -diff -Nura glibc-2.19.orig/iconvdata/run-iconv-test.sh glibc-2.19/iconvdata/run-iconv-test.sh
> ---- glibc-2.19.orig/iconvdata/run-iconv-test.sh	2015-01-08 16:02:54.322935176 -0300
> -+++ glibc-2.19/iconvdata/run-iconv-test.sh	2015-01-08 16:02:57.609690007 -0300
> -@@ -188,6 +188,24 @@
> - 
> - done < TESTS2
> - 
> -+# Check for crashes in decoders.
> -+printf '\016\377\377\377\377\377\377\377' > $temp1
> -+for from in $iconv_modules ; do
> -+    echo $ac_n "test decoder $from $ac_c"
> -+    PROG=`eval echo $ICONV`
> -+    if $PROG < $temp1 >/dev/null 2>&1 ; then
> -+	: # fall through
> -+    else
> -+	status=$?
> -+	if test $status -gt 1 ; then
> -+	    echo "/FAILED"
> -+	    failed=1
> -+	    continue
> -+	fi
> -+    fi
> -+    echo "OK"
> -+done
> -+
> - exit $failed
> - # Local Variables:
> - #  mode:shell-script
> diff --git a/package/glibc/2.19/0003-CVE-2014-9402.patch b/package/glibc/2.19/0003-CVE-2014-9402.patch
> deleted file mode 100644
> index d6d753e..0000000
> --- a/package/glibc/2.19/0003-CVE-2014-9402.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Fix CVE-2014-9402 - denial of service in getnetbyname function.
> -Backport from https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=11e3417af6e354f1942c68a271ae51e892b2814d
> -See https://bugzilla.redhat.com/show_bug.cgi?id=1175369
> -
> -Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> -
> -diff --git a/resolv/nss_dns/dns-network.c b/resolv/nss_dns/dns-network.c
> -index 0a77c8b..08cf0a6 100644
> ---- a/resolv/nss_dns/dns-network.c
> -+++ b/resolv/nss_dns/dns-network.c
> -@@ -398,8 +398,8 @@ getanswer_r (const querybuf *answer, int anslen, struct netent *result,
> - 
> - 	case BYNAME:
> - 	  {
> --	    char **ap = result->n_aliases++;
> --	    while (*ap != NULL)
> -+	    char **ap;
> -+	    for (ap = result->n_aliases; *ap != NULL; ++ap)
> - 	      {
> - 		/* Check each alias name for being of the forms:
> - 		   4.3.2.1.in-addr.arpa		= net 1.2.3.4
> --- 
> -1.7.1
> -
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 8c033f2..b1c0364 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -30,14 +30,14 @@ config BR2_PACKAGE_GLIBC
>  
>  choice
>  	prompt "glibc version"
> -	default BR2_GLIBC_VERSION_2_19
> -
> -config BR2_GLIBC_VERSION_2_19
> -	bool "2.19"
> +	default BR2_GLIBC_VERSION_2_20
>  
>  config BR2_GLIBC_VERSION_2_20
>  	bool "2.20"
>  
> +config BR2_GLIBC_VERSION_2_21
> +	bool "2.21"
> +
>  endchoice
>  
>  endif
> @@ -46,5 +46,5 @@ config BR2_GLIBC_VERSION_STRING
>  	string
>  	default "2.18-svnr23787" if BR2_EGLIBC_VERSION_2_18
>  	default "2.19-svnr25243" if BR2_EGLIBC_VERSION_2_19
> -	default "2.19" if BR2_GLIBC_VERSION_2_19
>  	default "2.20" if BR2_GLIBC_VERSION_2_20
> +	default "2.21" if BR2_GLIBC_VERSION_2_21
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 094bbda..245f40f 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,8 +1,8 @@
>  # Locally calculated after checking pgp signature (glibc)
>  # http://downloads.yoctoproject.org/releases/eglibc/*.{md5,sha1} (eglibc)
> -md5	b395b021422a027d89884992e91734fc	eglibc-2.18-svnr23787.tar.bz2
> -sha1	224d9e655e8f0ad04ffde47b97a11c64e2255b56	eglibc-2.18-svnr23787.tar.bz2
> -md5	197836c2ba42fb146e971222647198dd	eglibc-2.19-svnr25243.tar.bz2
> -sha1	8013c1935b46fd50d2d1fbfad3b0af362b75fb28	eglibc-2.19-svnr25243.tar.bz2
> -sha256	2d3997f588401ea095a0b27227b1d50cdfdd416236f6567b564549d3b46ea2a2	glibc-2.19.tar.xz
> -sha256	f84b6d42aecc288d593c397b0a3d02260a33ee686bce0c634eb9b32798f36ba5	glibc-2.20.tar.xz
> +md5     b395b021422a027d89884992e91734fc                                  eglibc-2.18-svnr23787.tar.bz2
> +sha1    224d9e655e8f0ad04ffde47b97a11c64e2255b56                          eglibc-2.18-svnr23787.tar.bz2
> +md5     197836c2ba42fb146e971222647198dd                                  eglibc-2.19-svnr25243.tar.bz2
> +sha1    8013c1935b46fd50d2d1fbfad3b0af362b75fb28                          eglibc-2.19-svnr25243.tar.bz2
> +sha256  f84b6d42aecc288d593c397b0a3d02260a33ee686bce0c634eb9b32798f36ba5  glibc-2.20.tar.xz
> +sha256  aeeb362437965a5d3f40b151094ca79def04a115bd363fdd4a9a0c69482923b8  glibc-2.21.tar.xz
> -- 
> 1.7.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
