From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Mar 2018 10:35:16 +0100
Subject: [Buildroot] [git commit] bluez5_utils: bump to version 5.49
Message-ID: <20180316094337.C8AE183628@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faf31a87f4dc4c03785ee55fb92818bd59cf5dbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop musl patch, which is not necessary anymore as netinet vs linux
header clash is fixed.

Also add hash for the license files.

musl build successfully tested with:
 * armv7-eabihf--musl--stable-2017.05-toolchains-1-1
   (GCC 5.4.0, Linux headers 3.10.105, musl 1.1.16)
 * armv7-eabihf--musl--bleeding-edge-2018.02-1
   (GCC 7.3.0, Linux headers 4.9.80, musl 1.1.18)

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...est.c-Remove-include-linux-if_bridge.h-to.patch | 45 ----------------------
 package/bluez5_utils/bluez5_utils.hash             |  4 +-
 package/bluez5_utils/bluez5_utils.mk               |  2 +-
 3 files changed, 4 insertions(+), 47 deletions(-)

diff --git a/package/bluez5_utils/0001-tools-bneptest.c-Remove-include-linux-if_bridge.h-to.patch b/package/bluez5_utils/0001-tools-bneptest.c-Remove-include-linux-if_bridge.h-to.patch
deleted file mode 100644
index e8a3ff47bf..0000000000
--- a/package/bluez5_utils/0001-tools-bneptest.c-Remove-include-linux-if_bridge.h-to.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7c136b4f1941e5bb2a6c8d93985c5734c6aefb29 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@writeme.com>
-Date: Sun, 22 May 2016 09:48:57 +0200
-Subject: [PATCH 1/1] tools/bneptest.c: Remove include linux/if_bridge.h to fix
- musl build
-
-Inspired by busybox commit:
-https://git.busybox.net/busybox/commit/networking/brctl.c?id=5fa6d1a632505789409a2ba6cf8e112529f9db18
-
-The build error was found by the autobuilders of the buildroot project:
-http://autobuild.buildroot.net/results/eba/ebaa0bcb9c325aa6ed0bbd6c7ec75d44befa7645/build-end.log
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@writeme.com>
-(Patch sent upstream:
- http://article.gmane.org/gmane.linux.bluez.kernel/67621)
----
- tools/bneptest.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/tools/bneptest.c b/tools/bneptest.c
-index 1404252..b832d72 100644
---- a/tools/bneptest.c
-+++ b/tools/bneptest.c
-@@ -36,7 +36,17 @@
- #include <net/if.h>
- #include <linux/sockios.h>
- #include <netinet/in.h>
--#include <linux/if_bridge.h>
-+/* #include <linux/if_bridge.h>
-+ * breaks on musl: we already included netinet/in.h,
-+ * if we also include <linux/if_bridge.h> here, we get this:
-+ * In file included from /usr/include/linux/if_bridge.h:18,
-+ *                  from networking/brctl.c:67:
-+ * /usr/include/linux/in6.h:32: error: redefinition of 'struct in6_addr'
-+ * /usr/include/linux/in6.h:49: error: redefinition of 'struct sockaddr_in6'
-+ * /usr/include/linux/in6.h:59: error: redefinition of 'struct ipv6_mreq'
-+ */
-+/* From <linux/if_bridge.h> */
-+#define BRCTL_SET_BRIDGE_FORWARD_DELAY 8
- 
- #include <glib.h>
- 
--- 
-2.8.1
-
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index dc331b5a0d..8d142b755c 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256 b9a8723072ef66bae7ec301c774902ebcb444c9c5b149b5a199e60a1ba970e90  bluez-5.48.tar.xz
+sha256  33301d7a514c73d535ee1f91c2aed1af1f2e53efe11d3ac06bcf0d7abed2ce95  bluez-5.49.tar.xz
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
+sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 395340a3e6..e1c67bd622 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.48
+BLUEZ5_UTILS_VERSION = 5.49
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
