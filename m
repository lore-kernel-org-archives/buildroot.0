From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 13 Oct 2018 21:51:00 +0300
Subject: [Buildroot] [PATCH] ntp: fix build for no-MMU with libcap
Message-ID: <42864d6afc883db05099a7d75a31de7e09e7ce96.1539456660.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 87d759ced5 (ntp: fix build for no-MMU) added a patch to make MMU
dependent code hidden behind HAVE_WORKING_FORK. It turns out that the
patch covers too much code. When libcap is enabled we pass
--enable-linuxcaps, which in turn enables HAVE_DROPROOT. This adds calls
to code that is covered by HAVE_WORKING_FORK.

Update the no-MMU fix so that HAVE_WORKING_FORK only covers the no-MMU
incompatible routine.

Fixes:
http://autobuild.buildroot.net/results/c5c/c5cf28bb969fec7c07864cdd094dedfa4d5439d2/

Cc: Artem Panfilov <apanfilov@spectracom.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ntp/0003-fix-nommu.patch | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/ntp/0003-fix-nommu.patch b/package/ntp/0003-fix-nommu.patch
index 53bf4dfcf38b..0959fa0ba522 100644
--- a/package/ntp/0003-fix-nommu.patch
+++ b/package/ntp/0003-fix-nommu.patch
@@ -10,13 +10,20 @@ Upstream status: http://bugs.ntp.org/show_bug.cgi?id=3538
 
 diff -Nuar ntp-4.2.8p12.orig/ntpd/ntpd.c ntp-4.2.8p12/ntpd/ntpd.c
 --- ntp-4.2.8p12.orig/ntpd/ntpd.c	2018-08-14 14:51:30.000000000 +0300
-+++ ntp-4.2.8p12/ntpd/ntpd.c	2018-10-12 08:19:01.291781773 +0300
-@@ -529,7 +529,7 @@
++++ ntp-4.2.8p12/ntpd/ntpd.c	2018-10-13 21:25:25.858261249 +0300
+@@ -534,6 +534,7 @@
+  * Detach from terminal (much like daemon())
+  * Nothe that this function calls exit()
+  */
++# ifdef HAVE_WORKING_FORK
+ static void
+ detach_from_terminal(
+ 	int pipe_fds[2],
+@@ -617,6 +618,7 @@
+ 
+ 	return;
  }
- #endif	/* !SIM */
++# endif /* HAVE_WORKING_FORK */
  
--#if !defined(SIM) && !defined(SYS_WINNT)
-+#if !defined(SIM) && !defined(SYS_WINNT) && defined(HAVE_WORKING_FORK)
+ #ifdef HAVE_DROPROOT
  /*
-  * Detach from terminal (much like daemon())
-  * Nothe that this function calls exit()
-- 
2.19.1
