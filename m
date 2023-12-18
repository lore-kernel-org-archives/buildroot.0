Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF01C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D27F54098E;
	Mon, 18 Dec 2023 08:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D27F54098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZC5K-Lqj-QPU; Mon, 18 Dec 2023 08:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CACE2405CB;
	Mon, 18 Dec 2023 08:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CACE2405CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 307D41BF3BC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15879408C3
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15879408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTZDiM8PcWXy for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:20:17 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83B4C40603
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83B4C40603
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a1fae88e66eso287399166b.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 00:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702887615; x=1703492415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vSHa95Y+hyYJW6mEjmZQWjX0vbe4isiHm4HPq5W984=;
 b=m6/ZO1R/muazBO9GfXaB9K1IRTGrxTov9gdnFqciYYYdcaZmcgpL2a9eQ22fT9oCnr
 j+31UlaYNBI2Xj5QjHEvk033Kg5drqUEZrYz07yc7BhR959pQ8mQPEBX4WCjWlbdvnbK
 IywnqdtoLvKi3/FCGYNXtZbS9QfvfyBkh58fUQfu9z+JEUVy8x06e+6Hp/9vcn5Gg9Xs
 QGXD+XlOKOKZneiBjhDT7W5hbUHTU/nfueNXgPeOLcnAVfTDBeYZUAl8bU4l62dtqIox
 v0R1M3dB9xV35y27E24Jhn6JcWJj+KvSX7odVx79HI7oCFjXjqNusRDn1y3Oxssn2zEy
 pGtw==
X-Gm-Message-State: AOJu0YzRWGeLiXdqWGPAmNLgynDQH7KHnAaf5XEHtzJnEUoJtLjEpU9V
 tNFWYdeSDI2eeq3Ix8vVDYD/lA29fbosRn6FN5wUFg==
X-Google-Smtp-Source: AGHT+IF7QQt9TzeMaU+d8ipZplBVKvmHqYPhh5WmFhJpEAzFjFOMtdA593sjx/ayKVQkrI4LRFHu0A==
X-Received: by 2002:a17:907:9408:b0:a1b:64a6:5f00 with SMTP id
 dk8-20020a170907940800b00a1b64a65f00mr9924928ejc.5.1702887615337; 
 Mon, 18 Dec 2023 00:20:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.retail.telecomitalia.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 lm11-20020a17090718cb00b00a1cf3fce937sm13807835ejc.162.2023.12.18.00.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 00:20:15 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 09:19:49 +0100
Message-ID: <20231218081958.506691-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702887615; x=1703492415;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vSHa95Y+hyYJW6mEjmZQWjX0vbe4isiHm4HPq5W984=;
 b=h/BGWFNfJYTexgWhZDifgyRoXko0pcV7d7lGdDETX2GDL9ttLOtrdNtEmdqej9OYWs
 ulff4FEsrMY47UmzgICvh5PREFQtIZK2i9Bu8xxY8GZ7nV6F2kH83CnrPEX7/jA1MFK5
 R6V2UYTAmm05JOnnqkd4PMSLduH7oKs/S5aU4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=h/BGWFNf
Subject: [Buildroot] [PATCH v3 02/11] boot/ti-k3-image-gen: manage HS
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
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
index 64be9a18f2c4..91aed63bab84 100644
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
+		TI_SECURE_DEV_PKG=$(BINARIES_DIR) \
 		CONFIG=evm \
 		CROSS_COMPILE=$(HOST_DIR)/bin/arm-none-eabi- \
 		SBL=$(BINARIES_DIR)/r5-u-boot-spl.bin \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
