Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E51C369A1
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 09:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE3C560675;
	Sat, 12 Apr 2025 09:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5cuKcVUoowRl; Sat, 12 Apr 2025 09:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F17486074D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F17486074D;
	Sat, 12 Apr 2025 09:19:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9295108
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 09:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F2FB60840
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 09:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87bg8BJBUNgt for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 09:19:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7932C60675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7932C60675
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7932C60675
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 09:19:44 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ac7bd86f637so750720866b.1
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 02:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744449582; x=1745054382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GRIiro+woxmqi0mdUzCC1w1Pc/KpmXOtIjlhMLlRfbk=;
 b=DJjVWfqCaRvCsjnpa+T2EFMnM6OQBAp1uqCLzqahfJhB9HiTA3KiFs9w8zR4emyoUW
 xsTyW1rCFmBiWxHyITkwn0uIpsVMxU4fKOsDBeSswUH5pqsQQ213dGTowX0gqI2dbloR
 aYONAe0jI4PalKY4dbBWwYYlCPaPqkXZQr3dsQFTcyEhOQ2emXnJPWl7rSEGXsFmdvMT
 wSs5fguEAgYJtziodlTcb6q5oqV8zjDUZlvWR8raIKZp/VO2saxbbMD+OdaotpvA6FsS
 XXuyZf7G30riTTvfv9gjB+mNUESQ6LNfiAhw0IFmBJ/lqjyoQM0Faopr7hXk0afPpqlk
 hWJg==
X-Gm-Message-State: AOJu0YwObIJYqbrtRCrgubuiw3cMeiwOPhX8HhNg6hjulHymXqoHR5W9
 o/3w/qz/8pqFelhiEmR/mbGiLFxyATjUzTmsMMjde271vi/l0dnQh5X7i4WR2WHWRo8tN5M0NeZ
 j
X-Gm-Gg: ASbGncuEDZICUeD5U5NpjPaq1ReVOB4DTloV3NlnS96bKnCvZaz2rHSoDGYlhwEUZze
 wXtZ0Ds+AsR/KrH34RaOqtzKf5R5LAnNXGi5eBI3hpmh4qn1EJJmBuQlAiC2CVOFaTWkWIwp+03
 bNlUlqt22VoNerh313g3ZMDyYgqpAlUq2RNmkT00mSk8tXoRUu2Ya4tUgt0BsyZoUr0HDCaVkZT
 mw81wU1aBo7BXK398crDiZtCo9LPb+gc7Dh/xO6baVqq/M5QTOSyVjOXqe/vyTnx6kWHFWzAP+Z
 RIUm1uafRoObH1NPtMZZAkCS1XpQP85NQmpT79bpkIzwcGbQpRDe03X4RXSUIc/bQPeXo2LfT16
 17RnOUF0LFOEmMAM3i3rSGBBcMk+VpBxmBD1v4z7bU4RGRpjTC4iGfQA18593wwE7kFHVuzPLBJ
 7Kt+iuhXM=
X-Google-Smtp-Source: AGHT+IH/1HV7cdaw2zYI4KytkfzvuoXUr1i8P6nkXPJc6Y0RC0P+oWJvXzMD++gDXh2YD5HC6R/THQ==
X-Received: by 2002:a17:907:86a4:b0:ac7:3929:25f9 with SMTP id
 a640c23a62f3a-acabc6c510dmr857612766b.29.1744449582236; 
 Sat, 12 Apr 2025 02:19:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-86-232.retail.telecomitalia.it. [79.25.86.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1bed98esm570920966b.72.2025.04.12.02.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Apr 2025 02:19:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com
Date: Sat, 12 Apr 2025 11:19:35 +0200
Message-ID: <20250412091936.1251605-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1744449582; x=1745054382;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GRIiro+woxmqi0mdUzCC1w1Pc/KpmXOtIjlhMLlRfbk=;
 b=n0+mEAU/tq1P3rS77JjVAsyETqIsVmnJL52HRf7rx8Tv4uEGVj+UXDcMLwKDVuKcu8
 vIkVxlqQxv/0EitpcdNRSwTJSSy66qB9Ivp3NT2PxmfVHNH1wiI3ixI8zub5PpWNYBbc
 f7bHzdvZ1Js86PZdXypo3IX+U5h3o0TYMMuVY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=n0+mEAU/
Subject: [Buildroot] [PATCH 1/2] boot/ti-k3-boot-firmware: bump to version
 11.00.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release-notes:
https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tag/?h=11.00.10

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 2398d02da258..d9cb66cd6a27 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  ae888a0a22f8c5b8fe841236d6e40bb2f821d9a4161dab6924fd989e1467ef0e  ti-linux-firmware-09.02.00.009.tar.xz
+sha256  884c454b1a518e6d31304acb201493156685fb8ff111383c842bb292a1b35c9b  ti-linux-firmware-11.00.10.tar.xz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 9332732ad4a3..e04165edd1e0 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TI_K3_BOOT_FIRMWARE_VERSION = 09.02.00.009
+TI_K3_BOOT_FIRMWARE_VERSION = 11.00.10
 TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
 TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
