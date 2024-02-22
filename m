Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A66C48BF8
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 664E041B58;
	Thu, 22 Feb 2024 10:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VN7ZP9Zy3EFi; Thu, 22 Feb 2024 10:16:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B3E041B5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B3E041B5C;
	Thu, 22 Feb 2024 10:16:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D3E01BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A6BE41936
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOb0plkGaICP for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9182641907
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9182641907
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9182641907
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:16:49 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-512d8950e3dso1311070e87.2
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597007; x=1709201807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7sg4my0bmFTEVDZCSKLIdWzjDSbE1BATZ02UIq0BPk=;
 b=RkE2OoMlyOogsC7E4qEoJ5ZF2qOTUS4OIyUxl3EY2hwoiVRw9XYJ/EEpG8mLm8/D3k
 83viHusMDcYG3bzUx9ot8EpzWQQ1UwHQWJqxCXc5ebI0hGfcOM43I4Ew9O7MQPlwek2O
 gqCh/VeEhy+GFub0ppuu/k7zp59PXnqEQsKHyoOHloJQX7ClYRnxSDcG0jBuKJHFecbv
 poXOrYrUUzj4yda+YWpBv1A6ztGlkD4xRV55Rui+TCx4/Wmd+/FovXBomGPI43KINF6H
 /gxWKNKtbQoCMCvq48CX7qOPOy+S8pvCdKgEcgYyzcEW+VsT8O0b+qmJxZ0zarLNNezy
 C2PQ==
X-Gm-Message-State: AOJu0Yx4oPmsHxoRK6LjhAoKkclEfibX2IECMFAzi6JSl8Lwx7lpMd5H
 ZhG79AdeVmRqhxjoA2Qh3Y0B+ddiztvcXTKdqc2WLvS9p4ip3oljQ6s1setkSDeTiNzRNl6JO9g
 WGNk=
X-Google-Smtp-Source: AGHT+IGciQi6y5N8sW3+k/som6ydmTKT49PZlSdY6QGVlibDcRGL94juBaClFjP/PPCBY87vhkoqtQ==
X-Received: by 2002:ac2:5dc3:0:b0:512:bb47:967c with SMTP id
 x3-20020ac25dc3000000b00512bb47967cmr6279397lfq.19.1708597007073; 
 Thu, 22 Feb 2024 02:16:47 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:16:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:02 +0100
Message-ID: <20240222101617.18422-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597007; x=1709201807;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7sg4my0bmFTEVDZCSKLIdWzjDSbE1BATZ02UIq0BPk=;
 b=Heqoljpigkm3XyiBnyufCFxAYwJyyQXRgCiwAcXqgQSs9q3Ne43Kgfik/AsVWiMOTG
 l94TKzaS7IDqY72BNnCwyVS+JOdhtCt+wqmVK69nn/S69P1FxmCwz0yHoZJKkidGWXpm
 rOegaDij8DVlq5TwyqlbwtF4NQNTdXqpSYa5w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Heqoljpi
Subject: [Buildroot] [PATCH v5 01/16] configs/ti_am62x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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

Checking the output of the command `git grep PLATFORM | grep k3`, we can
found the proper settings for the optee-os package:

.github/workflows/ci.yml:          _make PLATFORM=k3-am62x
.github/workflows/ci.yml:          _make PLATFORM=k3-am62x CFG_ARM64_core=y
...
core/arch/arm/plat-k3/conf.mk:ifneq (,$(filter ${PLATFORM_FLAVOR},am65x j721e j784s4 am64x am62x))

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5
- Drop BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR option

Added in v4

 configs/ti_am62x_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index f88252a89c68..c3ad555a8184 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
