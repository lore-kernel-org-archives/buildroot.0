From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 31 Mar 2014 18:10:21 -0300
Subject: [Buildroot] [PATCH] pptp-linux: bump to version 1.8.0
Message-ID: <1396300221-11919-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../pptp-linux/pptp-linux-001-susv3-legacy.patch   | 43 +++++++++++----------
 .../pptp-linux/pptp-linux-002-drop-stropts.patch   | 26 -------------
 package/pptp-linux/pptp-linux-003-ip-path.patch    | 44 ----------------------
 .../pptp-linux-004-fix-parallel-build.patch        | 23 -----------
 package/pptp-linux/pptp-linux.mk                   |  5 ++-
 5 files changed, 27 insertions(+), 114 deletions(-)
 delete mode 100644 package/pptp-linux/pptp-linux-002-drop-stropts.patch
 delete mode 100644 package/pptp-linux/pptp-linux-003-ip-path.patch
 delete mode 100644 package/pptp-linux/pptp-linux-004-fix-parallel-build.patch

diff --git a/package/pptp-linux/pptp-linux-001-susv3-legacy.patch b/package/pptp-linux/pptp-linux-001-susv3-legacy.patch
index f41b63f..5cc9f57 100644
--- a/package/pptp-linux/pptp-linux-001-susv3-legacy.patch
+++ b/package/pptp-linux/pptp-linux-001-susv3-legacy.patch
@@ -1,24 +1,29 @@
-diff -rdup pptp-linux-1.7.0/pptp_callmgr.c pptp-linux-1.7.0.orig/pptp_callmgr.c
---- pptp-linux-1.7.0/pptp_callmgr.c	2005-07-28 03:15:11.000000000 +0200
-+++ pptp-linux-1.7.0.orig/pptp_callmgr.c	2007-08-24 09:20:39.000000000 +0200
-@@ -314,7 +314,7 @@ int open_inetsock(struct in_addr inetadd
-         return s;
+bzero is deprecated in POSIX.1-2001 and removed for POSIX.1-2008 so
+switch to memset instead.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura pptp-1.8.0.orig/pptp_callmgr.c pptp-1.8.0/pptp_callmgr.c
+--- pptp-1.8.0.orig/pptp_callmgr.c	2013-10-23 05:10:46.000000000 -0300
++++ pptp-1.8.0/pptp_callmgr.c	2014-03-31 16:47:42.617643298 -0300
+@@ -340,7 +340,7 @@
      }
+ #endif
      if (localbind.s_addr != INADDR_NONE) {
 -        bzero(&src, sizeof(src));
-+        memset(&src, 0, sizeof(src));
-         src.sin_family = AF_INET;
-         src.sin_addr   = localbind;
-         if (bind(s, (struct sockaddr *) &src, sizeof(src)) != 0) {
-diff -rdup pptp-linux-1.7.0/pptp_gre.c pptp-linux-1.7.0.orig/pptp_gre.c
---- pptp-linux-1.7.0/pptp_gre.c	2005-07-28 03:15:11.000000000 +0200
-+++ pptp-linux-1.7.0.orig/pptp_gre.c	2007-08-24 09:20:56.000000000 +0200
-@@ -81,7 +81,7 @@ int pptp_gre_bind(struct in_addr inetadd
-     int s = socket(AF_INET, SOCK_RAW, PPTP_PROTO);
-     if (s < 0) { warn("socket: %s", strerror(errno)); return -1; }
++	memset(&src, 0, sizeof(src));
+         src.i.sin_family = AF_INET;
+         src.i.sin_addr   = localbind;
+         if (bind(s, &src.a, sizeof(src.i)) != 0) {
+diff -Nura pptp-1.8.0.orig/pptp_gre.c pptp-1.8.0/pptp_gre.c
+--- pptp-1.8.0.orig/pptp_gre.c	2013-10-23 05:10:46.000000000 -0300
++++ pptp-1.8.0/pptp_gre.c	2014-03-31 16:47:30.745249066 -0300
+@@ -103,7 +103,7 @@
+     }
+ #endif
      if (localbind.s_addr != INADDR_NONE) {
 -        bzero(&loc_addr, sizeof(loc_addr));
-+        memset(&loc_addr, 0, sizeof(loc_addr));
-         loc_addr.sin_family = AF_INET;
-         loc_addr.sin_addr   = localbind;
-         if (bind(s, (struct sockaddr *) &loc_addr, sizeof(loc_addr)) != 0) {
++	memset(&loc_addr, 0, sizeof(loc_addr));
+         loc_addr.i.sin_family = AF_INET;
+         loc_addr.i.sin_addr   = localbind;
+         if (bind(s, &loc_addr.a, sizeof(loc_addr.i)) != 0) {
diff --git a/package/pptp-linux/pptp-linux-002-drop-stropts.patch b/package/pptp-linux/pptp-linux-002-drop-stropts.patch
deleted file mode 100644
index bc53cc2..0000000
--- a/package/pptp-linux/pptp-linux-002-drop-stropts.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ae214f5103dfaa92ecb0b1953d4c9dd059e620ca Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 21 Oct 2010 10:59:02 -0300
-Subject: [PATCH] Drop stropts.h, it's deprecated and unneeded
-
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- pptp_compat.c |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/pptp_compat.c b/pptp_compat.c
-index 1760a3b..e98cbf0 100644
---- a/pptp_compat.c
-+++ b/pptp_compat.c
-@@ -7,7 +7,6 @@
- #include <fcntl.h>
- #include <sys/types.h>
- #include <unistd.h>
--#include <stropts.h>
- #include <stdlib.h>
- #include <strings.h>
- #include "pptp_compat.h"
--- 
-1.7.2.2
-
diff --git a/package/pptp-linux/pptp-linux-003-ip-path.patch b/package/pptp-linux/pptp-linux-003-ip-path.patch
deleted file mode 100644
index 6d8f3c8..0000000
--- a/package/pptp-linux/pptp-linux-003-ip-path.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 00b9e2615191439a6c7db960d169129479ac633b Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 21 Oct 2010 11:01:25 -0300
-Subject: [PATCH] The ip tool is in /sbin rather that /bin, fix it
-
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- routing.c |    6 +++---
- 1 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/routing.c b/routing.c
-index ab20a03..7fb4277 100644
---- a/routing.c
-+++ b/routing.c
-@@ -55,7 +55,7 @@ regardless (not yet implemented).
- 
- void routing_init(char *ip) {
-   char buf[256];
--  snprintf(buf, 255, "/bin/ip route get %s", ip);
-+  snprintf(buf, 255, "/sbin/ip route get %s", ip);
-   FILE *p = popen(buf, "r");
-   fgets(buf, 255, p);
-   /* TODO: check for failure of fgets */
-@@ -66,14 +66,14 @@ void routing_init(char *ip) {
- 
- void routing_start() {
-   char buf[256];
--  snprintf(buf, 255, "/bin/ip route replace %s", route);
-+  snprintf(buf, 255, "/sbin/ip route replace %s", route);
-   FILE *p = popen(buf, "r");
-   pclose(p);
- }
- 
- void routing_end() {
-   char buf[256];
--  snprintf(buf, 255, "/bin/ip route delete %s", route);
-+  snprintf(buf, 255, "/sbin/ip route delete %s", route);
-   FILE *p = popen(buf, "r");
-   pclose(p);
- }
--- 
-1.7.2.2
-
diff --git a/package/pptp-linux/pptp-linux-004-fix-parallel-build.patch b/package/pptp-linux/pptp-linux-004-fix-parallel-build.patch
deleted file mode 100644
index 04a7977..0000000
--- a/package/pptp-linux/pptp-linux-004-fix-parallel-build.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix parallel build issue
-
-The config.h header file must be created before being used to build
-source files that include it, especially version.c. In order for this
-to happen even in highly-parallel builds, we add a dependency of all
-object files on config.h, in order to ensure it gets generated before
-make attempts to build the object files.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -37,6 +37,8 @@
- 
- all: config.h $(PPTP_BIN) pptpsetup.8
- 
-+$(PPTP_OBJS): config.h
-+
- $(PPTP_BIN): $(PPTP_OBJS) $(PPTP_DEPS)
- 	$(CC) -o $(PPTP_BIN) $(PPTP_OBJS) $(LDFLAGS) $(LIBS)
- 
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 7b10886..dc624eb 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PPTP_LINUX_VERSION = 1.7.2
+PPTP_LINUX_VERSION = 1.8.0
 PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
 PPTP_LINUX_MAKE = $(MAKE1)
@@ -15,7 +15,8 @@ define PPTP_LINUX_BUILD_CMDS
 	$(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
 		CC="$(TARGET_CC)" \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		IP=/sbin/ip
 endef
 
 define PPTP_LINUX_INSTALL_TARGET_CMDS
-- 
1.8.3.2
