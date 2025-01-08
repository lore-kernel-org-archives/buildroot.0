Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE4E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D7B6817B3;
	Wed,  8 Jan 2025 22:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQjZdRyFrD8F; Wed,  8 Jan 2025 22:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AC358161D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AC358161D;
	Wed,  8 Jan 2025 22:05:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C3061FF9
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F338C40300
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KA6EAtWmH38q for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E565402F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E565402F3
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF2A583F2A; Wed,  8 Jan 2025 22:04:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 21:28:18 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: e4b591c8d14f9225c96c8ead92c390b9c03fa417
X-Git-Newrev: 39e5e3a29a52a688f9cf172a8e8317d2e2d01e8d
X-Patchwork-Hint: ignore
Message-Id: <20250108220443.EF2A583F2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] linux: select
 host-uboot-tools on nios2
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

commit: https://git.buildroot.net/buildroot/commit/?id=39e5e3a29a52a688f9cf172a8e8317d2e2d01e8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

In the latest kernel, U-Boot images are always generated when building
a kernel for NIOS2. Note that we build the kernel with:

  make all
  make <selected-image>

so the selected image through Buildroot options doesn't matter: a
U-Boot image is always generated.

Therefore, in order to fix autobuilder issues, make sure
host-uboot-tools are always selected when building the latest kernel
version. We do not select it in general as custom versions may be
different.

Fixes:

  http://autobuild.buildroot.net/results/1d4c249887bdd78dab40152ad3a4fcef16458a1a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d94c478ebc03fb71cd0c7ee48e7d52ff79b2807e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index b70b1f323a..4d0620150d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,6 +33,8 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	# nios2 always generates a U-Boot image
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_nios2
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
