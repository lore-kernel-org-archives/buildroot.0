Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6EECD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 563A1812FD;
	Sun,  7 Apr 2024 16:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_1mNHIDsnIr; Sun,  7 Apr 2024 16:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC368209C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC368209C;
	Sun,  7 Apr 2024 16:26:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 309191BF954
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23B78812FD
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZa3JHKLK2Zq for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7198980BB8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7198980BB8
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:26:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E9C485ADA; Sun,  7 Apr 2024 16:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 18:25:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de6415ad9c35b2013af1f1821bcac12ba3959674
X-Git-Newrev: 47a02a5afcdf5d6a72d203c31dabd5727547057c
X-Patchwork-Hint: ignore
Message-Id: <20240407162602.5E9C485ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imx-gpu-viv: fix masking fb option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47a02a5afcdf5d6a72d203c31dabd5727547057c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the 32bit ARM blob provides the framebuffer backend. This is
apparently independent of which imx8 derivate is used, so changed
the condition for the config option accordingly.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/freescale-imx/imx-gpu-viv/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index 3e095b730c..b8dff8f9ab 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -45,8 +45,8 @@ choice
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
-	# The i.MX8 blob doesn't support FB output
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	# The i.MX8 aarch64 blob doesn't support FB output
+	depends on BR2_arm
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
