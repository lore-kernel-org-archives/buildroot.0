From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 Jan 2009 18:39:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntp
Message-ID: <20090131183950.6538D7621A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-31 18:39:49 +0000 (Sat, 31 Jan 2009)
New Revision: 25180

Log:
ntp: fix time sync issue

Fix for https://support.ntp.org/bugs/show_bug.cgi?id=769 - Patch from gentoo.

Added:
   trunk/buildroot/package/ntp/ntp-4.2.4_p5-adjtimex.patch


Changeset:
Added: trunk/buildroot/package/ntp/ntp-4.2.4_p5-adjtimex.patch
===================================================================
--- trunk/buildroot/package/ntp/ntp-4.2.4_p5-adjtimex.patch	                        (rev 0)
+++ trunk/buildroot/package/ntp/ntp-4.2.4_p5-adjtimex.patch	2009-01-31 18:39:49 UTC (rev 25180)
@@ -0,0 +1,33 @@
+https://support.ntp.org/bugs/show_bug.cgi?id=769
+http://bugs.gentoo.org/254030
+
+--- ntp/util/tickadj.c
++++ ntp/util/tickadj.c
+@@ -21,7 +21,8 @@
+ # include <unistd.h>
+ #endif /* HAVE_UNISTD_H */
+ 
+-#ifdef HAVE___ADJTIMEX		/* Linux */
++/* proper handling here has been moved to upstream ntp bugzilla */
++#ifdef linux
+ 
+ #include <sys/timex.h>
+ struct timex txc;
+@@ -91,7 +92,7 @@
+ 	}
+ 
+ 	if (!errflg) {
+-		if (__adjtimex(&txc) < 0)
++		if (adjtimex(&txc) < 0)
+ 			perror("adjtimex");
+ 		else if (!quiet)
+ 			printf("tick     = %ld\ntick_adj = %d\n",
+@@ -146,7 +147,7 @@
+ #endif
+ 	}
+     
+-	if (__adjtimex(&txc) < 0)
++	if (adjtimex(&txc) < 0)
+ 	{
+ 		perror("adjtimex");
+ 	}
