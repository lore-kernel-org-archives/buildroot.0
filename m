From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Mar 2021 21:41:03 +0200
Subject: [Buildroot] [git commit] package/libqmi: fix build when libc
 doesn't define ARPHRD_RAWIP
Message-ID: <20210330191612.139B58A30D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91e97b56dcab8c9e404a19ac4e7599145c3bc948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARPHRD_RAWIP symbol is used in the rmnet backend in the link
management support now included in libqmi.

If libc doesn't provide this symbol yet, define it ourselves. The
symbol will only be used if rmnet is enabled in the kernel anyway.

This patch will be included in the next libqmi 1.28.4.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
[yann.morin.1998 at free.fr:
  - do an actual backport now it's been applied upstream
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch b/package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch
new file mode 100644
index 0000000000..1212878af4
--- /dev/null
+++ b/package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch
@@ -0,0 +1,39 @@
+From cdec8660427d2895415f1d84426e39d1ed145136 Mon Sep 17 00:00:00 2001
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
+index eb26129..571d4c4 100644
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
