Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF73C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 10:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 202896083F;
	Thu,  6 Jun 2024 10:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKioKxUM8kJy; Thu,  6 Jun 2024 10:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CEB76085D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CEB76085D;
	Thu,  6 Jun 2024 10:22:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FAE41BF5AD
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CAB86083F
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nupv5PRguUyD for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 10:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24CD66077E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24CD66077E
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24CD66077E
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 10:22:15 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52b894021cbso1059790e87.0
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 03:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717669333; x=1718274133;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v7N3GSvYb+iPX3IchbBlCJnHzgyBjXJvQbxWJJBC1og=;
 b=g+D2Alp65gUB1Z4g8hOz/LYBTl+/0VdtwFkciHye6cge4U/iCS6gPUZoviKSCdM44Z
 JOIVZJBo0hZ0UyyuFQPCUba+QqTHpxhr9DBkCa5h8ZpKk9+8dgIRTpU/ARwBm0gx8QLv
 r2zvYP8QyXeYidF9LILlVFX4EjAnn7kUi54m158Ejg1LAZismx+Mlsiq3eoOTkfI1Ukw
 UC3zSb8m6Hra0qLH25MO6Rny4lWrK9lMYuDb/i4Ph1evLuolss4+ZHNfJ87iOd0l4Ggd
 Y7f4QhH63PMsj2za76Xrlcrn7rQ7IJTJLRI5avmbqLZmCRVLGK8foGancNHe0KTWcN67
 WgJA==
X-Gm-Message-State: AOJu0YySrENJw58DGaLDxT0tPHElI2A9lgfC+mrDnhru5PaI7aempgbD
 kKduevfK7GhdV5tkuiZ+RWdM/y4Lml/5RIIi04W2pIzZz+gxFRrF2MT/y/o118h9FQoLHEcsRK7
 h
X-Google-Smtp-Source: AGHT+IGEHv/7YbyZi0WWObgrnOewocsCzE049JSWn3nr5WeaPyjkNNCTXGGllEIMkgE9Dt+i4iFuog==
X-Received: by 2002:a19:2d4a:0:b0:523:90df:a9c6 with SMTP id
 2adb3069b0e04-52bab4fa5b2mr2985490e87.50.1717669332659; 
 Thu, 06 Jun 2024 03:22:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421581490c2sm50175585e9.37.2024.06.06.03.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 03:22:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 12:22:08 +0200
Message-ID: <20240606102208.580103-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717669333; x=1718274133;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v7N3GSvYb+iPX3IchbBlCJnHzgyBjXJvQbxWJJBC1og=;
 b=YAsccc2QJbSdrPUTB3GKd0lJGfIgzweTBq9VEn2U+XhBLyvtinvzJ8ycK2JouCUuam
 lW9dGxEPvfamFRoAHaierN2sH4vWaScXstfhHv/NatTLIilSCeiKDU7mpeAEjIShDOhG
 h6cqyEfPbOM+wEEtTXcU0f8og8lvaeJl7sKy4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=YAsccc2Q
Subject: [Buildroot] [PATCH 1/1] configs/stm32f429_disco_xip: add hashes
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds .hash files for Linux and Linux headers and then enables
BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the defconfig
from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 1 -
 .../stm32f429-disco/patches/linux-headers/linux-headers.hash    | 1 +
 .../stmicroelectronics/stm32f429-disco/patches/linux/linux.hash | 2 ++
 configs/stm32f429_disco_xip_defconfig                           | 2 ++
 4 files changed, 5 insertions(+), 1 deletion(-)
 create mode 120000 board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index d0bd179a5c02..437aafb41594 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -330,7 +330,6 @@ configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
-configs/stm32f429_disco_xip_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_sd_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_xip_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f769_disco_sd_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
new file mode 100644
index 000000000000..c1bd9f9100d5
--- /dev/null
+++ b/board/stmicroelectronics/stm32f429-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c2b74b96dd3d0cc9f300914ef7c4eef76d5fac9de6047961f49e69447ce9f905  linux-6.1.27.tar.xz
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 99ae8cc7533b..e3d3cc38ff8e 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -3,6 +3,8 @@ BR2_cortex_m4=y
 BR2_KERNEL_HEADERS_6_1=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
