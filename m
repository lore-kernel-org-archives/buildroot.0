Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B188C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 07:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFA7640342;
	Wed,  3 Aug 2022 07:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFA7640342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b7W2J5ntC0mJ; Wed,  3 Aug 2022 07:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7643640340;
	Wed,  3 Aug 2022 07:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7643640340
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD751BF4E5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 07:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68B80817C0
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 07:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68B80817C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r1YvTLvD4yNx for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 07:44:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 221C5812EA
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 221C5812EA
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 07:44:04 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id m4so8141597ejr.3
 for <buildroot@busybox.net>; Wed, 03 Aug 2022 00:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ofiN6AlGKgR0p5SRN/P1LqcVk0BPo/vKfhGgfupWHg=;
 b=0nSyivXSuvSNtmmHf4xBRVV/BIjgAG74+mQpbdX4XryYCFjN5xEtqdF45LSAWEAdOM
 50kl4lwGJeElNf/9STB/Vh4TLsAFYZ59y2vKB9qezSLsWyaoxVLHuAGXn//bq6V797tD
 VAEUQb8qC/cMYnZdEsBBFDto0TUdYgroCPMQVB4mu0gNrCYkERvsOdKu6W+xax3Bh9lb
 e/LmlkMRYuCi+Wy8gupBDFXmsvEmRT8ChKkl7+lAj9/NQ55IkiPqk7nlUH6ImgsPn1k5
 qfrnxnEaYeA2Qhclnd8dezmYYsUSkNDoI7eryCBW7Z3LfeA0niTnkZfG69RbmJJqkr86
 ej1g==
X-Gm-Message-State: AJIora+kcwZkaR+yuuKfjLEKt5265CjHHJxwiByill0HPS5N8ChFvF0j
 unjr8nYpPRz5ZgiZ8zxHQQOfHTTywKU=
X-Google-Smtp-Source: AGRyM1vNfim3vYz4CykybyQPOPDdm0KCyjksEqAG0+102kH/I87N1E3K0TcfGxGGlMDLzcbEe5t3SQ==
X-Received: by 2002:a17:907:7255:b0:72b:50b8:82d6 with SMTP id
 ds21-20020a170907725500b0072b50b882d6mr19681072ejc.677.1659512642168; 
 Wed, 03 Aug 2022 00:44:02 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7d88f000000b0043ccd4d15eesm9173758edq.64.2022.08.03.00.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 00:44:01 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Aug 2022 09:43:47 +0200
Message-Id: <20220803074349.7590-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220803074349.7590-1-francois.perrad@gadz.org>
References: <20220803074349.7590-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ofiN6AlGKgR0p5SRN/P1LqcVk0BPo/vKfhGgfupWHg=;
 b=EYypZk6aez05s6ujHySRrdgABp9wdjl7aVGwlM2fcIkFMam/CCcpVlZEwnZJ9WnrFh
 lrfMJZl+AGt1o86igCVhQoaDPQ5BM+gfCkGXXAcwf8pKXzO+SmVm7qITa8CxVaRnWf5K
 nMdDB41HEVRpA+lFR4eV8uKQ1yhpebgOUY0QUd+JHGa4WhlCg2DFLs43m9WM1gbh2DXh
 orS1ga80kDftW7s83ccX9E7LAM/KF4wBM8vLbsPnd094hiz+GEgimL+IfWOocLiLacw/
 2qMMjV1riZLupUD2D7g4z9rOAPvF3c6itH1tPKDUR26Zl745QQpzrFhxPIAeI1+C3fmZ
 qnKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EYypZk6a
Subject: [Buildroot] [PATCH v2 1/3] boot/arm-trusted-firmware: allow to
 generate BL2 from RCW
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds option BR2_TARGETARM_TRUSTED_FIRMWARE_RCW that allows
TF-A to encapsulate a pre-loader RCW (Reset Configuration Word) file
into BL2.

Upcoming NXP QorIQ family board needs this option.
---
 boot/arm-trusted-firmware/Config.in               | 6 ++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1fc03e10..0f91953bf 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -85,6 +85,12 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
 	  platforms were ATF encapsulates the second stage bootloader
 	  (such as U-Boot).
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
+	bool "Include RCW"
+	select BR2_PACKAGE_HOST_QORIQ_RCW
+	help
+	  Include the RCW in BL2.
+
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
 	bool "Build BL31 image"
 	help
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 35a95a7ec..eb9b656fe 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -133,6 +133,12 @@ define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
 endef
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW),y)
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-qoriq-rcw
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RCW=$(BINARIES_DIR)/PBL.bin
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
