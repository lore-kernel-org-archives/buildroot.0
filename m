Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B9D10ED64F
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24701613C3;
	Fri, 27 Mar 2026 10:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGTgWGc3lZTJ; Fri, 27 Mar 2026 10:02:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E76D6131A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605724;
	bh=k9CSavNpbqta2I6Kn7kG9JfySIGTKbnc62FiLh9QYsM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qLxeGHtL7cZ7RnoKCKD8wlpU4r4dx3TnkBX9MVM8Kwfh+xwC/nAj8CTSv25nc3ND6
	 vN32BJ0aSsWIBKpA1Al2Ad7mtLYCRZet2WmZ54zI6J5aikrSa7bR5GTYzTA13tUYH+
	 Mw3XMz8HMXPuYi3KHGDGPFfyD0zfA3zJ+lAdR4qUJsdiPzVEmKobb9dALSguc7DbPS
	 i52RGjEMyyXsey5jz+Z8vsc0EySQz4eLbVP/mwTMYCW9Pb+GaS5KZzo+KW/KpAYgQ7
	 fWPWsxngvSu6uf+Mtc/lOBj5tHdeYqM6q9XTvp0TPOwaN95mtS6ipBURH36wRzsnM1
	 ASUgKR04FQrTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E76D6131A;
	Fri, 27 Mar 2026 10:02:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E6F11D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C105040BD7
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqGVL8GpaK2i for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EEBD40BE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EEBD40BE0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A291A7FBB8; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:07:59 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b17368f7c11b09e24f2f72bde5309fba2d08f20a
X-Git-Newrev: fdf1bdd0cf08a3327bcf2a8fbee879acd25c0939
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.A291A7FBB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/igh-ethercat: fix
 build with kernel >= 6.15
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fdf1bdd0cf08a3327bcf2a8fbee879acd25c0939
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 7fe315a6f71a9f66ff4672deb58d723b81953c74)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
