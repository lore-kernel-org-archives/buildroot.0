Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33BBF483ED
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C458C821ED;
	Mon, 23 Mar 2026 19:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFXlx_f3ieVU; Mon, 23 Mar 2026 19:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCD36821D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295710;
	bh=AVph4jJ1IaPLDNOlLnjPO2RcpKJWYme50jeytBLUQc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dcbBoCXYebz1/8uYFDoTZPQAQuoGds8GmIuTs7it/8bZ7ZmMbgdgaBNApOenFdna3
	 sqO06vxFyuxCohv9dmrwbMdAohsc/pXsEf0ZrHkHklkgWTr8Oc1xcrzm7npYnxAGFj
	 kqQ6yr3iUwfrGy+YeI2LvewfNlZbyFBwc1+2TSlFhXLRVDnju1Irn53VGWSoBtgvT7
	 86GiJsZNNKOdsvqC4yICcT479aaTg65VS3zTquDJmJzfHV42jDKWzTdVDSMwtZ36nl
	 tRNGETZ4L1vvx6LIKRk3Ma65TpkfvU4nFSPsQR3Qd+micYBO5sVoxKNUeQ5qSuWvF8
	 0fLaTeZ1sFPwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCD36821D0;
	Mon, 23 Mar 2026 19:55:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F3D5F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4F3540971
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQU90xJaD2k3 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A17E405EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A17E405EE
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59EF5844A5; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 12:22:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef12f5bb2c79a533e978cbaaf911b5ba96e97439
X-Git-Newrev: 7fe315a6f71a9f66ff4672deb58d723b81953c74
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.59EF5844A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: fix build with
 kernel >= 6.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fe315a6f71a9f66ff4672deb58d723b81953c74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit c6e914819774212e79be19f62706f653b9646f11 bumped the
package from 1.6.3 to 1.6.8. The previous version 1.6.3 failed to build
with kernel >= 6.15 as seen here:
https://autobuild.buildroot.net/results/7f4/7f4b3e632a5de67dec2624a2097045ec4d767246/
"examples/mini/mini.c:528:5: error: implicit declaration of function
 'del_timer_sync' [-Wimplicit-function-declaration]
  528 |     del_timer_sync(&timer);"

The bump to 1.6.8 includes a commit which fixes the problem:
https://gitlab.com/etherlab.org/ethercat/-/commit/240080f11062cca42f9132cd32fad3b993502665

but it only masked other build errors which were found by the
autobuilders:
https://autobuild.buildroot.net/results/1a5/1a546ee2217e7843b852a5b79b477ef23df6a064/
"examples/tty/tty.c:236:5: error: implicit declaration of function
 'del_timer_sync' [-Wimplicit-function-declaration]
  236 |     del_timer_sync(&timer);"

which need similar fixes.

Fixes:
https://autobuild.buildroot.net/results/0ba/0ba7163e5012309d3a31aa7186ca95a9d5c8de69/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...nted-new-timer-interface-since-kernel-6.1.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/igh-ethercat/0001-tty-Implemented-new-timer-interface-since-kernel-6.1.patch b/package/igh-ethercat/0001-tty-Implemented-new-timer-interface-since-kernel-6.1.patch
new file mode 100644
index 0000000000..5e568eaba9
--- /dev/null
+++ b/package/igh-ethercat/0001-tty-Implemented-new-timer-interface-since-kernel-6.1.patch
@@ -0,0 +1,63 @@
+From e32e99f8b8ec02a340ad3b93cc8abd36781ff568 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 15 Mar 2026 20:06:42 +0100
+Subject: [PATCH] tty: Implemented new timer interface since kernel 6.15
+
+Upstream: https://gitlab.com/etherlab.org/ethercat/-/merge_requests/187
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ examples/tty/tty.c | 4 ++++
+ tty/module.c       | 8 ++++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/examples/tty/tty.c b/examples/tty/tty.c
+index 4d47a49..e5b4d52 100644
+--- a/examples/tty/tty.c
++++ b/examples/tty/tty.c
+@@ -233,7 +233,11 @@ static void __exit cleanup_mini_module(void)
+ {
+     printk(KERN_INFO PFX "Stopping...\n");
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0)
++    timer_delete_sync(&timer);
++#else
+     del_timer_sync(&timer);
++#endif
+ 
+     free_serial_devices();
+ 
+diff --git a/tty/module.c b/tty/module.c
+index 2b7b22b..12ad1e7 100644
+--- a/tty/module.c
++++ b/tty/module.c
+@@ -292,7 +292,11 @@ static int ec_tty_init(ec_tty_t *t, int minor,
+ 
+ static void ec_tty_clear(ec_tty_t *tty)
+ {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0)
++    timer_delete_sync(&tty->timer);
++#else
+     del_timer_sync(&tty->timer);
++#endif
+     tty_unregister_device(tty_driver, tty->minor);
+ }
+ 
+@@ -367,10 +371,14 @@ static void ec_tty_wakeup(struct timer_list *t)
+ static void ec_tty_wakeup(unsigned long data)
+ #endif
+ {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0)
++    ec_tty_t *tty = timer_container_of(tty, t, timer);
++#else
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
+     ec_tty_t *tty = from_timer(tty, t, timer);
+ #else
+     ec_tty_t *tty = (ec_tty_t *) data;
++#endif
+ #endif
+     size_t to_recv;
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
