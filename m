Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B73C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 07:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C7340863;
	Sat,  4 Nov 2023 07:25:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C7340863
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nrv539d4XGJp; Sat,  4 Nov 2023 07:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B8940743;
	Sat,  4 Nov 2023 07:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62B8940743
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 844DE1BF397
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A39760E17
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A39760E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nj6NVN4NtqBr for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 07:25:08 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B00E560B29
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 07:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B00E560B29
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507b96095abso3507793e87.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 00:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699082705; x=1699687505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ppvn8Rvk3T67uZipeGKk0Uc9TqESSleZPBZSZJDPaLw=;
 b=ogZ/KH0OAom508SmY9pez5f32tWwOhQ0hpwWBZAV2bR9Zhfn6AaFYpCEmzY25rDSqD
 wOPbHq3MECU1Vap3Ls+KToLJICEElUC1KnHKUaah95sgYYmIOAwrzQfD0uMa/6s26Vda
 t8zKjIUBFmW2si4V7PkNTfbPzH48lwPd+LdslqHHKm8xuWhvuxMQkcffVBg49shOr5kt
 QhWU8SA152hyRnE4mquzinOJ4cYsk3u064ltCHVkfVW/YGIkh4mxOMcmZoE583IV3F6i
 a9pt1t+QpiW/FiwAn9I2RF13QnsLjlVEX/vXRF98BH0em8hZecNdnANk6YnVO1pMOiZw
 +ilA==
X-Gm-Message-State: AOJu0YzezFwQ8eHx7CBuvdaJGCovy2t/Y7K0fgwzEJqAMP2tgJWRXV6D
 ih4wyR9BDf53/EQLXGD7BiwhqFwhwls+k7g+zhP7pg==
X-Google-Smtp-Source: AGHT+IHp8yThi43lGMCi5vUMi1+uKl0C/hDEnVL7CyafPtBwfDhuTGkVWyQSGoERNU117PYXvkDaOw==
X-Received: by 2002:ac2:5928:0:b0:504:3499:7c37 with SMTP id
 v8-20020ac25928000000b0050434997c37mr17428246lfi.60.1699082704404; 
 Sat, 04 Nov 2023 00:25:04 -0700 (PDT)
Received: from jpl.. ([151.238.102.70]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d5292000000b0032da87e32e2sm3686742wrv.4.2023.11.04.00.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 00:25:04 -0700 (PDT)
From: Javad Rahimipetroudi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 10:54:52 +0330
Message-Id: <20231104072458.7369-1-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699082705; x=1699687505; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ppvn8Rvk3T67uZipeGKk0Uc9TqESSleZPBZSZJDPaLw=;
 b=OHL6MKY1VQBw87jgGdQ1kdGh5DHmtmCTIQkFcWA5lk4u46wnoGNwgdMyaOHJZPSX1T
 LGL4tel0zlX9U/rA8zAHr/OBpxumlVhdIWcjfahmZf988jWKv5SlBcS6FUOnYtHoRRd1
 lliIk9bNkaGa6qI3m8ylE71ZDUVF6rEN7rq0vvD0TdB2JM9J1XpGLpoct2UbyvlkvTMg
 oc5ZLZozBXDrqjs818a3PlTbWs2csit3cIAFonJ5Au0jGeymouxqKOYla/pnaE83FrxN
 d7lm87FgIWOB26LF2FLSyXiCYVrXGCiNBk9bBmLGcU3djPfwOU1MEWVmHEQ9P6FhwFKE
 EQ7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OHL6MKY1
Subject: [Buildroot] [PATCH 1/7] configs/pine64_defconfig: bump Linux
 version to 6.1 Linux Kernel and Header version upgraded to 6.1.50 LTS
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
Cc: Javad Rahimipetroudi <javad321javad@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
---
 configs/pine64_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index c454114d2a..e2549628ee 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -2,8 +2,8 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
@@ -32,7 +32,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/pine64/boot.cmd"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.60"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-pine64"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
