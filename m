Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07419E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8927815CF;
	Wed,  8 Jan 2025 22:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGrG8XDA_tMg; Wed,  8 Jan 2025 22:04:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0500815E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0500815E7;
	Wed,  8 Jan 2025 22:04:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31E701EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B65F409BC
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zbdxhib6IEUD for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04A4640146
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04A4640146
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4A7483F27; Wed,  8 Jan 2025 22:04:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 21:27:41 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 1f6275e558efe187795de6726cf0b0b47bcfc6c4
X-Git-Newrev: e4b591c8d14f9225c96c8ead92c390b9c03fa417
X-Patchwork-Hint: ignore
Message-Id: <20250108220443.E4A7483F27@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] linux: select
 host-uboot-tools with FIT on mips
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4b591c8d14f9225c96c8ead92c390b9c03fa417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

In the latest kernel, FIT images are always generated when building a
kernel for MIPS. Note that we build the kernel with:

  make all
  make <selected-image>

so the selected image through Buildroot options doesn't matter: a FIT
image is always generated.

Therefore, in order to fix autobuilder issues, make sure
host-uboot-tools with FIT image are always selected when building the
latest kernel version. We do not select it in general as custom
versions may be different.

Fixes:

  http://autobuild.buildroot.net/results/24bd5ae44f4097c374fe43b263254a985e2989d2 (mips)
  http://autobuild.buildroot.net/results/d18b458a600f1f4bd7008d13ad2a56cb22ce8a73 (mips64el)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 40e266ccb9aa5a9d9ddcee2457990ee2d80c5a21)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index a7caf2743c..b70b1f323a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,6 +30,9 @@ choice
 config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (6.11)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11 if BR2_KERNEL_HEADERS_AS_KERNEL
+	# mips always generates an ITB image
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
