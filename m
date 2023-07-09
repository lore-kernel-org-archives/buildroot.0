Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3803BEB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA4F56073F;
	Sun,  9 Jul 2023 16:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA4F56073F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoElXkW8Yauf; Sun,  9 Jul 2023 16:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A1D606F5;
	Sun,  9 Jul 2023 16:32:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5A1D606F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E71201BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFE0C409B6
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE0C409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ak73rmjnf-x0 for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:32:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC4EC409B0
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC4EC409B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9878886954; Sun,  9 Jul 2023 16:32:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Jul 2023 18:31:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af5ccec266dbb7925ac12622f379dacb20087ddd
X-Git-Newrev: 76059865ad2e99375fb5ba4b93ed0464cb14734b
X-Patchwork-Hint: ignore
Message-Id: <20230709163204.9878886954@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-linux: fix build on Linux 6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=76059865ad2e99375fb5ba4b93ed0464cb14734b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/8b1/8b140b7f4d2f2b3080cab90906c3cebea0e510c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../dahdi-linux/0006-Fix-build-on-Linux-6.4.patch  | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
