Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6F1C3601A
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 16:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7418F811F4;
	Sun,  6 Apr 2025 16:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aD7xTE4MuCkD; Sun,  6 Apr 2025 16:27:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80740811C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80740811C7;
	Sun,  6 Apr 2025 16:27:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BABADA
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 16:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31EAE811FF
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 16:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zade63MDodtQ for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 16:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CE3481157
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE3481157
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CE3481157
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 16:27:10 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D3D5DB00539;
 Sun,  6 Apr 2025 18:27:02 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Apr 2025 18:26:40 +0200
Message-ID: <20250406162641.521533-3-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406162641.521533-1-ju.o@free.fr>
References: <20250406162641.521533-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743956828;
 bh=H5F4nvG2TRds1DGpR0vGo7hla+ArBen1BYwSVgutKbM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jB4rJxsl5RB7KbQnndYSBPDiDBhPo+YX7+feONK2ESptM919fVcZ8TbIhD8c6pksq
 CRngVvjdodccWTFd1cQYmbYn2v5qT8nzSzHGTTisauepn49DGVnh/FS87nke89pwIY
 LVPI03mCATlKjqEiixDlERlrVBQewPrsHI9d+mmKLnsiKgZanu6ZdoF1mbw2+4h/Fs
 JYXmyzdew4GqbO/0WOhgjsbjA+sl+Ha8LPt2a3RX3NpFXkJo6bs30/65WxOdWn4G1V
 oOWocMw89jk3FGT84U12uCUs4S0Kt0wBWudlyAFjKPaQknFHwV/MzCuyKFW75foB9R
 D6BK3MrzDE+kA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jB4rJxsl
Subject: [Buildroot] [PATCH 3/4] configs/ls1046a-rdb: linux needs
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
Cc: Julien Olivain <ju.o@free.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] which introduced this defconfig using a
Kernel 6.6.x series, the build can fail with error:

    certs/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory

The issue is generally masked by the build order, as
arm-trusted-firmware selects BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
which requires host-openssl.

The issue can be reproduced in the Buildroot Docker reference image,
using the commands:

    utils/docker-run
    make ls1046a-rdb_defconfig
    make linux

This commit fixes the issue by explicitly adding
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y to the defconfig.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/774035189fc211fccedb856b1718c8836be94387

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/ls1046a-rdb_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
index 441d461298..bd20baeea9 100644
--- a/configs/ls1046a-rdb_defconfig
+++ b/configs/ls1046a-rdb_defconfig
@@ -18,6 +18,7 @@ BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.con
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1046a-rdb freescale/fsl-ls1046a-rdb-sdk"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_QORIQ_FM_UCODE=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
