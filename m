Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AF4C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F6D081E0C;
	Wed, 23 Nov 2022 19:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F6D081E0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yWD4reZ51EIO; Wed, 23 Nov 2022 19:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724AD81DCB;
	Wed, 23 Nov 2022 19:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 724AD81DCB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76F111BF95E
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 514D1409AA
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 514D1409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NsHGSKym7Jk7 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:53:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76ACF40951
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76ACF40951
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:53:22 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id v28so18267866pfi.12
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnoati0xoqwPXpTcVp5RcuiXgyUJzdR+95HYvxtqNj0=;
 b=ObS2112YtGKWb6Cl0gl+YwIwjoyv8D23S/KspjWTVjxabDRYwI0arb35PbvcvQ77SD
 si7ABUFPPSasU7Flu3octYS5RDBqfzdFiXLOxOMdVwW0OTBXIa7kMaTEqQ8je1fUA9sQ
 COnTheN7v8EH0BzUQ5SxiSUZ8BnJtShOYqSQLrL0+cv2zrIXp94sVIuD4aFPhJKs2grG
 HB2AMchMiGpVxmHxO3g1ZnRW1ihMyixb0bgWkNIXKEAns6CmThHsQPkO5GK3U4XP8qhY
 3gs+65RB/UPP8YUSOlEK6xw/B+E61/KI61jjoNa6u19+r/Z0qVxbBurNrkQJW/Zf4MlF
 g2yQ==
X-Gm-Message-State: ANoB5pkqp2bkHuth/YiojCc4Z28Hv6pKKCQZ3/LFoQlotFcyxE91tLxh
 iqq/VBIZ+h0lSnclS2jqzIcn2RezmzGQ7g==
X-Google-Smtp-Source: AA0mqf5rb6zNLFeblkya8CX8jVXm56iCZSosm9rVjF2IAdmfqe4aWCyXlH8Q+qhtgSlzVWnDkmMz3Q==
X-Received: by 2002:a62:6247:0:b0:56b:eda9:f47a with SMTP id
 w68-20020a626247000000b0056beda9f47amr12582740pfb.84.1669233201560; 
 Wed, 23 Nov 2022 11:53:21 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 y129-20020a626487000000b005745a586badsm1818282pfb.218.2022.11.23.11.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:53:21 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:52:56 -0800
Message-Id: <20221123195304.1582783-6-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
References: <20221123195304.1582783-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnoati0xoqwPXpTcVp5RcuiXgyUJzdR+95HYvxtqNj0=;
 b=aaj+IzI44ueKyU1EqNlPPzOGeOUsNVIJv+MpCMtq5gUaon7eSULJWAVDg963VaM/PW
 tsQg6HnmP7FTNpmI6u6/y1ySD6QimpECzFhjbHcJ7l0IJt2Z6QRvqNxH2PE+uZ2HDdMF
 OgFgt44K4ga/A4WhqidaKszyPdoOky5laPHM4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=aaj+IzI4
Subject: [Buildroot] [PATCH 6/7] package/freescale-imx/imx-vpu-hantro-vc:
 add INSTALL_STAGING_CMDS
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
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an INSTALL_STAGING_CMDS define as libraries needed by
imx-vpu-hantro-daemon.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 .../freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
index 1f033c1434..a8a6ffdef8 100644
--- a/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
+++ b/package/freescale-imx/imx-vpu-hantro-vc/imx-vpu-hantro-vc.mk
@@ -8,6 +8,7 @@ IMX_VPU_HANTRO_VC_VERSION = 1.9.0
 IMX_VPU_HANTRO_VC_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_VC_SOURCE = imx-vpu-hantro-vc-$(IMX_VPU_HANTRO_VC_VERSION).bin
 IMX_VPU_HANTRO_VC_DEPENDENCIES = linux
+IMX_VPU_HANTRO_VC_INSTALL_STAGING = YES
 
 IMX_VPU_HANTRO_VC_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_VC_LICENSE_FILES = EULA COPYING
@@ -17,6 +18,12 @@ define IMX_VPU_HANTRO_VC_EXTRACT_CMDS
 	$(call NXP_EXTRACT_HELPER,$(IMX_VPU_HANTRO_VC_DL_DIR)/$(IMX_VPU_HANTRO_VC_SOURCE))
 endef
 
+define IMX_VPU_HANTRO_VC_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755  $(@D)/usr/include/hantro_VC8000E_enc/*.h $(STAGING_DIR)/usr/include/
+	$(INSTALL) -D -m 0755  $(@D)/usr/lib/libhantro_vc8000e.so $(STAGING_DIR)/usr/lib/libhantro_vc8000e.so
+	$(INSTALL) -D -m 0755  $(@D)/usr/lib/libhantro_vc8000e.so.1 $(STAGING_DIR)/usr/lib/libhantro_vc8000e.so.1
+endef
+
 define IMX_VPU_HANTRO_VC_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so
 	$(INSTALL) -D -m 0755 $(@D)/usr/lib/libhantro_vc8000e.so.1 $(TARGET_DIR)/usr/lib/libhantro_vc8000e.so.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
