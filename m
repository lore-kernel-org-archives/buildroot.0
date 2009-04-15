From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 18:29:51 +0000 (UTC)
Subject: [Buildroot] svn commit: [26115] trunk/buildroot/package/bind
Message-ID: <20090415182951.59441772DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-15 18:29:50 +0000 (Wed, 15 Apr 2009)
New Revision: 26115

Log:
bind: bump version (security issue with DNSSEC DLV)

Patch by Gustavo Zacarias <gustavo@zacarias.com.ar>, closes #275.

Added:
   trunk/buildroot/package/bind/bind-cross.patch
   trunk/buildroot/package/bind/bind-susv3-legacy.patch

Removed:
   trunk/buildroot/package/bind/bind-9.5.1-P1-cross.patch
   trunk/buildroot/package/bind/bind-9.5.1-P1-susv3-legacy.patch

Modified:
   trunk/buildroot/package/bind/bind.mk


Changeset:
Deleted: trunk/buildroot/package/bind/bind-9.5.1-P1-cross.patch
===================================================================
--- trunk/buildroot/package/bind/bind-9.5.1-P1-cross.patch	2009-04-15 13:42:12 UTC (rev 26114)
+++ trunk/buildroot/package/bind/bind-9.5.1-P1-cross.patch	2009-04-15 18:29:50 UTC (rev 26115)
@@ -1,14 +0,0 @@
-diff -Nura bind-9.5.1-P1/lib/dns/Makefile.in bind-9.5.1-P1.gencross/lib/dns/Makefile.in
---- bind-9.5.1-P1/lib/dns/Makefile.in	2007-09-11 22:09:08.000000000 -0300
-+++ bind-9.5.1-P1.gencross/lib/dns/Makefile.in	2009-03-04 16:35:23.000000000 -0200
-@@ -160,8 +160,8 @@
- 	./gen -s ${srcdir} > code.h
- 
- gen: gen.c
--	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
--	${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c ${BUILD_LIBS}
-+	${HOSTCC} ${HOST_CFLAGS} -I${top_srcdir}/lib/isc/include \
-+	${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c
- 
- rbtdb64. at O@: rbtdb.c
- 

Deleted: trunk/buildroot/package/bind/bind-9.5.1-P1-susv3-legacy.patch
===================================================================
--- trunk/buildroot/package/bind/bind-9.5.1-P1-susv3-legacy.patch	2009-04-15 13:42:12 UTC (rev 26114)
+++ trunk/buildroot/package/bind/bind-9.5.1-P1-susv3-legacy.patch	2009-04-15 18:29:50 UTC (rev 26115)
@@ -1,23 +0,0 @@
-diff -Nura bind-9.5.1-P1/lib/isc/unix/ifiter_ioctl.c bind-9.5.1-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c
---- bind-9.5.1-P1/lib/isc/unix/ifiter_ioctl.c	2007-08-30 03:02:28.000000000 -0300
-+++ bind-9.5.1-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c	2009-03-04 16:31:20.000000000 -0200
-@@ -17,6 +17,8 @@
- 
- /* $Id: ifiter_ioctl.c,v 1.58 2007/08/30 06:02:28 marka Exp $ */
- 
-+#include <string.h>
-+
- /*! \file
-  * \brief
-  * Obtain the list of network interfaces using the SIOCGLIFCONF ioctl.
-@@ -479,8 +481,8 @@
- 	for (i = 0; i < 16; i++) {
- 		unsigned char byte;
- 		static const char hex[] = "0123456789abcdef";
--		byte = ((index(hex, address[i * 2]) - hex) << 4) |
--		       (index(hex, address[i * 2 + 1]) - hex);
-+		byte = ((strchr(hex, address[i * 2]) - hex) << 4) |
-+			(strchr(hex, address[i * 2 + 1]) - hex);
- 		addr6.s6_addr[i] = byte;
- 	}
- 	iter->current.af = AF_INET6;

Copied: trunk/buildroot/package/bind/bind-cross.patch (from rev 26114, trunk/buildroot/package/bind/bind-9.5.1-P1-cross.patch)
===================================================================
--- trunk/buildroot/package/bind/bind-cross.patch	                        (rev 0)
+++ trunk/buildroot/package/bind/bind-cross.patch	2009-04-15 18:29:50 UTC (rev 26115)
@@ -0,0 +1,14 @@
+diff -Nura bind-9.5.1-P1/lib/dns/Makefile.in bind-9.5.1-P1.gencross/lib/dns/Makefile.in
+--- bind-9.5.1-P1/lib/dns/Makefile.in	2007-09-11 22:09:08.000000000 -0300
++++ bind-9.5.1-P1.gencross/lib/dns/Makefile.in	2009-03-04 16:35:23.000000000 -0200
+@@ -160,8 +160,8 @@
+ 	./gen -s ${srcdir} > code.h
+ 
+ gen: gen.c
+-	${BUILD_CC} ${BUILD_CFLAGS} -I${top_srcdir}/lib/isc/include \
+-	${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} -o $@ ${srcdir}/gen.c ${BUILD_LIBS}
++	${HOSTCC} ${HOST_CFLAGS} -I${top_srcdir}/lib/isc/include \
++	${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c
+ 
+ rbtdb64. at O@: rbtdb.c
+ 

Copied: trunk/buildroot/package/bind/bind-susv3-legacy.patch (from rev 26114, trunk/buildroot/package/bind/bind-9.5.1-P1-susv3-legacy.patch)
===================================================================
--- trunk/buildroot/package/bind/bind-susv3-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/bind/bind-susv3-legacy.patch	2009-04-15 18:29:50 UTC (rev 26115)
@@ -0,0 +1,23 @@
+diff -Nura bind-9.5.1-P1/lib/isc/unix/ifiter_ioctl.c bind-9.5.1-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c
+--- bind-9.5.1-P1/lib/isc/unix/ifiter_ioctl.c	2007-08-30 03:02:28.000000000 -0300
++++ bind-9.5.1-P1.nosusv3/lib/isc/unix/ifiter_ioctl.c	2009-03-04 16:31:20.000000000 -0200
+@@ -17,6 +17,8 @@
+ 
+ /* $Id: ifiter_ioctl.c,v 1.58 2007/08/30 06:02:28 marka Exp $ */
+ 
++#include <string.h>
++
+ /*! \file
+  * \brief
+  * Obtain the list of network interfaces using the SIOCGLIFCONF ioctl.
+@@ -479,8 +481,8 @@
+ 	for (i = 0; i < 16; i++) {
+ 		unsigned char byte;
+ 		static const char hex[] = "0123456789abcdef";
+-		byte = ((index(hex, address[i * 2]) - hex) << 4) |
+-		       (index(hex, address[i * 2 + 1]) - hex);
++		byte = ((strchr(hex, address[i * 2]) - hex) << 4) |
++			(strchr(hex, address[i * 2 + 1]) - hex);
+ 		addr6.s6_addr[i] = byte;
+ 	}
+ 	iter->current.af = AF_INET6;

Modified: trunk/buildroot/package/bind/bind.mk
===================================================================
--- trunk/buildroot/package/bind/bind.mk	2009-04-15 13:42:12 UTC (rev 26114)
+++ trunk/buildroot/package/bind/bind.mk	2009-04-15 18:29:50 UTC (rev 26115)
@@ -3,7 +3,7 @@
 # bind
 #
 #############################################################
-BIND_VERSION = 9.5.1-P1
+BIND_VERSION = 9.5.1-P2
 BIND_SOURCE = bind-$(BIND_VERSION).tar.gz
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_LIBTOOL_PATCH = NO
