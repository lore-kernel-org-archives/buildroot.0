Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EF8E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 18:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C652680B4A;
	Mon, 30 Dec 2024 18:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 28TIdaA5U4yT; Mon, 30 Dec 2024 18:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC00D80E49
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC00D80E49;
	Mon, 30 Dec 2024 18:28:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B5A7CA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A1FE40C02
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RTtEEAGMKEg for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 18:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A034400B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A034400B8
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 18:28:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35E7C828E3; Mon, 30 Dec 2024 18:28:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 19:25:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40e266ccb9aa5a9d9ddcee2457990ee2d80c5a21
X-Git-Newrev: d94c478ebc03fb71cd0c7ee48e7d52ff79b2807e
X-Patchwork-Hint: ignore
Message-Id: <20241230182802.35E7C828E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: select host-uboot-tools on nios2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d94c478ebc03fb71cd0c7ee48e7d52ff79b2807e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 linux/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index e5051f52b5..6db6fc8b0c 100644
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
