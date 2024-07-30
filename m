Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB1C3DA7E
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 13:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF85A80CCE;
	Tue, 30 Jul 2024 13:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2KzdMKbUY1z; Tue, 30 Jul 2024 13:10:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C47B80F76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C47B80F76;
	Tue, 30 Jul 2024 13:10:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86E0A1BF969
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 13:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 815A880CCE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 13:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYs1MybvpcoL for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 13:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 427D780B42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 427D780B42
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 427D780B42
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 13:10:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7a8a4f21aeso600951566b.2
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722345015; x=1722949815;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/vCW5eUxOjB1yF/w1jn8GRH25mP7DDx19uCBsmGxijE=;
 b=PaIxnNkJMi3DWFoW2QdIRZTxgv86qDMl07i/+uAotoGNxPqVjkL9vek2bLWGf7VBVY
 in36mY+YY/S+PUNL92ouagQ+x+Vi3GM6e6zme0LFpWj0/VV5yyCC6R9J5NF6wU/PxMmU
 rPpIzPzGWr1nuorHMyTqVFt0VQOFDB5Ktx4FC0uEWafFJ63KUdhRJFG8BDieWY7LDO/E
 GkpsxjjUzJQd2iUmeYtVQCcHOVpCOfcq7Hax/sQ1dYZKsVeFiowv53x54Vbvx1BNOJZa
 BJvvNahOwz2+eOpWpClkc0bGYxDkxtaHsaBfbN3nED9OStRnYO4NkuE9UnBGtt6+ZrIw
 IeuA==
X-Gm-Message-State: AOJu0YxtKp9qthUeO2MFgtIDUST8xGTGs7c1jlILAnzkZGnCqCaKytbd
 DUn5ED0KyYhqhgLv/OwXPKw14fNFE9yWP8JF+5hpIQqFPVFO3Ivv
X-Google-Smtp-Source: AGHT+IElF/9EPYQWuB691CgMQHxs0wRj6UECPwdK9Px0v/s7ZxUeILlrvG/3FbOqGdCLbW8osPdVnQ==
X-Received: by 2002:a17:907:160a:b0:a7a:8cb9:7490 with SMTP id
 a640c23a62f3a-a7d4013523dmr715862766b.47.1722345014156; 
 Tue, 30 Jul 2024 06:10:14 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab580b4sm638940266b.58.2024.07.30.06.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 06:10:13 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 30 Jul 2024 15:08:44 +0200
MIME-Version: 1.0
Message-Id: <20240730-master-v1-1-3ca889c14ea4@gmail.com>
References: <20240730-master-v1-0-3ca889c14ea4@gmail.com>
In-Reply-To: <20240730-master-v1-0-3ca889c14ea4@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722345015; x=1722949815; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/vCW5eUxOjB1yF/w1jn8GRH25mP7DDx19uCBsmGxijE=;
 b=X0uRs3dz01FfkwTkJjhncMCCVtyuKMlhLoych1LSk6+6FGBoHOZTfHeC606PEkm9G7
 /Z4HPLMKOPm6C+UWEiX9JgkY+fbZQHEN6lss+FBbKvMrd+72Zm9megHkM8efxjZtXZrd
 pp5mM9jqDi0K3V1lyVvZS7pdF7rsHFFR1pEbF0OHcnqouhCk/0/DZmK/3kizEn3zvYLo
 fSbI9ICxXB+ZOz2y2fDhUH8Oxmm/4tfVUJjnitSCdFNNXK71Ht+kUnvgzogSXi0MFIzk
 JUpyizEgwydTYAhDD5lBE7f4s+f1xFRAuXPisIrHA1RyFStBaHrafSES0XywmiXffqt2
 hRGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X0uRs3dz
Subject: [Buildroot] [PATCH RFC 1/2]
 board/stmicroelectronics/common/stm32mp157: rename folder
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

STM32MP15x and STM32MP13 can use almost of the same configuration
regarding bootloaders and the Linux kernel. To make profit of the
commont folder, rename it to 'stm32mp1xx' and change dependencies
accordingly.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 .checkpackageignore                                                   | 2 +-
 DEVELOPERS                                                            | 2 +-
 .../common/{stm32mp157 => stm32mp1xx}/genimage.cfg.template           | 0
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash            | 0
 .../patches/linux-headers/linux-headers.hash                          | 0
 .../common/{stm32mp157 => stm32mp1xx}/patches/linux/linux.hash        | 0
 .../common/{stm32mp157 => stm32mp1xx}/patches/uboot/uboot.hash        | 0
 .../common/{stm32mp157 => stm32mp1xx}/post-image.sh                   | 2 +-
 configs/avenger96_defconfig                                           | 2 +-
 configs/stm32mp157a_dk1_defconfig                                     | 4 ++--
 configs/stm32mp157c_dk2_defconfig                                     | 4 ++--
 11 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0f054c9a30..39ad3efcd3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -83,7 +83,7 @@ board/solidrun/clearfog/post-build.sh Shellcheck
 board/solidrun/macchiatobin/post-build-mainline.sh Shellcheck
 board/solidrun/macchiatobin/post-build.sh Shellcheck
 board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh Shellcheck
-board/stmicroelectronics/common/stm32mp157/post-image.sh Shellcheck
+board/stmicroelectronics/common/stm32mp1xx/post-image.sh Shellcheck
 board/stmicroelectronics/stm32f429-disco/flash.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/flash_sd.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/flash_xip.sh Shellcheck
diff --git a/DEVELOPERS b/DEVELOPERS
index 78ea65205d..f1a940a355 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2234,7 +2234,7 @@ F:	configs/qemu_riscv32_virt_defconfig
 F:	configs/qemu_riscv64_virt_defconfig
 
 N:	Marleen Vos <marleen.vos@mind.be>
-F:	board/stmicroelectronics/common/stm32mp157/
+F:	board/stmicroelectronics/common/stm32mp1xx/
 F:	configs/avenger96_defconfig
 F:	configs/stm32mp157a_dk1_defconfig
 F:	configs/stm32mp157c_dk2_defconfig
diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp1xx/genimage.cfg.template
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
rename to board/stmicroelectronics/common/stm32mp1xx/genimage.cfg.template
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
rename to board/stmicroelectronics/common/stm32mp1xx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/patches/linux-headers/linux-headers.hash
rename to board/stmicroelectronics/common/stm32mp1xx/patches/linux-headers/linux-headers.hash
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/patches/linux/linux.hash
rename to board/stmicroelectronics/common/stm32mp1xx/patches/linux/linux.hash
diff --git a/board/stmicroelectronics/common/stm32mp157/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
similarity index 100%
rename from board/stmicroelectronics/common/stm32mp157/patches/uboot/uboot.hash
rename to board/stmicroelectronics/common/stm32mp1xx/patches/uboot/uboot.hash
diff --git a/board/stmicroelectronics/common/stm32mp157/post-image.sh b/board/stmicroelectronics/common/stm32mp1xx/post-image.sh
similarity index 93%
rename from board/stmicroelectronics/common/stm32mp157/post-image.sh
rename to board/stmicroelectronics/common/stm32mp1xx/post-image.sh
index 0cf52f4564..77547832ab 100755
--- a/board/stmicroelectronics/common/stm32mp157/post-image.sh
+++ b/board/stmicroelectronics/common/stm32mp1xx/post-image.sh
@@ -22,7 +22,7 @@ main()
 	GENIMAGE_CFG="$(mktemp --suffix genimage.cfg)"
 
 	sed -e "s/%ATFBIN%/${ATFBIN}/" \
-		board/stmicroelectronics/common/stm32mp157/genimage.cfg.template > ${GENIMAGE_CFG}
+		board/stmicroelectronics/common/stm32mp1xx/genimage.cfg.template > ${GENIMAGE_CFG}
 
 	support/scripts/genimage.sh -c ${GENIMAGE_CFG}
 
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 64cfb3c2b0..3b471109f7 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -7,7 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
 BR2_ROOTFS_OVERLAY="board/arrow/avenger96/overlay/"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 310e179cf7..e2dd48bb17 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -6,10 +6,10 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp157/patches"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 2a9c31df37..d6085583d3 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -6,10 +6,10 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp157/patches"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
 
 # Kernel
 BR2_LINUX_KERNEL=y

-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
