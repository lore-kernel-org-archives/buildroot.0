From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:16:39 +0100
Subject: [Buildroot] [git commit] uemacs: bump to latest LT master
Message-ID: <20141124212129.22DE47FECD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3112f4bb18c8ead891387ad6104525ceb137ca85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Latest LT (Linus Torvalds) master fixes symbol collision with ncurses.

Drop patches 01 and 02 as they are not needed anymore.

Refresh patch 03 to account for context changes, and rename to new convention.

Fixes:
http://autobuild.buildroot.net/results/6e0/6e0fb4a74f62e23cbc56482ae25f9979fa6f14f8/
http://autobuild.buildroot.net/results/df9/df9b693d7f53daba0d25f52132ca1594dd1273fa/
http://autobuild.buildroot.net/results/b39/b39d3997466951df078a5f47c5a75200b07dca4c/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ixon.patch => 01-clear-ixon-termios-flag.patch} |   15 +++++----
 package/uemacs/uemacs-4.0.15-lt.01.patch           |   33 --------------------
 package/uemacs/uemacs-4.0.15-lt.02.patch           |   16 ---------
 package/uemacs/uemacs.mk                           |    6 ++--
 4 files changed, 11 insertions(+), 59 deletions(-)

diff --git a/package/uemacs/uemacs-4.0.15-lt.03.ixon.patch b/package/uemacs/01-clear-ixon-termios-flag.patch
similarity index 64%
rename from package/uemacs/uemacs-4.0.15-lt.03.ixon.patch
rename to package/uemacs/01-clear-ixon-termios-flag.patch
index d0aaa79..dde7642 100644
--- a/package/uemacs/uemacs-4.0.15-lt.03.ixon.patch
+++ b/package/uemacs/01-clear-ixon-termios-flag.patch
@@ -4,10 +4,11 @@ Otherwise ctrl-S/Q gets intercepted by the tty layer instead of
 handled by uemacs.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-diff -U8 em-4.0.15-lt-orig/posix.c em-4.0.15-lt/posix.c
---- em-4.0.15-lt-orig/posix.c	1999-05-16 02:06:19.000000000 -0500
-+++ em-4.0.15-lt/posix.c	2012-04-25 16:14:25.000000000 -0500
-@@ -45,17 +45,17 @@
+diff --git a/posix.c b/posix.c
+index 97edd9f052b1..352c4712b689 100644
+--- a/posix.c
++++ b/posix.c
+@@ -53,17 +53,17 @@ void ttopen(void)
  	/*
  	 * base new settings on old ones - don't change things
  	 * we don't know about
@@ -20,9 +21,9 @@ diff -U8 em-4.0.15-lt-orig/posix.c em-4.0.15-lt/posix.c
 +			      | INPCK | INLCR | IGNCR | ICRNL | IXON);
  
  	/* raw CR/NR etc output handling */
- 	ntermios.c_oflag &= ~(OPOST | ONLCR | OLCUC | OCRNL | ONOCR | ONLRET);
+ 	ntermios.c_oflag &=
+ 	    ~(OPOST | ONLCR | OLCUC | OCRNL | ONOCR | ONLRET);
  
  	/* No signal handling, no echo etc */
  	ntermios.c_lflag &= ~(ISIG | ICANON | XCASE | ECHO | ECHOE | ECHOK
- 			     | ECHONL | NOFLSH | TOSTOP | ECHOCTL | ECHOPRT
- 			     | ECHOKE | FLUSHO | PENDIN | IEXTEN);
+ 			      | ECHONL | NOFLSH | TOSTOP | ECHOCTL |
diff --git a/package/uemacs/uemacs-4.0.15-lt.01.patch b/package/uemacs/uemacs-4.0.15-lt.01.patch
deleted file mode 100644
index 855dd35..0000000
--- a/package/uemacs/uemacs-4.0.15-lt.01.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-diff -rup em-4.0.15-lt.oorig/display.c em-4.0.15-lt/display.c
---- em-4.0.15-lt.oorig/display.c	1994-05-21 12:40:56.000000000 +0200
-+++ em-4.0.15-lt/display.c	2005-11-16 16:54:22.000000000 +0100
-@@ -9,6 +9,7 @@
-  */
- 
- #include        <stdio.h>
-+#include        <errno.h>
- #include	"estruct.h"
- #include        "edef.h"
- 
-diff -rup em-4.0.15-lt.oorig/main.c em-4.0.15-lt/main.c
---- em-4.0.15-lt.oorig/main.c	1994-05-21 12:41:03.000000000 +0200
-+++ em-4.0.15-lt/main.c	2005-11-16 16:54:01.000000000 +0100
-@@ -123,7 +123,7 @@ char *argv[];	/* argument strings */
- #endif
- 
- #if UNIX
--	static void emergencyexit();
-+	void emergencyexit();
- #ifdef SIGWINCH
- 	extern void sizesignal();
- #endif
-@@ -599,7 +599,7 @@ quickexit(f, n)
- 	return(TRUE);
- }
- 
--static void emergencyexit(signr)
-+void emergencyexit(signr)
- int signr;
- {
- 	quickexit(FALSE, 0);
-
diff --git a/package/uemacs/uemacs-4.0.15-lt.02.patch b/package/uemacs/uemacs-4.0.15-lt.02.patch
deleted file mode 100644
index 946b3d5..0000000
--- a/package/uemacs/uemacs-4.0.15-lt.02.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- em-4.0.15-lt.oorig/lock.c	1999-05-16 09:04:17.000000000 +0200
-+++ em-4.0.15-lt/lock.c	2006-03-10 15:22:16.000000000 +0100
-@@ -152,10 +152,8 @@
- 
- 	strcpy(obuf, errstr);
- 	strcat(obuf, " - ");
--	if (errno < sys_nerr)
--		strcat(obuf, sys_errlist[errno]);
--	else
--		strcat(obuf, "(can not get system error message)");
-+	strcat(obuf, strerror(errno));
-+
- 	mlwrite(obuf);
- }
- #endif
-
diff --git a/package/uemacs/uemacs.mk b/package/uemacs/uemacs.mk
index eeb4f26..321fbde 100644
--- a/package/uemacs/uemacs.mk
+++ b/package/uemacs/uemacs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-UEMACS_VERSION = 4.0.15-lt
-UEMACS_SOURCE = em-$(UEMACS_VERSION).tar.gz
-UEMACS_SITE = $(BR2_KERNEL_MIRROR)/software/editors/uemacs
+UEMACS_VERSION = fa00fe882f719351fdf7a4c4100baf4f3eab4d61
+UEMACS_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/torvalds/uemacs.git
+UEMACS_SITE_METHOD = git
 UEMACS_DEPENDENCIES = ncurses
 
 define UEMACS_BUILD_CMDS
