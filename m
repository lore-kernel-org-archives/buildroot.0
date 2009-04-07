From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  7 Apr 2009 07:01:20 +0000 (UTC)
Subject: [Buildroot] svn commit: [26007] trunk/buildroot/package/openssl
Message-ID: <20090407070120.F1F0D768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-07 07:01:20 +0000 (Tue, 07 Apr 2009)
New Revision: 26007

Log:
openssl: bump version

Patch by Gustavo Zacarias <gustavo@zacarias.com.ar>, closes #217

Fixes multiple security flaws - See
http://www.openssl.org/news/secadv_20090325.txt for details.

Added:
   trunk/buildroot/package/openssl/openssl-0.9.8k-do-not-build-docs.patch
   trunk/buildroot/package/openssl/openssl-0.9.8k-dont-force-large-file.patch
   trunk/buildroot/package/openssl/openssl-0.9.8k-nofips.patch
   trunk/buildroot/package/openssl/openssl-0.9.8k-uclibc-susv3-legacy.patch

Removed:
   trunk/buildroot/package/openssl/openssl-0.9.8j-do-not-build-docs.patch
   trunk/buildroot/package/openssl/openssl-0.9.8j-dont-force-large-file.patch
   trunk/buildroot/package/openssl/openssl-0.9.8j-nofips.patch
   trunk/buildroot/package/openssl/openssl-0.9.8j-uclibc-susv3-legacy.patch

Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Deleted: trunk/buildroot/package/openssl/openssl-0.9.8j-do-not-build-docs.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8j-do-not-build-docs.patch	2009-04-07 06:23:17 UTC (rev 26006)
+++ trunk/buildroot/package/openssl/openssl-0.9.8j-do-not-build-docs.patch	2009-04-07 07:01:20 UTC (rev 26007)
@@ -1,13 +0,0 @@
-Dont waste time building manpages if we're not going to use em.
-
---- openssl/Makefile.org
-+++ openssl/Makefile.org
-@@ -792,7 +792,7 @@
- dist_pem_h:
- 	(cd crypto/pem; $(MAKE) CC='${CC}' SDIRS='${SDIRS}' CFLAG='${CFLAG}' pem.h; $(MAKE) clean)
- 
--install: all install_docs install_sw
-+install: all install_sw
- 
- install_sw:
- 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \

Deleted: trunk/buildroot/package/openssl/openssl-0.9.8j-dont-force-large-file.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8j-dont-force-large-file.patch	2009-04-07 06:23:17 UTC (rev 26006)
+++ trunk/buildroot/package/openssl/openssl-0.9.8j-dont-force-large-file.patch	2009-04-07 07:01:20 UTC (rev 26007)
@@ -1,19 +0,0 @@
-[patch]: bss_file.c: don't force largefile mode
----
- crypto/bio/bss_file.c |    3 ---
- 1 file changed, 3 deletions(-)
-
-Index: openssl-0.9.8g/crypto/bio/bss_file.c
-===================================================================
---- openssl-0.9.8g.orig/crypto/bio/bss_file.c
-+++ openssl-0.9.8g/crypto/bio/bss_file.c
-@@ -78,9 +78,6 @@
-  * sequential access of large files without extra "magic" comprise *BSD,
-  * Darwin, IRIX...
-  */
--#ifndef _FILE_OFFSET_BITS
--#define _FILE_OFFSET_BITS 64
--#endif
- #endif
- 
- #include <stdio.h>

Deleted: trunk/buildroot/package/openssl/openssl-0.9.8j-nofips.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8j-nofips.patch	2009-04-07 06:23:17 UTC (rev 26006)
+++ trunk/buildroot/package/openssl/openssl-0.9.8j-nofips.patch	2009-04-07 07:01:20 UTC (rev 26007)
@@ -1,12 +0,0 @@
-diff -Nura openssl-0.9.8j/Makefile openssl-0.9.8j.nofips/Makefile
---- openssl-0.9.8j/Makefile	2009-01-07 09:57:01.000000000 -0200
-+++ openssl-0.9.8j.nofips/Makefile	2009-03-05 10:10:09.000000000 -0200
-@@ -133,7 +133,7 @@
- 
- BASEADDR=0xFB00000
- 
--DIRS=   crypto fips ssl engines apps test tools
-+DIRS=   crypto ssl engines apps test tools
- SHLIBDIRS= crypto ssl
- 
- # dirs in crypto to build

Deleted: trunk/buildroot/package/openssl/openssl-0.9.8j-uclibc-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8j-uclibc-susv3-legacy.patch	2009-04-07 06:23:17 UTC (rev 26006)
+++ trunk/buildroot/package/openssl/openssl-0.9.8j-uclibc-susv3-legacy.patch	2009-04-07 07:01:20 UTC (rev 26007)
@@ -1,18 +0,0 @@
-sys/timeb.h / ftime are legacy, so don't enable them for uClibc 
----
- apps/speed.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: openssl-0.9.8g/apps/speed.c
-===================================================================
---- openssl-0.9.8g.orig/apps/speed.c
-+++ openssl-0.9.8g/apps/speed.c
-@@ -113,7 +113,7 @@
- #elif !defined(OPENSSL_SYS_MSDOS) && !defined(OPENSSL_SYS_VXWORKS) && (!defined(OPENSSL_SYS_VMS) || defined(__DECC))
- # define TIMES
- #endif
--#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) /* FIXME */
-+#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) && !defined(__UCLIBC__) /* FIXME */
- # define TIMEB
- #endif
- 

Copied: trunk/buildroot/package/openssl/openssl-0.9.8k-do-not-build-docs.patch (from rev 26000, trunk/buildroot/package/openssl/openssl-0.9.8j-do-not-build-docs.patch)
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8k-do-not-build-docs.patch	                        (rev 0)
+++ trunk/buildroot/package/openssl/openssl-0.9.8k-do-not-build-docs.patch	2009-04-07 07:01:20 UTC (rev 26007)
@@ -0,0 +1,13 @@
+Dont waste time building manpages if we're not going to use em.
+
+--- openssl/Makefile.org
++++ openssl/Makefile.org
+@@ -792,7 +792,7 @@
+ dist_pem_h:
+ 	(cd crypto/pem; $(MAKE) CC='${CC}' SDIRS='${SDIRS}' CFLAG='${CFLAG}' pem.h; $(MAKE) clean)
+ 
+-install: all install_docs install_sw
++install: all install_sw
+ 
+ install_sw:
+ 	@$(PERL) $(TOP)/util/mkdir-p.pl $(INSTALL_PREFIX)$(INSTALLTOP)/bin \

Copied: trunk/buildroot/package/openssl/openssl-0.9.8k-dont-force-large-file.patch (from rev 26000, trunk/buildroot/package/openssl/openssl-0.9.8j-dont-force-large-file.patch)
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8k-dont-force-large-file.patch	                        (rev 0)
+++ trunk/buildroot/package/openssl/openssl-0.9.8k-dont-force-large-file.patch	2009-04-07 07:01:20 UTC (rev 26007)
@@ -0,0 +1,19 @@
+[patch]: bss_file.c: don't force largefile mode
+---
+ crypto/bio/bss_file.c |    3 ---
+ 1 file changed, 3 deletions(-)
+
+Index: openssl-0.9.8g/crypto/bio/bss_file.c
+===================================================================
+--- openssl-0.9.8g.orig/crypto/bio/bss_file.c
++++ openssl-0.9.8g/crypto/bio/bss_file.c
+@@ -78,9 +78,6 @@
+  * sequential access of large files without extra "magic" comprise *BSD,
+  * Darwin, IRIX...
+  */
+-#ifndef _FILE_OFFSET_BITS
+-#define _FILE_OFFSET_BITS 64
+-#endif
+ #endif
+ 
+ #include <stdio.h>

Added: trunk/buildroot/package/openssl/openssl-0.9.8k-nofips.patch
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8k-nofips.patch	                        (rev 0)
+++ trunk/buildroot/package/openssl/openssl-0.9.8k-nofips.patch	2009-04-07 07:01:20 UTC (rev 26007)
@@ -0,0 +1,12 @@
+diff -Nura openssl-0.9.8k/Makefile.org openssl-0.9.8k.nofips/Makefile.org
+--- openssl-0.9.8k/Makefile.org	2009-03-03 20:40:29.000000000 -0200
++++ openssl-0.9.8k.nofips/Makefile.org	2009-03-26 09:50:27.000000000 -0300
+@@ -131,7 +131,7 @@
+ 
+ BASEADDR=
+ 
+-DIRS=   crypto fips ssl engines apps test tools
++DIRS=   crypto ssl engines apps test tools
+ SHLIBDIRS= crypto ssl fips
+ 
+ # dirs in crypto to build

Copied: trunk/buildroot/package/openssl/openssl-0.9.8k-uclibc-susv3-legacy.patch (from rev 26000, trunk/buildroot/package/openssl/openssl-0.9.8j-uclibc-susv3-legacy.patch)
===================================================================
--- trunk/buildroot/package/openssl/openssl-0.9.8k-uclibc-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/openssl/openssl-0.9.8k-uclibc-susv3-legacy.patch	2009-04-07 07:01:20 UTC (rev 26007)
@@ -0,0 +1,18 @@
+sys/timeb.h / ftime are legacy, so don't enable them for uClibc 
+---
+ apps/speed.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: openssl-0.9.8g/apps/speed.c
+===================================================================
+--- openssl-0.9.8g.orig/apps/speed.c
++++ openssl-0.9.8g/apps/speed.c
+@@ -113,7 +113,7 @@
+ #elif !defined(OPENSSL_SYS_MSDOS) && !defined(OPENSSL_SYS_VXWORKS) && (!defined(OPENSSL_SYS_VMS) || defined(__DECC))
+ # define TIMES
+ #endif
+-#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) /* FIXME */
++#if !defined(_UNICOS) && !defined(__OpenBSD__) && !defined(sgi) && !defined(__FreeBSD__) && !(defined(__bsdi) || defined(__bsdi__)) && !defined(_AIX) && !defined(OPENSSL_SYS_MPE) && !defined(__NetBSD__) && !defined(OPENSSL_SYS_VXWORKS) && !defined(__UCLIBC__) /* FIXME */
+ # define TIMEB
+ #endif
+ 

Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2009-04-07 06:23:17 UTC (rev 26006)
+++ trunk/buildroot/package/openssl/openssl.mk	2009-04-07 07:01:20 UTC (rev 26007)
@@ -3,7 +3,7 @@
 # openssl
 #
 #############################################################
-OPENSSL_VERSION:=0.9.8j
+OPENSSL_VERSION:=0.9.8k
 OPENSSL_SITE:=http://www.openssl.org/source
 
 OPENSSL_TARGET_ARCH=generic32
