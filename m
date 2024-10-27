Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDC9D1359F
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 12:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9BE081131;
	Mon, 28 Oct 2024 12:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqFz6KdN_9z8; Mon, 28 Oct 2024 12:24:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D28E881138
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D28E881138;
	Mon, 28 Oct 2024 12:24:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ED2AAEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CF51605ED
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVlhVBiRAbMI for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 12:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B33D6066A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B33D6066A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:24:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F9A07F887; Mon, 28 Oct 2024 12:24:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:48:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b07d21ab984d10cbabeb186fbd47d446e027c03b
X-Git-Newrev: cb4f11a6964902990ce774ff7144b24a1ffd635c
X-Patchwork-Hint: ignore
Message-Id: <20241028122431.0F9A07F887@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: handle empty
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME situation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb4f11a6964902990ce774ff7144b24a1ffd635c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y,
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME should be set or the build will
fail. Instead of miserably failing the build, let's catch this earlier
and warn the user in a more informative way.

Related to:

  http://autobuild.buildroot.net/results/1d104a051c83bb31e98565369a2ec7badfa21eca/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 469a80db9f..1d3d8fffa6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -654,6 +654,10 @@ $(error No kernel device tree source specified, check your \
 	BR2_LINUX_KERNEL_INTREE_DTS_NAME / BR2_LINUX_KERNEL_CUSTOM_DTS_PATH settings)
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM):$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME)),y:)
+$(error No image name specified in BR2_LINUX_KERNEL_IMAGE_TARGET_NAME despite BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y)
+endif
+
 endif # BR_BUILDING
 
 $(eval $(kconfig-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
