Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F41CD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 10:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7BB4405FA;
	Mon,  2 Sep 2024 10:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQxBm7DFwxrj; Mon,  2 Sep 2024 10:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3CC740606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3CC740606;
	Mon,  2 Sep 2024 10:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB3911BF279
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98214605BD
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOYh9nzJg65H for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 10:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 962AF600C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 962AF600C9
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 10:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 815FD86925; Mon,  2 Sep 2024 10:29:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Sep 2024 12:14:46 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 08fe7fb96b159dadd9b2a2144ebbe0215583c667
X-Git-Newrev: 07b54bed071fc49f12da0b85abb8ec663438829d
X-Patchwork-Hint: ignore
Message-Id: <20240902102948.815FD86925@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pkg-kconfig: fix
 *-diff-config under ppd
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

commit: https://git.buildroot.net/buildroot/commit/?id=07b54bed071fc49f12da0b85abb8ec663438829d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The 'linux-diff-config' target fails with the below error when
PER_PACKAGE_DIRECTORIES is enabled and the 'host-finalize' target hasn't
run yet.

  scripts/Kconfig.include:39: C compiler '.../buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc' not found

The 'PPD' variable isn't defined for this target, so 'BR_PATH' falls
back to the final host directory.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 641084bfb37856f79db86d9dbd6638ec70fc9681)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-kconfig.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 6bf3d6b4be..684342bcef 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -301,6 +301,7 @@ endif
 # defconfig + fragments (if any) and the current configuration.
 # Note: it preserves the timestamp of the current configuration when moving it
 # around.
+$(1)-diff-config: PKG=$(2)
 $(1)-diff-config: $(1)-check-configuration-done
 	$$(Q)cp -a $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG) $$($(2)_DIR)/.config.dc.bak
 	$$(call kconfig-package-merge-config,$(2),$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG),\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
