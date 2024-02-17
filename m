Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C04C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE0DD83F77;
	Sat, 17 Feb 2024 16:04:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQu45ZrQOVdW; Sat, 17 Feb 2024 16:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B54083F88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B54083F88;
	Sat, 17 Feb 2024 16:04:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5981BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 321FE60C0E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IkcxD6XtOnj0 for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5497D60BF2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5497D60BF2
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5497D60BF2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:25 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-563d32ee33aso2484384a12.2
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185804; x=1708790604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=stVMgRgj6SXlAeBpc0EdH+5C/HFkr+XYuVWquNjzch8=;
 b=W/s+jDy8pbR7kzRmMCrRpatLHi7oViY111ni3bmeuMlbW/Li2aSYaap82ZMJi/GUT8
 OBG6MMkAzcoM4gqAbyPMasmQ8Zcl5ZKIPQ9JaLjQiZpDx6bro1LyFlGS+3kkRucKfSm3
 UWtfSUU9/N+vq0hFPqnxu23H+Jbqah64YUeCroY210T/Zjw2pR6vo5+CFFNizxsMykT1
 oAHLVXoWvQtLwETxVKp5SPPg9UeZolH+nu/AO1P6x0rX7n7Lizj9QIUlHFVeZjrMSH93
 8emOg1XAoJ1e0WpZ9vaTSxbDRxD5xxzgMyV7gaRGStqukY4iiFnYSRrUddMCttOlQJgb
 LlvA==
X-Gm-Message-State: AOJu0YwA5zD96NaBcbBHdkEPgnLil7wmcQN/XvDuWNiHSP+DAr08C5Z1
 TO0DKUA2JOwuH9tA79eGSFnveipPLSUAxiaChB58cBlCS6hK8crST/7Z3aNlUYUChY3j1KW62LZ
 dH4U=
X-Google-Smtp-Source: AGHT+IGJwtYZJhFjs566skGX4Ef9DBe22OUOWPxMGIx4s32hfJ8MYz/sJ/8K7Ow0qu/cJSSbdK7vUw==
X-Received: by 2002:aa7:d354:0:b0:560:4e74:9cf8 with SMTP id
 m20-20020aa7d354000000b005604e749cf8mr5231797edr.34.1708185803848; 
 Sat, 17 Feb 2024 08:03:23 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:44 +0100
Message-ID: <20240217160244.1320482-21-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185804; x=1708790604;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stVMgRgj6SXlAeBpc0EdH+5C/HFkr+XYuVWquNjzch8=;
 b=j+2jEQ8Gmrn1gy2UDW4aHSQLnbsCBrgwuwcU84G2mhfHnyN4N1CLjot9IrWpcBcyDy
 GnSxSU7aOtEpOrjQoFYlJHBJ4aOo+GCcdC+HAlo8/LvRu49+x+Hd/18d9A3JJMttr6NB
 qMOAmlWgoUal3IEfWEmZQxVxst7WxXGgjT1gU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=j+2jEQ8G
Subject: [Buildroot] [PATCH v4 20/20] configs/ti_am62x_sk_defconfig: don't
 use ti-k3-image-gen anymore
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

Recent versions of U-Boot are capable of building tiboot3.bin using
Binman. So it's no longer necessary to use custom tools like
ti-k3-image-gen.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index cfefce0a77a4..6259dec5985d 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="am62x"
 BR2_TARGET_TI_K3=y
 BR2_TARGET_TI_K3_SOC_AM62X=y
-BR2_TARGET_TI_K3_IMAGE_GEN=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
