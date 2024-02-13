Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3586BC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE10A4157F;
	Tue, 13 Feb 2024 17:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7la8lkts3VWj; Tue, 13 Feb 2024 17:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1F2341624
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1F2341624;
	Tue, 13 Feb 2024 17:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90E151BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CD21817ED
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAGSvBmDHcjx for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 609B481AD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609B481AD7
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 609B481AD7
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3394b892691so3075862f8f.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845301; x=1708450101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hb5SwMHmPWvFnFheV2vX4Jc/FooqkrAu5CqevydcaDM=;
 b=qVVnVy0s7jyFcq4ngI5N4FUO2Tjr0ZXO81SeQD7RHcKDMK5PNObOHQ3xhva5AWj0pg
 cNM3u4m+d2R1Htymj/JPB0pmB5R1dcB6nY4kCvVPctnK40suu2c3iffXJ/RjAbvmzxku
 1dpnV/7X9Q19uOtEiTwKqEvKGml5xhXw3D1hSEOhGdwbmicJIxrluQnX+fMOtbJ/GNDo
 y2HTn3NNyUQw2O8yEp7gGJcj1DM/zK9vDYFgPrCjWuydKxt00FRuYyyT5VwZdZS/1Q3f
 dg8UOjYSkJURT52uGQ5vWZ9ZORq3DPgSJmSY9gFJrqBHgBA30zSxY7uHEHw/WPMi2IpI
 ZZDQ==
X-Gm-Message-State: AOJu0YxZaPrUIOVLv3FWwcfUuw6YO8IVkBcLLXJ5W1i62iWK6+IbJKyt
 U8nFvCDIiW0Hq3Iyp9zFPFlO+HZyrKm0oDxPGz+lAIFQnc0ozmv4EB/mpibCFv681lwrD/VyhGz
 j
X-Google-Smtp-Source: AGHT+IEk7A+uT9pT3+j+bO/IFhUy1usymu5oxI7VvYW1xV7g2qD6DJ+DVkERG0bnX94rrVJzlnEN6A==
X-Received: by 2002:adf:ea90:0:b0:33b:69ef:dfb with SMTP id
 s16-20020adfea90000000b0033b69ef0dfbmr115551wrm.14.1707845301604; 
 Tue, 13 Feb 2024 09:28:21 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:21 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:27:59 +0100
Message-ID: <20240213172817.2872849-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845301; x=1708450101;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hb5SwMHmPWvFnFheV2vX4Jc/FooqkrAu5CqevydcaDM=;
 b=b2vqmL+0awZe4BXVe6GPD+Qpytkb9130+4zsgynGqxWAWxQh2VR97DHnp6l/0tpgPL
 upKoy9lqCJ9WfEjcYIjynMEUVNABOImJCg0mpMaxo93b9/Zzp947XfPM1/8WznpXw344
 EqZ+SZSI8evYOYgvWExQPZ2tkdeNN9v9L6w0Rm9OwCLOrxXJImLr2JJHxUTdlFOgSvRp
 vM0PQVeuIPiIrYieSwtlYfZKY2FwCAKAY+tpgdkfPTgxzll95PbLEb5TqRRT/N4/T2Sb
 P6ARwORXmLYhztiS5XlkSR5jBhzw5yFgKKpMjhXdCGeAuNSd34T/JnCOkK0a1ktgWBqD
 Idqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=b2vqmL+0
Subject: [Buildroot] [PATCH 03/21] configs/ti_am64x_sk_defconfig: fix
 optee-os plateform
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

According to meta-ti, the optee-os plateform must be
"k3-am64x" not "k3".

  meta-ti uses the OPTEEMACHINE to set optee-os platform [1].
  meta-ti]$ git grep OPTEEMACHINE
  meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
  meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
  meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
  meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
  meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
  meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"

[1] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
On SK-TDA4VM, such error leads to a runtime boot crash.
---
 configs/ti_am64x_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 4bfd31f0c8..097175bd8f 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
