Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01454C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C539341759;
	Tue, 13 Feb 2024 17:29:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0aXy0jWt-Ak; Tue, 13 Feb 2024 17:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8425D4175F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8425D4175F;
	Tue, 13 Feb 2024 17:29:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E515C1BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D03E041599
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-bQkCb9RSn9 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFB0341602
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFB0341602
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFB0341602
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b0e5d1e89so3063719f8f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845309; x=1708450109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2pPc7ZAEUSj79PfdokPnk4NOezg0mGZLM+8INE1xDvQ=;
 b=R1vmGNa4RxUOrOrscff9DU8VGoVq9b6frzzroyT84ZWvFe4V3d/PZgMwYNzqhM+059
 p8vNInYDZW/6TPO47NNUzD3hHoD3ihf4ZcCt7/PbKOnCgtCAVVTUSQUQbtsPY+QGpNk2
 JwYtrP/XKcoULOVCr+9rrVGss1+LzXOTzA6g3fxC+T0NR+5DR4eAnYAFrTVabvMHopm0
 JBRanAVE3cbjJdI9h72PIzA44ciyCXLyVhOmZ/zEyL8daqgYoA7XjmMntVrhYf+vDIlT
 5PhUOJgeB8RTYcD8U8CHCOw3Bemfa9LNXkaGn2ROOT8xBZ3SoJs5TgQqfZ47GfatUcuo
 P5yQ==
X-Gm-Message-State: AOJu0Yy2AmLb6WN/5gLumwZfEkns3RZKxZadGmN6I51A/oC3e8a7pzGH
 2XwBIlbWZ+aA0fNCmGDFoEH/EE/nbP3weUUb3oXpCZTG3pj7TXe2KOkLNSCeB1OxvuzugbWUXG7
 t
X-Google-Smtp-Source: AGHT+IFOPErImWl0+8dH3Gp6NBo8YvmDXqn1JazhIkWhbJ+Cg7CujpwUVqRXuevYcusuAtuNwQ7dCQ==
X-Received: by 2002:a5d:4e8b:0:b0:33a:e7de:aa8b with SMTP id
 e11-20020a5d4e8b000000b0033ae7deaa8bmr7045033wru.26.1707845308997; 
 Tue, 13 Feb 2024 09:28:28 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:28 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:13 +0100
Message-ID: <20240213172817.2872849-18-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845309; x=1708450109;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2pPc7ZAEUSj79PfdokPnk4NOezg0mGZLM+8INE1xDvQ=;
 b=DklL3w4/pRCoTROFJllCo8C/Alqj+hyhDKJ1o0rhxrzHDIrLJOxJzvm0uaGDgvCSlA
 tdPk/QeLt7raXuEJBTrAYjAO1Snkk2Am0g5hVhh0WDhJVb/SvD84CMPvcjj1gZPyLNVX
 JVWAttfXdOnMQNddYYoWdvl4w5V9Kyo9QZ3HkUPnhbM8rTcHYKaIAyV/IAf+ZTtwZ5+T
 gP5Ue0J+T9zw05EwdTcY14oPlJCScIu+l99bxzhvAlwNhz5J3AmPoMDNjybOJSTBBStl
 JaWGMSUF3d3O7lQiuYiBswi2/GnF5s/t7+/KVdECKyD+oH5RVeMNrASbm9VsPWOGM/3Y
 zw9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=DklL3w4/
Subject: [Buildroot] [PATCH 17/21] boot/ti-k3-boot-firmware: bump to version
 09.02.00.004
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

Remove the comment about ti-k3-image-gen since this tool is
deprecated an replaced by binman.

ti-k3-image-gen has been removed from meta-ti [1].

[1] https://git.yoctoproject.org/meta-ti/commit/?id=835811cf8586926cf78a961d090f4e6150432235

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 95131180ef..939bd0794a 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  6032a258ce731d987576115f5de44c677a6b0cf8bddcd61a9a2852928bdfff92  ti-linux-firmware-08.06.00.006.tar.xz
+sha256  701d400ac33b2885ec35d73f0d66e5186e3c2f71ef28679508b58ef986804d35  ti-linux-firmware-09.02.00.004.tar.xz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index c7c5eb0818..fb28d8ac41 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# The hash 340194800a581baf976360386dfc7b5acab8d948 defined in the
-# Makefile of ti-k3-image-gen corresponds to the tag 08.06.00.006.
-TI_K3_BOOT_FIRMWARE_VERSION = 08.06.00.006
+TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.004
 TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
 TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
