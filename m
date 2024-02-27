Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5C0C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E8BE40508;
	Tue, 27 Feb 2024 16:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WRR3AB8mvKI0; Tue, 27 Feb 2024 16:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4510C405EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4510C405EC;
	Tue, 27 Feb 2024 16:30:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 705F41BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E50A605BD
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id spvrrg6t-Ec6 for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C8A4605D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C8A4605D5
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C8A4605D5
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:31 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso4817571a12.3
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051429; x=1709656229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YgYiCkyWSz9+UM98pKugQP9FQ92RtBJP5LG6O8oNnAc=;
 b=Dv9sXjGPKpesk2x14w+BRU/V3oYc9oV2rgxCUIJ9UDhtb386zQvUUfHRw0FPmCR/Ee
 DgoEJpvfWeJwKDfftu6bBJiZ8Z06BidPguGiI6HAGpFid2fhx8EAKacbU6IAq+V3P/hy
 UjMsMqickSNeyNvUewJ6FGRKDB2fagI4fzJIyHIzPEg1oA5VD6okNn1JHykOdIGJnjh2
 L2JKOUJ19knT6PBmztCIgVP5IbzX3IeH9dvM3aA+XSZs29Ih39KzjrMCNktx/4xo4Fzm
 KstLWKmxbRBLjaOYxyg1o6fF9O/7Y+3Kg4QLU2HG20cGjOt+xk4LNmi6iyUaR2ccTF1p
 Aesg==
X-Gm-Message-State: AOJu0YwND9TcrpFipwBCY9c0wOvgWSrXRDsYAEE0Hw9w7xhFianWZ5r9
 srnvcN7m2UadmBB6Luya5YXEx0wQ54Pp/QIWSStLZ0wXjWhktglEoO3qVggpGsO7g4LPtGXqJK1
 Wzi0=
X-Google-Smtp-Source: AGHT+IGr9XUIP1saPcE42SBiD09qZNYA5i1uyB4GXXiyrRsGDZTxwORJfsEG/w6myjUkkwdePWppGQ==
X-Received: by 2002:a05:6402:3456:b0:565:7116:d533 with SMTP id
 l22-20020a056402345600b005657116d533mr7327697edc.6.1709051429130; 
 Tue, 27 Feb 2024 08:30:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:03 +0100
Message-ID: <20240227163019.2876942-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051429; x=1709656229;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YgYiCkyWSz9+UM98pKugQP9FQ92RtBJP5LG6O8oNnAc=;
 b=iD32jxYKfRmBY6m2THQRk6vl7vdXrw2RJNkkXXJ1NOhXHxBBdr3AlTb0KRQHhdYdUf
 1CTkA9yc4xMXe4/jhz9TPmoQxPFvvrqsKH1El3rHa3BedCgl7mzttrfuaDo9HO1rkZ4W
 pHphQtoIhcB1xRRA5FkYKBbu4J+aHEpOXN640=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=iD32jxYK
Subject: [Buildroot] [PATCH v7 01/17] configs/ti_am62x_sk_defconfig: fix
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

Using PLATFORM=k3 can leads to a runtime boot crash on some K3 SoC (e.g.
j721e) because the optee flavor is missing.

We could use BR2_TARGET_OPTEE_OS_PLATFORM=k3 and
BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=am62x but we actually can use
BR2_TARGET_OPTEE_OS_PLATFORM=k3-am62x as explained in the optee-os
Makefile [1]:

  # If $(PLATFORM) is defined and contains a hyphen, parse it as
  # $(PLATFORM)-$(PLATFORM_FLAVOR) for convenience

This is how meta-ti set the optee-os platform:

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

  meta-ti uses the OPTEEMACHINE to set optee-os platform [2].

[1] https://github.com/OP-TEE/optee_os/blob/4.0.0/Makefile#L37
[2] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Update commit message

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
