From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 02:04:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20081020090449.7BB813C65A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 02:04:49 -0700 (Mon, 20 Oct 2008)
New Revision: 23735

Log:
strace: bump version

Fixes build with 2.6.27 kernel headers

Removed:
   trunk/buildroot/package/strace/strace-mips-sprintsigmask-fix.patch
   trunk/buildroot/package/strace/strace-superh-update.ac.patch
   trunk/buildroot/package/strace/strace-undef-PACKET_MEMBERSHIP.patch

Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:
Deleted: trunk/buildroot/package/strace/strace-mips-sprintsigmask-fix.patch
===================================================================
--- trunk/buildroot/package/strace/strace-mips-sprintsigmask-fix.patch	2008-10-20 08:59:03 UTC (rev 23734)
+++ trunk/buildroot/package/strace/strace-mips-sprintsigmask-fix.patch	2008-10-20 09:04:49 UTC (rev 23735)
@@ -1,12 +0,0 @@
-diff -ur strace-4.5.15/signal.c strace-4.5.15-patched/signal.c
---- strace-4.5.15/signal.c	2007-01-11 16:08:38.000000000 -0600
-+++ strace-4.5.15-patched/signal.c	2007-02-06 20:49:34.714320249 -0600
-@@ -1440,7 +1440,7 @@
- 	  	tcp->u_rval = tcp->u_error = 0;
- 		if(tcp->u_arg[0] == 0)
- 		  	return 0;
--		tcp->auxstr = sprintsigmask("mask now ", tcp->u_arg[1]);
-+		tcp->auxstr = sprintsigmask("mask now ", tcp->u_arg[1], 0);
- 		return RVAL_NONE | RVAL_STR;
- 	}
- 	return 0;

Deleted: trunk/buildroot/package/strace/strace-superh-update.ac.patch
===================================================================
--- trunk/buildroot/package/strace/strace-superh-update.ac.patch	2008-10-20 08:59:03 UTC (rev 23734)
+++ trunk/buildroot/package/strace/strace-superh-update.ac.patch	2008-10-20 09:04:49 UTC (rev 23735)
@@ -1,22 +0,0 @@
---- strace-4.5.15.orig/configure.ac	2007-01-11 12:37:55.000000000 +0100
-+++ strace-4.5.15/configure.ac	2007-01-29 17:38:26.000000000 +0100
-@@ -91,14 +91,14 @@ hppa*|parisc*)
- 	arch=hppa
- 	AC_DEFINE([HPPA], 1, [Define for the HPPA architecture.])
- 	;;
--sh)
--	arch=sh
--	AC_DEFINE([SH], 1, [Define for the SH architecture.])
--	;;
- sh64)
- 	arch=sh64
- 	AC_DEFINE([SH64], 1, [Define for the SH64 architecture.])
- 	;;
-+sh*)
-+	arch=sh
-+	AC_DEFINE([SH], 1, [Define for the SH architecture.])
-+	;;
- x86?64*)
- 	arch=x86_64
- 	AC_DEFINE([X86_64], 1, [Define for the AMD x86-64 architecture.])
-

Deleted: trunk/buildroot/package/strace/strace-undef-PACKET_MEMBERSHIP.patch
===================================================================
--- trunk/buildroot/package/strace/strace-undef-PACKET_MEMBERSHIP.patch	2008-10-20 08:59:03 UTC (rev 23734)
+++ trunk/buildroot/package/strace/strace-undef-PACKET_MEMBERSHIP.patch	2008-10-20 09:04:49 UTC (rev 23735)
@@ -1,15 +0,0 @@
---- strace-4.5.14/net.c.oorig	2005-07-05 01:33:38.000000000 +0200
-+++ strace-4.5.14/net.c	2006-10-09 16:35:02.000000000 +0200
-@@ -800,8 +800,12 @@
- 
- #ifdef SOL_PACKET
- static const struct xlat sockpacketoptions[] = {
-+#if defined(PACKET_ADD_MEMBERSHIP)
- 	{ PACKET_ADD_MEMBERSHIP,	"PACKET_ADD_MEMBERSHIP"	},
-+#endif
-+#if defined(PACKET_DROP_MEMBERSHIP)
- 	{ PACKET_DROP_MEMBERSHIP,	"PACKET_DROP_MEMBERSHIP"},
-+#endif
- #if defined(PACKET_RECV_OUTPUT)
- 	{ PACKET_RECV_OUTPUT,		"PACKET_RECV_OUTPUT"	},
- #endif

Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2008-10-20 08:59:03 UTC (rev 23734)
+++ trunk/buildroot/package/strace/strace.mk	2008-10-20 09:04:49 UTC (rev 23735)
@@ -3,7 +3,7 @@
 # strace
 #
 #############################################################
-STRACE_VERSION:=4.5.15
+STRACE_VERSION:=4.5.18
 STRACE_SOURCE:=strace-$(STRACE_VERSION).tar.bz2
 STRACE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/strace
 STRACE_AUTORECONF:=no
