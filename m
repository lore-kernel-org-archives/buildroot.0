From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] psmisc: bump to version 22.13
Message-ID: <20110117202412.387528A6AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=147b81996db73787f578a73fd222d297e1e4ceef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/psmisc/psmisc-no-__progname.patch |   36 +++++++++++++++++------------
 package/psmisc/psmisc.mk                  |   14 +++++++----
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/package/psmisc/psmisc-no-__progname.patch b/package/psmisc/psmisc-no-__progname.patch
index 82e6daf..063b120 100644
--- a/package/psmisc/psmisc-no-__progname.patch
+++ b/package/psmisc/psmisc-no-__progname.patch
@@ -4,21 +4,27 @@ uclibc (per default) doesn't implement __progname, and the pstree.x11
 stuff isn't that critical, so just disable it.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/pstree.c |    3 ---
- 1 file changed, 3 deletions(-)
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-Index: psmisc-22.8/src/pstree.c
-===================================================================
---- psmisc-22.8.orig/src/pstree.c
-+++ psmisc-22.8/src/pstree.c
-@@ -893,9 +893,6 @@ main (int argc, char **argv)
-   bindtextdomain(PACKAGE, LOCALEDIR);
-   textdomain(PACKAGE);
+diff -Nura psmisc-22.13.orig/src/pstree.c psmisc-22.13/src/pstree.c
+--- psmisc-22.13.orig/src/pstree.c	2010-07-12 08:10:03.000000000 -0300
++++ psmisc-22.13/src/pstree.c	2011-01-07 15:02:41.902741728 -0300
+@@ -49,8 +49,6 @@
+ #include <selinux/selinux.h>
+ #endif                                /*WITH_SELINUX */
+ 
+-extern const char *__progname;
+-
+ #define PROC_BASE    "/proc"
+ 
+ /* UTF-8 defines by Johan Myreen, updated by Ben Winslow */
+@@ -854,9 +852,6 @@
+     textdomain(PACKAGE);
  #endif
--  
--  if (!strcmp(__progname, "pstree.x11"))
--    wait_end=1;
  
-   /*
-    * Attempt to figure out a good default symbol set.  Will be overriden by
+-    if (!strcmp(__progname, "pstree.x11"))
+-        wait_end = 1;
+-
+     /*
+      * Attempt to figure out a good default symbol set.  Will be overriden by
+      * command-line options, if given.
diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
index e4301da..3cbf941 100644
--- a/package/psmisc/psmisc.mk
+++ b/package/psmisc/psmisc.mk
@@ -3,10 +3,14 @@
 # psmisc
 #
 #############################################################
-PSMISC_VERSION:=22.8
-PSMISC_SOURCE:=psmisc-$(PSMISC_VERSION).tar.gz
-PSMISC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
-PSMISC_AUTORECONF:=NO
-PSMISC_DEPENDENCIES:=ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+
+PSMISC_VERSION = 22.13
+PSMISC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
+PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
+
+# build after busybox, we prefer fat versions while we're at it
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+PSMISC_DEPENDENCIES += busybox
+endif
 
 $(eval $(call AUTOTARGETS,package,psmisc))
-- 
1.7.3.4
