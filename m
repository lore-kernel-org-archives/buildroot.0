Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75EEC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 21:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDED781F94;
	Sat, 13 Jul 2024 21:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpCHR-CdHzqJ; Sat, 13 Jul 2024 21:52:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40CFF81F9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40CFF81F9B;
	Sat, 13 Jul 2024 21:52:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 068A61BF355
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E640481EE1
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 21:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjxemZYQRSk1 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 21:52:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BFDB181120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFDB181120
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFDB181120
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 21:52:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso412519666b.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720907550; x=1721512350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s0kslVySifvIdBpOB62TUmJisvHRBqWmyl7Fu0shtHI=;
 b=wFXdaHpM7ypUwceNHg0N/HkUx/pu4dpwmKssijJjE84PlIT3P0Nj0a0GHs9U/QO9hw
 0jC65ccMD66YYFCQftNBKR4n0a98z+VyKgxaAgqdBVxoSOFxoqqOTdO7HXU2tU/wMd2q
 Besjk0kVUaDtz25iEhMdAMyGPDv/zO7Xm1jQuWpGfl/66xGfO5qWEENHzEWWzncd4FpO
 ic/ko/Bu/bfhsftIQBvNbk6Rf9to2rdeaQvml1U/X1YwkSK6YeTm3Q2GOtsPXL9r0sdb
 wh8OIrCzP0frLITCbXyvvLA+ZaKq5226t1M9/XFSubtUlW6anSN5pEbrTuKxE6S0CTKf
 KxTg==
X-Gm-Message-State: AOJu0Yz3QHFDd9BFbM3uS7tBh0nAsTxEAYaOAWBlSlHTcQPzGFexl0u/
 jEtXQedi7uKeD03qdP2+K+lpbOnC44PLBSKjxTEQtU8e08fyixKdPtLuzWoXfZE4VJxq3WN8yQR
 U+eE=
X-Google-Smtp-Source: AGHT+IGtsqCeGWiieICeKuJoEvKtdrwUqMXW9uBF4R+Lp2R/NFj1FvCHPbpJYxOiBPuvDAxPG0IumQ==
X-Received: by 2002:a17:906:d195:b0:a72:b4c9:2be8 with SMTP id
 a640c23a62f3a-a780b89f634mr829401966b.72.1720907550174; 
 Sat, 13 Jul 2024 14:52:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-44-29-159.retail.telecomitalia.it. [79.44.29.159])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5d2018sm80223566b.85.2024.07.13.14.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 14:52:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 23:52:18 +0200
Message-ID: <20240713215218.2665512-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240713215218.2665512-1-dario.binacchi@amarulasolutions.com>
References: <20240713215218.2665512-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720907550; x=1721512350;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s0kslVySifvIdBpOB62TUmJisvHRBqWmyl7Fu0shtHI=;
 b=H8xRTch50bITBLXvGmwH82PDtsBIOg4b/aRJNhp8ivLtQqU1yIQpm7cW0yFoEISy0H
 N3UyGaGV7KMVmjv/c+9tQFZyUIikfqpjbc5EQOQpDxdcue/8L1TFKEK0GUoCZ4GLjYYI
 pfDb9mhef3XCJxR/qELfAHTVZY4UaverPydMs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=H8xRTch5
Subject: [Buildroot] [PATCH 2/2] configs/stm32mp157c_dk2: add hashes
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
 Marleen Vos <marleen.vos@mind.be>, Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that the configurations of boards stm32mp157a-dk1 and stm32mp157c-dk2
have the same software versions, it is possible to share the hash files as
well.
The patch uses the hash files for Arm Trusted Firmware, Linux, Linux
headers and U-Boot of stm32mp175a_dk1 also for stm32mp175c_dk2, and then
enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 0
 .../stm32mp157}/patches/linux-headers/linux-headers.hash        | 0
 .../stm32mp157}/patches/linux/linux.hash                        | 0
 .../stm32mp157}/patches/uboot/uboot.hash                        | 0
 configs/stm32mp157a_dk1_defconfig                               | 2 +-
 configs/stm32mp157c_dk2_defconfig                               | 2 ++
 7 files changed, 3 insertions(+), 2 deletions(-)
 rename board/stmicroelectronics/{stm32mp157a-dk1 => common/stm32mp157}/patches/arm-trusted-firmware/arm-trusted-firmware.hash (100%)
 rename board/stmicroelectronics/{stm32mp157a-dk1 => common/stm32mp157}/patches/linux-headers/linux-headers.hash (100%)
 rename board/stmicroelectronics/{stm32mp157a-dk1 => common/stm32mp157}/patches/linux/linux.hash (100%)
 rename board/stmicroelectronics/{stm32mp157a-dk1 => common/stm32mp157}/patches/uboot/uboot.hash (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index db28680f40e8..da5fa2685ae6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -278,7 +278,6 @@ configs/socrates_cyclone5_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
-configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
 configs/toradex_apalis_imx6_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
similarity index 100%
rename from board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
rename to board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/common/stm32mp157/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash
rename to board/stmicroelectronics/common/stm32mp157/patches/linux-headers/linux-headers.hash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp157/patches/linux/linux.hash
similarity index 100%
rename from board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
rename to board/stmicroelectronics/common/stm32mp157/patches/linux/linux.hash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp157/patches/uboot/uboot.hash
similarity index 100%
rename from board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
rename to board/stmicroelectronics/common/stm32mp157/patches/uboot/uboot.hash
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index cf42b29a7c0b..310e179cf782 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -6,7 +6,7 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp157/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index c923d2cd60bb..2a9c31df37c2 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -6,6 +6,8 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp157/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
