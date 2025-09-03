Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CDFCA0FF2
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 13:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7650F42148;
	Wed,  3 Sep 2025 13:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtwvxt5H__RG; Wed,  3 Sep 2025 13:50:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1E5D42155
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E5D42155;
	Wed,  3 Sep 2025 13:50:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E8662BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7554241561
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCXXaaRTwcDB for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 13:50:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.70.43.23;
 helo=mail-4323.protonmail.ch; envelope-from=philip@philipmolloy.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 480244014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 480244014E
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 480244014E
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 13:50:28 +0000 (UTC)
Date: Wed, 03 Sep 2025 13:50:19 +0000
To: buildroot@buildroot.org
From: Philip Molloy <philip@philipmolloy.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Philip Molloy <philip.molloy@analog.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20250903135005.1803497-3-philip@philipmolloy.com>
In-Reply-To: <20250903135005.1803497-1-philip@philipmolloy.com>
References: <20250903135005.1803497-1-philip@philipmolloy.com>
Feedback-ID: 9117015:user:proton
X-Pm-Message-ID: ff5c01775d031881f958ee1ba8725aa64d9dde82
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philipmolloy.com; 
 s=protonmail3; t=1756907424; x=1757166624;
 bh=KJF8iv7Mqf/aiE9VfPkuA9CLqFn0dEwsGuFXJDgxj+8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Mmc76NFDVbzJMBo3M2grfAUyXQDWMpCsqCXYOCFLJk6e4CESVc0ZFY6VcviJWyx01
 m/ZGgALoYLIMqud82IbQ6TC2T0mXSU3ezThCl4wCCCtoLvNajn98jbhX6UuQj2oY7d
 sLoyWGmVzVSOovUcLFQ/2JsjAQuoXFEmpignK/ugduT+KvioxtTcd9llmP0RGzVb8t
 H/8g96DpFy461bBqP/19750/5/w3maCHZDfRcu/wAyjCMaby3JIdZekPCkFEgtLQQH
 /uRMMOX30CGD0KAu2bwf8296hoKizJNnDZuuXtwWDpi8T25Z3rvxKw5Jn90kQePFDV
 uAL57+MREUdLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=philipmolloy.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=philipmolloy.com header.i=@philipmolloy.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=Mmc76NFD
Subject: [Buildroot] [PATCH v2 2/2] boot/uboot: add ADSP LDR binary format
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
 boot/uboot/Config.in | 4 ++++
 boot/uboot/uboot.mk  | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index a2301b7747..813a29828d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -479,6 +479,10 @@ config BR2_TARGET_UBOOT_FORMAT_QSPI_BIN
 	  file for flashing by combining the spl/boot.bin and
 	  u-boot.itb files into a unified binary.
 
+config BR2_TARGET_UBOOT_FORMAT_ADSP_LDR
+	bool "u-boot.ldr"
+	depends on BR2_arm || BR2_aarch64
+
 config BR2_TARGET_UBOOT_FORMAT_STM32
 	bool "u-boot.stm32"
 	depends on BR2_arm
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 2796b0a310..844984c9e6 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -144,6 +144,10 @@ UBOOT_MAKE_TARGET += u-boot.stm32
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
+UBOOT_BINS += u-boot.ldr
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
 UBOOT_MAKE_TARGET += u-boot-initial-env
 define UBOOT_INSTALL_UBOOT_INITIAL_ENV
@@ -257,6 +261,10 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/$(notdir $(ROCKCHIP_RKBIN_TEE_FILENAME))
 endif
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
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
