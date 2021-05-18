From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 13:40:18 +0200
Subject: [Buildroot] [git commit branch/next] package/libqmi: bump version
 to 1.28.4
Message-ID: <20210518111135.0A87287C0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=118cf25a5ca012bd32031820250d0e5196be751a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch backported from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch | 39 ----------------------
 package/libqmi/libqmi.hash                         |  2 +-
 package/libqmi/libqmi.mk                           |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch b/package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch
deleted file mode 100644
index 1212878af4..0000000000
--- a/package/libqmi/0001-libqmi-fix-build-when-ARPHRD_RAWIP-isn-t-defined-in-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From cdec8660427d2895415f1d84426e39d1ed145136 Mon Sep 17 00:00:00 2001
-From: Aleksander Morgado <aleksander@aleksander.es>
-Date: Tue, 30 Mar 2021 00:13:45 +0200
-Subject: [PATCH] libqmi: fix build when ARPHRD_RAWIP isn't defined in libc
-
-The kernel may be new enough to have rmnet support, but it could be
-that libc doesn't have ARPHRD_RAWIP defined yet; if so, just define it
-ourselves.
-
-Fixes http://autobuild.buildroot.org/results/c8853b7161bd85d46c1282c6c097e7ef4042ae68
-
-Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
----
- src/libqmi-glib/qmi-net-port-manager-rmnet.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/libqmi-glib/qmi-net-port-manager-rmnet.c b/src/libqmi-glib/qmi-net-port-manager-rmnet.c
-index eb26129..571d4c4 100644
---- a/src/libqmi-glib/qmi-net-port-manager-rmnet.c
-+++ b/src/libqmi-glib/qmi-net-port-manager-rmnet.c
-@@ -24,8 +24,15 @@
- #include <linux/if_link.h>
- #include <linux/netlink.h>
- #include <linux/rtnetlink.h>
-+
- #include <net/if.h>
- #include <net/if_arp.h>
-+
-+/* The if_arp.h from libc may not have this symbol yet */
-+#if !defined ARPHRD_RAWIP
-+#define ARPHRD_RAWIP 519
-+#endif
-+
- #include <sys/socket.h>
- #include <sys/types.h>
- #include <string.h>
--- 
-2.30.1
-
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 8cf25f486a..2720a8236d 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  8c8c3ee719874d2529bce9b35b028fe435b36f003979a360d3ad0938449db783  libqmi-1.28.2.tar.xz
+sha256  3b14cd2ab5221a7adbb39fed16ef697538ea1c79308821ad2d19b505e1daaea0  libqmi-1.28.4.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 6fc6d4a50d..278c0116be 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.28.2
+LIBQMI_VERSION = 1.28.4
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
