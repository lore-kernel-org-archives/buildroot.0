From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 25 Jul 2015 10:53:50 +0200
Subject: [Buildroot] [PATCH] can-utils: bump version
Message-ID: <1437814430-13677-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstreamed patches.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0001-log2asc-include-sys-time.h.patch          | 28 ---------------
 ...Include-linux-sockios.h-to-fix-musl-build.patch | 42 ----------------------
 package/can-utils/can-utils.mk                     |  2 +-
 3 files changed, 1 insertion(+), 71 deletions(-)
 delete mode 100644 package/can-utils/0001-log2asc-include-sys-time.h.patch
 delete mode 100644 package/can-utils/0002-Include-linux-sockios.h-to-fix-musl-build.patch

diff --git a/package/can-utils/0001-log2asc-include-sys-time.h.patch b/package/can-utils/0001-log2asc-include-sys-time.h.patch
deleted file mode 100644
index 30cf23b..0000000
--- a/package/can-utils/0001-log2asc-include-sys-time.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 50a71462a3291f7e08fa25f67b274792bb419211 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 14 Jul 2015 21:24:37 +0200
-Subject: [PATCH 1/2] log2asc: include sys/time.h
-
-Without this patch compilation against musl C library
-breaks, because struct timeval cannot be found.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- log2asc.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/log2asc.c b/log2asc.c
-index 29d13e8..8fb88a9 100644
---- a/log2asc.c
-+++ b/log2asc.c
-@@ -48,6 +48,7 @@
- #include <unistd.h>
- 
- #include <net/if.h>
-+#include <sys/time.h>
- #include <linux/can.h>
- 
- #include "lib.h"
--- 
-2.1.4
-
diff --git a/package/can-utils/0002-Include-linux-sockios.h-to-fix-musl-build.patch b/package/can-utils/0002-Include-linux-sockios.h-to-fix-musl-build.patch
deleted file mode 100644
index aca3eb4..0000000
--- a/package/can-utils/0002-Include-linux-sockios.h-to-fix-musl-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 204cfffefb2ee6058e5d22a4b65cff22e6cff5ee Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Thu, 16 Jul 2015 21:30:02 +0200
-Subject: [PATCH 2/2] Include linux/sockios.h to fix musl build
-
-Including <sys/ioctl.h> and <net/if.h> is not sufficient
-to musl to find SIOCSIFNAME, so <linux/sockios.h> must be
-included too.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- slcan_attach.c | 1 +
- slcand.c       | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/slcan_attach.c b/slcan_attach.c
-index ab8ff0a..485cbe3 100644
---- a/slcan_attach.c
-+++ b/slcan_attach.c
-@@ -52,6 +52,7 @@
- #include <net/if.h>
- #include <termios.h>
- #include <linux/tty.h>
-+#include <linux/sockios.h>
- 
- void print_usage(char *prg)
- {
-diff --git a/slcand.c b/slcand.c
-index e5e4752..e8c70e0 100644
---- a/slcand.c
-+++ b/slcand.c
-@@ -38,6 +38,7 @@
- #include <net/if.h>
- #include <termios.h>
- #include <linux/tty.h>
-+#include <linux/sockios.h>
- 
- /* Change this to whatever your daemon is called */
- #define DAEMON_NAME "slcand"
--- 
-2.1.4
-
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index 23649fe..8e8ed4e 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = 0eb1e3db2e20b0d895468363dbe6030cd8afa61c
+CAN_UTILS_VERSION = f0abaaacb0a3f620f73dd6fd716d7daa3c36a8e3
 CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
 CAN_UTILS_AUTORECONF = YES
 
-- 
2.1.0
