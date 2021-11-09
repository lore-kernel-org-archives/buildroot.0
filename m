Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D18C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:23:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F4A861027
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 17:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F4A861027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D2B340398;
	Tue,  9 Nov 2021 17:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2QvejaGiXh8; Tue,  9 Nov 2021 17:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BA5440186;
	Tue,  9 Nov 2021 17:23:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1EE501BF9AA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BD7940186
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 17:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qoG0hdW6bpDa for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 17:23:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E57B400D4
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 17:23:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d24so34299412wra.0
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 09:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BOnID2EbdOnOzgVvrX5QekDBuwLJT9pI5zd1uAy2Zv0=;
 b=mgMDYhz+X3fZ2JzCi6IVTwD9a5d8c1Mgwlc9JteFzYsPCNoY4U8Jw4Jp9WdocUDSEy
 9SERoO2zN31yMnG8iYat/Q3PCLjCZMO6Ffs5nXM1mpNj8V/BYaLyNn6kQ3k1d8V3EBcQ
 fCMFhePmFyQCV/I/C1UOmcgOUZQsthual3jIlE/fBDLqXs3a18TIW4/Y3kLlwuHYCipE
 G4lmvALVNnfmA9CmXaFJtXgjWWw0keY4jrL+MTisBTz6DEMKgmrbBJQ/EwRUjScZKyLc
 OX1PjELCM9hc7ICWjgytmxeNSDTW3Ty5fQ2DYFqzzmVSc0nG3x3ynDlYIntDrMHu9uz1
 D82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BOnID2EbdOnOzgVvrX5QekDBuwLJT9pI5zd1uAy2Zv0=;
 b=wo+JDHO5jiauwjVBSunSTPZzu59S38uoxnLTY2BPOrixzcGjiBlCFrYQcydwxbOxb9
 bRR5ikG51hTsZuC58WMi8HKBbJ6RD04ZfwOMCoBRGggFiswlsUHOD3/gJ3iQ9VjoUTeP
 thLQOIHgmRFO1qdSlDzMz+OyHa+1l2ito+dT8nSpkTm6Qgqd9pkQgo8uQZ7SxiDrg/Zz
 zYbsDFO1jqZVE6YVxgrEkMhqtTlWlYGN5CISk68sxVInv+Xl3zVwjAlmRKW6qDXsw5wK
 bwZpB6UXHNV4qAnVjSu1YEyi/cmwdNaiaV1G24TwaDy6r6+raAmMzhHsdZToh11sgSO1
 Ws1A==
X-Gm-Message-State: AOAM533/JGwcyJ7p2sJR9WDufD25H8e627Sy9feO1nlsKg9wARwUjx7C
 LEko79lbeKe5eNnE3ZKvaaTmgIKTqjw=
X-Google-Smtp-Source: ABdhPJy+TJfr7y8gXiWpkC8TW2fhazCjDVnfJqDoD7weiPmJKs/BoQg1ZtnmaVJCZTdd+eTcfueH6A==
X-Received: by 2002:a5d:588b:: with SMTP id n11mr11822988wrf.344.1636478594210; 
 Tue, 09 Nov 2021 09:23:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id a1sm24094313wri.89.2021.11.09.09.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 09:23:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 18:21:20 +0100
Message-Id: <20211109172120.457166-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpuwrap: don't
 override dependencies
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Don't override IMX_VPUWRAP_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index fdad3a5f2b..b9a1717d28 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -8,15 +8,9 @@ IMX_VPUWRAP_VERSION = 4.3.5
 IMX_VPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
 IMX_VPUWRAP_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_IMX_VPU),y)
-IMX_VPUWRAP_DEPENDENCIES = imx-vpu
-endif
-
-ifeq ($(BR2_PACKAGE_IMX_VPU_HANTRO),y)
-IMX_VPUWRAP_DEPENDENCIES = imx-vpu-hantro
-endif
-
+IMX_VPUWRAP_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_IMX_VPU),imx-vpu) \
+	$(if $(BR2_PACKAGE_IMX_VPU_HANTRO),imx-vpu-hantro)
 IMX_VPUWRAP_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPUWRAP_LICENSE_FILES = EULA COPYING
 IMX_VPUWRAP_REDISTRIBUTE = NO
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
