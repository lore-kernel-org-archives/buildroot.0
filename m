From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sat,  3 Feb 2007 12:52:34 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20070203205234.6E42B48629@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-03 12:52:33 -0800 (Sat, 03 Feb 2007)
New Revision: 17743

Log:
grumble grumble.  fontconfig's fc-lang is broken upstream and
doesn't understand how to deal with trailing whitespace...  So
I had to whip up this patch to bludgeon it into submission.


Added:
   trunk/buildroot/package/fontconfig/fc-lang.patch


Changeset:
Added: trunk/buildroot/package/fontconfig/fc-lang.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fc-lang.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/fc-lang.patch	2007-02-03 20:52:33 UTC (rev 17743)
@@ -0,0 +1,51 @@
+--- /tmp/Makefile.am	2006-04-25 15:47:49.313035880 +0200
++++ fontconfig-2.3.94/fc-lang/Makefile.am	2006-04-25 15:48:22.807943880 +0200
+@@ -31,6 +31,7 @@
+ TMPL=fclang.tmpl.h
+ STMPL=${top_srcdir}/fc-lang/fclang.tmpl.h
+ TARG=fclang.h
++FC_LANG=./fc-lang
+ 
+ noinst_PROGRAMS=fc-lang
+ 
+@@ -44,6 +45,6 @@
+ 
+ $(TARG):$(ORTH) fc-lang${EXEEXT} $(STMPL)
+ 	rm -f $(TARG)
+-	./fc-lang${EXEEXT} -d ${srcdir} $(ORTH) < $(STMPL) > $(TARG)
++	$(FC_LANG)${EXEEXT} -d ${srcdir} $(ORTH) < $(STMPL) > $(TARG)
+ 
+ CLEANFILES=$(TARG)
+--- fontconfig-2.4.2/fc-lang/fc-lang.orig.c	2007-02-03 13:39:49.000000000 -0700
++++ fontconfig-2.4.2/fc-lang/fc-lang.c	2007-02-03 13:46:08.000000000 -0700
+@@ -116,6 +116,20 @@
+     return f;
+ }
+ 
++char* trim(char *s)
++{
++	int len = strlen(s);
++
++	/* nuke trailing whitespace */
++	while (len > 0 && (isspace(s[len - 1]) || s[len - 1]=='\n'))
++		s[--len] = '\0';
++
++	/* skip leading whitespace */
++	s += strspn(s, " \n\r\t\v");
++
++	return s;
++}
++
+ /*
+  * build a single charset from a source file
+  *
+@@ -142,8 +156,7 @@
+             if (!file)
+                 fatal (line, lineno, 
+                        "invalid syntax, expected: include filename");
+-	    while (isspace(*file))
+-		file++;
++	    file = trim(file);
+ 	    f = scanopen (file);
+ 	    if (!f)
+ 		fatal (file, 0, "can't open");
