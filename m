Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A22C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 09:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB1841521;
	Sat, 29 Jul 2023 09:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DB1841521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E_refJWz4Kqw; Sat, 29 Jul 2023 09:00:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE7941960;
	Sat, 29 Jul 2023 09:00:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AE7941960
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EABFB1BF3FC
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C09E44190C
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 08:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C09E44190C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIaUWuMO9EPr for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 08:59:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C559B41521
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 08:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C559B41521
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2F0183714; Sat, 29 Jul 2023 08:59:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 10:59:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36d275f695936b7a54738c0354572944c1f08d87
X-Git-Newrev: 9d6f966f9ad012879bb472896eb35eeda5baa9ab
X-Patchwork-Hint: ignore
Message-Id: <20230729085958.B2F0183714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: don't select seatd daemon
 if we have logind
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d6f966f9ad012879bb472896eb35eeda5baa9ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If we are using systemd-logind we shouldn't need the seatd daemon.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 8aabe86652..1a7c27a715 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_WESTON
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_SEATD
-	select BR2_PACKAGE_SEATD_DAEMON
+	select BR2_PACKAGE_SEATD_DAEMON if !BR2_PACKAGE_SYSTEMD_LOGIND
 	# Runtime dependency
 	select BR2_PACKAGE_XKEYBOARD_CONFIG
 	select BR2_PACKAGE_WESTON_SHELL_DESKTOP if !BR2_PACKAGE_WESTON_HAS_SHELL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
