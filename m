Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE03C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 181E284188;
	Fri, 14 Feb 2025 11:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0WUuiIh6UaS; Fri, 14 Feb 2025 11:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 440CB8403F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 440CB8403F;
	Fri, 14 Feb 2025 11:32:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CCE0EC2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB9EA40768
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35dHlqSWb9hl for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 546D54071D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 546D54071D
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 546D54071D
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:32:04 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab7e1286126so345715966b.0
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739532722; x=1740137522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IMy+MjI4f1wu9owsKq4areX71QjPlAUFTz86/acqUdA=;
 b=ttQS3QIEZSzQ/RbVECnBY5GU3ekNkk3VVGesqXlHE6OS4y3RsQuvWJb5sJtxPkMqGa
 8SFfj5q75CYgr6ziVfhzRPSvf1rzwOUYqBVgvb6/c3faU/clznL0QvJ2c4QMfmJtDNrW
 cxBkE88/I2MzCwENyHxWuGM+5LD5TtBLWSbb01Ge+VwD7jYAQzEFACqf4mIhgJIHkBec
 KfMTFq+ycRn8zTN77B/GMDYKSZeiZq7n3lcH1VkHZ9ob/7hbrDkOP0lDDkh3Q1c3BCvJ
 9EgORkEd4KZXizFINsP/HYCGxlgOKlGsCxoIFR3RzOg32jRWb+HVayfzFFTDsEIKCwbe
 OAlA==
X-Gm-Message-State: AOJu0YyncAWcyKnVj3OHufM2ct2MrvNK38P4llUZ57jWqOTWNE2A69P3
 MiVxXzoYL5kLGuSVJHccy2/hb2I6ez6WAjUeNUbPYcOebDAKefe7OQhFiUFTYyPsHZoNHq37ajq
 r
X-Gm-Gg: ASbGnct+mfXsf5yzV8opudt9dZTPNLadbgV1c7hK9v48uCA6rPpvgdy0o649WI58qMo
 RuPy245JBOhqXxT5iWdlxISMDzlEjuBdkp594ZaFXHzPig4UpGzkU1g3bD0VGGUGOvtRqlteKZz
 wnmGb2fuLiA7NspmBayba61Gg08XnXZNh01W3LCerqe3U81uBy0EKUOurK0mOD3ruQ54GMdObUc
 /SWUtdTCP5314Bw2MYRm0BDre8DK7klPU/de68J8HGgGBSWtBq+Sfo/xJgdHu9N2GXM7n3FSJ0/
 uUhSu4qANP4uhqkP+yT0DGhvZFeQreZRwRA0nEU7Kv8GitdsveaTyXKXPA6K65G3DwRGOWWBjXg
 YgMP8I7qq
X-Google-Smtp-Source: AGHT+IFrFLyzer+bPuqvb8SrBfuHeO9JpO7Wr9PPGcmDTmXJx4tMCW2R8FRcE1QZHRDO3gZu1/fksw==
X-Received: by 2002:a17:907:3da2:b0:a9e:b2da:b4a3 with SMTP id
 a640c23a62f3a-ab7f347dc2bmr1102905666b.42.1739532721958; 
 Fri, 14 Feb 2025 03:32:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([176.200.207.55]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bf5casm321668666b.182.2025.02.14.03.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:32:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 14 Feb 2025 12:31:57 +0100
Message-ID: <20250214113158.3584398-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739532722; x=1740137522;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IMy+MjI4f1wu9owsKq4areX71QjPlAUFTz86/acqUdA=;
 b=ZKeUaaOFbGi2Rt1WKFebNzqkGakXycewkXZZToV0gKeEjFOpS7el8r6yj9t2lxzWGT
 R8E+tlfiu42uicP40rpycxEnyhaUTgGe7+JPr9U0LNE7RE5901Rj0A/ol8sL+IBmgMJ5
 Wjn29tlbr/6N7HPPfnhizlRZLl27jeWObdVVM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZKeUaaOF
Subject: [Buildroot] [PATCH 1/1] board/stm32f769-disco: speed up U-Boot
 bootup
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

Updating the framebuffer takes quite a long time on this slow platform.
The added patch allow to avoid the following cyclic warning:

 cyclic function video_init took too long: 7280us vs 5000us max

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...9-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32f769-disco/patches/uboot/0001-configs-stm32f769-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/0001-configs-stm32f769-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch b/board/stmicroelectronics/stm32f769-disco/patches/uboot/0001-configs-stm32f769-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch
new file mode 100644
index 000000000000..a9a5c631b629
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/0001-configs-stm32f769-disco-Set-CYCLIC_MAX_CPU_TIME_US-t.patch
@@ -0,0 +1,48 @@
+From c1bb2b62b00a68ff710d8c5635f68c83a4b8c1c8 Mon Sep 17 00:00:00 2001
+From: Patrice Chotard <patrice.chotard@foss.st.com>
+Date: Wed, 11 Dec 2024 09:09:35 +0100
+Subject: [PATCH] configs: stm32f769-disco: Set CYCLIC_MAX_CPU_TIME_US to 8000
+ for stm32f769-disco
+
+Updating the framebuffer takes quite a long time on this slow patform,
+set CYCLIC_MAX_CPU_TIME_US to 8000 for stm32f769-disco to avoid
+following cyclic warning:
+
+"cyclic function video_init took too long: 7280us vs 5000us max"
+
+Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
+Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
+Upstream: https://gitlab.com/u-boot/u-boot/-/commit/c1bb2b62b00a68ff710d8c5635f68c83a4b8c1c8
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ configs/stm32f769-disco_defconfig     | 1 +
+ configs/stm32f769-disco_spl_defconfig | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
+index 1e09c224fc0d..5be221afd2fa 100644
+--- a/configs/stm32f769-disco_defconfig
++++ b/configs/stm32f769-disco_defconfig
+@@ -21,6 +21,7 @@ CONFIG_USE_BOOTARGS=y
+ CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+ CONFIG_SYS_PBSIZE=1050
+ # CONFIG_DISPLAY_CPUINFO is not set
++CONFIG_CYCLIC_MAX_CPU_TIME_US=8000
+ CONFIG_SYS_PROMPT="U-Boot > "
+ CONFIG_CMD_GPT=y
+ CONFIG_CMD_MMC=y
+diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
+index 787571dba0cf..7d4bda440685 100644
+--- a/configs/stm32f769-disco_spl_defconfig
++++ b/configs/stm32f769-disco_spl_defconfig
+@@ -30,6 +30,7 @@ CONFIG_USE_BOOTARGS=y
+ CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
+ CONFIG_SYS_PBSIZE=1050
+ # CONFIG_DISPLAY_CPUINFO is not set
++CONFIG_CYCLIC_MAX_CPU_TIME_US=8000
+ CONFIG_SPL_PAD_TO=0x9000
+ CONFIG_SPL_NO_BSS_LIMIT=y
+ CONFIG_SPL_BOARD_INIT=y
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
