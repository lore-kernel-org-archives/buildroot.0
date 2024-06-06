Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C92C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 10:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C56FB606AA;
	Thu,  6 Jun 2024 10:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJfGmp1OlUL3; Thu,  6 Jun 2024 10:18:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2986077E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE2986077E;
	Thu,  6 Jun 2024 10:18:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4416C1BF865
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C25484413
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BB4yTl1H4Jxr for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 10:18:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0BA7784403
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BA7784403
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BA7784403
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 10:18:12 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5295e488248so923446e87.2
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 03:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717669090; x=1718273890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zr7YQPxXedTwam/PkUqFF4Cfk89jLM+LstKy2GwL8JA=;
 b=bokW6insEJ6cTufXbQLZx3ufnv6rBohwx3UHYl9FzsQZgPoGDlzYBSOTMLivv94+8Y
 RrSBEKguibeXcFZGJAmIK7PcZnyZEbWIYDtK9/bvK3tIgZBpPvzQx9yCol1xR/O5FWG6
 oXMjWM0BEA6/5Lm48SBsFa8wOGIL2TjyHCFHcnz9lORT8H/J3g6PYN1f/Fad0T9EqEIy
 DC0TWjBKFThlTYKRjngnIw3Sdu9tfzjadb8J705bHPRdxpjkUmIjl/RRxwmkGY7JKFdm
 uSHNu2ijzGCeMu3o/GZdOQoxS19Q/M/wqk3l+Fc/nZ38POTdFCIpF79cgFXVEbqUsTD2
 DOJw==
X-Gm-Message-State: AOJu0YxGX0M+kb4OnpPCpKXjt0HbXrvjvX6Vs1NBE1XQcdLOg1aEKz9F
 8xofq4zY4QE+FAQ9Bhyvb3lwXAFyl7GX2UqLh0KSG2X3KDuiAwKGUu6mtjGbhhEeUs4J3wfG31A
 U
X-Google-Smtp-Source: AGHT+IGj5SpZTzPrvOMqtRSJFQ/MwVkQKSsOar9HufifEfjMdkf1FJvkeawtE64i50+QaVwfMW2nHA==
X-Received: by 2002:ac2:5486:0:b0:52b:401e:1b5e with SMTP id
 2adb3069b0e04-52bab4d30c4mr3026175e87.17.1717669090328; 
 Thu, 06 Jun 2024 03:18:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d29653sm1153323f8f.21.2024.06.06.03.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 03:18:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 12:18:06 +0200
Message-ID: <20240606101806.579260-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717669090; x=1718273890;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zr7YQPxXedTwam/PkUqFF4Cfk89jLM+LstKy2GwL8JA=;
 b=ruwMdDug2UReShej7eUJ11huUluyTYria/ktqkCjWBdweGxh1xbqFrKOq3SVmlvA3E
 8ZXBlq6Z+38pLKwusBWFogg8lTyZQaQ2WZ8qwTbnEdX6u2+8nxu9hJymQ11ltaMYZbOM
 8xU2X3zG1J+F7mYp7vr0fgzG7WOSX2adOaqZU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ruwMdDug
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: add hashes
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
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds .hash files for Linux, Linux headers and U-Boot and then
enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 1 -
 .../stm32f769-disco/patches/linux-headers/linux-headers.hash    | 1 +
 .../stmicroelectronics/stm32f769-disco/patches/linux/linux.hash | 2 ++
 .../stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash | 2 ++
 configs/stm32f769_disco_sd_defconfig                            | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)
 create mode 120000 board/stmicroelectronics/stm32f769-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index d0bd179a5c02..35c8c0a59c7f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -333,7 +333,6 @@ configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f429_disco_xip_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_sd_defconfig lib_defconfig.ForceCheckHash
 configs/stm32f469_disco_xip_defconfig lib_defconfig.ForceCheckHash
-configs/stm32f769_disco_sd_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157a_dk1_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
new file mode 100644
index 000000000000..49a2ba85a7de
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8beb69ada46f1cbca2f4cf901ec078846035c1cd925d9471422f65aff74243ba  linux-5.15.108.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..7cef5b688ec3
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index 725c985ec04e..952d22cc60dd 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_m7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f769-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
