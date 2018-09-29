From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Sep 2018 13:15:37 +0200
Subject: [Buildroot] [PATCH 1/1] bootutils: fix build with glibc 2.28
Message-ID: <20180929111537.22500-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace first patch which was adding sys/types.h to fix musl issue by a
patch adding sys/sysmacros to fix build with glibc 2.28

Fixes:
 - http://autobuild.buildroot.org/results/c26761663a764a2eb7af54316a6dc78bd01490fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-with-glibc-2.28.patch      | 41 +++++++++++++++++++
 .../0001-fix-musl-compilation-issue.patch     | 31 --------------
 2 files changed, 41 insertions(+), 31 deletions(-)
 create mode 100644 package/bootutils/0001-fix-build-with-glibc-2.28.patch
 delete mode 100644 package/bootutils/0001-fix-musl-compilation-issue.patch

diff --git a/package/bootutils/0001-fix-build-with-glibc-2.28.patch b/package/bootutils/0001-fix-build-with-glibc-2.28.patch
new file mode 100644
index 0000000000..fced93d4a6
--- /dev/null
+++ b/package/bootutils/0001-fix-build-with-glibc-2.28.patch
@@ -0,0 +1,41 @@
+From 00773e89893e4aaed721269eee0dbf844edd291c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 29 Sep 2018 12:56:14 +0200
+Subject: [PATCH] fix build with glibc 2.28
+
+Include to sys/sysmacros.h is needed to use makedev since glibc 2.28 so
+add this include to devname.c and raidscan.c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libblkid/devname.c | 1 +
+ raidscan.c         | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libblkid/devname.c b/libblkid/devname.c
+index d11bddd..12b63db 100644
+--- a/libblkid/devname.c
++++ b/libblkid/devname.c
+@@ -37,6 +37,7 @@
+ #if HAVE_SYS_MKDEV_H
+ #include <sys/mkdev.h>
+ #endif
++#include <sys/sysmacros.h>
+ #include <time.h>
+ 
+ #include "blkidP.h"
+diff --git a/raidscan.c b/raidscan.c
+index fab3b02..6e07b3d 100644
+--- a/raidscan.c
++++ b/raidscan.c
+@@ -22,6 +22,7 @@
+ #include "config.h"
+ 
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <linux/major.h>
+-- 
+2.17.1
+
diff --git a/package/bootutils/0001-fix-musl-compilation-issue.patch b/package/bootutils/0001-fix-musl-compilation-issue.patch
deleted file mode 100644
index ccb6ef61ec..0000000000
--- a/package/bootutils/0001-fix-musl-compilation-issue.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e4c2c18b9d1d7a6dc17d8f7705b26fc2e2efc5a9 Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Sun, 30 Aug 2015 20:12:40 +0100
-Subject: [PATCH 1/1] fix musl compilation issue
-
-makedev(3) requires sys/types.h to be included.
-
-Note upstream has not issued releases since 2009. No mailing list activity
-since January 2010, and even before then it seems to be mostly spam.
-
-Upstream-Status: dormant
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
----
- raidscan.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/raidscan.c b/raidscan.c
-index fab3b02..3cb1a0d 100644
---- a/raidscan.c
-+++ b/raidscan.c
-@@ -22,6 +22,7 @@
- #include "config.h"
- 
- #include <sys/stat.h>
-+#include <sys/types.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
- #include <linux/major.h>
--- 
-2.4.3
-
-- 
2.17.1
