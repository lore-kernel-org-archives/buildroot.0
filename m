Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A08C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 15:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1925E41E35;
	Fri, 17 Jan 2025 15:50:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UYeo5l1XAq3l; Fri, 17 Jan 2025 15:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC4741A6B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC4741A6B;
	Fri, 17 Jan 2025 15:50:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76A60B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 15:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 710406FAAB
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 15:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xu_PB32Dlrfy for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 15:50:36 +0000 (UTC)
X-Greylist: delayed 701 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 17 Jan 2025 15:50:35 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1460F60661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1460F60661
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1460F60661
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 15:50:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97613FF80A;
 Fri, 17 Jan 2025 15:50:32 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri, 17 Jan 2025 15:50:30 +0000
Message-Id: <20250117155030.3238710-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737129033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=R0meyPrQcY1XRpR6Cljk/ta9U0jid199ezge7csrAt0=;
 b=VccqF3qgfvhOtF8LL3bVEaibrUW/Llt6EZUteuCQpW2fYhweAlSCqKg0ozI5FXeRh0Ez4W
 x6G5e8Vb31Z8vS5L01Q2yA+vRJdmumCKLAMNj4BJNgjhh3MyK2OeL86te97PncUP0y+tso
 tNsoOLk4MClQtJZ8iMTDtAQ4aSdbAGYTCCW5UlW9WYSac4elM/+VYuJBeKgogJorv0dih7
 WAVZviGIyMt4w0Wiuc/vb47UHZkWgNaSWk/Sbg181HWEpl0I5K0uUlTykE4hFWqjXXFpoa
 MgouM3wn0HPlYSV2Mi9NNvEUBiaGw9aauf8isF9TkkUOUk3hwuAOnKE0OVTWuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VccqF3qg
Subject: [Buildroot] [PATCH] package/murata-cyw-fw: Bump to last revision
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to last revision and install the newly added CYW43439 firmware.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/murata-cyw-fw/Config.in          | 20 ++----
 package/murata-cyw-fw/murata-cyw-fw.hash |  6 +-
 package/murata-cyw-fw/murata-cyw-fw.mk   | 85 ++++++++++++------------
 3 files changed, 51 insertions(+), 60 deletions(-)

diff --git a/package/murata-cyw-fw/Config.in b/package/murata-cyw-fw/Config.in
index 7530477511..8a2795e806 100644
--- a/package/murata-cyw-fw/Config.in
+++ b/package/murata-cyw-fw/Config.in
@@ -25,20 +25,9 @@ config BR2_PACKAGE_MURATA_CYW_FW_CYW43362
 	  Murata Wireless CYW43362 (SN8000) module firmware files.
 
 config BR2_PACKAGE_MURATA_CYW_FW_CYW4339
-	bool "CYW4339 (1CK/ZP)"
+	bool "CYW4339 (ZP)"
 	help
-	  Murata Wireless CYW4339 (1CK/ZP) module firmware files.
-
-choice
-	prompt "CYW4339 module" if BR2_PACKAGE_MURATA_CYW_FW_CYW4339
-
-config BR2_PACKAGE_MURATA_CYW_FW_CYW4339_1CK
-	bool "1CK"
-
-config BR2_PACKAGE_MURATA_CYW_FW_CYW4339_ZP
-	bool "ZP"
-
-endchoice
+	  Murata Wireless CYW4339 (ZP) module firmware files.
 
 config BR2_PACKAGE_MURATA_CYW_FW_CYW43430
 	bool "CYW43430/CYW4343W/CYW43364 (1DX/1FX/1LN)"
@@ -60,6 +49,11 @@ config BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1LN
 
 endchoice
 
+config BR2_PACKAGE_MURATA_CYW_FW_CYW43439
+	bool "CYW43439 (1YN)"
+	help
+	  Murata Wireless CYW43439 (1YN) module firmware files.
+
 config BR2_PACKAGE_MURATA_CYW_FW_CYW43455
 	bool "CYW43455 (1HK/1LC/1MW)"
 	help
diff --git a/package/murata-cyw-fw/murata-cyw-fw.hash b/package/murata-cyw-fw/murata-cyw-fw.hash
index d3c23dca71..cf199929a6 100644
--- a/package/murata-cyw-fw/murata-cyw-fw.hash
+++ b/package/murata-cyw-fw/murata-cyw-fw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c3ecf357786d6db6f3283c0ea36ec067b1728f801fd8871694aed1502a82e9bc  murata-cyw-fw-8d87950bfad28c65926695b7357bd8995b60016a.tar.gz
-sha256  03c140ae04f9c2036678262d6457b9c4b4a9ebb523c5e681af6d57b97c11da37  cyw-fmac-nvram-d27f1bf105fa1e5b828e355793b88d4b66188411.tar.gz
-sha256  8f23ebb9a262112b62ace1e1bedcdeb00523d9a45e8d48a829d4ca35db4f0280  cyw-bt-patch-748462f0b02ec4aeb500bedd60780ac51c37be31.tar.gz
+sha256  2b71cb2a9376d3dda36185f2afff294322f6d1b60dd26c534b5fbeeb6155ea14  murata-cyw-fw-35459425949f0fa7de0b5c9f0c8bc0560087e1de.tar.gz
+sha256  59b6f9c117023226ea7e614265a71dc3ed4991774298609fd9f516a5581d3cba  cyw-fmac-nvram-fd6587f8183b612ea52404c7a73aeb2698099587.tar.gz
+sha256  d80f8a03095f0a63284bbc83e6b878d41f94d402c569a49a1a8c8105983d7d34  cyw-bt-patch-83f8e16423c47e195f52a06fd68ac92a20a80a9f.tar.gz
 sha256  3a892759b73e8b459f1a750954b316118b0061fd9d1868d11fa258c104ee7e0c  LICENCE.cypress
diff --git a/package/murata-cyw-fw/murata-cyw-fw.mk b/package/murata-cyw-fw/murata-cyw-fw.mk
index b99168b875..e482629e49 100644
--- a/package/murata-cyw-fw/murata-cyw-fw.mk
+++ b/package/murata-cyw-fw/murata-cyw-fw.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MURATA_CYW_FW_VERSION = 8d87950bfad28c65926695b7357bd8995b60016a
-MURATA_CYW_FW_VERSION_NVRAM = d27f1bf105fa1e5b828e355793b88d4b66188411
-MURATA_CYW_FW_VERSION_BT_PATCH = 748462f0b02ec4aeb500bedd60780ac51c37be31
+MURATA_CYW_FW_VERSION = 35459425949f0fa7de0b5c9f0c8bc0560087e1de
+MURATA_CYW_FW_VERSION_NVRAM = fd6587f8183b612ea52404c7a73aeb2698099587
+MURATA_CYW_FW_VERSION_BT_PATCH = 83f8e16423c47e195f52a06fd68ac92a20a80a9f
 MURATA_CYW_FW_SITE = $(call github,murata-wireless,cyw-fmac-fw,$(MURATA_CYW_FW_VERSION))
 MURATA_CYW_FW_EXTRA_DOWNLOADS = \
 	$(call github,murata-wireless,cyw-fmac-nvram,$(MURATA_CYW_FW_VERSION_NVRAM))/cyw-fmac-nvram-$(MURATA_CYW_FW_VERSION_NVRAM).tar.gz \
@@ -24,69 +24,66 @@ endef
 MURATA_CYW_FW_POST_EXTRACT_HOOKS += MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
 
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43012) += \
-	brcmfmac43012-sdio.bin \
-	brcmfmac43012-sdio.1LV.clm_blob \
-	brcmfmac43012-sdio.1LV.txt \
-	CYW43012C0.1LV.hcd
+	cyfmac43012-sdio.bin \
+	cyfmac43012-sdio.1LV.clm_blob \
+	cyfmac43012-sdio.1LV.txt \
+	BCM43012C0_003.001.015.0303.0267.1LV.sAnt.hcd
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43340) += \
-	brcmfmac43340-sdio.bin \
-	brcmfmac43340-sdio.1BW.txt \
+	cyfmac43340-sdio.bin \
+	cyfmac43340-sdio.1BW.txt \
 	CYW43341B0.1BW.hcd
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43362) += \
-	brcmfmac43362-sdio.bin \
-	brcmfmac43362-sdio.SN8000.txt
+	cyfmac43362-sdio.bin
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4339) += \
-	brcmfmac4339-sdio.bin
-MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4339_1CK) += \
-	brcmfmac4339-sdio.1CK.txt
-MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4339_ZP) += \
-	brcmfmac4339-sdio.ZP.txt \
+	cyfmac4339-sdio.bin \
 	CYW4335C0.ZP.hcd
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43430) += \
-	brcmfmac43430-sdio.bin
+	cyfmac43430-sdio.bin
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1DX) += \
-	brcmfmac43430-sdio.1DX.clm_blob \
-	brcmfmac43430-sdio.1DX.txt \
-	CYW43430A1.1DX.hcd
+	cyfmac43430-sdio.1DX.clm_blob \
+	cyfmac43430-sdio.1DX.txt \
+	BCM43430A1_001.002.009.0159.0528.1DX.hcd
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1FX) += \
-	brcmfmac43430-sdio.1FX.clm_blob \
-	brcmfmac43430-sdio.1FX.txt
+	cyfmac43430-sdio.1FX.clm_blob \
+	cyfmac43430-sdio.1FX.txt
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43430_1LN) += \
-	brcmfmac43430-sdio.1LN.clm_blob \
-	brcmfmac43430-sdio.1LN.txt
+	cyfmac43430-sdio.1LN.clm_blob
+MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43439) += \
+	cyfmac43439-sdio.bin \
+	cyfmac43439-sdio.1YN.clm_blob \
+	cyfmac43439-sdio.1YN.txt \
+	CYW4343A2_001.003.016.0031.0000.1YN.hcd
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43455) += \
-	brcmfmac43455-sdio.bin
+	cyfmac43455-sdio.bin
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43455_1HK) += \
-	brcmfmac43455-sdio.1HK.clm_blob \
-	brcmfmac43455-sdio.1HK.txt
+	cyfmac43455-sdio.1HK.clm_blob
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43455_1LC) += \
-	brcmfmac43455-sdio.1LC.clm_blob \
-	brcmfmac43455-sdio.1LC.txt
+	cyfmac43455-sdio.1LC.clm_blob \
+	cyfmac43455-sdio.1LC.txt
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW43455_1MW) += \
-	brcmfmac43455-sdio.1MW.clm_blob \
-	brcmfmac43455-sdio.1MW.txt \
-	CYW4345C0.1MW.hcd
+	cyfmac43455-sdio.1MW.clm_blob \
+	cyfmac43455-sdio.1MW.txt \
+	BCM4345C0_003.001.025.0187.0366.1MW.hcd
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4354) += \
-	brcmfmac4354-sdio.bin \
-	brcmfmac4354-sdio.1BB.clm_blob \
-	brcmfmac4354-sdio.1BB.txt \
+	cyfmac4354-sdio.bin \
+	cyfmac4354-sdio.1BB.clm_blob \
 	CYW4350C0.1BB.hcd
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4356) += \
-	brcmfmac4356-pcie.bin \
-	brcmfmac4356-pcie.1CX.clm_blob \
-	brcmfmac4356-pcie.1CX.txt \
-	CYW4354A2.1CX.hcd
+	cyfmac4356-pcie.bin \
+	cyfmac4356-pcie.1CX.clm_blob \
+	BCM4356A2_001.003.015.0112.0410.1CX.hcd
 MURATA_CYW_FW_FILES_$(BR2_PACKAGE_MURATA_CYW_FW_CYW4359) += \
-	brcmfmac4359-pcie.bin \
-	brcmfmac4359-pcie.1FD.clm_blob
+	cyfmac4359-pcie.bin \
+	cyfmac4359-sdio.bin
 
 # Helper that assumes filename with model has two dots (CHIP.MODEL.EXT),
-# but filename without model has only single dot (CHIP.EXT).
-murata-cyw-fw-strip-model = $(shell echo -n $(1) | sed 's/\..*\./\./')
+# or a underscore with several dots (CHIP_MODEL.MODEL.MODEL.EXT), but
+# filename without model has only single dot (CHIP.EXT).
+murata-cyw-fw-strip-model = $(shell echo -n $(1) | sed -e 's/\..*\./\./' -e 's/_.*\./\./')
 
 # Helper that strips model name and renames Bluetooth patch files to the ones
 # expected by Linux kernel.
-murata-cyw-fw-file-rename = $(call murata-cyw-fw-strip-model,$(patsubst CYW%,BCM%,$(f)))
+murata-cyw-fw-file-rename = $(call murata-cyw-fw-strip-model,$(patsubst CYW%,BCM%,$(patsubst cy%,brcm%,$(f))))
 
 define MURATA_CYW_FW_INSTALL_TARGET_CMDS
 	$(foreach f,$(MURATA_CYW_FW_FILES_y), \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
