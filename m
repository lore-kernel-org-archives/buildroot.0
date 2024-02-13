Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D05C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63646416E3;
	Tue, 13 Feb 2024 17:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YScjk9KPu87D; Tue, 13 Feb 2024 17:29:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17EE641722
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17EE641722;
	Tue, 13 Feb 2024 17:29:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1EEA1BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD02581AD7
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrljTkHanCS8 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4FAF817ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FAF817ED
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4FAF817ED
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:29 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-411c93e6bfaso5194835e9.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845308; x=1708450108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNH/aD/r8N1bm4rrRuTLyZ3uzPxN2QOOTbVeaIQvdzg=;
 b=PQyeU57sVGyHxdSJXExalUWyVYcEiANzKhFBuXBJChDCxLIN/EmW61yHGSPe5zvZK0
 3vLnDHJTlun6zRzKyXlaG7A8rPOag8GdIA07tfZWrvrmvjvMNUnqJqjcrhFACxB22H/D
 VRkwCxO929b/0n/FIoKAx2KtBD5RZIzCOZNoLGmquBTgBUS0XPfd0M8HzXfM9kbAcN0C
 4nulcqMdKecHtfGuv5dnW5eo1jqFhTvHxnsXrcNq1Kg8fgYkP7U33XE7h4lcS6A2tYkj
 LNjE9IIGaYGinNRSX+p/0UnH+swrTmCbtw9q3Kr9jR+NJ4ZXSnY8GoQYzJEfC9o5lLmi
 qKmA==
X-Gm-Message-State: AOJu0Yz1mGiRJOZo3ByvxEzg/pOZafwthhhcImSKahXpmpSL9GWh3MQ0
 NehSkmk6K6K2eVxBoIHUsuQ9hZPZy+A3zH4mlOBrgdm2bH2IGTn8FLmf1wxPbARPxjzEEgj1IV6
 z
X-Google-Smtp-Source: AGHT+IF8XBF7UnXSN1zVdvsTdrpSQEKHlUA2r7/50KiU0Gwv4xmWVij6GYF8arTFOD5AY/XC4kNKwg==
X-Received: by 2002:a5d:4682:0:b0:33b:71d1:e9a0 with SMTP id
 u2-20020a5d4682000000b0033b71d1e9a0mr6703310wrq.59.1707845308119; 
 Tue, 13 Feb 2024 09:28:28 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:27 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:11 +0100
Message-ID: <20240213172817.2872849-16-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845308; x=1708450108;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNH/aD/r8N1bm4rrRuTLyZ3uzPxN2QOOTbVeaIQvdzg=;
 b=j+xkYj+If7GSw4igWvUNjpEFjxSDzeBqNVUAaqfNYecDMJRMvEhIg27tLXY8ZQP7J2
 xnZx0MpzP9J0qS4u/bYtPqEfQDfHKRtaXSaaZ781Tof+zN+2bLesV/ySTqBMZw17/Vyz
 pHtmpc/BOWSYqp3cKkc7xAMSBs5+3XStrgKli2Gyiz2ynOaxJKPZL9Ih9UAUAWjC5VGP
 7xxh6iP8W2Q/7B9fpfhpQQ9M930X1jhlSUE2z7+ixKluLlYvj7WwOgfXlWzFzkhfEkCO
 cWHFQPTgusqWKs0smV43w3WwwMXolGUrYj4+Wz/Yw+VFcrJynfa6MGwawsany8KktGyR
 XO6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=j+xkYj+I
Subject: [Buildroot] [PATCH 15/21] boot/uboot: replace ti-k3-image-gen
 options by ti-k3-firmware options
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

ti-k3-image-gen tool is deprecated an replaced by binman [1].

Use the newly introduced BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_{AM62AX,AM62X}.

[1] https://git.yoctoproject.org/meta-ti/commit/?id=835811cf8586926cf78a961d090f4e6150432235

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/uboot/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 63359266c6..7586f24c90 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -242,10 +242,10 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
 
 config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 	bool "U-Boot needs TI K3 Device Manager (DM)"
-	# We use the SoC selection defined for the ti-k3-image-gen
+	# We use the SoC selection defined for the ti-k3-boot-firmware
 	# package
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN
-	depends on BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX || BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
+	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE
+	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62AX || BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X
 	help
 	  Some TI K3 devices need the Device Manager (DM) firmware to
 	  be available for the U-Boot build.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
