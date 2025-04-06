Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119A3C3601A
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 16:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB44460F4E;
	Sun,  6 Apr 2025 16:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlXf1x9GezUe; Sun,  6 Apr 2025 16:27:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF7061005
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF7061005;
	Sun,  6 Apr 2025 16:27:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52BE5DA
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 16:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39DAC40286
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 16:27:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1PjNd2-INE6z for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 16:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47A4B40A2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47A4B40A2F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47A4B40A2F
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 16:27:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C5DE3B00539;
 Sun,  6 Apr 2025 18:26:55 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Apr 2025 18:26:39 +0200
Message-ID: <20250406162641.521533-2-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406162641.521533-1-ju.o@free.fr>
References: <20250406162641.521533-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743956821;
 bh=oPpbHhr7z747i519s3+z8DQwu/fo+eruV4TD4QUb7zk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YFqskrbKtjLzI+69FdUOXRBlorRK0/xBb88PMWLALVYLC0MGxPSdVt5LgDrq9TG//
 R24bbB0JAC2v2VGkMxpbqKicwnfcrV2UVxpavHt1iTte5DqOJ8H6uL6ay0RZDmoWeY
 5rPH3ag7xqQdTGciG/9QaXQOr7VcN836Tqe1epypEPpdxJ9v/JLMFyx9WD9k+RsW3p
 vlcq9om9Jpn9KeqEycZXpcVAIbNtxMwe1dR8qZiEUbFm3cgQonPYT+k+9yffnu8HKy
 wQje/Nz4qh20BG0YfZpPxuhh58Tvya0dvSWb1TQBXSpqkp3EZyig40FahMsSIcmh+O
 xantPhyXbfz7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YFqskrbK
Subject: [Buildroot] [PATCH 2/4] configs/ls1046a-frwy: linux needs
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
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
