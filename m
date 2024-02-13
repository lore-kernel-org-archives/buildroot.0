Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D710C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3EC4161C;
	Tue, 13 Feb 2024 17:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0SNnZWFj2DN; Tue, 13 Feb 2024 17:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A270E416D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A270E416D9;
	Tue, 13 Feb 2024 17:28:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BF61BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2503941586
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2YZAiSWXgsy5 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D78284159D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D78284159D
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D78284159D
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33b86bc4bbaso1075121f8f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845305; x=1708450105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrSGc8jPPcr9pvQOjyxVoSkQ75M13XvCgchohuLvq8w=;
 b=pEsbu3XCKMDLI69jF1INuQ8TVxMn828IKZ2AvB7EZyQ1y7UJSQyZEKWj0aOVBfNoMG
 K4z29NmX5MbczUj63vgODaglm5xW0aQ64vp04eB8MQZ/eCu0Z7Sc0xBE6IERYpW2JC/O
 3D5UrjrVf+ie4BB+xBtGPAiQ2RsLaftgaZU99848ZygSDxHd6ah6GNZ5kkIIKbEi/oTz
 vTQ/R4Cpf5wg/zKg7VJ8TzS6RMU+3L/krFsl1dBvugspuRC/HVhHFIhQmNyBmf6jsiYk
 uz/gWQqX/uZ9pkZf+7ZoXWQrN6p31/cAj/4E5/nzrbu25cW+km1cLdkLEHGxLc4MfZrl
 4GPg==
X-Gm-Message-State: AOJu0YwwMA/JLZXNQiBaLo34VRET92YlNW5+4TVp7/06ivHJ623qi4EO
 o8ENix6RwBQnKaQ63aC51urDUwR3j1aUTWL2UHf0QHD434HVnHXDH9hTVIvqPbHu4cO3M+vp++r
 7
X-Google-Smtp-Source: AGHT+IHwBzRT827JaN4HNPBDjk0yeil7JGl5/8grlw1sxcL4ZNwYkp2bNTKOkEUaLCC71VvLQ/+WTQ==
X-Received: by 2002:adf:e384:0:b0:33b:1588:2250 with SMTP id
 e4-20020adfe384000000b0033b15882250mr7860863wrm.8.1707845304910; 
 Tue, 13 Feb 2024 09:28:24 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:24 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:05 +0100
Message-ID: <20240213172817.2872849-10-romain.naour@smile.fr>
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
 bh=mrSGc8jPPcr9pvQOjyxVoSkQ75M13XvCgchohuLvq8w=;
 b=cyxoO7EwFoMa3dvZsPE9ao+fGdfZjvwCQH1XUJpSbxEBmPjghnMZ4DFSFR/djuLFCY
 I2rZC7EkIcCbnRiMl3htcLAw+Okjw0w4HYP3B+lElO1olALcYVM0GgLHpeKiMPME0usY
 bgs9nNgI+MaVbWjKZXIGqclEoEcaj5N3WFgm68k7Pu8ceLSgQMLdUUq3hDzBwm6OZzDd
 Ttot6d67vEm97Vi23Wahg/kqBZ3TDyZJpOAkZ0xFi2cI2Lc38T2ScE/qRVaMvjedvr5G
 vP90FdGg36PC07Mr63B0ygzpJHblPKV2yJ8/MKlShr1NVu3uYEK23hz5n0H4koXtEMex
 X40g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=cyxoO7Ew
Subject: [Buildroot] [PATCH 09/21] boot/uboot: add
 BR2_TARGET_UBOOT_USE_BINMAN option
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

This tool uses additional host python modules that must be provided by
Buildroot. So introduce a new option BR2_TARGET_UBOOT_USE_BINMAN to
add additional host packages in U-Boot build dependency to use binman.

The binman requirement is directly included in buildman dependency
(tools/buildman/requirements.txt) since within U-Boot, binman is
invoked by the build system, here buildman [1].

[1] https://docs.u-boot.org/en/v2024.01/develop/package/binman.html#invoking-binman-within-u-boot

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Note:
  binman is bundled in U-Boot source code. Use "USE_BINMAN" instead of
  "NEEDS_BINMAN" since it's not an external U-Boot dependency.
---
 boot/uboot/Config.in | 11 +++++++++++
 boot/uboot/uboot.mk  |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index beafb38930..e6e7956adc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -290,6 +290,17 @@ config BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN
 	  This option makes sure that the needed binary blobs are copied
 	  into the U-Boot source directory.
 
+config BR2_TARGET_UBOOT_USE_BINMAN
+	bool "U-Boot use binman"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py -> python-jsonschema
+	select BR2_TARGET_UBOOT_NEEDS_PYTHON3
+	select BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS
+	select BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
+	help
+	  Use binman tool for generation and signing of boot images.
+
+	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
+
 menu "U-Boot binary format"
 
 config BR2_TARGET_UBOOT_FORMAT_AIS
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dda606a880..0714522550 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -269,6 +269,14 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_XXD),y)
 UBOOT_DEPENDENCIES += host-vim
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+UBOOT_DEPENDENCIES += \
+	host-python-jsonschema \
+	host-python-pyyaml
+UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
