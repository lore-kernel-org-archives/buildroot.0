From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  5 Aug 2008 23:37:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080806063722.19AF53C3F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-05 23:37:21 -0700 (Tue, 05 Aug 2008)
New Revision: 23059

Log:
busybox: additional 1.11.1 patches

Added:
   trunk/buildroot/package/busybox/busybox-1.11.1-ash.patch

Modified:
   trunk/buildroot/package/busybox/busybox-1.11.1-tar.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.11.1-ash.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.11.1-ash.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.11.1-ash.patch	2008-08-06 06:37:21 UTC (rev 23059)
@@ -0,0 +1,155 @@
+--- busybox-1.11.1/shell/ash.c	Wed Jun 25 14:51:23 2008
++++ busybox-1.11.1-ash/shell/ash.c	Wed Aug  6 00:47:45 2008
+@@ -1569,14 +1569,14 @@
+ static char *optptr;                   /* used by nextopt */
+ 
+ /*
+- * XXX - should get rid of.  have all builtins use getopt(3).  the
+- * library getopt must have the BSD extension static variable "optreset"
+- * otherwise it can't be used within the shell safely.
++ * XXX - should get rid of. Have all builtins use getopt(3).
++ * The library getopt must have the BSD extension static variable
++ * "optreset", otherwise it can't be used within the shell safely.
+  *
+- * Standard option processing (a la getopt) for builtin routines.  The
+- * only argument that is passed to nextopt is the option string; the
+- * other arguments are unnecessary.  It return the character, or '\0' on
+- * end of input.
++ * Standard option processing (a la getopt) for builtin routines.
++ * The only argument that is passed to nextopt is the option string;
++ * the other arguments are unnecessary. It returns the character,
++ * or '\0' on end of input.
+  */
+ static int
+ nextopt(const char *optstring)
+@@ -1587,13 +1587,20 @@
+ 
+ 	p = optptr;
+ 	if (p == NULL || *p == '\0') {
++		/* We ate entire "-param", take next one */
+ 		p = *argptr;
+-		if (p == NULL || *p != '-' || *++p == '\0')
++		if (p == NULL)
+ 			return '\0';
++		if (*p != '-')
++			return '\0';
++		if (*++p == '\0') /* just "-" ? */
++			return '\0';
+ 		argptr++;
+-		if (LONE_DASH(p))        /* check for "--" */
++		if (LONE_DASH(p)) /* "--" ? */
+ 			return '\0';
++		/* p => next "-param" */
+ 	}
++	/* p => some option char in the middle of a "-param" */
+ 	c = *p++;
+ 	for (q = optstring; *q != c;) {
+ 		if (*q == '\0')
+@@ -1602,8 +1609,11 @@
+ 			q++;
+ 	}
+ 	if (*++q == ':') {
+-		if (*p == '\0' && (p = *argptr++) == NULL)
+-			ash_msg_and_raise_error("no arg for -%c option", c);
++		if (*p == '\0') {
++			p = *argptr++;
++			if (p == NULL)
++				ash_msg_and_raise_error("no arg for -%c option", c);
++		}
+ 		optionarg = p;
+ 		p = NULL;
+ 	}
+@@ -7428,8 +7438,10 @@
+ 		else if (c != 'p')
+ 			abort();
+ #endif
+-	if (verify)
++	/* Mimic bash: just "command -v" doesn't complain, it's a nop */
++	if (verify && (*argptr != NULL)) {
+ 		return describe_command(*argptr, verify - VERIFY_BRIEF);
++	}
+ 
+ 	return 0;
+ }
+@@ -7788,16 +7800,33 @@
+ static void
+ evaltree(union node *n, int flags)
+ {
++
++	struct jmploc *volatile savehandler = exception_handler;
++	struct jmploc jmploc;
+ 	int checkexit = 0;
+ 	void (*evalfn)(union node *, int);
+-	unsigned isor;
+ 	int status;
++
+ 	if (n == NULL) {
+ 		TRACE(("evaltree(NULL) called\n"));
+-		goto out;
++		goto out1;
+ 	}
+ 	TRACE(("pid %d, evaltree(%p: %d, %d) called\n",
+ 			getpid(), n, n->type, flags));
++
++	exception_handler = &jmploc;
++	{
++		int err = setjmp(jmploc.loc);
++		if (err) {
++			/* if it was a signal, check for trap handlers */
++			if (exception == EXSIG)
++				goto out;
++			/* continue on the way out */
++			exception_handler = savehandler;
++			longjmp(exception_handler->loc, err);
++		}
++	}
++
+ 	switch (n->type) {
+ 	default:
+ #if DEBUG
+@@ -7843,19 +7872,20 @@
+ 		goto calleval;
+ 	case NAND:
+ 	case NOR:
+-	case NSEMI:
++	case NSEMI: {
++
+ #if NAND + 1 != NOR
+ #error NAND + 1 != NOR
+ #endif
+ #if NOR + 1 != NSEMI
+ #error NOR + 1 != NSEMI
+ #endif
+-		isor = n->type - NAND;
++		unsigned is_or = n->type - NAND;
+ 		evaltree(
+ 			n->nbinary.ch1,
+-			(flags | ((isor >> 1) - 1)) & EV_TESTED
++			(flags | ((is_or >> 1) - 1)) & EV_TESTED
+ 		);
+-		if (!exitstatus == isor)
++		if (!exitstatus == is_or)
+ 			break;
+ 		if (!evalskip) {
+ 			n = n->nbinary.ch2;
+@@ -7866,6 +7896,7 @@
+ 			break;
+ 		}
+ 		break;
++	}
+ 	case NIF:
+ 		evaltree(n->nif.test, EV_TESTED);
+ 		if (evalskip)
+@@ -7886,8 +7917,11 @@
+ 		exitstatus = status;
+ 		break;
+ 	}
++
+  out:
+-	if ((checkexit & exitstatus))
++	exception_handler = savehandler;
++ out1:
++	if (checkexit & exitstatus)
+ 		evalskip |= SKIPEVAL;
+ 	else if (pendingsig && dotrap())
+ 		goto exexit;

Modified: trunk/buildroot/package/busybox/busybox-1.11.1-tar.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.11.1-tar.patch	2008-08-06 00:51:43 UTC (rev 23058)
+++ trunk/buildroot/package/busybox/busybox-1.11.1-tar.patch	2008-08-06 06:37:21 UTC (rev 23059)
@@ -1,6 +1,6 @@
 --- busybox-1.11.1/archival/libunarchive/get_header_tar.c	Wed Jun 25 14:51:17 2008
-+++ busybox-1.11.1-tar/archival/libunarchive/get_header_tar.c	Sun Jul 20 19:11:45 2008
-@@ -261,26 +261,31 @@
++++ busybox-1.11.1-tar/archival/libunarchive/get_header_tar.c	Wed Jul 23 02:16:24 2008
+@@ -261,26 +261,33 @@
  	case '0':
  #if ENABLE_FEATURE_TAR_OLDGNU_COMPATIBILITY
  		if (last_char_is(file_header->name, '/')) {
@@ -27,7 +27,9 @@
 -		break;
 +		goto size0;
  	case '5':
++#if ENABLE_FEATURE_TAR_OLDGNU_COMPATIBILITY
 + set_dir:
++#endif
  		file_header->mode |= S_IFDIR;
 -		break;
 +		goto size0;
