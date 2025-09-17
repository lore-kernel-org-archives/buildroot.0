Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46250CAC59F
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 02:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0637C41577;
	Wed, 17 Sep 2025 02:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cP-F9rLnIrKF; Wed, 17 Sep 2025 02:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A7ED4157F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A7ED4157F;
	Wed, 17 Sep 2025 02:45:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC7A9279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 02:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C221683CD8
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 02:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBuULS46yAh1 for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 02:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=kastelic.jakob@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21B6E83CC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21B6E83CC9
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21B6E83CC9
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 02:45:48 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b4c3d8bd21eso4016241a12.2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 19:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758077148; x=1758681948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xfb462gyuUkfqyv9AJK4iXheRMiJwrethAeOA7JL6vk=;
 b=h3zVkaoaxl0J23NOoDbOqr2LYu5dDFYFeo7lZUrPdxr3VQDYluCxfM73X/MUjCt+YR
 GYWlKty55IELo2Sp0wVP0Km57qnIM5n+DA4h8mwGYrHEQZtvqv33ww2R97+PAZ/mGLmC
 A9azufeZwTe6fffzc+kpqlf1MLugYIXwmc02VTLVpFMUqkBw9loXvMpc7H66djthnjRW
 AUYsElO7aea8e2P1aZ1G/yRDbOSJAX0ILoWNn52wBcQwwBZgxD0HfPkt4k7+tg8VbNAS
 yoOUkX0594LTBP7U13oTP+eVbXYMdmzKvSJ8u0/J6ThxTglnC/tPQsAX43KtrMUOQGYl
 4chA==
X-Gm-Message-State: AOJu0YzptLvjifQKnvslSRE+cM3JDuq6TgdbkFKkP+sOOD/HDZbLFPMJ
 PnJu1ZXrVl7WSbCNNBfufF9Or81M25pfgZFIHEOWKQiNK0RcOwo6AP4YhZLaRAJ4jgU=
X-Gm-Gg: ASbGncvKTRlR8Uymg70FPWAN6sPtJmbEp5f90qFw7pDakWEho9qyR3pz0Wkui+sfM3Q
 zmSc7+9Sgp1RiQN8zqic2YZnrUJ+zpsujn8doU/mwY8bp5Agstzyi2pQyRXs2gOa7rJotc1b2mv
 OLPep1XtDJBFAz9c8b7gU++DhzFAK3f+zN5yc/o+GTov3YCTeJXv12jqS21CzO5KgEAR79L2DmP
 /i7M/TL8RCBKZrB80wkHno428w15sEgs2N2FL9kNSUtsZeId7cQ0CYBEETfMShSj9eySF4TkYQT
 uand3F6pcd1FaH9R8LxW5UUBAMGUFjwA2BgKF6EmO66nO712X/ho4JPIkkJmX8R9kdfTQDuImjY
 jf3VI7gEIviF6GGogBStCv96Q7kiBBqUQiA+nUebursdVK8kFdbImVkL/V23JK4s0z4V+5v7wby
 /N
X-Google-Smtp-Source: AGHT+IHWmsh6rEQLT1LkspESGtSUZiIzndzOUUWNLotAudmmh0lP/CDyMNBQcdPLh3eyptkpvx8htQ==
X-Received: by 2002:a17:902:d0d1:b0:267:776b:a315 with SMTP id
 d9443c01a7336-268138fdcc9mr4287795ad.32.1758077147595; 
 Tue, 16 Sep 2025 19:45:47 -0700 (PDT)
Received: from localhost.localdomain (c-67-164-2-197.hsd1.ca.comcast.net.
 [67.164.2.197]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2631ee2ceb2sm102588735ad.141.2025.09.16.19.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 19:45:47 -0700 (PDT)
From: Jakob Kastelic <kastelic.jakob@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 19:45:40 -0700
Message-Id: <20250917024541.1480367-2-kastelic.jakob@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219214555.3435133-1-jkastelic@thinksrs.com>
References: <20241219214555.3435133-1-jkastelic@thinksrs.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758077148; x=1758681948; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xfb462gyuUkfqyv9AJK4iXheRMiJwrethAeOA7JL6vk=;
 b=gg3FPihyzqMdI2JjZxrKnt5KgGpwwVZomFm5DQsviq3oEGifvXEz2Jp3coDbNJgeRI
 h+zDj+iGVnQEEHb6k6zixttYVdkBlHvBhFbJ4VhN1j1xJe53I0HwsvXqvsBzndNk6yjH
 0EKv2kg1b8gLhrbWDPewQgOMpTw0dMXWa9vopLNNoT4WR2rHbUB4ia3pxwfnHwcxHuza
 nEd1htsBM1M5ulcB1vkR2oKGB2p4jPF1yi2/5GlUN6c553mZPWNwcVjsaA3UqZDib/Mm
 gtEdxhCNBaW+W3QclZFVvCs/vBvtXzPdaANdMQpPSyXrXSJADM6a6oYRG8DtaDBfbBxS
 0nqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gg3FPihy
Subject: [Buildroot] [PATCH v2 1/2] boot/arm-trusted-firmware: optional
 Linux as BL33
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
Cc: Jakob Kastelic <kastelic.jakob@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>,
 Dick Olsson <hi@senzilla.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arm Trusted Firmware (TF-A) can be used to load U-Boot or another
bootloader, which in turn loads the Linux kernel. However, TF-A is
capable of loading the kernel directly. To this end, we need to define
the BL33 and BL33_CFG compile options containing, respectively, the
zImage and the DTB.

This config introduces a new config option,
BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33, which sets the BL33 and
BL33_CFG parameters, and ensures that the kernel is built before the
TF-A by having linux as a _DEPENDENCY of the TF-A.

---
Changes v1 -> v2:
  - add depend on AArch32 and zImage
  - for STM32MP1, point BL33_CFG to the DTB

Signed-off-by: Jakob Kastelic <kastelic.jakob@gmail.com>
---
 boot/arm-trusted-firmware/Config.in           | 21 +++++++++++++++++++
 .../arm-trusted-firmware.mk                   |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 72684e5974..42f44a7036 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -188,6 +188,27 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33
 	  for the 'qemu_sbsa' platform. In this case, due to the EDK2
 	  build system, the dependency between ATF and EDK is reversed.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33
+	bool "Linux kernel"
+	depends on BR2_LINUX_KERNEL
+	depends on (BR2_arm || BR2_armeb)
+	depends on (BR2_LINUX_KERNEL_ZIMAGE || BR2_LINUX_KERNEL_APPENDED_ZIMAGE)
+	help
+	  This option allows to embed the Linux kernel as the BL33 part
+	  of the ARM Trusted Firmware.
+
+	  Do not choose this option if you intend to use U-Boot or
+	  another second-stage bootloader. With this option, TF-A starts
+	  Linux directly.
+
+	  With this option chosen, whenever the Linux zImage changes,
+	  TF-A may need need to be re-built to create the latest FIP
+	  file. Since Buildroot does not track package dependencies,
+	  this has to be done manually by invoking `make
+	  arm-trusted-firmware-rebuild`. The final boot medium image may
+	  need to be re-generated as well to include the latest FIP file
+	  version.
+
 endchoice
 
 if BR2_TARGET_ARM_TRUSTED_FIRMWARE_BAREBOX_AS_BL33
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index dca16d3960..ce7ac86290 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -132,6 +132,14 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/$(ARM_TRUSTED_FIRMWARE_UB
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += uboot
 endif
 
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LINUX_AS_BL33),y)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33=$(BINARIES_DIR)/zImage
+ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM),stm32mp1)
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BL33_CFG=$(BINARIES_DIR)/$(LINUX_DTBS)
+endif
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += linux
+endif
+
 ifeq ($(BR2_TARGET_VEXPRESS_FIRMWARE),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
