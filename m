Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB750C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C5D817FD;
	Wed, 29 Nov 2023 17:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C5D817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id he8-tIvpDGlB; Wed, 29 Nov 2023 17:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B06F682197;
	Wed, 29 Nov 2023 17:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B06F682197
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 719CA1BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A91761528
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A91761528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNrG7tRYJr-o for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:40 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AF63614FA
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AF63614FA
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5484ef5e3d2so55032a12.3
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278798; x=1701883598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vSHa95Y+hyYJW6mEjmZQWjX0vbe4isiHm4HPq5W984=;
 b=M9kEmt1K3fD2j6sy0S3FsCgi7zkFzSKzXfxUMJqwNdulu2XMFPlv/zXw8QPZZj0SQF
 nOjAowtHu7k755DgHzQkC+fPvMR7WuC1E9ajEcP/XAtnH5AJW3wdIGHyHZKsGL3I8ajT
 /T2UGpDk8eziJL80dJhyRF6wiAe8kyTbp/uTe9d4d6b2HFwNgYhclx6QLTiHpkcSKV3M
 GQOFha+q3X5hFFmTMtxL/KQdVm49isA8lY7YjK6AFCczvHB/ORmqqbEx9OPAaWlVKEcb
 RFtwJW+5E01s6Usox2jGz1l4lmR7/Soe9wqkQ52BoEK22neBs+nU+sy2ESe/0wcRu5Ut
 IC5Q==
X-Gm-Message-State: AOJu0Ywp5rZRWZ+h+l6E+bLPkETvB7C4RRkYGAD5hIBqp/8GqAvrXUyo
 rCNMcJjJWWgj5WK9ghXX3uwjGn2T1uOvFNBa/yJMnQ==
X-Google-Smtp-Source: AGHT+IFZxJ02qlxJd0j0iFE79GViybRE4lkED/CcjrDibk8k34gzggdU98wYIiOdtGv4b/GSr/5dBg==
X-Received: by 2002:a17:906:20c9:b0:a0e:3a21:fea3 with SMTP id
 c9-20020a17090620c900b00a0e3a21fea3mr9944745ejc.60.1701278798358; 
 Wed, 29 Nov 2023 09:26:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:06 +0100
Message-ID: <20231129172615.1683565-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278798; x=1701883598;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vSHa95Y+hyYJW6mEjmZQWjX0vbe4isiHm4HPq5W984=;
 b=odxbEKVXEgZuzUcUtXw1EKbNRcpvZLPrdo3xI7NUXRoKoneSMo1AcEGoE0yQnzNNS8
 P8l/uDCgqs6UZvenqU7d+tJ7U76hELwDGy9/ro78M/8m7xMjBemR5rlwWWR8Ss4nGeo/
 rAGZUJwv2HjFQwhzb8Wfb5RS2fYufai5cTvY4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=odxbEKVX
Subject: [Buildroot] [PATCH 02/11] boot/ti-k3-image-gen: manage HS hardware
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
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
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
