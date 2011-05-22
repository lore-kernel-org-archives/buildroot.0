From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 May 2011 16:58:32 +0200
Subject: [Buildroot] [git commit] psmisc: do not install pstree.x11 symbolic
	link
Message-ID: <20110522145941.B02288356F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9868d2419021a3362d55963b022d18d57438c164
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The psmisc-no-__progname.patch removes the usage of __progname, which
removes any difference between pstree and pstree.x11. Therefore, we
make sure to not create the pstree.x11 symbolic link in the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/psmisc/psmisc-no-__progname.patch |   23 ++++++++++++++++++++---
 1 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/psmisc/psmisc-no-__progname.patch b/package/psmisc/psmisc-no-__progname.patch
index 063b120..5109657 100644
--- a/package/psmisc/psmisc-no-__progname.patch
+++ b/package/psmisc/psmisc-no-__progname.patch
@@ -5,10 +5,12 @@ stuff isn't that critical, so just disable it.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-diff -Nura psmisc-22.13.orig/src/pstree.c psmisc-22.13/src/pstree.c
---- psmisc-22.13.orig/src/pstree.c	2010-07-12 08:10:03.000000000 -0300
-+++ psmisc-22.13/src/pstree.c	2011-01-07 15:02:41.902741728 -0300
+Index: psmisc-22.13/src/pstree.c
+===================================================================
+--- psmisc-22.13.orig/src/pstree.c	2010-07-12 13:10:03.000000000 +0200
++++ psmisc-22.13/src/pstree.c	2011-05-21 16:33:37.456530775 +0200
 @@ -49,8 +49,6 @@
  #include <selinux/selinux.h>
  #endif                                /*WITH_SELINUX */
@@ -28,3 +30,18 @@ diff -Nura psmisc-22.13.orig/src/pstree.c psmisc-22.13/src/pstree.c
      /*
       * Attempt to figure out a good default symbol set.  Will be overriden by
       * command-line options, if given.
+Index: psmisc-22.13/src/Makefile.in
+===================================================================
+--- psmisc-22.13.orig/src/Makefile.in	2011-05-21 16:33:42.748530777 +0200
++++ psmisc-22.13/src/Makefile.in	2011-05-21 16:33:47.360530782 +0200
+@@ -557,10 +557,6 @@
+ 		grep '^{ 1,"HUP" },$$' signames.h >/dev/null || \
+ 		  { rm -f signames.h; exit 1; }
+ 
+-install-exec-hook:
+-		cd $(DESTDIR)$(bindir) && \
+-			( [ -h pstree.x11 ]  || $(LN_S) pstree pstree.x11)
+-
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
+ .NOEXPORT:
-- 
1.7.3.4
