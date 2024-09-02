Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE133CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 10:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77FA9600C9;
	Mon,  2 Sep 2024 10:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhaOLKYYwqNU; Mon,  2 Sep 2024 10:31:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C54605BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C54605BD;
	Mon,  2 Sep 2024 10:31:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16F6D1BF279
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FCE781080
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qh2TywXemmUC for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 10:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53E9280F81
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53E9280F81
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 10:30:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EAA986973; Mon,  2 Sep 2024 10:30:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Sep 2024 12:16:45 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 5ff452936ed477c14f17d4af3ac7e99ffe0e9649
X-Git-Newrev: 37d815cbf48762f2a5d66b3f352c5b4612c9867e
X-Patchwork-Hint: ignore
Message-Id: <20240902103059.4EAA986973@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/pkg-kconfig: fix
 *-savedefconfig under ppd
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

commit: https://git.buildroot.net/buildroot/commit/?id=37d815cbf48762f2a5d66b3f352c5b4612c9867e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The 'linux-savedefconfig' target fails with the below error when
PER_PACKAGE_DIRECTORIES is enabled and the 'host-finalize' target hasn't
run yet.

  scripts/Kconfig.include:39: C compiler '.../buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc' not found

The 'PPD' variable isn't defined for this target, so 'BR_PATH' falls
back to the final host directory.

Reported-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit de11afaa3458eae781582e61e0de6a91e9e48d0e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
