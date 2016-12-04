From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 23:57:31 +0100
Subject: [Buildroot] [git commit] package/openpowerlink: fix build with
	Linux kernel 4.7+
Message-ID: <20161204225741.CED5880D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1db28a7ba0a230b5d22ef32a64b6844665afa755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dev->trans_start was replaced by netif_trans_update helper in kernel
4.7 by commit 860e9538a9482bb84589f7d0718a7e6d0a944d58.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Veth-Fix-compilation-on-Linux-kernels-4.7.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/openpowerlink/0004-FIX-Veth-Fix-compilation-on-Linux-kernels-4.7.patch b/package/openpowerlink/0004-FIX-Veth-Fix-compilation-on-Linux-kernels-4.7.patch
new file mode 100644
index 0000000..d246f46
--- /dev/null
+++ b/package/openpowerlink/0004-FIX-Veth-Fix-compilation-on-Linux-kernels-4.7.patch
@@ -0,0 +1,35 @@
+From 041799c4990d56b9822ee3ae3ffbb181e5c16c81 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 3 Nov 2016 21:09:57 +0100
+Subject: [PATCH] [FIX] Veth: Fix compilation on Linux kernels >= 4.7
+
+dev->trans_start was replaced by netif_trans_update helper in kernel
+4.7 by commit 860e9538a9482bb84589f7d0718a7e6d0a944d58.
+
+Upstream status: Pending
+https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/177
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ stack/src/kernel/veth/veth-linuxkernel.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/stack/src/kernel/veth/veth-linuxkernel.c b/stack/src/kernel/veth/veth-linuxkernel.c
+index 8c68c47..ecdc000 100644
+--- a/stack/src/kernel/veth/veth-linuxkernel.c
++++ b/stack/src/kernel/veth/veth-linuxkernel.c
+@@ -287,7 +287,11 @@ static int vethStartXmit(struct sk_buff* pSkb_p, struct net_device* pNetDevice_p
+     struct net_device_stats* pStats = netdev_priv(pNetDevice_p);
+ 
+     //save time stamp
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 7, 0))
+     pNetDevice_p->trans_start = jiffies;
++#else
++    netif_trans_update(pNetDevice_p);
++#endif
+ 
+     frameInfo.frame.pBuffer = (tPlkFrame*)pSkb_p->data;
+     frameInfo.frameSize = pSkb_p->len;
+-- 
+2.5.5
+
