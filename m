From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jun 2016 20:39:41 -0300
Subject: [Buildroot] [PATCH] pcre: bump to version 8.39
Message-ID: <1465947581-5930-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patches and giterize/rebase the other ones.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...at.patch => 0001-Kill-compatibility-bits.patch} |  24 ++-
 ...tests.patch => 0002-Disable-C-unit-tests.patch} |  25 ++-
 package/pcre/0003-fix-CVE-2016-1283.patch          |  44 ------
 package/pcre/0004-fix-CVE-2016-3191.patch          | 174 ---------------------
 package/pcre/pcre.hash                             |   2 +-
 package/pcre/pcre.mk                               |   2 +-
 6 files changed, 38 insertions(+), 233 deletions(-)
 rename package/pcre/{0001-no-compat.patch => 0001-Kill-compatibility-bits.patch} (63%)
 rename package/pcre/{0002-no-cpp-tests.patch => 0002-Disable-C-unit-tests.patch} (66%)
 delete mode 100644 package/pcre/0003-fix-CVE-2016-1283.patch
 delete mode 100644 package/pcre/0004-fix-CVE-2016-3191.patch

diff --git a/package/pcre/0001-no-compat.patch b/package/pcre/0001-Kill-compatibility-bits.patch
similarity index 63%
rename from package/pcre/0001-no-compat.patch
rename to package/pcre/0001-Kill-compatibility-bits.patch
index 7099727..3563e4b 100644
--- a/package/pcre/0001-no-compat.patch
+++ b/package/pcre/0001-Kill-compatibility-bits.patch
@@ -1,12 +1,21 @@
+From e180a4085d8d2f82a05f037e465708cfc16bd2bf Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 14 Jun 2016 20:31:12 -0300
+Subject: [PATCH] Kill compatibility bits
+
 Kill ABI compatibility bits, we don't need them.
-Fixes build failures on non-ELF (blackfin) targets.
+Fixes build failures on non-ELF targets.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ pcrecpp.cc | 16 ----------------
+ 1 file changed, 16 deletions(-)
 
-diff -Nura pcre-8.32.orig/pcrecpp.cc pcre-8.32/pcrecpp.cc
---- pcre-8.32.orig/pcrecpp.cc	2012-12-28 08:32:10.193847937 -0300
-+++ pcre-8.32/pcrecpp.cc	2012-12-28 08:32:26.924376180 -0300
-@@ -58,22 +58,6 @@
+diff --git a/pcrecpp.cc b/pcrecpp.cc
+index d09c9ab..6910db0 100644
+--- a/pcrecpp.cc
++++ b/pcrecpp.cc
+@@ -58,22 +58,6 @@ static const int kVecSize = (1 + kMaxArgs) * 3;  // results + PCRE workspace
  // Special object that stands-in for no argument
  Arg RE::no_arg((void*)NULL);
  
@@ -18,7 +27,7 @@ diff -Nura pcre-8.32.orig/pcrecpp.cc pcre-8.32/pcrecpp.cc
 -// inclusive test if we ever needed it.  (Note that not only the
 -// __attribute__ syntax, but also __USER_LABEL_PREFIX__, are
 -// gnu-specific.)
--#if defined(__GNUC__) && __GNUC__ >= 3 && defined(__ELF__)
+-#if defined(__GNUC__) && __GNUC__ >= 3 && defined(__ELF__) && !defined(__INTEL_COMPILER)
 -# define ULP_AS_STRING(x)            ULP_AS_STRING_INTERNAL(x)
 -# define ULP_AS_STRING_INTERNAL(x)   #x
 -# define USER_LABEL_PREFIX_STR       ULP_AS_STRING(__USER_LABEL_PREFIX__)
@@ -29,3 +38,6 @@ diff -Nura pcre-8.32.orig/pcrecpp.cc pcre-8.32/pcrecpp.cc
  // If a regular expression has no error, its error_ field points here
  static const string empty_string;
  
+-- 
+2.7.3
+
diff --git a/package/pcre/0002-no-cpp-tests.patch b/package/pcre/0002-Disable-C-unit-tests.patch
similarity index 66%
rename from package/pcre/0002-no-cpp-tests.patch
rename to package/pcre/0002-Disable-C-unit-tests.patch
index 0255028..c5c1a49 100644
--- a/package/pcre/0002-no-cpp-tests.patch
+++ b/package/pcre/0002-Disable-C-unit-tests.patch
@@ -1,12 +1,20 @@
-Disable PCRE C++ unit tests, they fail to build on static scenarios
-and they're not installed.
+From e3c636b8c7f9912d8d3a9fabdaa0a96ba69f7b29 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Tue, 14 Jun 2016 20:32:44 -0300
+Subject: [PATCH] Disable C++ unit tests
+
+They fail to build on static targets and they're not installed anyway.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Makefile.in | 9 ---------
+ 1 file changed, 9 deletions(-)
 
-diff -Nura pcre-8.33.orig/Makefile.in pcre-8.33/Makefile.in
---- pcre-8.33.orig/Makefile.in	2013-05-28 06:09:27.000000000 -0300
-+++ pcre-8.33/Makefile.in	2013-09-03 11:28:28.398198832 -0300
-@@ -123,12 +123,6 @@
+diff --git a/Makefile.in b/Makefile.in
+index 6d03912..2c42b3e 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -133,12 +133,6 @@ noinst_PROGRAMS = $(am__EXEEXT_2) $(am__EXEEXT_3) $(am__EXEEXT_4)
  @WITH_PCRE8_TRUE at am__append_20 = libpcreposix.la
  @WITH_GCOV_TRUE@@WITH_PCRE8_TRUE at am__append_21 = $(GCOV_CFLAGS)
  @WITH_PCRE_CPP_TRUE at am__append_22 = libpcrecpp.la
@@ -19,7 +27,7 @@ diff -Nura pcre-8.33.orig/Makefile.in pcre-8.33/Makefile.in
  @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE at am__append_25 = $(GCOV_CXXFLAGS)
  @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE at am__append_26 = $(GCOV_LIBS)
  @WITH_GCOV_TRUE@@WITH_PCRE_CPP_TRUE at am__append_27 = $(GCOV_LIBS)
-@@ -360,9 +354,6 @@
+@@ -362,9 +356,6 @@ libpcreposix_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC \
  @WITH_PCRE8_TRUE at am__EXEEXT_1 = pcregrep$(EXEEXT)
  @WITH_REBUILD_CHARTABLES_TRUE at am__EXEEXT_2 = dftables$(EXEEXT)
  @WITH_JIT_TRUE at am__EXEEXT_3 = pcre_jit_test$(EXEEXT)
@@ -29,3 +37,6 @@ diff -Nura pcre-8.33.orig/Makefile.in pcre-8.33/Makefile.in
  PROGRAMS = $(bin_PROGRAMS) $(noinst_PROGRAMS)
  am__dftables_SOURCES_DIST = dftables.c
  @WITH_REBUILD_CHARTABLES_TRUE at am_dftables_OBJECTS =  \
+-- 
+2.7.3
+
diff --git a/package/pcre/0003-fix-CVE-2016-1283.patch b/package/pcre/0003-fix-CVE-2016-1283.patch
deleted file mode 100644
index 8a4349c..0000000
--- a/package/pcre/0003-fix-CVE-2016-1283.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b7537308b7c758f33c347cb0bec62754c43c271f Mon Sep 17 00:00:00 2001
-From: ph10 <ph10@2f5784b3-3f2a-0410-8824-cb99058d5e15>
-Date: Sat, 27 Feb 2016 17:38:11 +0000
-Subject: [PATCH] Yet another duplicate name bugfix by overestimating the
- memory needed (i.e. another hack - PCRE2 has this "properly" fixed).
-
-git-svn-id: svn://vcs.exim.org/pcre/code/trunk at 1636 2f5784b3-3f2a-0410-8824-cb99058d5e15
-
-Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
----
- ChangeLog            | 7 +++++++
- pcre_compile.c       | 7 ++++++-
- testdata/testinput2  | 2 ++
- testdata/testoutput2 | 2 ++
- 4 files changed, 17 insertions(+), 1 deletion(-)
-
-14. And yet another buffer overflow bug involving duplicate named groups, this
-    time nested, with a nested back reference. Yet again, I have just allowed
-    for more memory, because anything more needs all the refactoring that has
-    been done for PCRE2. An example pattern that provoked this bug is:
-    /((?J)(?'R'(?'R'(?'R'(?'R'(?'R'(?|(\k'R'))))))))/ and the bug was
-    registered as CVE-2016-1283.
-
-diff --git a/pcre_compile.c b/pcre_compile.c
-index 5019854..4ffea0c 100644
---- a/pcre_compile.c
-+++ b/pcre_compile.c
-@@ -7311,7 +7311,12 @@ for (;; ptr++)
-           so far in order to get the number. If the name is not found, leave
-           the value of recno as 0 for a forward reference. */
- 
--          else
-+          /* This patch (removing "else") fixes a problem when a reference is
-+          to multiple identically named nested groups from within the nest.
-+          Once again, it is not the "proper" fix, and it results in an
-+          over-allocation of memory. */
-+
-+          /* else */
-             {
-             ng = cd->named_groups;
-             for (i = 0; i < cd->names_found; i++, ng++)
--- 
-2.7.4
-
diff --git a/package/pcre/0004-fix-CVE-2016-3191.patch b/package/pcre/0004-fix-CVE-2016-3191.patch
deleted file mode 100644
index b28aaf6..0000000
--- a/package/pcre/0004-fix-CVE-2016-3191.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From 943a5105b9fe2842851003f692c7077a6cdbeefe Mon Sep 17 00:00:00 2001
-From: ph10 <ph10@2f5784b3-3f2a-0410-8824-cb99058d5e15>
-Date: Wed, 10 Feb 2016 19:13:17 +0000
-Subject: [PATCH] Fix workspace overflow for (*ACCEPT) with deeply nested
- parentheses.
-
-git-svn-id: svn://vcs.exim.org/pcre/code/trunk at 1631 2f5784b3-3f2a-0410-8824-cb99058d5e15
-
-Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
----
- ChangeLog                | 32 ++++++++++++++++++--------------
- pcre_compile.c           | 23 +++++++++++++++++++----
- pcre_internal.h          |  4 ++--
- pcreposix.c              |  5 +++--
- testdata/testinput11     |  2 ++
- testdata/testoutput11-16 |  3 +++
- testdata/testoutput11-32 |  3 +++
- testdata/testoutput11-8  |  3 +++
- 8 files changed, 53 insertions(+), 22 deletions(-)
-
-13. A pattern that included (*ACCEPT) in the middle of a sufficiently deeply
-    nested set of parentheses of sufficient size caused an overflow of the
-    compiling workspace (which was diagnosed, but of course is not desirable).
-
-diff --git a/pcre_compile.c b/pcre_compile.c
-index b9a239e..5019854 100644
---- a/pcre_compile.c
-+++ b/pcre_compile.c
-@@ -6,7 +6,7 @@
- and semantics are as close as possible to those of the Perl 5 language.
- 
-                        Written by Philip Hazel
--           Copyright (c) 1997-2014 University of Cambridge
-+           Copyright (c) 1997-2016 University of Cambridge
- 
- -----------------------------------------------------------------------------
- Redistribution and use in source and binary forms, with or without
-@@ -560,6 +560,7 @@ static const char error_texts[] =
-   /* 85 */
-   "parentheses are too deeply nested (stack check)\0"
-   "digits missing in \\x{} or \\o{}\0"
-+  "regular expression is too complicated\0"
-   ;
- 
- /* Table to identify digits and hex digits. This is used when compiling
-@@ -4591,7 +4592,8 @@ for (;; ptr++)
-     if (code > cd->start_workspace + cd->workspace_size -
-         WORK_SIZE_SAFETY_MARGIN)                       /* Check for overrun */
-       {
--      *errorcodeptr = ERR52;
-+      *errorcodeptr = (code >= cd->start_workspace + cd->workspace_size)?
-+        ERR52 : ERR87;
-       goto FAILED;
-       }
- 
-@@ -6626,8 +6628,21 @@ for (;; ptr++)
-             cd->had_accept = TRUE;
-             for (oc = cd->open_caps; oc != NULL; oc = oc->next)
-               {
--              *code++ = OP_CLOSE;
--              PUT2INC(code, 0, oc->number);
-+              if (lengthptr != NULL)
-+                {
-+#ifdef COMPILE_PCRE8
-+                *lengthptr += 1 + IMM2_SIZE;
-+#elif defined COMPILE_PCRE16
-+                *lengthptr += 2 + IMM2_SIZE;
-+#elif defined COMPILE_PCRE32
-+                *lengthptr += 4 + IMM2_SIZE;
-+#endif
-+                }
-+              else
-+                {
-+                *code++ = OP_CLOSE;
-+                PUT2INC(code, 0, oc->number);
-+                }
-               }
-             setverb = *code++ =
-               (cd->assert_depth > 0)? OP_ASSERT_ACCEPT : OP_ACCEPT;
-diff --git a/pcre_internal.h b/pcre_internal.h
-index f7a5ee7..dbfe80e 100644
---- a/pcre_internal.h
-+++ b/pcre_internal.h
-@@ -7,7 +7,7 @@
- and semantics are as close as possible to those of the Perl 5 language.
- 
-                        Written by Philip Hazel
--           Copyright (c) 1997-2014 University of Cambridge
-+           Copyright (c) 1997-2016 University of Cambridge
- 
- -----------------------------------------------------------------------------
- Redistribution and use in source and binary forms, with or without
-@@ -2289,7 +2289,7 @@ enum { ERR0,  ERR1,  ERR2,  ERR3,  ERR4,  ERR5,  ERR6,  ERR7,  ERR8,  ERR9,
-        ERR50, ERR51, ERR52, ERR53, ERR54, ERR55, ERR56, ERR57, ERR58, ERR59,
-        ERR60, ERR61, ERR62, ERR63, ERR64, ERR65, ERR66, ERR67, ERR68, ERR69,
-        ERR70, ERR71, ERR72, ERR73, ERR74, ERR75, ERR76, ERR77, ERR78, ERR79,
--       ERR80, ERR81, ERR82, ERR83, ERR84, ERR85, ERR86, ERRCOUNT };
-+       ERR80, ERR81, ERR82, ERR83, ERR84, ERR85, ERR86, ERR87, ERRCOUNT };
- 
- /* JIT compiling modes. The function list is indexed by them. */
- 
-diff --git a/pcreposix.c b/pcreposix.c
-index dcc13ef..55b6ddc 100644
---- a/pcreposix.c
-+++ b/pcreposix.c
-@@ -6,7 +6,7 @@
- and semantics are as close as possible to those of the Perl 5 language.
- 
-                        Written by Philip Hazel
--           Copyright (c) 1997-2014 University of Cambridge
-+           Copyright (c) 1997-2016 University of Cambridge
- 
- -----------------------------------------------------------------------------
- Redistribution and use in source and binary forms, with or without
-@@ -173,7 +173,8 @@ static const int eint[] = {
-   REG_BADPAT,  /* group name must start with a non-digit */
-   /* 85 */
-   REG_BADPAT,  /* parentheses too deeply nested (stack check) */
--  REG_BADPAT   /* missing digits in \x{} or \o{} */
-+  REG_BADPAT,  /* missing digits in \x{} or \o{} */
-+  REG_BADPAT   /* pattern too complicated */
- };
- 
- /* Table of texts corresponding to POSIX error codes */
-diff --git a/testdata/testinput11 b/testdata/testinput11
-index ac9d228..6f0989a 100644
---- a/testdata/testinput11
-+++ b/testdata/testinput11
-@@ -138,4 +138,6 @@ is required for these tests. --/
- 
- /.((?2)(?R)\1)()/B
- 
-+/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
-+
- /-- End of testinput11 --/
-diff --git a/testdata/testoutput11-16 b/testdata/testoutput11-16
-index 280692e..3c485da 100644
---- a/testdata/testoutput11-16
-+++ b/testdata/testoutput11-16
-@@ -765,4 +765,7 @@ Memory allocation (code space): 14
-  25     End
- ------------------------------------------------------------------
- 
-+/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
-+Failed: regular expression is too complicated at offset 490
-+
- /-- End of testinput11 --/
-diff --git a/testdata/testoutput11-32 b/testdata/testoutput11-32
-index cdbda74..e19518d 100644
---- a/testdata/testoutput11-32
-+++ b/testdata/testoutput11-32
-@@ -765,4 +765,7 @@ Memory allocation (code space): 28
-  25     End
- ------------------------------------------------------------------
- 
-+/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
-+Failed: missing ) at offset 509
-+
- /-- End of testinput11 --/
-diff --git a/testdata/testoutput11-8 b/testdata/testoutput11-8
-index cb37896..5a4fbb2 100644
---- a/testdata/testoutput11-8
-+++ b/testdata/testoutput11-8
-@@ -765,4 +765,7 @@ Memory allocation (code space): 10
-  38     End
- ------------------------------------------------------------------
- 
-+/([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00]([00](*ACCEPT)/
-+Failed: missing ) at offset 509
-+
- /-- End of testinput11 --/
--- 
-2.7.4
-
diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index 5b580a7..bc50042 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b9e02d36e23024d6c02a2e5b25204b3a4fa6ade43e0a5f869f254f49535079df	pcre-8.38.tar.bz2
+sha256	b858099f82483031ee02092711689e7245586ada49e534a06e678b8ea9549e8b	pcre-8.39.tar.bz2
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index 7fcc592..a10950d 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.38
+PCRE_VERSION = 8.39
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3c
-- 
2.7.3
