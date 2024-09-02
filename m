Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34371CA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA80B4064C;
	Mon,  2 Sep 2024 10:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48zE5-FoWg3H; Mon,  2 Sep 2024 10:29:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6776540606
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6776540606;
	Mon,  2 Sep 2024 10:29:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2BFF11BF279
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1889A403E2
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 10:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_BcJYxk4wfN for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 10:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24761403C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24761403C4
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 10:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C6918696A; Mon,  2 Sep 2024 10:29:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Sep 2024 12:15:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 07b54bed071fc49f12da0b85abb8ec663438829d
X-Git-Newrev: 49f95629605ab60133ea9f7ba0f77c8bf29c8942
X-Patchwork-Hint: ignore
Message-Id: <20240902102948.8C6918696A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/pkg-kconfig:
 cleanup savedefconfig MAKE
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

commit: https://git.buildroot.net/buildroot/commit/?id=49f95629605ab60133ea9f7ba0f77c8bf29c8942
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The kconfig infra defines a 'PKG_KCONFIG_MAKE' var that wraps all the
standard kconfig options. Switch to this so we aren't duplicating the
logic.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 009d31b438b2c402fa959a9041f5cc9b050a1f8f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-kconfig.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 684342bcef..8000de16c4 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -33,8 +33,7 @@ PKG_KCONFIG_COMMON_OPTS = \
 # Macro to save the defconfig file
 # $(1): the name of the package in upper-case letters
 define kconfig-package-savedefconfig
-	$($(1)_MAKE_ENV) $($(1)_MAKE) -C $($(1)_DIR) \
-		$(PKG_KCONFIG_COMMON_OPTS) $($(1)_KCONFIG_OPTS) savedefconfig
+	$($(1)_KCONFIG_MAKE) savedefconfig
 endef
 
 # The correct way to regenerate a .config file is to use 'make olddefconfig'.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
