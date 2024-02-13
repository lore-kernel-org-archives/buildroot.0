Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1D5C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAACC41688;
	Tue, 13 Feb 2024 17:28:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OQfMEjJfaiE; Tue, 13 Feb 2024 17:28:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54CC9416C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54CC9416C7;
	Tue, 13 Feb 2024 17:28:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 659781BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60EC960B79
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wy2cRLO4nBpu for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4221660B65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4221660B65
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4221660B65
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:27 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33ce55ab993so9024f8f.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845305; x=1708450105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTAgpTAtpHzHlmM3BkcKdoh4Mb1HzYUjgZ4/pqPE1Yc=;
 b=iXopuHzG7+Mtlzv7Ewiif/0/ppmZxd8PvgKmNvrC5Ih6rcsTPy9fTRf6Fd0bkbdDqR
 W/EhF9i32PDKofy6MvfBSIC2K0cKAAWylxaNS7/FOG+oZ3glbJjDqRneY5o/roOORy8Z
 onCbo+kgamVSTYKTh+eGvkyOno+a2IQJWLfGb5X/gOFC6ZbL9PmRf/U9d+rUip0JrlV5
 QdDlieSgjxAUuED9hWOIrekLEUfTwUau2sTMQdFOV0qxOVRZI4XSy3r4zwv1KjHGh2pl
 hkM/8UJMmYAtm8yfd8Ftw/szfxJ5gL3LKgOz5NWtF3pdIKEXRxwcmdHznciCqRuST/S9
 G8og==
X-Gm-Message-State: AOJu0YwT39FPAp8kzRgcoJGgJum4f+HL9n16DqZsoXxnOPxihgbL4qU1
 t20FYP/ACoQfb2JfN+ypgjWAYh4PqdNJbwwQfICR1/GWUAfz9Ep00DYdQed4360qoqIDP9e2DWS
 T
X-Google-Smtp-Source: AGHT+IH06C44C1qGUvJ63lhbHFlKCImyFbhFxb06Ev2dlh2lChnbGNl2INySWVk59HWbofyPoqCQwg==
X-Received: by 2002:adf:f0c7:0:b0:33c:d57d:3749 with SMTP id
 x7-20020adff0c7000000b0033cd57d3749mr1892319wro.51.1707845305371; 
 Tue, 13 Feb 2024 09:28:25 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:25 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:06 +0100
Message-ID: <20240213172817.2872849-11-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845305; x=1708450105;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uTAgpTAtpHzHlmM3BkcKdoh4Mb1HzYUjgZ4/pqPE1Yc=;
 b=lbHt2ynyJjl8FfvzM91yNu3dTFHFYEy6SSh1AHE7NMRSDIj2z06PNRqiy9TWwWfItb
 jntlLf9R4Tk626S65DBkGgLin/LUl1LZThkT/K7U6ub3bDBe2+F/Ko0yuNtExU5SJoww
 X5b+teQirrHWYkS5EGU4X5xdgpOfjP6snMnZrUCVWU4qSJ74clkf2/wc9pI4pSruYNEA
 LdUZ9TtPm4BuCnuI7AXk4CqdgzeVcaQol1ugYh+GVPStu3/tAqkrW4XORamGd8OF1UnB
 ujQyAbrSA44LFx9NcTvYYglPDM269TU16qaZejAu2TG1+1AkEZhOf4YI/ilg53KRvqTE
 vjHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=lbHt2yny
Subject: [Buildroot] [PATCH 10/21] boot/ti-k3-r5-loader: add
 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
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

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts.

As for U-boot package, this tool uses additional host python modules
that must be provided by Buildroot. So introduce a new option
BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN to add additional host packages
in U-Boot build dependency to use binman.

The binman requirement is directly included in buildman dependency
(tools/buildman/requirements.txt) since within U-Boot, binman is
invoked by the build system, here buildman [1].

Make sure that all binman requirements are build before
ti-k3-r5-loader.

[1] https://docs.u-boot.org/en/v2024.01/develop/package/binman.html#invoking-binman-within-u-boot

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Note:
  binman is bundled in U-Boot source code. Use "USE_BINMAN" instead of
  "NEEDS_BINMAN" since it's not an external U-Boot dependency.
---
 boot/ti-k3-r5-loader/Config.in          |  8 ++++++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 14 ++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 8c8368a1a5..d678bd17c2 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -93,4 +93,12 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
 	help
 	  Path to the TI K3 R5 Loader configuration file.
 
+config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
+	bool "ti-k3-r5-loader use binman"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	help
+	  Use binman tool for generation and signing of boot images.
+
+	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
+
 endif
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index 0ffcb8235f..8f86e0fb07 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -60,6 +60,20 @@ TI_K3_R5_LOADER_MAKE_OPTS = \
 	HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+TI_K3_R5_LOADER_DEPENDENCIES += \
+	host-python-jsonschema \
+	host-python-pyyaml
+# Make sure that all binman requirements are build before ti-k3-r5-loader.
+TI_K3_R5_LOADER_DEPENDENCIES += \
+	host-python3 \
+	host-python-setuptools \
+	host-python-pylibfdt \
+	host-python-pyelftools
+TI_K3_R5_LOADER_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+endif
+
 define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
