Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AC3C001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 19:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C238341D73;
	Wed,  2 Aug 2023 19:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C238341D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPbiZOoUVDBg; Wed,  2 Aug 2023 19:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 997DD41C49;
	Wed,  2 Aug 2023 19:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 997DD41C49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50AE81BF2F5
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37F1C80C00
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F1C80C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENiwA35Tvm-2 for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 19:25:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80EBA8141D
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 19:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80EBA8141D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A3DE8411D; Wed,  2 Aug 2023 19:25:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 2 Aug 2023 21:18:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ceb8c97bcb6753740fa27a58b8e0dc00dbbbd19
X-Git-Newrev: c26a44b5567a88ec471b7bcad150f5a6c33ae87b
X-Patchwork-Hint: ignore
Message-Id: <20230802192543.6A3DE8411D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestLxc switch to the Arm
 Bootlin toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=c26a44b5567a88ec471b7bcad150f5a6c33ae87b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TestLxc uses systemd as init but the recent update to systemd v254
requires a toolchain w/ linux headers >= 4.14 to provide
LOOP_SET_BLOCK_SIZE [1] (added in systemd v253 [2]).

Since no other toolchain that the Bootlin one is available
switch to it.
(ARM Arm toolchain requires BR2_ARM_CPU_HAS_NEON enabled)

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=89e4fdecb51cf5535867026274bc97de9480ade5
[2] https://github.com/systemd/systemd/commit/1163ddb386ef46f63942171e6eab0ca64eb818e4

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561390

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/test_lxc.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index f66b31f3ba..5be4782e2d 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -10,6 +10,7 @@ class TestLxc(infra.basetest.BRTest):
             BR2_cortex_a9=y
             BR2_ARM_ENABLE_VFP=y
             BR2_TOOLCHAIN_EXTERNAL=y
+            BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
             BR2_LINUX_KERNEL=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.38"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
