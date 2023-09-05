Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278A6C83F2C
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 00:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E6160FE0;
	Tue,  5 Sep 2023 00:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1E6160FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWvfv_u4x6SG; Tue,  5 Sep 2023 00:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21D5D605B3;
	Tue,  5 Sep 2023 00:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D5D605B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2753F1BF964
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 00:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F41C5605B3
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 00:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F41C5605B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93pGsyisQ-Bp for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 00:35:04 +0000 (UTC)
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D239605B1
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 00:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D239605B1
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-5733d431209so1261574eaf.0
 for <buildroot@buildroot.org>; Mon, 04 Sep 2023 17:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693874103; x=1694478903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Lo9X6x9O3kVcUe56ZqEEO7GIWSn9yNql0iHxx7oqcU=;
 b=VQ4EJzYy3wE6Itw4RCCARmNB09TOwGKtXVj12LkKCEfKHL28z5/+bk278my0phf0pW
 wejobZ+a+wc2v7spiAKYthnCrFZQE2dtkdHO9LW/s8MDyoaCq/yM9roo5UPWIq+Zd1I9
 LPkawdOGtF0OEs8JQD/4rsuW6YZs2Vgn7VwnNUORywA+gbiSPNADytFzA2pmaufFpyyP
 l7uOn/aHD5JYnjDlf9XPmkF6Mt1AV7YI1q0kNwMvxugvO5+2h7O4aq9ahruwoulku3PQ
 tZx+85vVWOf7do2SZs/EQ4CQ999VGWtw8FdJGK0tDe+FM/gv/xk3J41r7emGMuKvMloA
 ow4w==
X-Gm-Message-State: AOJu0Yz/6xlN5bG+0gWSL35ipRNyfKeDzWCIXNi1q9cP/udYRPrSiQ0e
 j+ytrtaiWOX02MJd5Q7qYjb8S6ZBoto=
X-Google-Smtp-Source: AGHT+IEM/XD+CbNLQdi4V/Z+1vSXzl0SyTaIUYjHg1uqZa0hiq5H+BJ4Uu0rTpMGuicQIL13UOFqQA==
X-Received: by 2002:a05:6358:930d:b0:139:a45c:32b2 with SMTP id
 x13-20020a056358930d00b00139a45c32b2mr9370357rwa.11.1693874102789; 
 Mon, 04 Sep 2023 17:35:02 -0700 (PDT)
Received: from pox13.. (office.relectrify.team. [159.196.192.155])
 by smtp.gmail.com with ESMTPSA id
 f4-20020aa782c4000000b006870ff20254sm7807255pfn.125.2023.09.04.17.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 17:35:02 -0700 (PDT)
From: patrick.oppenlander@gmail.com
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 10:33:48 +1000
Message-ID: <20230905003412.67305-2-patrick.oppenlander@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230904182649.51e17f8d@windsurf>
References: <20230904182649.51e17f8d@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693874103; x=1694478903; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Lo9X6x9O3kVcUe56ZqEEO7GIWSn9yNql0iHxx7oqcU=;
 b=eSHOwG2vbPKfGqTZj/mnpyTRVxwtMMcxl8G6QwP7tLOmaplaSUgMw+iHmw4OfOtFaY
 7QaiJa5QBpJPPYng3ek1wy5zlmnsvxjVFsfs1rdeYfm3BtiK11l+TcO9xZqQnK5SfB8L
 npLMb2s6unBMLiyf7MEp39BuvpPQF8Msf8I8Diyg63+3Dpa7au8E5XJ6GKioojv+TjGQ
 baEGbV4PsdM2ey+aNGOKHKpA+0Z/OOwnLUUcRSw8ujkMshmizpsxySGsMpriWUOl84OQ
 bPIaoKZ5Lh55cNsbl+3F33s/x/2L9U8jsvG+7T98+B1y1cXfRAyLFq44YWVuqsPCSdpN
 K/XQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eSHOwG2v
Subject: [Buildroot] [PATCH] ti-k3-r5-loader: support devicetree
 customisation
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Patrick Oppenlander <patrick.oppenlander@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Patrick Oppenlander <patrick.oppenlander@gmail.com>

This is duplicated from the U-Boot makefile & Kconfig.

Similarly to U-Boot custom boards sometimes need to adjust the U-Boot
devicetree. For example, the AM64x SDRAM controller supports inline ECC
which needs to be enabled in the R5 loader devicetree.

Please note that some versions of U-Boot have broken external devicetree
support and may require manual patching to build. See commit
3609e1dc5f4d4c238dcd23e045ba6223310feffa in the U-Boot tree.
---
 boot/ti-k3-r5-loader/Config.in          | 10 ++++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 2419babe70..580abf59ec 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -92,3 +92,13 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	  Path to the TI K3 R5 Loader configuration file.
 
 endif
+
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH
+	string "Device Tree Source file paths"
+	help
+	  Space-separated list of paths to device tree source files
+	  that will be copied to arch/ARCH/dts/ before starting the
+	  build.
+
+	  To use this device tree source file, the TI K3 R5 Loader
+	  configuration file must refer to it.
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 8311e1b401..012f4ee52d 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -77,7 +77,12 @@ TI_K3_R5_LOADER_MAKE_OPTS += TI_SECURE_DEV_PKG=$(TI_CORE_SECDEV_K3_INSTALL_DIR)
 endif
 endif
 
+TI_K3_R5_LOADER_CUSTOM_DTS_PATH = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_DTS_PATH))
+
 define TI_K3_R5_LOADER_BUILD_CMDS
+	$(if $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH),
+		cp -f $(TI_K3_R5_LOADER_CUSTOM_DTS_PATH) $(@D)/arch/arm/dts/
+	)
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
