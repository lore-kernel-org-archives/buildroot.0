From: Romain Naour <romain.naour@smile.fr>
Date: Sat,  6 May 2017 13:02:47 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to v2.5.2
Message-ID: <20170506110247.17670-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patch.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...Veth-Fix-compilation-on-Linux-kernels-4.7.patch | 35 ----------------------
 package/openpowerlink/openpowerlink.hash           |  8 ++---
 package/openpowerlink/openpowerlink.mk             |  2 +-
 3 files changed, 5 insertions(+), 40 deletions(-)
 delete mode 100644 package/openpowerlink/0004-FIX-Veth-Fix-compilation-on-Linux-kernels-4.7.patch

diff --git a/package/openpowerlink/0004-FIX-Veth-Fix-compilation-on-Linux-kernels-4.7.patch b/package/openpowerlink/0004-FIX-Veth-Fix-compilation-on-Linux-kernels-4.7.patch
deleted file mode 100644
index d246f46..0000000
--- a/package/openpowerlink/0004-FIX-Veth-Fix-compilation-on-Linux-kernels-4.7.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 041799c4990d56b9822ee3ae3ffbb181e5c16c81 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Thu, 3 Nov 2016 21:09:57 +0100
-Subject: [PATCH] [FIX] Veth: Fix compilation on Linux kernels >= 4.7
-
-dev->trans_start was replaced by netif_trans_update helper in kernel
-4.7 by commit 860e9538a9482bb84589f7d0718a7e6d0a944d58.
-
-Upstream status: Pending
-https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/177
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- stack/src/kernel/veth/veth-linuxkernel.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/stack/src/kernel/veth/veth-linuxkernel.c b/stack/src/kernel/veth/veth-linuxkernel.c
-index 8c68c47..ecdc000 100644
---- a/stack/src/kernel/veth/veth-linuxkernel.c
-+++ b/stack/src/kernel/veth/veth-linuxkernel.c
-@@ -287,7 +287,11 @@ static int vethStartXmit(struct sk_buff* pSkb_p, struct net_device* pNetDevice_p
-     struct net_device_stats* pStats = netdev_priv(pNetDevice_p);
- 
-     //save time stamp
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 7, 0))
-     pNetDevice_p->trans_start = jiffies;
-+#else
-+    netif_trans_update(pNetDevice_p);
-+#endif
- 
-     frameInfo.frame.pBuffer = (tPlkFrame*)pSkb_p->data;
-     frameInfo.frameSize = pSkb_p->len;
--- 
-2.5.5
-
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index f9c94f9..7132090 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.5.0/
-md5	929b778a6a4d448d502da5a428322949	openPOWERLINK_V2.5.0.tar.gz
-sha1	28e2e5621550421e74ba94738f6c12eb8c279fce	openPOWERLINK_V2.5.0.tar.gz
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.5.2/
+md5	aa74d7f80d1ef6debcd40f97cd2df3f5	openPOWERLINK_V2.5.2.tar.gz
+sha1	7c46f337324e88096531d2cb74e47750833e851b	openPOWERLINK_V2.5.2.tar.gz
 # sha256 locally computed
-sha256	1cb8c44626dbb7f224520667e437b4b430a32699560914f379679b6c58c1309c	openPOWERLINK_V2.5.0.tar.gz
+sha256	4bc288be11ceebba2aa5c2a43a66489218f1e55bb75a07afc9e01e0e6233bcdc	openPOWERLINK_V2.5.2.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 06846ee..adcc48b 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.5.0
+OPENPOWERLINK_VERSION = V2.5.2
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
-- 
2.9.3
