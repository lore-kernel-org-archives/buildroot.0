Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A04CC369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 12:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7EF340759;
	Sat, 12 Apr 2025 12:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVs0hJS9G3Ub; Sat, 12 Apr 2025 12:08:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE04540901
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE04540901;
	Sat, 12 Apr 2025 12:08:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9EA3138
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B9AA407CC
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtyXfYAR5BJk for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 12:08:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA38A40759
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA38A40759
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 12:08:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2B2A84457; Sat, 12 Apr 2025 12:08:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Apr 2025 14:06:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d0ec3b6a43b0bf803233a4d07fbe3466442bd13
X-Git-Newrev: 094f7a5b868ba6395d1e5d71d29c9e8baf886a46
X-Patchwork-Hint: ignore
Message-Id: <20250412120806.E2B2A84457@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ls1046a-frwy: linux needs
 host-openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=094f7a5b868ba6395d1e5d71d29c9e8baf886a46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] updating the defconfig to use Kernel 6.6.x
series, the build can fail with error:

    certs/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory

The issue is generally masked by the build order, as
arm-trusted-firmware selects BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
which requires host-openssl.

The issue can be reproduced in the Buildroot Docker reference image,
using the commands:

    utils/docker-run
    make ls1046a-frwy_defconfig
    make linux

This commit fixes the issue by explicitly adding
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y to the defconfig.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/0344e5dae647c5cc23eea11fcbeddd7fec776d75

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/ls1046a-frwy_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ls1046a-frwy_defconfig b/configs/ls1046a-frwy_defconfig
index 52d8f0cc07..f2fac6590f 100644
--- a/configs/ls1046a-frwy_defconfig
+++ b/configs/ls1046a-frwy_defconfig
@@ -18,6 +18,7 @@ BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.con
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1046a-frwy freescale/fsl-ls1046a-frwy-sdk"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_QORIQ_FM_UCODE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
