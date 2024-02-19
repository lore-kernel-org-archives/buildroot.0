Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74278C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 21:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F75940B9D;
	Mon, 19 Feb 2024 21:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSdKuRxC0JtS; Mon, 19 Feb 2024 21:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E505D40359
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E505D40359;
	Mon, 19 Feb 2024 21:05:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 253451BF3A3
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F86B404A6
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15em2dKE3VFG for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 21:05:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 585CB40377
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 585CB40377
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:05:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4CBC787950; Mon, 19 Feb 2024 21:05:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 21:55:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85d1c86acabb07f7d8ace564ae68a64eb6335a62
X-Git-Newrev: 613c817aefbaf5f62bf75437da61752a30348e8b
X-Patchwork-Hint: ignore
Message-Id: <20240219210500.4CBC787950@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: needs sulogin for
 emergency target support
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

commit: https://git.buildroot.net/buildroot/commit/?id=613c817aefbaf5f62bf75437da61752a30348e8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

systemd invokes util-linux' sulogin via systemd-sulogin-shell[1] via
emergency.service/emergency.target[2].

[1] https://github.com/systemd/systemd/blob/main/src/sulogin-shell/sulogin-shell.c
[2] https://github.com/systemd/systemd/blob/main/units/emergency.service.in#L23

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[yann.morin.1998@free.fr: drop superfluous dependency comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 859332d9e4..aa5143d484 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -34,6 +34,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_UTIL_LINUX_FSCK
+	select BR2_PACKAGE_UTIL_LINUX_SULOGIN
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 	select BR2_PACKAGE_KMOD_TOOLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
