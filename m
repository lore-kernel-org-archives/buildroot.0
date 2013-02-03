From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Feb 2013 21:53:20 +0100
Subject: [Buildroot] [PATCH 1/2] pptp-linux: rename patches to remove the
	version number
Message-ID: <1359924801-30806-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../pptp-linux/pptp-linux-001-susv3-legacy.patch   |   24 +++++++++++
 .../pptp-linux/pptp-linux-002-drop-stropts.patch   |   26 ++++++++++++
 package/pptp-linux/pptp-linux-003-ip-path.patch    |   44 ++++++++++++++++++++
 .../pptp-linux-1.7.0-001-susv3-legacy.patch        |   24 -----------
 .../pptp-linux/pptp-linux-1.7.2-drop-stropts.patch |   26 ------------
 package/pptp-linux/pptp-linux-1.7.2-ip-path.patch  |   44 --------------------
 6 files changed, 94 insertions(+), 94 deletions(-)
 create mode 100644 package/pptp-linux/pptp-linux-001-susv3-legacy.patch
 create mode 100644 package/pptp-linux/pptp-linux-002-drop-stropts.patch
 create mode 100644 package/pptp-linux/pptp-linux-003-ip-path.patch
 delete mode 100644 package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch
 delete mode 100644 package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch
 delete mode 100644 package/pptp-linux/pptp-linux-1.7.2-ip-path.patch

diff --git a/package/pptp-linux/pptp-linux-001-susv3-legacy.patch b/package/pptp-linux/pptp-linux-001-susv3-legacy.patch
new file mode 100644
index 0000000..f41b63f
--- /dev/null
+++ b/package/pptp-linux/pptp-linux-001-susv3-legacy.patch
@@ -0,0 +1,24 @@
+diff -rdup pptp-linux-1.7.0/pptp_callmgr.c pptp-linux-1.7.0.orig/pptp_callmgr.c
+--- pptp-linux-1.7.0/pptp_callmgr.c	2005-07-28 03:15:11.000000000 +0200
++++ pptp-linux-1.7.0.orig/pptp_callmgr.c	2007-08-24 09:20:39.000000000 +0200
+@@ -314,7 +314,7 @@ int open_inetsock(struct in_addr inetadd
+         return s;
+     }
+     if (localbind.s_addr != INADDR_NONE) {
+-        bzero(&src, sizeof(src));
++        memset(&src, 0, sizeof(src));
+         src.sin_family = AF_INET;
+         src.sin_addr   = localbind;
+         if (bind(s, (struct sockaddr *) &src, sizeof(src)) != 0) {
+diff -rdup pptp-linux-1.7.0/pptp_gre.c pptp-linux-1.7.0.orig/pptp_gre.c
+--- pptp-linux-1.7.0/pptp_gre.c	2005-07-28 03:15:11.000000000 +0200
++++ pptp-linux-1.7.0.orig/pptp_gre.c	2007-08-24 09:20:56.000000000 +0200
+@@ -81,7 +81,7 @@ int pptp_gre_bind(struct in_addr inetadd
+     int s = socket(AF_INET, SOCK_RAW, PPTP_PROTO);
+     if (s < 0) { warn("socket: %s", strerror(errno)); return -1; }
+     if (localbind.s_addr != INADDR_NONE) {
+-        bzero(&loc_addr, sizeof(loc_addr));
++        memset(&loc_addr, 0, sizeof(loc_addr));
+         loc_addr.sin_family = AF_INET;
+         loc_addr.sin_addr   = localbind;
+         if (bind(s, (struct sockaddr *) &loc_addr, sizeof(loc_addr)) != 0) {
diff --git a/package/pptp-linux/pptp-linux-002-drop-stropts.patch b/package/pptp-linux/pptp-linux-002-drop-stropts.patch
new file mode 100644
index 0000000..bc53cc2
--- /dev/null
+++ b/package/pptp-linux/pptp-linux-002-drop-stropts.patch
@@ -0,0 +1,26 @@
+From ae214f5103dfaa92ecb0b1953d4c9dd059e620ca Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 21 Oct 2010 10:59:02 -0300
+Subject: [PATCH] Drop stropts.h, it's deprecated and unneeded
+
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ pptp_compat.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/pptp_compat.c b/pptp_compat.c
+index 1760a3b..e98cbf0 100644
+--- a/pptp_compat.c
++++ b/pptp_compat.c
+@@ -7,7 +7,6 @@
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+-#include <stropts.h>
+ #include <stdlib.h>
+ #include <strings.h>
+ #include "pptp_compat.h"
+-- 
+1.7.2.2
+
diff --git a/package/pptp-linux/pptp-linux-003-ip-path.patch b/package/pptp-linux/pptp-linux-003-ip-path.patch
new file mode 100644
index 0000000..6d8f3c8
--- /dev/null
+++ b/package/pptp-linux/pptp-linux-003-ip-path.patch
@@ -0,0 +1,44 @@
+From 00b9e2615191439a6c7db960d169129479ac633b Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 21 Oct 2010 11:01:25 -0300
+Subject: [PATCH] The ip tool is in /sbin rather that /bin, fix it
+
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ routing.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/routing.c b/routing.c
+index ab20a03..7fb4277 100644
+--- a/routing.c
++++ b/routing.c
+@@ -55,7 +55,7 @@ regardless (not yet implemented).
+ 
+ void routing_init(char *ip) {
+   char buf[256];
+-  snprintf(buf, 255, "/bin/ip route get %s", ip);
++  snprintf(buf, 255, "/sbin/ip route get %s", ip);
+   FILE *p = popen(buf, "r");
+   fgets(buf, 255, p);
+   /* TODO: check for failure of fgets */
+@@ -66,14 +66,14 @@ void routing_init(char *ip) {
+ 
+ void routing_start() {
+   char buf[256];
+-  snprintf(buf, 255, "/bin/ip route replace %s", route);
++  snprintf(buf, 255, "/sbin/ip route replace %s", route);
+   FILE *p = popen(buf, "r");
+   pclose(p);
+ }
+ 
+ void routing_end() {
+   char buf[256];
+-  snprintf(buf, 255, "/bin/ip route delete %s", route);
++  snprintf(buf, 255, "/sbin/ip route delete %s", route);
+   FILE *p = popen(buf, "r");
+   pclose(p);
+ }
+-- 
+1.7.2.2
+
diff --git a/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch b/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch
deleted file mode 100644
index f41b63f..0000000
--- a/package/pptp-linux/pptp-linux-1.7.0-001-susv3-legacy.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff -rdup pptp-linux-1.7.0/pptp_callmgr.c pptp-linux-1.7.0.orig/pptp_callmgr.c
---- pptp-linux-1.7.0/pptp_callmgr.c	2005-07-28 03:15:11.000000000 +0200
-+++ pptp-linux-1.7.0.orig/pptp_callmgr.c	2007-08-24 09:20:39.000000000 +0200
-@@ -314,7 +314,7 @@ int open_inetsock(struct in_addr inetadd
-         return s;
-     }
-     if (localbind.s_addr != INADDR_NONE) {
--        bzero(&src, sizeof(src));
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
-     if (localbind.s_addr != INADDR_NONE) {
--        bzero(&loc_addr, sizeof(loc_addr));
-+        memset(&loc_addr, 0, sizeof(loc_addr));
-         loc_addr.sin_family = AF_INET;
-         loc_addr.sin_addr   = localbind;
-         if (bind(s, (struct sockaddr *) &loc_addr, sizeof(loc_addr)) != 0) {
diff --git a/package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch b/package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch
deleted file mode 100644
index bc53cc2..0000000
--- a/package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch
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
diff --git a/package/pptp-linux/pptp-linux-1.7.2-ip-path.patch b/package/pptp-linux/pptp-linux-1.7.2-ip-path.patch
deleted file mode 100644
index 6d8f3c8..0000000
--- a/package/pptp-linux/pptp-linux-1.7.2-ip-path.patch
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
-- 
1.7.9.5
