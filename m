Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E14ED41C2B
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD99380593;
	Wed, 13 Nov 2024 09:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Rmt-LYHLW3V; Wed, 13 Nov 2024 09:54:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CD4E80885
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CD4E80885;
	Wed, 13 Nov 2024 09:54:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EBD1E11
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 260D64027F
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hiO5sKMqtWj for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E0D7405F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E0D7405F3
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3819B8622A; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Nov 2024 22:45:11 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a1bf4fa4bcf540a1ec94c58ce013f2847b6cf94c
X-Git-Newrev: 79db543d0a260cf72d3ecb1f2a9a32bea5727bd5
X-Patchwork-Hint: ignore
Message-Id: <20241113095351.3819B8622A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] linux: handle empty
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=79db543d0a260cf72d3ecb1f2a9a32bea5727bd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

When BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y,
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME should be set or the build will
fail. Instead of miserably failing the build, let's catch this earlier
and warn the user in a more informative way.

Related to:

  http://autobuild.buildroot.net/results/1d104a051c83bb31e98565369a2ec7badfa21eca/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cb4f11a6964902990ce774ff7144b24a1ffd635c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 53f27bf3b1..97db5ff16a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -641,6 +641,10 @@ $(error No kernel device tree source specified, check your \
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
