Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89759C369CB
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6281861AC7;
	Wed, 16 Apr 2025 21:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVnMo2fvlPdx; Wed, 16 Apr 2025 21:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B64C06F6BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B64C06F6BE;
	Wed, 16 Apr 2025 21:41:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 033C3159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7512C61410
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vaFblogoFLQM for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C004561B31
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C004561B31
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:40:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDFC58408D; Wed, 16 Apr 2025 21:40:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 10:45:21 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 783b1d61695caf9afcfb5fc2e95e5b7c441569e2
X-Git-Newrev: 8c5f3cf8d5ed863b1da46ae182b13c2a9ed262c6
X-Patchwork-Hint: ignore
Message-Id: <20250416214041.BDFC58408D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] configs/ls1028ardb: linux
 needs host-openssl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8c5f3cf8d5ed863b1da46ae182b13c2a9ed262c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] updating the defconfig to use Kernel 6.6.x
series, the build can fail with error:

    certs/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory

The issue is generally masked by the build order, as
arm-trusted-firmware selects BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
which requires host-openssl.

The issue can be reproduced in the Buildroot Docker reference image,
using the commands:

    utils/docker-run
    make ls1028ardb_defconfig
    make linux

This commit fixes the issue by explicitly adding
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y to the defconfig.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/7cbc240ac2c3a5d7cbbec9826fb99854bdd156a7

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5d0ec3b6a43b0bf803233a4d07fbe3466442bd13)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 configs/ls1028ardb_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index 0d1843bf5f..7b24a41cd9 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -18,6 +18,7 @@ BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.con
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
