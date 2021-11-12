Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B001DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:36:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E7CB6102A
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E7CB6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3573240247;
	Fri, 12 Nov 2021 13:36:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zhs2ETmPevpK; Fri, 12 Nov 2021 13:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 260684020A;
	Fri, 12 Nov 2021 13:36:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7EE31C1148
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A74C940538
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_I3jlTB657y for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:36:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB86C4052D
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:36:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2AC738B70B; Fri, 12 Nov 2021 13:32:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 14:32:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d77dae55778eef05a90718f49914cf6eb3d6fc6
X-Git-Newrev: 7863327ea2fa92fb8bae2ddf42b7df001f3400a6
X-Patchwork-Hint: ignore
Message-Id: <20211112133210.2AC738B70B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: fix build on arm926ej-s
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

commit: https://git.buildroot.net/buildroot/commit/?id=7863327ea2fa92fb8bae2ddf42b7df001f3400a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.3.39 in
commit d9796f2db9866060b916487784b046bb6b76f9b6:

/tmp/ccsZ6haQ.s:467: Error: selected processor does not support `vmrs r3,fpscr' in ARM mode
/tmp/ccsZ6haQ.s:469: Error: selected processor does not support `vmsr fpscr,r3' in ARM mode
/tmp/ccsZ6haQ.s:490: Error: selected processor does not support `vmrs r3,fpscr' in ARM mode
/tmp/ccsZ6haQ.s:492: Error: selected processor does not support `vmsr fpscr,r3' in ARM mode

Fixes:
 - http://autobuild.buildroot.org/results/d449095c67b9477fc95ebbab5eb628e5eb4ea5c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...02-cpu-disable-VFP-asm-when-not-available.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch b/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
new file mode 100644
index 0000000000..297016edc2
--- /dev/null
+++ b/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
@@ -0,0 +1,30 @@
+From 2cddd4a775c145570f4a8a30d28b57f551d43206 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Mon, 25 Oct 2021 16:32:16 +0200
+Subject: [PATCH] cpu: disable VFP asm when not available
+
+Fixes #1746
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/2cddd4a775c145570f4a8a30d28b57f551d43206]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ spa/plugins/support/cpu-arm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
+index c07711f70..fe6222f7c 100644
+--- a/spa/plugins/support/cpu-arm.c
++++ b/spa/plugins/support/cpu-arm.c
+@@ -143,7 +143,7 @@ static int arm_zero_denormals(void *object, bool enable)
+ 			"msr	fpcr, %0		\n"
+ 			"isb				\n"
+ 			: "=r"(cw)::"memory");
+-#else
++#elif (defined(__VFP_FP__) && !defined(__SOFTFP__))
+ 	uint32_t cw;
+ 	if (enable)
+ 		__asm__ __volatile__(
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
