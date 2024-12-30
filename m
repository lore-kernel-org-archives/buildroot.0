Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF5E7718F
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 22:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167D160A89;
	Mon, 30 Dec 2024 22:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMMSzJovsZDB; Mon, 30 Dec 2024 22:52:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C16F760677
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C16F760677;
	Mon, 30 Dec 2024 22:52:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA228E0F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98F1C605FA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFnHDOi3jwHa for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 22:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E340260677
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E340260677
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E340260677
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:52:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id ADA431BF204;
 Mon, 30 Dec 2024 22:52:28 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 30 Dec 2024 23:52:22 +0100
Message-ID: <20241230225225.1493467-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735599148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zPpID+odfbNxN+Y452TfLYLFroxEJ2TUyZQi86kufmI=;
 b=PI1HHAvglPXwXNqropRF1KdzZqJeked7095zI9xW6sj7rhoG411/wjlptzfhcx+qgDVjjQ
 BdEU5Zo3w6MYoLyVcAUkxaSrprkb9fegmLeS2fsZ22RKdS8z1+esYU+TD+GjpBoxprYGHq
 3zu/7AZLPzmXHBW0NRlHxjL7UMa46pAilc4FyddpQSOSrS7TZAw+1IbtXPleFS/DnPTRjO
 Nha15wdavXdFwH6mDgd1VLvQ0LbGnww4EKTI9AAnqVWa0Q0ZMwZAoQljzC+oxnzRXn0BDP
 ZPcxbgLyV9EuCoKDQY4lVhnMzrmqUdteOmb9l0Wd/ocsOa391mA9JPW6fgogzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PI1HHAvg
Subject: [Buildroot] [PATCH 1/2] package/batman-adv: fix build failures with
 Linux >= 6.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The first two patches fix:

/home/autobuild/autobuild/instance-5/output-1/build/batman-adv-2024.2/net/batman-adv/distributed-arp-table.c:10:10: fatal error: asm/unaligned.h: No such file or directory

Which is a fallout out from Linux kernel upstream commit
5f60d5f6bbc12e782fac78110b0ee62698f3b576 that got merged in Linux
6.12.

Patch 0003 is needed due to the removal of NETIF_F_LLTX in upstream
Linux kernel commit 00d066a4d4edbe559ba6c35153da71d4b2b8a383 that got
merged in Linux 6.12.

Patch 0004 is needed due to the removal of NETIF_F_NETNS_LOCAL in
upstream Linux kernel commit 05c1280a2bcfca187fe7fa90bb240602cf54af0a
that got merged in Linux 6.12.

Fixes:

  https://autobuild.buildroot.org/results/4ac369f7fe9cd62de431fa02bc982465e8d1f806/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...asm-unaligned.h-to-linux-unaligned.h.patch | 74 +++++++++++++++++++
 ...er-includes-for-distributed-arp-tabl.patch | 39 ++++++++++
 ...adv-convert-NETIF_F_LLTX-to-dev-lltx.patch | 40 ++++++++++
 ...rt-NETIF_F_NETNS_LOCAL-to-dev-netns_.patch | 43 +++++++++++
 4 files changed, 196 insertions(+)
 create mode 100644 package/batman-adv/0001-batman-adv-move-asm-unaligned.h-to-linux-unaligned.h.patch
 create mode 100644 package/batman-adv/0002-batman-adv-Reorder-includes-for-distributed-arp-tabl.patch
 create mode 100644 package/batman-adv/0003-batman-adv-convert-NETIF_F_LLTX-to-dev-lltx.patch
 create mode 100644 package/batman-adv/0004-batman-adv-convert-NETIF_F_NETNS_LOCAL-to-dev-netns_.patch

diff --git a/package/batman-adv/0001-batman-adv-move-asm-unaligned.h-to-linux-unaligned.h.patch b/package/batman-adv/0001-batman-adv-move-asm-unaligned.h-to-linux-unaligned.h.patch
new file mode 100644
index 0000000000..d2757aa025
--- /dev/null
+++ b/package/batman-adv/0001-batman-adv-move-asm-unaligned.h-to-linux-unaligned.h.patch
@@ -0,0 +1,74 @@
+From 3b434d5878131cd45aa5c4dd906fe0e569b445d6 Mon Sep 17 00:00:00 2001
+From: Al Viro <viro@zeniv.linux.org.uk>
+Date: Tue, 1 Oct 2024 15:35:57 -0400
+Subject: [PATCH] batman-adv: move asm/unaligned.h to linux/unaligned.h
+
+asm/unaligned.h is always an include of asm-generic/unaligned.h;
+might as well move that thing to linux/unaligned.h and include
+that - there's nothing arch-specific in that header.
+
+auto-generated by the following:
+
+for i in `git grep -l -w asm/unaligned.h`; do
+	sed -i -e "s/asm\/unaligned.h/linux\/unaligned.h/" $i
+done
+for i in `git grep -l -w asm-generic/unaligned.h`; do
+	sed -i -e "s/asm-generic\/unaligned.h/linux\/unaligned.h/" $i
+done
+git mv include/asm-generic/unaligned.h include/linux/unaligned.h
+git mv tools/include/asm-generic/unaligned.h tools/include/linux/unaligned.h
+sed -i -e "/unaligned.h/d" include/asm-generic/Kbuild
+sed -i -e "s/__ASM_GENERIC/__LINUX/" include/linux/unaligned.h tools/include/linux/unaligned.h
+
+Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
+Signed-off-by: Sven Eckelmann <sven@narfation.org>
+Upstream: https://git.open-mesh.org/batman-adv.git/commit/ee60832ebec47a023d634b06f9434103ec090aed
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ compat-include/linux/unaligned.h       | 20 ++++++++++++++++++++
+ net/batman-adv/distributed-arp-table.c |  2 +-
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+ create mode 100644 compat-include/linux/unaligned.h
+
+diff --git a/compat-include/linux/unaligned.h b/compat-include/linux/unaligned.h
+new file mode 100644
+index 00000000..66d86646
+--- /dev/null
++++ b/compat-include/linux/unaligned.h
+@@ -0,0 +1,20 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/* Copyright (C) B.A.T.M.A.N. contributors:
++ *
++ * Marek Lindner, Simon Wunderlich
++ *
++ * This file contains macros for maintaining compatibility with older versions
++ * of the Linux kernel.
++ */
++
++#ifndef _NET_BATMAN_ADV_COMPAT_LINUX_UNALIGNED_H_
++#define _NET_BATMAN_ADV_COMPAT_LINUX_UNALIGNED_H_
++
++#include <linux/version.h>
++#if LINUX_VERSION_IS_GEQ(6, 12, 0)
++#include_next <linux/unaligned.h>
++#else
++#include <asm/unaligned.h>
++#endif
++
++#endif /* _NET_BATMAN_ADV_COMPAT_LINUX_UNALIGNED_H_ */
+diff --git a/net/batman-adv/distributed-arp-table.c b/net/batman-adv/distributed-arp-table.c
+index 4c7e8553..801eff8a 100644
+--- a/net/batman-adv/distributed-arp-table.c
++++ b/net/batman-adv/distributed-arp-table.c
+@@ -7,7 +7,7 @@
+ #include "distributed-arp-table.h"
+ #include "main.h"
+ 
+-#include <asm/unaligned.h>
++#include <linux/unaligned.h>
+ #include <linux/atomic.h>
+ #include <linux/bitops.h>
+ #include <linux/byteorder/generic.h>
+-- 
+2.47.1
+
diff --git a/package/batman-adv/0002-batman-adv-Reorder-includes-for-distributed-arp-tabl.patch b/package/batman-adv/0002-batman-adv-Reorder-includes-for-distributed-arp-tabl.patch
new file mode 100644
index 0000000000..ab3f642cfe
--- /dev/null
+++ b/package/batman-adv/0002-batman-adv-Reorder-includes-for-distributed-arp-tabl.patch
@@ -0,0 +1,39 @@
+From dc072c88ef0eaa80215dbc25923678c6a3d46e25 Mon Sep 17 00:00:00 2001
+From: Sven Eckelmann <sven@narfation.org>
+Date: Wed, 16 Oct 2024 09:23:06 +0200
+Subject: [PATCH] batman-adv: Reorder includes for distributed-arp-table.c
+
+The commit ee60832ebec4 ("batman-adv: move asm/unaligned.h to
+linux/unaligned.h") changed the include without adjusting the order (to
+match the rest of the file).
+
+Signed-off-by: Sven Eckelmann <sven@narfation.org>
+Upstream: https://git.open-mesh.org/batman-adv.git/commit/fd3a0eff09429719e61e60b7dc3d2a373183a5ad
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ net/batman-adv/distributed-arp-table.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/net/batman-adv/distributed-arp-table.c b/net/batman-adv/distributed-arp-table.c
+index 801eff8a..48b72c2b 100644
+--- a/net/batman-adv/distributed-arp-table.c
++++ b/net/batman-adv/distributed-arp-table.c
+@@ -7,7 +7,6 @@
+ #include "distributed-arp-table.h"
+ #include "main.h"
+ 
+-#include <linux/unaligned.h>
+ #include <linux/atomic.h>
+ #include <linux/bitops.h>
+ #include <linux/byteorder/generic.h>
+@@ -32,6 +31,7 @@
+ #include <linux/stddef.h>
+ #include <linux/string.h>
+ #include <linux/udp.h>
++#include <linux/unaligned.h>
+ #include <linux/workqueue.h>
+ #include <net/arp.h>
+ #include <net/genetlink.h>
+-- 
+2.47.1
+
diff --git a/package/batman-adv/0003-batman-adv-convert-NETIF_F_LLTX-to-dev-lltx.patch b/package/batman-adv/0003-batman-adv-convert-NETIF_F_LLTX-to-dev-lltx.patch
new file mode 100644
index 0000000000..6e41ba6ad9
--- /dev/null
+++ b/package/batman-adv/0003-batman-adv-convert-NETIF_F_LLTX-to-dev-lltx.patch
@@ -0,0 +1,40 @@
+From e8d6208a41c9b9912cac60ebad57d7dbe4b9786c Mon Sep 17 00:00:00 2001
+From: Alexander Lobakin <aleksander.lobakin@intel.com>
+Date: Thu, 29 Aug 2024 14:33:37 +0200
+Subject: [PATCH] batman-adv: convert NETIF_F_LLTX to dev->lltx
+
+NETIF_F_LLTX can't be changed via Ethtool and is not a feature,
+rather an attribute, very similar to IFF_NO_QUEUE (and hot).
+Free one netdev_features_t bit and make it a "hot" private flag.
+
+Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
+Signed-off-by: Paolo Abeni <pabeni@redhat.com>
+[sven@narfation.org: add compat code]
+Signed-off-by: Sven Eckelmann <sven@narfation.org>
+Upstream: https://git.open-mesh.org/batman-adv.git/commit/b6d2c16d1a5f90e1aff1ca55d73ba4e7be03c2a0
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ net/batman-adv/soft-interface.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/net/batman-adv/soft-interface.c b/net/batman-adv/soft-interface.c
+index 30ecbc2e..48cf3bd9 100644
+--- a/net/batman-adv/soft-interface.c
++++ b/net/batman-adv/soft-interface.c
+@@ -1021,8 +1021,12 @@ static void batadv_softif_init_early(struct net_device *dev)
+ 	dev->needs_free_netdev = true;
+ 	dev->priv_destructor = batadv_softif_free;
+ 	dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_NETNS_LOCAL;
+-	dev->features |= NETIF_F_LLTX;
+ 	dev->priv_flags |= IFF_NO_QUEUE;
++#if LINUX_VERSION_IS_GEQ(6, 12, 0) // UGLY_HACK_NEW
++	dev->lltx = true;
++#else // UGLY_HACK_OLD
++	dev->features |= NETIF_F_LLTX;
++#endif // UGLY_HACK_STOP
+ 
+ 	/* can't call min_mtu, because the needed variables
+ 	 * have not been initialized yet
+-- 
+2.47.1
+
diff --git a/package/batman-adv/0004-batman-adv-convert-NETIF_F_NETNS_LOCAL-to-dev-netns_.patch b/package/batman-adv/0004-batman-adv-convert-NETIF_F_NETNS_LOCAL-to-dev-netns_.patch
new file mode 100644
index 0000000000..7d0ea9f087
--- /dev/null
+++ b/package/batman-adv/0004-batman-adv-convert-NETIF_F_NETNS_LOCAL-to-dev-netns_.patch
@@ -0,0 +1,43 @@
+From 5315fd6f4db07dfb5c25949a3c7ac607feff863e Mon Sep 17 00:00:00 2001
+From: Alexander Lobakin <aleksander.lobakin@intel.com>
+Date: Thu, 29 Aug 2024 14:33:38 +0200
+Subject: [PATCH] batman-adv: convert NETIF_F_NETNS_LOCAL to dev->netns_local
+
+"Interface can't change network namespaces" is rather an attribute,
+not a feature, and it can't be changed via Ethtool.
+Make it a "cold" private flag instead of a netdev_feature and free
+one more bit.
+
+Signed-off-by: Alexander Lobakin <aleksander.lobakin@intel.com>
+Signed-off-by: Paolo Abeni <pabeni@redhat.com>
+[sven@narfation.org: add compat code]
+Signed-off-by: Sven Eckelmann <sven@narfation.org>
+Upstream: https://git.open-mesh.org/batman-adv.git/commit/b0405a97957978a0aa46dde55d590e1cf0f4309e
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ net/batman-adv/soft-interface.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/net/batman-adv/soft-interface.c b/net/batman-adv/soft-interface.c
+index 48cf3bd9..610bbaaa 100644
+--- a/net/batman-adv/soft-interface.c
++++ b/net/batman-adv/soft-interface.c
+@@ -1020,12 +1020,13 @@ static void batadv_softif_init_early(struct net_device *dev)
+ 	dev->netdev_ops = &batadv_netdev_ops;
+ 	dev->needs_free_netdev = true;
+ 	dev->priv_destructor = batadv_softif_free;
+-	dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_NETNS_LOCAL;
++	dev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+ 	dev->priv_flags |= IFF_NO_QUEUE;
+ #if LINUX_VERSION_IS_GEQ(6, 12, 0) // UGLY_HACK_NEW
+ 	dev->lltx = true;
++	dev->netns_local = true;
+ #else // UGLY_HACK_OLD
+-	dev->features |= NETIF_F_LLTX;
++	dev->features |= NETIF_F_LLTX | NETIF_F_NETNS_LOCAL;
+ #endif // UGLY_HACK_STOP
+ 
+ 	/* can't call min_mtu, because the needed variables
+-- 
+2.47.1
+
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
