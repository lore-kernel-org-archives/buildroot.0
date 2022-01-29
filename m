Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F429C433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 14:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF692812C8;
	Sat, 29 Jan 2022 14:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJRdtGYDtJZX; Sat, 29 Jan 2022 14:08:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FCB181275;
	Sat, 29 Jan 2022 14:08:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8BE51BF681
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 14:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7A2181275
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 14:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJ4M_BHo-mbE for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 14:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E4D481255
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 14:08:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f22-20020a1c1f16000000b003525bf08b1eso1627226wmf.0
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziEjfAuin1YZ0oAKoGs0+1ng4IKa5vve3Qqu6lyVf/M=;
 b=CiwRXwAMu24iErU0mpIItI4KFu+FIL5eLzH1TRhKTAEdTZx7pumRHJtTlO//3KfuPQ
 DQo7BKXerx21jrdwpFnqmMs5vUd+8FFyn6Ar0hRq8mCbpX0bkYNU0FWANGWoihVWOI3h
 KSYX1/Jc4nMNXc8nEVwYc+q9sza5poocr9ET4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ziEjfAuin1YZ0oAKoGs0+1ng4IKa5vve3Qqu6lyVf/M=;
 b=Id8CxFVr/ikvhYXc2W9elrjsS4Rbk0jaGeT2s7Ecdw5UOpnJKdaAS7N8lUlLVMtUc/
 hyBPRG7k6dvOLphcqpYwBIJEYtcwv8P6L2n6PhoHtrGEvxIfWFNpFzTHsl1lk2cSChfn
 HWuM/BhTnISUunUDgag2kmmMCcr3TjNqmnXvNnKpxEJ71WADqBr0OvY1QxVkMZ9HR2Vi
 iemODlyaXCdp2u28WHNZ5uxA1/rFQIA7bEQ8A9/FNyitc6Cb2iiSfJbqN6AsrwEuripb
 FoNb3GZIX1K3N9RVxtvDf5n5lKGFpMCscdpN/Co0EO+0ue/4nN93QA8g2n4sHtXaCB93
 u+dA==
X-Gm-Message-State: AOAM533DqAdkGKVAvwnG4uhSNtTeokQyxPR8cpS/1gyQGuxH15GjPN1R
 GP2Cqt5vreht6VSb/FgrodB1V/PyDp/rGg==
X-Google-Smtp-Source: ABdhPJwPPoreoobZQRBe2R+cvHkfI1yeNy9NBIlgwbZQfPba+k6GlrT0U4VrbGq8ttDicuZahadzaw==
X-Received: by 2002:a05:600c:1d8b:: with SMTP id
 p11mr19874411wms.115.1643465315833; 
 Sat, 29 Jan 2022 06:08:35 -0800 (PST)
Received: from panicking.amarulasolutions.com ([62.18.234.10])
 by smtp.gmail.com with ESMTPSA id m25sm4150707wml.47.2022.01.29.06.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 06:08:34 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 15:08:31 +0100
Message-Id: <20220129140831.1284832-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/freescale-imx: Add installation of
 easrc-imx8mn.bin firmware
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The easrc firmware is used for audio resampling. The firmware for now
exists only for imx8mn device

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 package/freescale-imx/firmware-imx/Config.in       |  4 ++++
 package/freescale-imx/firmware-imx/firmware-imx.mk | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index df266fb28e..06c4d8036c 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -39,6 +39,10 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+
 config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EPDC_FW
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 3acd053d0f..211a43c4ca 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -113,6 +113,17 @@ define FIRMWARE_IMX_INSTALL_IMAGE_HDMI_FW
 endef
 endif
 
+#
+# EASRC firmware
+#
+
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EASRC_FW),y)
+define FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW
+	mkdir -p $(TARGET_DIR)/lib/firmware/imx
+	cp -r $(@D)/firmware/easrc $(TARGET_DIR)/lib/firmware/imx
+endef
+endif
+
 #
 # EPDC firmware
 #
@@ -160,6 +171,7 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
 endef
 
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
+	$(FIRMWARE_IMX_INSTALL_TARGET_EASRC_FW)
 	$(FIRMWARE_IMX_INSTALL_TARGET_EPDC_FW)
 	$(FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW)
 	$(FIRMWARE_IMX_INSTALL_TARGET_VPU_FW)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
