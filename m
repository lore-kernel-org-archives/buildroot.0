Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F03C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 15:31:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B217C611C4
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 15:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B217C611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F883405D9;
	Thu,  4 Nov 2021 15:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzQegcTZn40Q; Thu,  4 Nov 2021 15:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF999405D6;
	Thu,  4 Nov 2021 15:31:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 885DA1BF5A1
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 15:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7455B403FB
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 15:31:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=microchip.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ab6_h40uqBrx for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 15:31:02 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D8F6403E2
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636039862; x=1667575862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c4u+tSBr1OqAWcMmdrTzXmbumvTcQG4rufAETXFkHVs=;
 b=P60JzBGApna5Cba5Z4V1NruIDjkGeCYGDtij109Z6Q1ncKUdivEjq+Yf
 wx5/9PPVXOmBg4gb8qLZJRyWuMeBbr6mwtkhRie1yTdXZpgmOWMuH5YFe
 9yANfY7UAcmyLqCfrCzOfAmc3tskIpiFZZKA1aBqyAgOfm/LuEHn2zmwY
 Pszhl0MT0cu8AruSnwLhoL3XFdi/WP079NpCkaqtMm9w3f2ZOPYr2/64m
 K2V+K/C6sjm0jvPxhWs4K50PJzjC0dJ3MqryZwTL1P6eAln0DNlcV4Ayw
 WI6ZUz7mX6tuTd3mGn5gOH0ViiqgtqH/9eMj5VqNnh15kcGgXD66wL1Rq g==;
IronPort-SDR: QwCi4P94wM633jndVhzzkuX515IHEiT6DzVfjd8jzPy5pKnrHNQ8fdEY5GN6+YYIjP2kkKBsNN
 naY/88SqdH2bBojG77c0i1h8eH0Kcv03Hh7+30Og7Iq7iYFhHp8lB+wyuz+pJqMX5gqNf2ywQo
 fLxuEHRlRsBRtZtuYw9rD7LilIG9rYl5Qrp3OpFiWlnnNp/DHBWzkKyXsMEDnmNOww4c8puBha
 7tJx8HOpXA/QwdQjuKoXFkh+MHDXTLSfs3OwmW8IzQ9yBhVCvdeEnRqswh+qFI/PISutXJg4Yp
 72vuEVGvtXy9PM/F/V4K0WpS
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="150736645"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Nov 2021 08:23:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 4 Nov 2021 08:23:55 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 4 Nov 2021 08:23:53 -0700
To: <buildroot@buildroot.org>
Date: Thu, 4 Nov 2021 17:23:29 +0200
Message-ID: <20211104152329.1560933-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104152329.1560933-1-eugen.hristev@microchip.com>
References: <20211104152329.1560933-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/microchip_sama5d2_icp: update
 at91bootstrap version
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
From: Eugen Hristev via buildroot <buildroot@buildroot.org>
Reply-To: Eugen Hristev <eugen.hristev@microchip.com>
Cc: Eugen Hristev <eugen.hristev@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update AT91bootstrap version to released 4.0.0 instead of using a release
candidate.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 configs/microchip_sama5d2_icp_mmc_defconfig     | 2 +-
 configs/microchip_sama5d2_icp_mmc_dev_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
index e41fdf2d31..5d0eac3250 100644
--- a/configs/microchip_sama5d2_icp_mmc_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0-rc2)/at91bootstrap-v4.0.0-rc2.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_icpsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index 50ae0a9ce7..46e802f67b 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -60,7 +60,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0-rc2)/at91bootstrap-v4.0.0-rc2.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_icpsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
