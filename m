Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7517FC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 07:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68AC9427BE;
	Sat,  8 Jun 2024 07:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id an4bSnmS2VtH; Sat,  8 Jun 2024 07:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D589942762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D589942762;
	Sat,  8 Jun 2024 07:52:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 632C01BF422
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 566B140223
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 07:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjcQaGDFoCrI for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8096E40158
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8096E40158
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 07:52:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7DB987D80; Sat,  8 Jun 2024 07:52:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 09:08:59 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4e2b6908659772d7dcedd465754ac59338f64d07
X-Git-Newrev: 8364c23d91b557d18cb03cbbc65c7940ca57cbe5
X-Patchwork-Hint: ignore
Message-Id: <20240608075252.D7DB987D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] configs/rock5b: remove
 futile unsetting of BR2_LINUX_KERNEL_INTREE_DTS_NAME
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

commit: https://git.buildroot.net/buildroot/commit/?id=8364c23d91b557d18cb03cbbc65c7940ca57cbe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The rock5b_defconfig contained a

  # BR2_LINUX_KERNEL_INTREE_DTS_NAME is not set

line. This caused check-dotconfig.py to throw a warning in the
buildroot CI, because the explicit unsetting of the parameter is not
taken on in the actual dotconfig, but instead the dotconfig will
contain the line 'BR2_LINUX_KERNEL_INTREE_DTS_NAME=""'.

This patch removes the parameter from the rock5b_defconfig. The
resulting dotconfig from the original rock5b_defconfig and the
rock5b_defconfig without the parameter is identical, but the
check-dotconfig.py does not throw a warning anymore.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0f0660ad2d0cb5fd6c399b5d74dd7b70bde4c23d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/rock5b_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 7175aa66bf..1ac42c8dc5 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -14,7 +14,6 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/radxa/kernel.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52f51a2b5ba178f331af62260d2da86d7472c14b"
 BR2_LINUX_KERNEL_DEFCONFIG="rockchip_linux"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-# BR2_LINUX_KERNEL_INTREE_DTS_NAME is not set
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/radxa/rock5b/rock5b.dts"
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
