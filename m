Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6BEE784B0
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 08:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 526EE40B4A;
	Mon,  2 Oct 2023 08:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 526EE40B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J2DUvmqYN73r; Mon,  2 Oct 2023 08:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3154040C12;
	Mon,  2 Oct 2023 08:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3154040C12
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 43DFA1BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26729417C3
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26729417C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRZrm_7vHuIE for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 08:44:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E81A41B27
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 08:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E81A41B27
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F030A84087; Mon,  2 Oct 2023 08:44:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Oct 2023 10:40:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fcd2ef29d2f6e782b9bd5928e2e835daf627ae8
X-Git-Newrev: c495aab88390767a217f6a0fc22008ff1aafc114
X-Patchwork-Hint: ignore
Message-Id: <20231002084431.F030A84087@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-driver: fix build failure
 with Linux 6.3+
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c495aab88390767a217f6a0fc22008ff1aafc114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patches pending upstream to fix build failure on Linux 6.3+

Fixes:
http://autobuild.buildroot.net/results/3b954399aa3ffab9609da1fc381f38f28bd8eb9f

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wilc-driver/0006-Support-Linux-6.3.patch | 43 ++++++++++++++++++++++++
 package/wilc-driver/0007-Support-Linux-6.4.patch | 36 ++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/package/wilc-driver/0006-Support-Linux-6.3.patch b/package/wilc-driver/0006-Support-Linux-6.3.patch
new file mode 100644
index 0000000000..f5a92027da
--- /dev/null
+++ b/package/wilc-driver/0006-Support-Linux-6.3.patch
@@ -0,0 +1,43 @@
+From 14b5eccf4145e7a5afc8bc65a15f26ac691f98d8 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 27 Sep 2023 10:54:18 +0200
+Subject: [PATCH] Support Linux 6.3
+
+With Linux 6.3 commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=40fc56ee608cdb20022c225ac6f1e4b7ba63f8f1
+function of_get_named_gpio_flags() has been dropped but it was only a
+wrapper to call of_get_named_gpio() if the flags passed was NULL and this
+is the case. So let's use of_get_named_gpio() in place of
+of_get_named_gpio_flags() since of_get_named_gpio() never changed
+after its adding in Linux version 3.1.
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/4
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ power.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/power.c b/power.c
+index 6c59e0b..6ab8d63 100644
+--- a/power.c
++++ b/power.c
+@@ -25,13 +25,11 @@ int wilc_of_parse_power_pins(struct wilc *wilc)
+ 	const struct wilc_power_gpios *gpios = &default_gpios[0];
+ 	int ret;
+ 
+-	power->gpios.reset = of_get_named_gpio_flags(of, "reset-gpios", 0,
+-						     NULL);
++	power->gpios.reset = of_get_named_gpio(of, "reset-gpios", 0);
+ 	if (!gpio_is_valid(power->gpios.reset))
+ 		power->gpios.reset = gpios->reset;
+ 
+-	power->gpios.chip_en = of_get_named_gpio_flags(of, "chip_en-gpios", 0,
+-						       NULL);
++	power->gpios.chip_en = of_get_named_gpio(of, "chip_en-gpios", 0);
+ 	if (!gpio_is_valid(power->gpios.chip_en))
+ 		power->gpios.chip_en = gpios->chip_en;
+ 
+-- 
+2.34.1
+
diff --git a/package/wilc-driver/0007-Support-Linux-6.4.patch b/package/wilc-driver/0007-Support-Linux-6.4.patch
new file mode 100644
index 0000000000..8339cc3cb6
--- /dev/null
+++ b/package/wilc-driver/0007-Support-Linux-6.4.patch
@@ -0,0 +1,36 @@
+From 94fc4594659494b8c5cbdf1a719aea4d66d3398d Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 27 Sep 2023 11:20:50 +0200
+Subject: [PATCH] Support Linux 6.4
+
+With Linux 6.4 commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1aaba11da9aa7d7d6b52a74d45b31cac118295a1
+class_create() doesn't require first argument THIS_MODULE anymore so let's
+drop first argument if Linux version >= 6.4
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/5
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bt.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bt.c b/bt.c
+index 48a5302..a752457 100644
+--- a/bt.c
++++ b/bt.c
+@@ -135,7 +135,11 @@ static void wilc_bt_create_device(void)
+ 	ret = alloc_chrdev_region(&chc_dev_no, 0, 1, "atmel");
+ 	if (ret < 0)
+ 		return;
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 4, 0)
++	chc_dev_class = class_create("atmel");
++#else
+ 	chc_dev_class = class_create(THIS_MODULE, "atmel");
++#endif
+ 	if (IS_ERR(chc_dev_class)) {
+ 		unregister_chrdev_region(chc_dev_no, 1);
+ 		return;
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
