Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22F9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:47:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE66060724
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE66060724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7884F4020E;
	Sat, 30 Oct 2021 23:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTAslYMbgXZp; Sat, 30 Oct 2021 23:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E970A40200;
	Sat, 30 Oct 2021 23:47:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84E581BF95D
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EFA080D1B
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ne9Bpu_hgiPH for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:46:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48A0980D17
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:46:53 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gy3mmpNlsrIRlgy3nm79m8; Sun, 31 Oct 2021 01:46:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635637611; bh=Lni1ju4Bj1qsWxKc6J3gWUwGAjfbk+3DGrkiWm1ZsR0=;
 h=From:To:Subject:Date:MIME-Version;
 b=Dyvwb2Db5EUHdZ/kgxM++li4+qLo5oZdcrhJ5L2t497VOGveTsp8ytV5xuyaMCdUz
 TrHLB5VF4hPMgLrv1AD3a/s9wFAtj61tt9VGbdKLs9tm4d+g7lHhbP6ZU/csNgJPa4
 iKzQ6Zp1ltIF+idYYij9GdPtkpT/lmc7kghVxcNCPlP4Uio/KsZrhgdzTdYAoujNHW
 XNiCiEwQfCpn718Kx3BscQDcvWMTdmHder3lC979e8XHq2CSHe7sCJ1XJ3lvHyeXUR
 PzGcNveNkDYTqGRqi674Zi1JY2c/CFYfHMfWclHNXPvgZe6Pv4kb4QSRdmX6/2/OXo
 Bn9m+4jy+P9rg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 01:46:45 +0200
Message-Id: <20211030234650.939616-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
References: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHYySGkJtiSyaX9+dd4NNFb6JwMbFEyQ4Z0UQCs4+NbiP08A0LpkFVKBStb52hCSykZO3f299W1OZ4QkByRMBUHMSsKkjhNQafl5mS+pUtY6pUMdAbee
 mk3Ei5FTbdZIpp9zTsuLqMdB3vlDvpJ+pbNBKmYs4Z3z8TmLBuTCEseTFH4a6cOv1dRU5HcfNB1ymO7KCVgT5wT43ckyA+fLy1rflZJhs1CoAgcCMNKnLp0s
 KwjVKpm+FxedRD/5yaBRVMuyr7pobbVKCLrs174lH6+CSNxIrLupDNsOrA7SKhvjcHDwffGbO24wvYhH5StF4wskTjL/6sTiKGWdO1wIvY17QkSytrMewWnT
 ceZgFUKi9dL8qjy7xe+bSeOVT9r+D/wOTp46CLw4zWexGxEhLPRyYt+YhvD42D+00gV1Ostm
Subject: [Buildroot] [PATCH 1/6] configs/olimex_a10_olinuxino: uboot 2021.10
 needs openssl and python3
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Leon Anavi <leon.anavi@konsulko.com>, Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Uboot 2021.10 needs openssl and python3 so enable them.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730014

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a10_olinuxino_lime_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
index c3b4f0161b..b168792b00 100644
--- a/configs/olimex_a10_olinuxino_lime_defconfig
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -36,7 +36,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A10-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
