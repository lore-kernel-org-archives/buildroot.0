Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B697BCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EED041922;
	Wed,  3 Apr 2024 19:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWLRoEaABPmJ; Wed,  3 Apr 2024 19:54:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F954191E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34F954191E;
	Wed,  3 Apr 2024 19:54:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2E9E1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0E8440437
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JapZutf6JM_W for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E70E402E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E70E402E6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E70E402E6
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3438f079ff5so116232f8f.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174054; x=1712778854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uoWPTL33rAFGGWYYkvuijZliBbrbJIGWD++MRzuTJhM=;
 b=ZNCYbXzHyvxFxflsi5tMi5+eyzWBhariK1d14xRIdtmaVpYh99YeLu7kO+DifOZ79a
 uA5BA6HapXOhwA5bBPlOTCCUWRMtedaH5atF1Sv4cHlI2DR2K+xAo9rYEah156Q40+bS
 Xhqx+iubw+lK1s/tw+jJtXXMbQj2VYWYWtUgLB+JkWmZzps3Oo1A4ewWBlhZFcDwwk5p
 mPTBc69aH7I5ypmeNZcf22Wu/pkqQu1uiTLOPzLZVtxptxBslCBmh0unPW+vIzQBh75e
 3Gtk8xxiDfJGDrJfIT8K4EWlpJ+1rsSX2yFqy4F73x/Co+1MWtOUwVQ9lTCUZ/IJQ/iy
 VVLw==
X-Gm-Message-State: AOJu0YxGIT5QTLLQWYKc5lwFguY3byRZlKknOuIiQAvClOMfkkY+BvCc
 IkhxBT1ga0rIbduRzFx66qbp+HVQjBix83hQFvkpZjJPdxf3Al6GTX232BIAtJNhOLYhWkLmMzb
 6
X-Google-Smtp-Source: AGHT+IEOMm/Rz2UADsMN/mgDhA57q20U0iM7I294cJGNsmWL96SQTo35Kga2XJNdjHtQJj30cuE9lA==
X-Received: by 2002:adf:f605:0:b0:33e:38f1:77f6 with SMTP id
 t5-20020adff605000000b0033e38f177f6mr338413wrp.39.1712174054619; 
 Wed, 03 Apr 2024 12:54:14 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:14 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:48 +0200
Message-ID: <20240403195403.1359007-15-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174054; x=1712778854;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uoWPTL33rAFGGWYYkvuijZliBbrbJIGWD++MRzuTJhM=;
 b=pHE7MIRKpH+o1K/5qZR9B/YMH9PXSjRHnTSE7eHQQ6gueBkPugAajUSB9dHXrTO3mz
 q96hSbLB/jOGIJ9FygkIAf8i6WAH13FKxjDz7l6vHdXJa4UJ6lbwUe8KLwih6uDfPcku
 OX0ldn4B+l+qkmbPFhcGR6pG6OFCzJ6GMjpBSQz7Jh6YXMYOXdIwbYc7bx2bxQZ8Nglr
 Laf6yRfg04oooilK4FjltO5Zl7da+hDOKDZr1VHD2X4y5+b8MubXz96PUwYp5ml9Nhb2
 GcqRrrk/AeSs00yXoAM9uaWxPW88VaefwKMY0sqnkEaYHWhGwh9lea57xLOY3omgS0Ty
 4U2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=pHE7MIRK
Subject: [Buildroot] [PATCH v11 14/17] boot/uboot: remove
 BR2_TARGET_UBOOT_NEEDS_TI_K3_DM option
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previoulsy (without binman), when a TI K3 SoC using Combined binary
with a split firmware boot method was used (am62ax or am62x) [1], the
user had to select BR2_TARGET_UBOOT_NEEDS_TI_K3_DM in the defconfig
to provide Device Manager firmware provided by ti-k3-boot-firmware.

With binman, this option is no longer necessary since
ti-k3-boot-firmware package is already in the u-boot dependency and the
path to DM and SYSFW binaries are provided by BINMAN_INDIRS.

We are going to remove ti-k3-image-gen, so binman is now mandatory on
all TI K3 SoCs.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/52ce606c05ee3ac869f8087292bc3dbb0d25b79b

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy     |  6 ++++++
 boot/uboot/Config.in | 19 -------------------
 boot/uboot/uboot.mk  |  6 ------
 3 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d00196e08b..7117f8f528 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.05"
 
+config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
+	bool "u-boot TI K3 DM option has been removed."
+	select BR2_LEGACY
+	help
+	  The TI K3 Device Manager handled by u-boot binman tool.
+
 config BR2_PACKAGE_FLUTTER_GALLERY
 	bool "flutter-gallery removed"
 	select BR2_LEGACY
diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2dc20e4770..57c41f6458 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -240,25 +240,6 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 	  U-Boot, and that the TEE variable pointing to OPTEE's
 	  tee.elf, is passed during the Buildroot build.
 
-config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
-	bool "U-Boot needs TI K3 Device Manager (DM)"
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN
-	# We use the SoC selection defined for the ti-k3 package
-	depends on BR2_PACKAGE_TI_K3
-	depends on BR2_PACKAGE_TI_K3_SOC_AM62AX || BR2_PACKAGE_TI_K3_SOC_AM62X
-	help
-	  Some TI K3 devices need the Device Manager (DM) firmware to
-	  be available for the U-Boot build.
-
-if BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
-
-config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
-	string
-	default "am62axx" if BR2_PACKAGE_TI_K3_SOC_AM62AX
-	default "am62xx"  if BR2_PACKAGE_TI_K3_SOC_AM62X
-
-endif
-
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index be366e7c31..26deda8402 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -186,12 +186,6 @@ UBOOT_DEPENDENCIES += optee-os
 UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
-ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_DM),y)
-UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
-UBOOT_DEPENDENCIES += ti-k3-boot-firmware
-UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
-endif
-
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
 UBOOT_DEPENDENCIES += opensbi
 UBOOT_MAKE_OPTS += OPENSBI=$(BINARIES_DIR)/fw_dynamic.bin
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
