Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64203C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F4778418A;
	Mon, 19 May 2025 10:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eK6804VHCDKt; Mon, 19 May 2025 10:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E5958418E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E5958418E;
	Mon, 19 May 2025 10:50:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDBC1BF
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8E744145F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vx4NRz1DYlx for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C83410B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28C83410B0
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 214F384A21; Mon, 19 May 2025 10:39:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Apr 2025 14:06:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a83242f131f6b4e130efc1b995e0cc45755b583c
X-Git-Newrev: 11315d478782ef89a621518acaad9c2c39ad3b81
X-Patchwork-Hint: ignore
Message-Id: <20250519103949.214F384A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/ls1043a-rdb: linux
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11315d478782ef89a621518acaad9c2c39ad3b81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since Buildroot commit [1] which introduced this defconfig using a
Kernel 6.6.x series, the build can fail with error:

    certs/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory

The issue is generally masked by the build order, as
arm-trusted-firmware selects BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
which requires host-openssl.

The issue can be reproduced in the Buildroot Docker reference image,
using the commands:

    utils/docker-run
    make ls1043a-rdb_defconfig
    make linux

This commit fixes the issue by explicitly adding
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y to the defconfig.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/34b047a442b1b3c64713972fc54d98c05a672c7c

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/ls1043a-rdb_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ls1043a-rdb_defconfig b/configs/ls1043a-rdb_defconfig
index d70e8692ab..fb0f781b44 100644
--- a/configs/ls1043a-rdb_defconfig
+++ b/configs/ls1043a-rdb_defconfig
@@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.con
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1043a-rdb freescale/fsl-ls1043a-rdb-sdk"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_QORIQ_FM_UCODE=y
 BR2_PACKAGE_QORIQ_FM_UCODE_PLATFORM="ls1043"
 BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
