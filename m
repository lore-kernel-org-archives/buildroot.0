From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:58 -0800
Subject: [Buildroot] [buildroot 0000883]: [patch] Gettext progname per case
	patch did not get fully commited in revision 15161
Message-ID: <86467aa133e34c586ab750a28c0d5c8a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=883 
====================================================================== 
Reported By:                mastag
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   883
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-25-2006 07:08 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    [patch] Gettext progname per case patch did not get
fully commited in revision 15161
Description: 
As of revision 15161 the gettext makefile was edited to apply the patch:

--- trunk/buildroot/package/gettext/gettext.mk	2006/05/24 14:41:30	15160
+++ trunk/buildroot/package/gettext/gettext.mk	2006/05/24 14:57:27	15161
@@ -17,6 +17,7 @@
 
 $(GETTEXT_DIR)/.unpacked: $(DL_DIR)/$(GETTEXT_SOURCE)
 	$(GETTEXT_CAT) $(DL_DIR)/$(GETTEXT_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(GETTEXT_DIR) package/gettext/
gettext\*.patch
 	touch $(GETTEXT_DIR)/.unpacked
 
 $(GETTEXT_DIR)/.configured: $(GETTEXT_DIR)/.unpacked

But there was no patch commited, so it still fails as of revision 15161

creating ngettext
/home/mastag/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-uclibc-gcc
-DLOCALEDIR=\"/usr/share/locale\" -DUSEJEXE=0
-DGETTEXTJEXEDIR=\"/usr/lib/gettext\"
-DGETTEXTJAR=\"/usr/share/gettext/gettext.jar\" -DLIBDIR=\"/usr/lib\"
-DGETTEXTDATADIR=\"/usr/share/gettext\"
-DPROJECTSDIR=\"/usr/share/gettext/projects\" -DHAVE_CONFIG_H -I. -I. -I..
-I. -I. -I.. -I../libuniname -I../lib -I../lib -I../intl -I../intl    -Os
-pipe  -c msgcmp.c
/bin/sh ../libtool --mode=link
/home/mastag/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-uclibc-gcc
 -Os -pipe    -o msgcmp  msgcmp.o libgettextsrc.la
/home/mastag/buildroot/build_mipsel/staging_dir/bin/mipsel-linux-uclibc-gcc
-Os -pipe -o .libs/msgcmp msgcmp.o  ./.libs/libgettextsrc.so
/home/mastag/buildroot/build_mipsel/gettext-0.11.5/lib/.libs/libgettextlib.so
/home/mastag/buildroot/build_mipsel/gettext-0.11.5/intl/.libs/libintl.so
-lc
msgcmp.o: In function `main':
msgcmp.c:(.text+0x9d4): undefined reference to `error_print_progname'
collect2: ld returned 1 exit status
make[4]: *** [msgcmp] Fout 1
make[4]: Leaving directory
`/home/mastag/buildroot/build_mipsel/gettext-0.11.5/src'
make[3]: *** [all] Fout 2
make[3]: Leaving directory
`/home/mastag/buildroot/build_mipsel/gettext-0.11.5/src'
make[2]: *** [all-recursive] Fout 1
make[2]: Leaving directory
`/home/mastag/buildroot/build_mipsel/gettext-0.11.5'
make[1]: *** [all] Fout 2
make[1]: Leaving directory
`/home/mastag/buildroot/build_mipsel/gettext-0.11.5'
make: *** [/home/mastag/buildroot/build_mipsel/gettext-0.11.5/src/gettext]
Fout 2

Anyways here's the patch anyways against 15161

diff -Naur buildroot.old/package/gettext/gettext_progname.patch
buildroot/package/gettext/gettext_progname.patch
--- buildroot.old/package/gettext/gettext_progname.patch	1970-01-01
01:00:00.000000000 +0100
+++ buildroot/package/gettext/gettext_progname.patch	2006-05-23
21:45:26.000000000 +0200
@@ -0,0 +1,63 @@
+--- gettext-0.11.5/lib/error.c.orig	2002-01-30 14:47:27.000000000 +0100
++++ gettext-0.11.5/lib/error.c	2006-04-14 19:44:33.000000000 +0200
+@@ -62,15 +62,6 @@
+ # endif
+ #endif
+ 
+-/* If NULL, error will flush stdout, then print on stderr the program
+-   name, a colon and a space.  Otherwise, error will call this
+-   function without parameters instead.  */
+-void (*error_print_progname) (
+-#if __STDC__ - 0
+-			      void
+-#endif
+-			      );
+-
+ /* This variable is incremented each time `error' is called.  */
+ unsigned int error_message_count;
+ 
+--- gettext-0.11.5/lib/error.h.orig	2001-02-20 16:15:03.000000000 +0100
++++ gettext-0.11.5/lib/error.h	2006-04-14 19:45:28.000000000 +0200
+@@ -53,11 +53,6 @@
+ 			   unsigned int lineno, const char *format, ...)
+      __attribute__ ((__format__ (__printf__, 5, 6)));
+ 
+-/* If NULL, error will flush stdout, then print on stderr the program
+-   name, a colon and a space.  Otherwise, error will call this
+-   function without parameters instead.  */
+-extern void (*error_print_progname) (void);
+-
+ #else
+ void error ();
+ void error_at_line ();
+--- gettext-0.11.5/lib/progname.c.orig	2001-10-30 12:08:15.000000000
+0100
++++ gettext-0.11.5/lib/progname.c	2006-04-14 19:45:59.000000000 +0200
+@@ -67,3 +67,12 @@
+   if (error_with_progname)
+     fprintf (stderr, "%s: ", program_name);
+ }
++
++/* If NULL, error will flush stdout, then print on stderr the program
++   name, a colon and a space.  Otherwise, error will call this
++   function without parameters instead.  */
++void (*error_print_progname) (
++#if __STDC__ - 0
++			      void
++#endif
++			      );
+--- gettext-0.11.5/lib/progname.h.orig	2001-07-02 14:49:08.000000000
+0200
++++ gettext-0.11.5/lib/progname.h	2006-04-14 19:46:57.000000000 +0200
+@@ -45,4 +45,13 @@
+    is true.  */
+ extern void maybe_print_progname PARAMS ((void));
+ 
++/* If NULL, error will flush stdout, then print on stderr the program
++   name, a colon and a space.  Otherwise, error will call this
++   function without parameters instead.  */
++extern void (*error_print_progname) (
++#if defined (__STDC__) && __STDC__
++				    void
++#endif
++				    );
++
+ #endif /* _PROGNAME_H */

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 07-19-06 17:06  
---------------------------------------------------------------------- 
should work fine with latest uclibc snapshot 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-25-06 07:08  mastag         New Issue                                    
05-25-06 07:08  mastag         Status                   new => assigned     
05-25-06 07:08  mastag         Assigned To               => uClibc          
07-19-06 17:06  vapier         Note Added: 0001540                          
07-19-06 17:06  vapier         Status                   assigned => closed  
07-19-06 17:06  vapier         Resolution               open => no change
required
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
