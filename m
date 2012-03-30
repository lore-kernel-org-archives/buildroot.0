From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Mar 2012 07:35:53 -0300
Subject: [Buildroot] [PATCH] sudo: add fix for non-utmpx toolchains
Message-ID: <1333103753-29248-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The utmpx defines for when the target systems lacks utmpx is incomplete,
resulting in a build failure, so fix it.
This can be triggered by a uClibc toolchain that lacks UTMPX in the
configuration, or an older (<= 0.9.31) uClibc which lacks the
functionality.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sudo/sudo-1.8.4p4-utmpx.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/sudo/sudo-1.8.4p4-utmpx.patch

diff --git a/package/sudo/sudo-1.8.4p4-utmpx.patch b/package/sudo/sudo-1.8.4p4-utmpx.patch
new file mode 100644
index 0000000..4e97406
--- /dev/null
+++ b/package/sudo/sudo-1.8.4p4-utmpx.patch
@@ -0,0 +1,19 @@
+Fix incomplete setutxent/endutxent defines for when there's no utmpx
+Upstream bug #551
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura sudo-1.8.4p4.orig/src/utmp.c sudo-1.8.4p4/src/utmp.c
+--- sudo-1.8.4p4.orig/src/utmp.c	2012-03-30 07:10:38.381706315 -0300
++++ sudo-1.8.4p4/src/utmp.c	2012-03-30 07:10:52.605802501 -0300
+@@ -63,8 +63,8 @@
+ #if !defined(HAVE_GETUTXID) && defined(HAVE_GETUTID)
+ # define getutxline(u)	getutline(u)
+ # define pututxline(u)	pututline(u)
+-# define setutxent	setutent(u)
+-# define endutxent	endutent(u)
++# define setutxent(u)	setutent(u)
++# define endutxent(u)	endutent(u)
+ #endif /* !HAVE_GETUTXID && HAVE_GETUTID */
+ 
+ #ifdef HAVE_GETUTXID
-- 
1.7.3.4
