Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E607CAC581
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 11:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D586E61CA5;
	Mon,  8 Sep 2025 11:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id odITPd5zcfCv; Mon,  8 Sep 2025 11:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0174561C50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0174561C50;
	Mon,  8 Sep 2025 11:52:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEBF9CA
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBEB384F18
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:52:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_QD_gH9k9Ea for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 11:52:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.224.244.21;
 helo=mail-24421.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3EDE883503
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EDE883503
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch
 [109.224.244.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EDE883503
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 11:52:13 +0000 (UTC)
Date: Mon, 08 Sep 2025 11:52:07 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip.molloy@analog.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20250908115200.3295727-3-philip@philipmolloy.com>
In-Reply-To: <20250908115200.3295727-1-philip@philipmolloy.com>
References: <20250908115200.3295727-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: 1f51c1a33474b869136cb2985c2af916e375c0ad
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1757332331; x=1757591531;
 bh=vPCDFSvpTuyCMgSQ22DUs8Ype13X4xG/vzBQtTymCjc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=BgCGMbKOGq2me8idcmJuowCtsq3wQGQcyvtdEUcnKGBgMJBrbjgxR5pgvkhdr+baG
 LZJLjpC8Vs0RPbIN1mp6wW4kjGnPS8wKYum5b2jBDiTBDnHIc4DWl/ktprzj2xQ7TG
 zjrkIc0vH+ooAjnj/Urc7jx0JB1d6nU3aEO7/5MfYxvB5xK/G/a9OnFuiIWNW1i7jN
 OJu2GphHrxUmgiNBBtHylvtD8j31rVvLr4hCysYpnuC5k8siPtlkleCC71Kt/oYgId
 V5nJc12WFljiJDShPahQ1pkzEa+xKX6uOqrXoUJPG0uztPSj8bnsSTWvj24IT8/+zL
 tWBS3WO9NOiog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=BgCGMbKO
Subject: [Buildroot] [PATCH v3 2/2] boot/uboot: add ADSP LDR binary format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Philip Molloy <philip.molloy@analog.com>

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a2301b7747..06e90b309c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -479,6 +479,14 @@ config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
 	  file for flashing by combining the spl/boot.bin and
 	  u-boot.itb files into a unified binary.
 
+config BR2_TARGET_UBOOT_FORMAT_ADSP_LDR
+	bool "u-boot.ldr"
+	depends on BR2_arm || BR2_aarch64
+	help
+	  Boot stream format for Analog Devices, Inc. ADSP-SCxxx
+	  processors including 32-bit SC589, SC592, and SC594, as
+	  well as 64-bit SC596 and SC598
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a310..9ad001c8a2 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -257,6 +257,11 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/$(notdir $(ROCKCHIP_RKBIN_TEE_FILENAME))
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
+UBOOT_BINS += u-boot.ldr
+UBOOT_DEPENDENCIES += host-adsp-ldr
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
 UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
-- 
2.50.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
