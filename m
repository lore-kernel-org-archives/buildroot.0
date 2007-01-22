From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 22 Jan 2007 11:22:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20070122192256.AF0184855D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-22 11:22:55 -0800 (Mon, 22 Jan 2007)
New Revision: 17474

Log:
- remove accidentally checked in debugging cruft


Removed:
   trunk/buildroot/toolchain/gcc/4.2/900-gengtype-verbose-error.patch


Changeset:
Deleted: trunk/buildroot/toolchain/gcc/4.2/900-gengtype-verbose-error.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/900-gengtype-verbose-error.patch	2007-01-22 19:17:23 UTC (rev 17473)
+++ trunk/buildroot/toolchain/gcc/4.2/900-gengtype-verbose-error.patch	2007-01-22 19:22:55 UTC (rev 17474)
@@ -1,27 +0,0 @@
-Index: gcc-4.2/gcc/gengtype-lex.l
-===================================================================
---- gcc-4.2/gcc/gengtype-lex.l	(revision 121000)
-+++ gcc-4.2/gcc/gengtype-lex.l	(working copy)
-@@ -535,13 +535,19 @@
- macro_input (char *buffer, unsigned size)
- {
-   unsigned result;
-+  int old_errno;
- 
-   result = fread (buffer, 1, size, yyin);
-+  old_errno = errno;
-   if (result)
-     /*NOP*/;
--  else if (ferror (yyin))
--    YY_FATAL_ERROR ("read of source file failed");
--  else if (macro_expns)
-+  else if (ferror (yyin)) {
-+    char *err_msg;
-+    err_msg = xasprintf ("read of source file '%s:%d' failed",
-+    			lexer_line.file,
-+    			lexer_line.line);
-+    YY_FATAL_ERROR (err_msg);
-+  } else if (macro_expns)
-     {
-       const char *expn;
-       unsigned len;
