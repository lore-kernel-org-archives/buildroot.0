Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435CCC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 094EE83D88;
	Sat, 17 Feb 2024 16:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaJpFHb9oFTx; Sat, 17 Feb 2024 16:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A747B83DA0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A747B83DA0;
	Sat, 17 Feb 2024 16:03:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B87F1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 190374012E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03l5BHhUafnE for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA2A3400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA2A3400C4
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA2A3400C4
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:09 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-563a6656c46so4622985a12.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185787; x=1708790587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KJHR/SId+NO0ochr48Hu+SbRiXw1dVqoxlmoiSoc1Y=;
 b=c6lFDGYT5/8smWAKabsrgD1qZG9bwAZF2nPBIR8m+S/kLw3kZN0PQNAQtrbNijClXr
 1+Ov3NIuk88/7yuxXEOkQ5fmQwxTnYh/lusYQwNmW+WuMTwcyq9q/4Xt+WinXMK2mYU0
 VvPV4jhB2dAtY+txTciwDDaMpgr0l80pgPi02mgWo5zttbOAjf8WmgUncMZblc63SPdo
 UuyUjXr1bPjs3YkDbex0yAdqxVHhUD4n64dD3Sw8u2KknRdGiO32ET5JHpJS6+qAp4Yi
 bGEvtNMLpf4AVJ61rBWU0enH6kulU4I6RgK5sxsyLUlSFlkQljSmv+PXKe6BG3egp0et
 0fng==
X-Gm-Message-State: AOJu0Yz1PldEFbQ6T0+VSS1WVbOE3r8wOX59FRbPjshkVMD2B7X/wuAD
 REiP/42NS75+f0STRt9zWTYsSVlKgaInHd54Gz6ZH9j2MWMags5+C0CRynldMkuqXJnBB342dd+
 6YEI=
X-Google-Smtp-Source: AGHT+IH3m2Kz6QGOLu6kKF51BCgwy647oMfsl7ZK94BwC9w+c7cm3qOXx68vOn9OqnNglVR2CWmiLQ==
X-Received: by 2002:aa7:c517:0:b0:561:c29b:9023 with SMTP id
 o23-20020aa7c517000000b00561c29b9023mr5186199edq.14.1708185786984; 
 Sat, 17 Feb 2024 08:03:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:31 +0100
Message-ID: <20240217160244.1320482-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185787; x=1708790587;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KJHR/SId+NO0ochr48Hu+SbRiXw1dVqoxlmoiSoc1Y=;
 b=jnh4sYSG+jPAR/waW72VSbfGGw3/w2+GFaBKWtxwPadcatd0c1koGZvzDgABiMnU7M
 mWUuMchEVmh3APuavmOVypNch3Gzq2DRLq7FJl3TLURKvoUVk3SKgYggMLPTno/HamM1
 zo+Qy/adcEtBjMZekKFfSi3t5h0Afa5gggQoY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jnh4sYSG
Subject: [Buildroot] [PATCH v4 07/20] boot/ti-k3-image-gen: manage HS
 hardware
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch sets the configurations required by TI HS systems. Some of these
configurations (i. e. HS SYSFW image signing key, HS Software Revision)
are provided by the ti-k3-core-secdev package in the binaries directory.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3:

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3-image-gen/Config.in          |  1 +
 boot/ti-k3-image-gen/ti-k3-image-gen.mk | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.in
index d76cef82e911..38d1598d9fc0 100644
--- a/boot/ti-k3-image-gen/Config.in
+++ b/boot/ti-k3-image-gen/Config.in
@@ -2,6 +2,7 @@ config BR2_TARGET_TI_K3_IMAGE_GEN
 	bool "ti-k3-image-gen"
 	depends on BR2_TARGET_TI_K3_R5_LOADER
 	select BR2_TARGET_TI_K3_BOOT_FIRMWARE
+	select BR2_TARGET_TI_K3_CORE_SECDEV if BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS || BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS
 	# We need FIT support in uboot-tools, which is why we select a
 	# host package
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
index 64be9a18f2c4..74b4fcb4bf89 100644
--- a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
@@ -29,10 +29,21 @@ TI_K3_IMAGE_GEN_FW_TYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE))
 TI_K3_IMAGE_GEN_SOC = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
 TI_K3_IMAGE_GEN_SECTYPE = $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE))
 
-TI_K3_IMAGE_GEN_SYSFW = $(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
+ifeq ($(BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP),y)
+TI_K3_IMAGE_GEN_SYSFW = \
+	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE).bin
+else
+TI_K3_IMAGE_GEN_DEPENDENCIES += ti-k3-core-secdev
+
+TI_K3_IMAGE_GEN_SYSFW = \
+	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE)-enc.bin \
+	$(TI_K3_IMAGE_GEN_FW_TYPE)-firmware-$(TI_K3_IMAGE_GEN_SOC)-$(TI_K3_IMAGE_GEN_SECTYPE)-cert.bin
+endif
 
 define TI_K3_IMAGE_GEN_CONFIGURE_CMDS
-	cp $(BINARIES_DIR)/ti-sysfw/$(TI_K3_IMAGE_GEN_SYSFW) $(@D)
+	$(foreach t,$(TI_K3_IMAGE_GEN_SYSFW),\
+		cp $(BINARIES_DIR)/ti-sysfw/$(t) $(@D)/
+	)
 endef
 
 define TI_K3_IMAGE_GEN_BUILD_CMDS
@@ -40,6 +51,7 @@ define TI_K3_IMAGE_GEN_BUILD_CMDS
 	$(BR2_MAKE) -C $(@D) \
 		SOC=$(TI_K3_IMAGE_GEN_SOC) \
 		SOC_TYPE=$(TI_K3_IMAGE_GEN_SECTYPE) \
+		TI_SECURE_DEV_PKG=$(BINARIES_DIR)/ti-k3-core-secdev \
 		CONFIG=evm \
 		CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 		SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
