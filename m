Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDED2C3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 16:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99DD7605AD;
	Sun,  4 Aug 2024 16:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvYSffnIvT8a; Sun,  4 Aug 2024 16:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A55D6605C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A55D6605C0;
	Sun,  4 Aug 2024 16:18:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9009E1BF371
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 16:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C43181110
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 16:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2c6eESbQWxW for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 16:18:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F2C7810F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F2C7810F4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F2C7810F4
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 16:18:18 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0FC0EB00573;
 Sun,  4 Aug 2024 18:18:12 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Aug 2024 18:18:06 +0200
Message-ID: <20240804161806.1320340-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722788296;
 bh=ASP/BmOv4Q2OXwd9a+ypjZ4+auYxnKMaVIyGRT5dx1M=;
 h=From:To:Cc:Subject:Date:From;
 b=BAWw0BzkzGLR07+KdbCN64GvFFVMe+qKSI+qUu29IlXaI4nxriNlI4UZbpc1t1rN1
 IBVBdVi9W56Xjn8RDkx87r6lY7OjUC4tBjy+k+yjDGEvuy5w/IzUnIsSACq7MA0/i+
 LmzXmwTW61L3t2YTRwm5iB6GvsSKtm1AkRg8DuNdjfO3kiTyP29nqPozT7jFdTssdW
 nS0wvwZjjqBWu4F3XGIBeVxGXPdZh4LRWXK72qUNiwz9MYdeyhH9k8VfH+pPmxd2eK
 nPu7of8pKMtAyw4kWGenzOP0CxmPNvXhMqEzB3BmT1VQ8krLeHwQIR3jn+EG59mEV/
 e/92ewmvX9mWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BAWw0Bzk
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8mnevk: uboot needs
 openssl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>, Fabio Estevam <festevam@gmail.com>,
 Stephane Viau <stephane.viau@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This defconfig was recently bumped to NXP BSP lf-6.6.23-2.0.0.

NXP BSP U-Boot version lf-6.6.23-2.0.0 is based on upstream
version 2024.04. This version now requires OpenSSL.

This defconfig is failing in uboot build, with output:

    In file included from tools/imagetool.h:24,
                     from tools/imagetool.c:8:
    include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
     1471 | #  include <openssl/evp.h>
          |            ^~~~~~~~~~~~~~~

This commit fixes the issue by adding
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y in the defconfig.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Note: Patch tested in Gitlab CI pipeline:
https://gitlab.com/jolivain/buildroot/-/pipelines/1400170073
---
 configs/freescale_imx8mnevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx8mnevk_defconfig b/configs/freescale_imx8mnevk_defconfig
index a534c50477..fc601dd5fb 100644
--- a/configs/freescale_imx8mnevk_defconfig
+++ b/configs/freescale_imx8mnevk_defconfig
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.6.23-2.0.0)/uboot-imx-lf-6.6.23-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_ddr4_evk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
