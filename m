Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83DEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:47:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77FDD60E0C
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77FDD60E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FB73401EA;
	Sat, 30 Oct 2021 23:47:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYP-_vaSe8HY; Sat, 30 Oct 2021 23:47:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ACE640203;
	Sat, 30 Oct 2021 23:47:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96F5B1BF95E
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8501940200
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S75KpLPC7hBC for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:46:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2306E401FB
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:46:52 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gy3mmpNlsrIRlgy3nm79mJ; Sun, 31 Oct 2021 01:46:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635637611; bh=aduxXFQf1LyK3GKsr6NKmCODCuf2AJM4zO6mn0e1+mo=;
 h=From:To:Subject:Date:MIME-Version;
 b=cufyQivcNonhQCF6ybXIlybuC+g4UMiSo6sfT2BMjo8mKF1ygj8lP4k6t7l/ZdtrU
 P4RfQ15L2lSDPQkqkgZeaLoYK5ajgOcetwDRMpC2hKkUPSJgXBAuU+y6o7tgt2+KaP
 5uDzUHamxFOpNteyM6+TgWKGthi/WqmwCq4kxdABdw0AktEGHWOFvk0ydG3qPSbPt3
 WXg1j1ikOo44bgiX+tfLDkMMCo3TU8H/+kyXqZ70UeQcfuYd4ZQdGUQC8UpLXEcclR
 otU3BW+iu05ScrrZ/R96g1OhY3GMF6Go0QTuECEtORV9mu/hXQ8hYk6ly81UjDgFzF
 UlS2V4iV5Ol/Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 01:46:46 +0200
Message-Id: <20211030234650.939616-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
References: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHYySGkJtiSyaX9+dd4NNFb6JwMbFEyQ4Z0UQCs4+NbiP08A0LpkFVKBStb52hCSykZO3f299W1OZ4QkByRMBUHMSsKkjhNQafl5mS+pUtY6pUMdAbee
 mk3Ei5FTbdZIpp9zTsuLqMdB3vlDvpJ+pbNBKmYs4Z3z8TmLBuTCEseTFH4a6cOv1dRU5HcfNB1ymO7KCVgT5wT43ckyA+fLy1rflZJhs1CoAgcCMNKnLp0s
 KwjVKpm+FxedRD/5yaBRVMuyr7pobbVKCLrs174lH6+CSNxIrLupDNsOrA7SKhvjcHDwffGbO24wvYhH5StF4wskTjL/6sTiKGWdO1wIvY17QkSytrMewWnT
 ceZgFUKi9dL8qjy7xe+bSeOVT9r+D/wOTp46CLw4zWexGxEhLPRyYt+YhvD42D+00gV1Ostm
Subject: [Buildroot] [PATCH 2/6] configs/olimex_a13_olinuxino: uboot 2021.10
 needs openssl, pylibfdt and python3
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

Uboot 2021.10 needs openssl, pylibfdt and python3 so enable them.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730015

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/olimex_a13_olinuxino_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/olimex_a13_olinuxino_defconfig b/configs/olimex_a13_olinuxino_defconfig
index 14cec97d49..d18a9ee6bd 100644
--- a/configs/olimex_a13_olinuxino_defconfig
+++ b/configs/olimex_a13_olinuxino_defconfig
@@ -18,6 +18,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A13-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
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
