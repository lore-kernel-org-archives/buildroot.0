Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E4EC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 20:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF1AF83F0A;
	Fri, 19 Jul 2024 20:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLptcgoZAAfJ; Fri, 19 Jul 2024 20:39:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1CE383F0B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1CE383F0B;
	Fri, 19 Jul 2024 20:39:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45C701BF31F
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33852605ED
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 20:39:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2zI-0XgBuEg for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 20:39:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91FA1605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91FA1605E0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91FA1605E0
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 20:39:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A1978FF802;
 Fri, 19 Jul 2024 20:39:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 22:39:33 +0200
Message-ID: <20240719203934.2090944-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721421575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=A/9/SvhMmEYt+YZJ0lP7kiGsXwKqvv2GnCn0bK78SsM=;
 b=JhgyGxKktTkKFcfGhD4/VlZj1jxUTt9ycPZcB/5DVixWb41tYlGHxQovq7AqnIM/nqXN92
 5m7azd2vNrcWl1zQ0MVb+OAPOG2fxgq5/3l060pSdA2gIVa39Ks8Og0gXf/+iNoGDRGnwA
 5zDtRWFKZtnvaUr6nv8eEnTzFugV82krtFLlBBozPNT7+VFCWvpBd6zPTNv7Okz2cjkJUP
 lBleMTyHlBYcQYt9aobA5MRDg2/XOYpntKUhUOMJh8ZWz3Qx+bp8qU0ctB6EqEHCe41Cq8
 +gIjxp+/9m0m1kmNgAD8qazxF9AfqdTO/EwrhcbYHPd53T7bcc+rpgxNk407Iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JhgyGxKk
Subject: [Buildroot] [PATCH] package/igh-ethercat: backport fix to build
 with Linux 6.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit backports a patch from upstream that fixes the build with
Linux 6.9.

Fixes:

  http://autobuild.buildroot.net/results/db2462b1c5c6797a0edca66a513c121dbddd8888/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Remove-dev_base_lock-for-linux-6.9.0.patch | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/igh-ethercat/0001-Remove-dev_base_lock-for-linux-6.9.0.patch

diff --git a/package/igh-ethercat/0001-Remove-dev_base_lock-for-linux-6.9.0.patch b/package/igh-ethercat/0001-Remove-dev_base_lock-for-linux-6.9.0.patch
new file mode 100644
index 0000000000..a71edb7be6
--- /dev/null
+++ b/package/igh-ethercat/0001-Remove-dev_base_lock-for-linux-6.9.0.patch
@@ -0,0 +1,51 @@
+From 09eb1b9f73d677d10d18039305b9d974e52cc6d5 Mon Sep 17 00:00:00 2001
+From: Nicola Fontana <ntd@entidi.it>
+Date: Mon, 3 Jun 2024 12:45:48 +0200
+Subject: [PATCH] Remove dev_base_lock for linux >= 6.9.0
+
+Kernel commit 1b3ef46cb7f2618cc0b507393220a69810f6da12 removed
+`dev_base_lock` from v6.9 onward.
+
+Use the alternate iterator `for_each_netdev_rcu` introduced by commit
+c6d14c84566d6b70ad9dc1618db0dec87cca9300 in 2.6.33+.
+
+Upstream: https://gitlab.com/etherlab.org/ethercat/-/commit/95c25b50711ca7e1f990bdcbca8fa713c942ab01
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ devices/generic.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/devices/generic.c b/devices/generic.c
+index 4d4d9bbd..f30f1e17 100644
+--- a/devices/generic.c
++++ b/devices/generic.c
+@@ -420,14 +420,14 @@ int __init ec_gen_init_module(void)
+     INIT_LIST_HEAD(&generic_devices);
+     INIT_LIST_HEAD(&descs);
+ 
+-    read_lock(&dev_base_lock);
+-    for_each_netdev(&init_net, netdev) {
++    rcu_read_lock();
++    for_each_netdev_rcu(&init_net, netdev) {
+         if (netdev->type != ARPHRD_ETHER)
+             continue;
+         desc = kmalloc(sizeof(ec_gen_interface_desc_t), GFP_ATOMIC);
+         if (!desc) {
+             ret = -ENOMEM;
+-            read_unlock(&dev_base_lock);
++            rcu_read_unlock();
+             goto out_err;
+         }
+         strncpy(desc->name, netdev->name, IFNAMSIZ);
+@@ -436,7 +436,7 @@ int __init ec_gen_init_module(void)
+         memcpy(desc->dev_addr, netdev->dev_addr, ETH_ALEN);
+         list_add_tail(&desc->list, &descs);
+     }
+-    read_unlock(&dev_base_lock);
++    rcu_read_unlock();
+ 
+     list_for_each_entry_safe(desc, next, &descs, list) {
+         ret = offer_device(desc);
+-- 
+2.45.2
+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
