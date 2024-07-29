Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0542C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 18:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989566066F;
	Mon, 29 Jul 2024 18:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jWy0ltMkTaLd; Mon, 29 Jul 2024 18:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F87C606E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F87C606E3;
	Mon, 29 Jul 2024 18:09:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76B8A1BF42C
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 648064033A
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 18:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVqu4WfS0_5x for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 18:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75BC340329
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75BC340329
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 18:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B1B182D9C; Mon, 29 Jul 2024 18:08:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 20:05:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c6fec29cb51d531f8463d73b26932a1c02ab76c
X-Git-Newrev: de11afaa3458eae781582e61e0de6a91e9e48d0e
X-Patchwork-Hint: ignore
Message-Id: <20240729180858.6B1B182D9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-kconfig: fix *-savedefconfig
 under ppd
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

commit: https://git.buildroot.net/buildroot/commit/?id=de11afaa3458eae781582e61e0de6a91e9e48d0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'linux-savedefconfig' target fails with the below error when
PER_PACKAGE_DIRECTORIES is enabled and the 'host-finalize' target hasn't
run yet.

  scripts/Kconfig.include:39: C compiler '.../buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc' not found

The 'PPD' variable isn't defined for this target, so 'BR_PATH' falls
back to the final host directory.

Reported-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-kconfig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index f4f35bf96a..6bf3d6b4be 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -270,6 +270,7 @@ $(1)-check-configuration-done:
 
 ifeq ($$($(2)_KCONFIG_SUPPORTS_DEFCONFIG),YES)
 .PHONY: $(1)-savedefconfig
+$(1)-savedefconfig: PKG=$(2)
 $(1)-savedefconfig: $(1)-check-configuration-done
 	$$(call kconfig-package-savedefconfig,$(2))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
