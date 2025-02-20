Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DAEC021AD
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 04:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1BB8606F6;
	Thu, 20 Feb 2025 04:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPFuKAEAiXnW; Thu, 20 Feb 2025 04:27:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6D18607A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6D18607A7;
	Thu, 20 Feb 2025 04:27:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73DD5CF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 04:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F94D607E0
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 04:27:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAejVpiLuEun for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 04:27:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1AF39606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AF39606F6
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AF39606F6
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 04:27:42 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-221050f3f00so8832225ad.2
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 20:27:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740025662; x=1740630462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z8eAZKP5aNoAihxrMkfAuTie7ltZZU+oU7p3VSgqTvM=;
 b=sZ0cX9xEKctb0UOx9DuL/oo5jICxVn9tXBjxuVlte0bw/aDXBXMQg+Kri7KGYKUd/g
 lXad1auvBPPPWEdEYR1HmMJyBHMp30+0wsuPI+5pc3T9Wl2X4c5DixqskOrswkoMlIZZ
 8PFeNYdyFZXaZnw09JDKF0VchbhrbLNLpgZC5o42h4lYH/3i3RtGNrTHjaVulMzn1DPE
 5aKnEIFdAfQUPqBgvDfSOmQPni/nI/aiCmqhx52bi84k66krTuhYdtmGYoaVlkxPxgIO
 qtR+SRzUHWsmMJS8vVU0vFoM332n3PbPOLTaQu8YTuB5hbnccDOF5lO11soKHnxeRg+p
 kEtg==
X-Gm-Message-State: AOJu0YwfsJnxkN1XZwz0rgryznDKFvL9/QMs3UenxPr5v26sogJljiQD
 P+C5OsiDZQneCwDvalgvnY3ybEEaK1CS9Bj9ZhZAPZUW0bHuM4gzt4cwI8o2qn7fshRNUStEdRp
 HwDA=
X-Gm-Gg: ASbGnctW9MowGUMFsfZodyA9gyzKisXZoq2uj2TTTjVXytkdDyHCnYfv3/kOPYHqLIC
 LwsQEmE97rvm8+wPtxlyDdaKfM9j+j7/AB0BRFinYoVOOp2bd/trZMlTLHV7/M2qIypDtQUFXLD
 Ac7QgMZhlUucbOngjeaR8Ht2nACYWA4vKft86MgR1NRzqqkV2r9K8L/yFgVz1NOI64FXTI1x+Tb
 umSWC5Kmon9gu/GaDuGIbfrIOHrllcpOPHS4E5r07oqe4TroVhtApqleKC91A1HG8CPMlocnjkG
 ZpB8Lz1jVyIl+iy/69u2LSLbHljJYXIy4DjdPMBUKF8=
X-Google-Smtp-Source: AGHT+IFJQwdHEroEw7SnT6nnL7lTsTOrDe+65iPnOWg3LzqdiyKS/Xne++CnXWd+kaXtYHRL+shqQA==
X-Received: by 2002:a17:902:e545:b0:21f:6dbf:1850 with SMTP id
 d9443c01a7336-221040bd704mr360095115ad.40.1740025662169; 
 Wed, 19 Feb 2025 20:27:42 -0800 (PST)
Received: from localhost.localdomain ([185.219.141.200])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d537d10esm113032045ad.103.2025.02.19.20.27.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Feb 2025 20:27:41 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 20:27:34 -0800
Message-ID: <20250220042734.23880-1-christian@aperture.us>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1740025662; x=1740630462; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z8eAZKP5aNoAihxrMkfAuTie7ltZZU+oU7p3VSgqTvM=;
 b=doxBZScWD/WNBSxNtRtWxanpCIBuHBsX72L9nlIm1xo33lvcZT5aVKPd52UQRh+Ifh
 Kf+WSBYxGW8Vwlm2GKn4ZhpElMCMnw7qQL/qQi/U89i6kFmSCM3fcXw2WEjhIOypiiPd
 rYvgqATsHPqssV5dLdxMY7ZucCPLpwyzDfvsUQHywBn7J1J9XXuMyaYtuaLgY+x5axDS
 RPcbN3zaBYXzLlInG+/tFu7qdwAsvKq3ePn13X72ArcV7RCcsg+Z83hP06EIq2TIh0JV
 WBrn85pUV9ot8z631JAs5kvi8IisSUBFHjY0rwLgMHl0bLLXEqXKjsiuZihuh7D1AvJI
 LsAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=doxBZScW
Subject: [Buildroot] [PATCH v1 1/1] package/rpi-firmware: remove broken
 32-bit binary install steps
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rpi-firmware currently refers to the following version:

https://github.com/raspberrypi/firmware/tree/5476720

The "opt" directory no longer exists as rpi-firmware removed 32-bit binaries.

Drop BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG as vcdbg no longer exists.

Drop the RPI_USERLAND conditional to install non-existent files in opt/.

Fixes the build on 32-bit raspberry pi systems.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/rpi-firmware/Config.in       | 12 ------------
 package/rpi-firmware/rpi-firmware.mk | 20 --------------------
 2 files changed, 32 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index f99c116ca2..4dda33a713 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -100,16 +100,4 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	  overlays, to support HATs (Hardware Attached on Top, add-on
 	  modules).
 
-config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
-	bool "vcdbg"
-	depends on BR2_arm # prebuilt arm binary, rpi-userland
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_INSTALL_LIBSTDCPP # rpi-userland
-	help
-	  Install vcdbg, to help debug communication with the GPU.
-
-comment "vcdbg needs a glibc toolchain w/ C++"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
-
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 7ae9ff6c28..a67e8294c4 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -61,26 +61,6 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 endef
 endif
 
-# Install prebuilt libraries if RPI_USERLAND not enabled
-ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)
-define RPI_FIRMWARE_INSTALL_TARGET_LIB
-	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libvcos.so \
-		$(TARGET_DIR)/usr/lib/libvcos.so
-	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libdebug_sym.so \
-		$(TARGET_DIR)/usr/lib/libdebug_sym.so
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
-define RPI_FIRMWARE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
-		$(TARGET_DIR)/usr/sbin/vcdbg
-	$(INSTALL) -D -m 0644 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/lib/libelftoolchain.so \
-		$(TARGET_DIR)/usr/lib/libelftoolchain.so
-	$(RPI_FIRMWARE_INSTALL_TARGET_LIB)
-endef
-endif # INSTALL_VCDBG
-
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(RPI_FIRMWARE_INSTALL_BIN)
 	$(RPI_FIRMWARE_INSTALL_CONFIG)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
