From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 30 Mar 2021 00:35:42 +0200
Subject: [Buildroot] [PATCH] package/libqmi: fix build when libc doesn't
 define ARPHRD_RAWIP
Message-ID: <20210329223542.13907-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ARPHRD_RAWIP symbol is used in the rmnet backend in the link
management support now included in libqmi.

If libc doesn't provide this symbol yet, define it ourselves. The
symbol will only be used if rmnet is enabled in the kernel anyway.

This patch will be included in the next libqmi 1.28.4.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 ...-when-ARPHRD_RAWIP-isn-t-defined-in-.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch

diff --git a/package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch b/package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch
new file mode 100644
index 0000000000..fb438676a9
--- /dev/null
+++ b/package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch
@@ -0,0 +1,39 @@
+From 6745e19b07006611eb392e5b33095c63ee41fe92 Mon Sep 17 00:00:00 2001
+From: Aleksander Morgado <aleksander@aleksander.es>
+Date: Tue, 30 Mar 2021 00:13:45 +0200
+Subject: [PATCH] libqmi: fix build when ARPHRD_RAWIP isn't defined in libc
+
+The kernel may be new enough to have rmnet support, but it could be
+that libc doesn't have ARPHRD_RAWIP defined yet; if so, just define it
+ourselves.
+
+Fixes http://autobuild.buildroot.org/results/c8853b7161bd85d46c1282c6c097e7ef4042ae68
+
+Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
+---
+ src/libqmi-glib/qmi-net-port-manager-rmnet.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/libqmi-glib/qmi-net-port-manager-rmnet.c b/src/libqmi-glib/qmi-net-port-manager-rmnet.c
+index bd6727e3..82935bb8 100644
+--- a/src/libqmi-glib/qmi-net-port-manager-rmnet.c
++++ b/src/libqmi-glib/qmi-net-port-manager-rmnet.c
+@@ -24,8 +24,15 @@
+ #include <linux/if_link.h>
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
++
+ #include <net/if.h>
+ #include <net/if_arp.h>
++
++/* The if_arp.h from libc may not have this symbol yet */
++#if !defined ARPHRD_RAWIP
++#define ARPHRD_RAWIP 519
++#endif
++
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <string.h>
+-- 
+2.30.1
+
-- 
2.30.1
