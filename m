Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92CAC3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 18:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A53D402BC;
	Wed, 14 Aug 2024 18:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPoKjNfzOEPI; Wed, 14 Aug 2024 18:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 216AE40C56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 216AE40C56;
	Wed, 14 Aug 2024 18:37:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B7FBA1BF97A
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4C2D4029A
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJU2N910azOq for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 18:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D10040264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D10040264
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D10040264
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 18:37:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-428f5c0833bso7034515e9.0
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 11:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723660636; x=1724265436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+awHZZ71PUSMMIuijXDZypC9a4k2oAde8xQRGYeX8mM=;
 b=ZDHanuWhXcX8q4HCJ9frt8f8nqzf/sa4qSW6XCPU9J5zlbolN7/GQQZWBLrXsioFjV
 cMETR7+xuhNVBaHeaW5ZKuHeFXwUY8CDLA/oM2PGc+B16kte7IZ+kh5l6AIpcxOP+XQy
 0dRYeVAmHKS9hVYTmSdpdS02DmJ17pxJBOZwFyDP94waVDDNbI15nvZCzmpPG5qbc17l
 OxlV2KxcD/BzwuZAiHYN1nvePBibmfuz9cY+gD5XtiBd8Ce+227DHysIOkkKSrNpgSXl
 FCABkPCC8KFHHoDuoPouMkNL6iovbCeACvEXofQqHXuP1BZuSGnEd2ImXe5/fS7BgjUM
 eOKQ==
X-Gm-Message-State: AOJu0YyJyWPDkKMrT9uF/zhajxzRPh7d1AiUeiyunHRQffcGl287Rp2/
 kuZ8Wwm5pZ76P8qYsVG8aAbWSR+StcFCcAZx93pvmN5Hj5Ugk0K0
X-Google-Smtp-Source: AGHT+IEucS/s9MOtOcKXFl4HObcYMv1NnZjVFwkzKNHpuL4CI9cFOoLITaZ6CUAhN+OPV1S564c4tg==
X-Received: by 2002:a05:600c:468e:b0:426:5b19:d2b3 with SMTP id
 5b1f17b1804b1-429e23b4b0cmr4578375e9.14.1723660635418; 
 Wed, 14 Aug 2024 11:37:15 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded4deb1sm28010735e9.36.2024.08.14.11.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 11:37:15 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Wed, 14 Aug 2024 20:37:02 +0200
MIME-Version: 1.0
Message-Id: <20240814-master-v1-1-7834f3deddcb@gmail.com>
References: <20240814-master-v1-0-7834f3deddcb@gmail.com>
In-Reply-To: <20240814-master-v1-0-7834f3deddcb@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723660636; x=1724265436; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+awHZZ71PUSMMIuijXDZypC9a4k2oAde8xQRGYeX8mM=;
 b=fHsawgN6S+tXcJvnFCkJgyMWpGg1HKeZY6sjKJnjo1tv3tGOyW5uAR1n4spqcuhs0n
 4cnEfgS68u2O+1i8sKFFrXWBH3MNFQvQr9CV9IhpCtCVHGkrndwXKvTzsaV//WXiehxq
 ou8aPh+4E65eaIzOn7iWXE5MroCudCYkyDKeWsQKA1GU/GRj0jTE0pPoxIiIB9Nvk5Az
 tZTUKe2VpBJ9jZ96jPsiqtudK20kRtSKf3QbZgJO1ACLYDqv4BQBV5irvqWToq2GTxvi
 rIrS8NghKkHc+1xo3FztdFU2IE8xAj634G8Scxw0Y1YZChFn/t33W0beuG0ZmnD2pUag
 YSww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fHsawgN6
Subject: [Buildroot] [PATCH RESEND 1/2]
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
index 8fe4a16eb8..e1d3d8d906 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -82,7 +82,7 @@ board/solidrun/clearfog/post-build.sh Shellcheck
 board/solidrun/macchiatobin/post-build-mainline.sh Shellcheck
 board/solidrun/macchiatobin/post-build.sh Shellcheck
 board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh Shellcheck
-board/stmicroelectronics/common/stm32mp157/post-image.sh Shellcheck
+board/stmicroelectronics/common/stm32mp1xx/post-image.sh Shellcheck
 board/stmicroelectronics/stm32f429-disco/flash.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/flash_sd.sh Shellcheck
 board/stmicroelectronics/stm32f469-disco/flash_xip.sh Shellcheck
diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..4a5394b596 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2236,7 +2236,7 @@ F:	configs/qemu_riscv32_virt_defconfig
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
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
