Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9A7C54E68
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 22:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCF9241827;
	Sat, 16 Mar 2024 22:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NivGhSSPsEw7; Sat, 16 Mar 2024 22:02:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D13341825
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D13341825;
	Sat, 16 Mar 2024 22:02:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 583A21BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEE7440151
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 22:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QYkliSb98syx for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 22:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB672402C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB672402C3
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 22:01:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E89408026F; Sat, 16 Mar 2024 22:01:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 22:25:02 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 386ee165c10f2bbd215d1c6d405ff65ab5ed4e1d
X-Git-Newrev: ef58952a07c748bc394a3428cea03c09ab17baa4
X-Patchwork-Hint: ignore
Message-Id: <20240316220156.E89408026F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/systemd: needs
 sulogin for emergency target support
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef58952a07c748bc394a3428cea03c09ab17baa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

systemd invokes util-linux' sulogin via systemd-sulogin-shell[1] via
emergency.service/emergency.target[2].

[1] https://github.com/systemd/systemd/blob/main/src/sulogin-shell/sulogin-shell.c
[2] https://github.com/systemd/systemd/blob/main/units/emergency.service.in#L23

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[yann.morin.1998@free.fr: drop superfluous dependency comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 613c817aefbaf5f62bf75437da61752a30348e8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index bea717a456..8c01a9ed74 100644
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
