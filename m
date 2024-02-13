Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECF7C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC0A4174E;
	Tue, 13 Feb 2024 17:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POQIA2B1MDJG; Tue, 13 Feb 2024 17:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB42741740
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB42741740;
	Tue, 13 Feb 2024 17:29:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7291BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28C7C403C4
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DazbziN_AmVA for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6B95B4010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B95B4010F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B95B4010F
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b2fba3176so2731242f8f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845308; x=1708450108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/5myQTr+ujpFveMMvlEo6ox2n8N2yNeo6LXxBFaEZk=;
 b=xEkZagfeeri7rK+eG50xkfuq2JtmL2hgoyitoZVdn9r9XFb9oJQn8ZTUDRROa5pjMm
 8sa1NBr30DydQjxhbxZ2j+WvWNdQuJuUyvfhkwhN4Cb1zHcq6vUwajQt6TgJjTaFtMdI
 WVou3/mrIwYZsmrv7XrQfUI2ME1fcPWVBLiCiDnHHikFSbGNSkHC4o/TYe7rDErjI+Eu
 dMpsBMiyNxMXShVWumnL4yCX0oJF3aKMXQvWLzX3nRs5PA5YosIAxhYpcjbAFsECkO99
 Uha9idewu0Pqa9/7pVfK9rb9lGsZEiGTwcaCxYKeKjOW06J8FqBVCmwsrHM/O0Y6vzLU
 KPow==
X-Gm-Message-State: AOJu0YzzEcRN1pbh9vML43nFXPQ/qRMBG+Uyv+JajklkYwjuICrDkg4x
 j7/RX/DhyTFI5BKySSLc0bB1CRNDnfR+0zExnZYrOE3FdO1FHXNfXGEXgcV40RNvpKgY8vQeN+8
 z
X-Google-Smtp-Source: AGHT+IF5d3H3PygHK/qrejmsynmlg5oPSJVa2FIzzdG1+WFynSz4bSOknFSb6ZJxqrOUKgrNygGMzg==
X-Received: by 2002:adf:d1e6:0:b0:33b:48ee:8a35 with SMTP id
 g6-20020adfd1e6000000b0033b48ee8a35mr11694310wrd.3.1707845308562; 
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
Date: Tue, 13 Feb 2024 18:28:12 +0100
Message-ID: <20240213172817.2872849-17-romain.naour@smile.fr>
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
 bh=u/5myQTr+ujpFveMMvlEo6ox2n8N2yNeo6LXxBFaEZk=;
 b=Ird2IAOAS6cl80Gi5hxMG+/YSr49FeTsYVtvjKkEfquAE4Dxit+InW0HmXINGQrnHE
 p7CZTaopblB8VFnyH9nh06EAefvEVZjB6xiagNT8Hb4RO7cDawLkSpv1V/jF26elsZg+
 YoLL+uGr7+c4rk21g8Ya9oRzvQx6FZCp+Qz+/7mUJwVjfAhp4aTPKZSDowl8FZPirBQy
 hYTycOu0rGlwTk1xuCW9mqvRCF0ogoAahe21SNzNT1Sfqru/pIV9HD3AgvZeaLkTGNIq
 lbDlWHPzAc7vX1/CjQNV1IxLzdPQ56enkWS1a8ncQ1OQltq6/R5AV3TZ1al7l/NhtL91
 jqGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Ird2IAOA
Subject: [Buildroot] [PATCH 16/21] boot/uboot: enable TI K3 Device Manager
 (DM) for j721e
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

The TI K3 Device Manager (DM) support for J721E is needed to boot
DRA829/TDA4VM SoC.

https://www.ti.com/product/TDA4VM (SoC)
https://www.ti.com/tool/PROCESSOR-SDK-J721E (TI SDK)
https://www.ti.com/tool/SK-TDA4VM (TDA4VM processor starter kit)
https://beagleboard.org/ai-64 (BeagleBone AI-64 SBC)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/uboot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7586f24c90..837f1605b7 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -245,7 +245,8 @@ config BR2_TARGET_UBOOT_NEEDS_TI_K3_DM
 	# We use the SoC selection defined for the ti-k3-boot-firmware
 	# package
 	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE
-	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62AX || BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X
+	depends on BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62AX || BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X \
+		|| BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_J721E
 	help
 	  Some TI K3 devices need the Device Manager (DM) firmware to
 	  be available for the U-Boot build.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
