From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  7 May 2018 23:20:30 +0200
Subject: [Buildroot] [PATCH 1/2] clamav: reformat patches as Git-formatted
 patches
Message-ID: <20180507212031.31337-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ClamAV is using Git upstream
(https://github.com/Cisco-Talos/clamav-devel), so it makes sense to
use Git-formatted patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...roto.c-fix-build-error-due-to-missing-soc.patch | 34 ++++++++++++++++++++++
 package/clamav/0001-clamdscan.patch                | 21 -------------
 ...use-backtrace-if-using-uClibc-without-ba.patch} | 22 ++++++++++----
 3 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 package/clamav/0001-clamdscan-proto.c-fix-build-error-due-to-missing-soc.patch
 delete mode 100644 package/clamav/0001-clamdscan.patch
 rename package/clamav/{0002-backtrace-uClibc.patch => 0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch} (53%)

diff --git a/package/clamav/0001-clamdscan-proto.c-fix-build-error-due-to-missing-soc.patch b/package/clamav/0001-clamdscan-proto.c-fix-build-error-due-to-missing-soc.patch
new file mode 100644
index 0000000000..daac677eaa
--- /dev/null
+++ b/package/clamav/0001-clamdscan-proto.c-fix-build-error-due-to-missing-soc.patch
@@ -0,0 +1,34 @@
+From 52fda6e6689e22866a39ec4273713fb6035c38b2 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 7 May 2018 23:14:46 +0200
+Subject: [PATCH] clamdscan/proto.c: fix build error due to missing sockaddr_un
+ definition
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+proto.c: In function ?dconnect?:
+proto.c:86:67: error: invalid application of ?sizeof? to incomplete type ?struct sockaddr_un?
+             if (connect(sockd, (struct sockaddr *)&nixsock, sizeof(nixsock)) == 0)
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Upstream-status: http://lurker.clamav.net/message/20140928.130829.5494fd68.en.html
+---
+ clamdscan/proto.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/clamdscan/proto.c b/clamdscan/proto.c
+index 0205f6da0..d3396732f 100644
+--- a/clamdscan/proto.c
++++ b/clamdscan/proto.c
+@@ -42,6 +42,7 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <sys/types.h>
++#include <sys/un.h>
+ #ifdef HAVE_SYS_SELECT_H
+ #include <sys/select.h>
+ #endif
+-- 
+2.14.3
+
diff --git a/package/clamav/0001-clamdscan.patch b/package/clamav/0001-clamdscan.patch
deleted file mode 100644
index c395ae1600..0000000000
--- a/package/clamav/0001-clamdscan.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Fixes build error
-
-proto.c: In function ?dconnect?:
-proto.c:86:67: error: invalid application of ?sizeof? to incomplete type ?struct sockaddr_un?
-             if (connect(sockd, (struct sockaddr *)&nixsock, sizeof(nixsock)) == 0)
-
-Patch sent upstream: http://lurker.clamav.net/message/20140928.130829.5494fd68.en.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr clamav-0.98.3.org/clamdscan/proto.c clamav-0.98.3/clamdscan/proto.c
---- clamav-0.98.3.org/clamdscan/proto.c	2014-05-06 20:39:56.000000000 +0200
-+++ clamav-0.98.3/clamdscan/proto.c	2014-05-10 10:41:44.000000000 +0200
-@@ -35,6 +35,7 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <sys/types.h>
-+#include <sys/un.h>
- #ifdef HAVE_SYS_SELECT_H
- #include <sys/select.h>
- #endif
diff --git a/package/clamav/0002-backtrace-uClibc.patch b/package/clamav/0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
similarity index 53%
rename from package/clamav/0002-backtrace-uClibc.patch
rename to package/clamav/0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
index 82ad67307d..e99a9742ec 100644
--- a/package/clamav/0002-backtrace-uClibc.patch
+++ b/package/clamav/0002-mbox-do-not-use-backtrace-if-using-uClibc-without-ba.patch
@@ -1,4 +1,8 @@
-mbox: do not use backtrace if using uClibc without backtrace support
+From 053bac34b9f0f947c58fcdf80ac03d5a6b05aa12 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 7 May 2018 23:15:58 +0200
+Subject: [PATCH] mbox: do not use backtrace if using uClibc without backtrace
+ support
 
 Since uClibc can be configured without support for backtrace, disable
 the backtrace if we are building with a uClibc that was built without
@@ -8,10 +12,15 @@ This is a bit hacky, and would greatly benefit from a test in ./configure
 instead, but does nicely as a quick fix for now.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-diff -durN clamav-0.98.4.orig/libclamav/mbox.c clamav-0.98.4/libclamav/mbox.c
---- clamav-0.98.4.orig/libclamav/mbox.c	2014-05-21 17:25:05.000000000 +0200
-+++ clamav-0.98.4/libclamav/mbox.c	2014-11-16 17:21:04.885383286 +0100
-@@ -83,7 +83,7 @@
+---
+ libclamav/mbox.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libclamav/mbox.c b/libclamav/mbox.c
+index 71f540c0a..4851297a9 100644
+--- a/libclamav/mbox.c
++++ b/libclamav/mbox.c
+@@ -98,7 +98,7 @@
  #include <features.h>
  #endif
  
@@ -20,3 +29,6 @@ diff -durN clamav-0.98.4.orig/libclamav/mbox.c clamav-0.98.4/libclamav/mbox.c
  #define HAVE_BACKTRACE
  #endif
  #endif
+-- 
+2.14.3
+
-- 
2.14.3
