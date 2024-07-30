Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65DAC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 07:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83E9180E0D;
	Tue, 30 Jul 2024 07:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nugsyN7JIyHu; Tue, 30 Jul 2024 07:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AB94812DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB94812DD;
	Tue, 30 Jul 2024 07:35:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C87F1BF360
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35C59405DE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 07:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enG4QYsBhjy2 for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 07:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA02405FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BA02405FA
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 07:35:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00B2C836B5; Tue, 30 Jul 2024 07:35:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 09:28:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d76daf0758e04d113c480974e5f89701255397cd
X-Git-Newrev: 7fab00ff153155fab626e718fb43d425e88d3066
X-Patchwork-Hint: ignore
Message-Id: <20240730073536.00B2C836B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: backport fix to
 build with Linux 6.9
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7fab00ff153155fab626e718fb43d425e88d3066
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit backports a patch from upstream that fixes the build with
Linux 6.9.

Fixes:

  http://autobuild.buildroot.net/results/db2462b1c5c6797a0edca66a513c121dbddd8888/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Remove-dev_base_lock-for-linux-6.9.0.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
