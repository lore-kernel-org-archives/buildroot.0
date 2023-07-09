Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EF7C0015E
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 15:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 945F8404D0;
	Sun,  9 Jul 2023 15:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 945F8404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id onZZ9uYyDkIH; Sun,  9 Jul 2023 15:19:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7A6E4016B;
	Sun,  9 Jul 2023 15:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7A6E4016B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA7391BF381
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 15:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3C7860ACA
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 15:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3C7860ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QneLnj7D9rqZ for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 15:19:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9414560AB2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9414560AB2
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 15:19:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D8A41A4C00F9;
 Sun,  9 Jul 2023 17:19:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60528)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIWBz-0005BB-20;
 Sun, 09 Jul 2023 17:19:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Jul 2023 17:19:19 +0200
Message-Id: <20230709151919.1694148-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688915959;
 bh=4UbK5WGArpGk1+gb1PUh4cXJE3NbNFljipBe/8Dq9kY=;
 h=From:To:Cc:Subject:Date:From;
 b=ynmnaDEbnIghvlAs8TOP1ru73k8QCUklJssSPSpKRQSrjwNWu57fr54Zd32ZqXn+o
 o3JY+/dpJj/BVebhfC0GmkcPK8uTvVOXVJRgn/AEfs9pRCIHT6ScsHDRMyceSnD/WD
 N2dUSbf9w/abIJh6oKK5+MdxDBu10mMbHkn9BGV+tpq9pnzVaNxmfmmnr+ETG2lCkA
 D+MNLm6MnX8IK5rlgIlMPHRmG0rZ3T1vrPIp8R24Wdj7qB7m1d0gnpkl6jKD0WQJC7
 6WsflD93abbE5dYvTTSH4WzOLXFbSEJ6Jt2vlwRIcgCHSBGzJ9YX+P5GuongmyAL1k
 +REiqD+RMFSzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=ynmnaDEb
Subject: [Buildroot] [PATCH 1/1] package/dahdi-linux: Fix build on Linux 6.4
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/8b1/8b140b7f4d2f2b3080cab90906c3cebea0e510c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0006-Fix-build-on-Linux-6.4.patch         | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 package/dahdi-linux/0006-Fix-build-on-Linux-6.4.patch

diff --git a/package/dahdi-linux/0006-Fix-build-on-Linux-6.4.patch b/package/dahdi-linux/0006-Fix-build-on-Linux-6.4.patch
new file mode 100644
index 0000000000..992cb4d513
--- /dev/null
+++ b/package/dahdi-linux/0006-Fix-build-on-Linux-6.4.patch
@@ -0,0 +1,69 @@
+From b393e59d7eb2951e2fb279fca1c4756ea165aeee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 9 Jul 2023 17:14:31 +0200
+Subject: [PATCH] Fix build on Linux 6.4
+
+Needed after upstream changes in kernel 6.4:
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/include/linux/device/class.h?id=1aaba11da9aa
+https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=48380368dec14859723b9e3fbd43e042638d9a76
+
+Upstream: https://github.com/asterisk/dahdi-linux/pull/22
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ drivers/dahdi/dahdi-sysfs-chan.c  | 4 ++++
+ drivers/dahdi/voicebus/voicebus.c | 4 ++++
+ drivers/dahdi/wctdm24xxp/base.c   | 4 ++++
+ 3 files changed, 12 insertions(+)
+
+diff --git a/drivers/dahdi/dahdi-sysfs-chan.c b/drivers/dahdi/dahdi-sysfs-chan.c
+index a91e6ed..b18b5f9 100644
+--- a/drivers/dahdi/dahdi-sysfs-chan.c
++++ b/drivers/dahdi/dahdi-sysfs-chan.c
+@@ -482,7 +482,11 @@ int __init dahdi_sysfs_chan_init(const struct file_operations *fops)
+ 	}
+ 	should_cleanup.channel_driver = 1;
+ 
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0)
+ 	dahdi_class = class_create(THIS_MODULE, "dahdi");
++#else
++	dahdi_class = class_create("dahdi");
++#endif
+ 	if (IS_ERR(dahdi_class)) {
+ 		res = PTR_ERR(dahdi_class);
+ 		dahdi_err("%s: class_create(dahi_chan) failed. Error: %d\n",
+diff --git a/drivers/dahdi/voicebus/voicebus.c b/drivers/dahdi/voicebus/voicebus.c
+index 8a1f7a6..d141aaf 100644
+--- a/drivers/dahdi/voicebus/voicebus.c
++++ b/drivers/dahdi/voicebus/voicebus.c
+@@ -1135,7 +1135,11 @@ static void vb_stop_txrx_processors(struct voicebus *vb)
+  */
+ void voicebus_stop(struct voicebus *vb)
+ {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0)
+ 	static DEFINE_SEMAPHORE(stop);
++#else
++	static DEFINE_SEMAPHORE(stop, 1);
++#endif
+ 
+ 	down(&stop);
+ 
+diff --git a/drivers/dahdi/wctdm24xxp/base.c b/drivers/dahdi/wctdm24xxp/base.c
+index a28e249..4392b45 100644
+--- a/drivers/dahdi/wctdm24xxp/base.c
++++ b/drivers/dahdi/wctdm24xxp/base.c
+@@ -224,7 +224,11 @@ mod_hooksig(struct wctdm *wc, struct wctdm_module *mod, enum dahdi_rxsig rxsig)
+ }
+ 
+ struct wctdm *ifaces[WC_MAX_IFACES];
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0)
+ DEFINE_SEMAPHORE(ifacelock);
++#else
++DEFINE_SEMAPHORE(ifacelock, 1);
++#endif
+ 
+ static void wctdm_release(struct wctdm *wc);
+ 
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
