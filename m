From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Mar 2012 13:08:11 +0200
Subject: [Buildroot] [git commit] sudo: add fix for non-utmpx toolchains
Message-ID: <20120330115042.63F55969B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20b76e7c3588938e5e6dc71e7f96607f0207f5c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The utmpx defines for when the target systems lacks utmpx is incomplete,
resulting in a build failure, so fix it.
This can be triggered by a uClibc toolchain that lacks UTMPX in the
configuration, or an older (<= 0.9.31) uClibc which lacks the
functionality.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sudo/sudo-1.8.4p4-utmpx.patch |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

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
