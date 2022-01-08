Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4123FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 20:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E44048148A;
	Sat,  8 Jan 2022 20:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8cu_q49lfLE; Sat,  8 Jan 2022 20:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2730481459;
	Sat,  8 Jan 2022 20:40:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E35941BF847
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDCDB4056A
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zi6zL76nbw8Y for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 20:40:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22E4A403A8
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 20:40:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1B53583456; Sat,  8 Jan 2022 20:34:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 21:40:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 188f8c836d9a3224c8cc6dda429108b0938c8cc2
X-Git-Newrev: 2fc0d98699b91bbdc9e6fe7064ecb1d966aaa4a0
X-Patchwork-Hint: ignore
Message-Id: <20220108203441.1B53583456@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "systemd: ensure
 tmpfiles.d/legacy.conf is installed"
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fc0d98699b91bbdc9e6fe7064ecb1d966aaa4a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

legacy.conf no longer exists, it's now legacy.conf.in that has to be
preprocessed. The preprocessing is only done if sysv-compat is enabled.

This reverts commit 0e71f5111988fe57531d1c84bdf631f1932b14bc.
---
 package/systemd/systemd.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b3b5ed600d..17bb922f51 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -563,17 +563,9 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
-# systemd doesn't install legacy.conf without sysv-compat
-# This config ensures /var/lock is created
-define SYSTEMD_INSTALL_LEGACY_CONF_HOOK
-	$(INSTALL) -D -m 0644 $(@D)/tmpfiles.d/legacy.conf \
-		$(TARGET_DIR)/usr/lib/tmpfiles.d
-endef
-
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
-	SYSTEMD_INSTALL_MACHINEID_HOOK \
-	SYSTEMD_INSTALL_LEGACY_CONF_HOOK
+	SYSTEMD_INSTALL_MACHINEID_HOOK
 
 define SYSTEMD_INSTALL_IMAGES_CMDS
 	$(SYSTEMD_INSTALL_BOOT_FILES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
