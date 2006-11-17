From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 17 Nov 2006 03:52:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20061117115258.F28264860E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-17 03:52:58 -0800 (Fri, 17 Nov 2006)
New Revision: 16557

Log:
- that version didn't build for me.
  Update version and make it compile..


Added:
   trunk/buildroot/package/strace/strace-undef-CTL_PROC.patch
   trunk/buildroot/package/strace/strace-undef-PACKET_MEMBERSHIP.patch

Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:
Added: trunk/buildroot/package/strace/strace-undef-CTL_PROC.patch
===================================================================
--- trunk/buildroot/package/strace/strace-undef-CTL_PROC.patch	2006-11-17 11:51:17 UTC (rev 16556)
+++ trunk/buildroot/package/strace/strace-undef-CTL_PROC.patch	2006-11-17 11:52:58 UTC (rev 16557)
@@ -0,0 +1,12 @@
+--- strace-4.5.12/system.c.oorig	2005-06-01 21:22:06.000000000 +0200
++++ strace-4.5.12/system.c	2006-09-28 18:18:31.000000000 +0200
+@@ -1572,7 +1572,9 @@
+ 	{ CTL_KERN, "CTL_KERN" },
+ 	{ CTL_VM, "CTL_VM" },
+ 	{ CTL_NET, "CTL_NET" },
++#ifdef CTL_PROC
+ 	{ CTL_PROC, "CTL_PROC" },
++#endif
+ 	{ CTL_FS, "CTL_FS" },
+ 	{ CTL_DEBUG, "CTL_DEBUG" },
+ 	{ CTL_DEV, "CTL_DEV" },

Added: trunk/buildroot/package/strace/strace-undef-PACKET_MEMBERSHIP.patch
===================================================================
--- trunk/buildroot/package/strace/strace-undef-PACKET_MEMBERSHIP.patch	2006-11-17 11:51:17 UTC (rev 16556)
+++ trunk/buildroot/package/strace/strace-undef-PACKET_MEMBERSHIP.patch	2006-11-17 11:52:58 UTC (rev 16557)
@@ -0,0 +1,15 @@
+--- strace-4.5.14/net.c.oorig	2005-07-05 01:33:38.000000000 +0200
++++ strace-4.5.14/net.c	2006-10-09 16:35:02.000000000 +0200
+@@ -800,8 +800,12 @@
+ 
+ #ifdef SOL_PACKET
+ static const struct xlat sockpacketoptions[] = {
++#if defined(PACKET_ADD_MEMBERSHIP)
+ 	{ PACKET_ADD_MEMBERSHIP,	"PACKET_ADD_MEMBERSHIP"	},
++#endif
++#if defined(PACKET_DROP_MEMBERSHIP)
+ 	{ PACKET_DROP_MEMBERSHIP,	"PACKET_DROP_MEMBERSHIP"},
++#endif
+ #if defined(PACKET_RECV_OUTPUT)
+ 	{ PACKET_RECV_OUTPUT,		"PACKET_RECV_OUTPUT"	},
+ #endif

Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2006-11-17 11:51:17 UTC (rev 16556)
+++ trunk/buildroot/package/strace/strace.mk	2006-11-17 11:52:58 UTC (rev 16557)
@@ -3,7 +3,7 @@
 # strace
 #
 #############################################################
-STRACE_VER:=4.5.12
+STRACE_VER:=4.5.14
 STRACE_SOURCE:=strace-$(STRACE_VER).tar.bz2
 STRACE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/strace
 STRACE_CAT:=bzcat
@@ -24,9 +24,10 @@
 	(cd $(STRACE_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
+		aaa_ac_cv_header_linux_if_packet_h=yes \
 		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
+		--target=$(REAL_GNU_TARGET_NAME) \
+		--host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
