Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD93EC77B6C
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 13:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A4341E0F;
	Sat,  8 Apr 2023 13:47:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10A4341E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1keBIjQ7N-sw; Sat,  8 Apr 2023 13:47:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 102E341DF2;
	Sat,  8 Apr 2023 13:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102E341DF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1255E1C2E82
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 13:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFF8983FF8
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 13:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFF8983FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ni9r3FjnhALq for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 13:47:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C88F82287
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C88F82287
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 13:47:34 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id xi5so2756975ejb.13
 for <buildroot@buildroot.org>; Sat, 08 Apr 2023 06:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680961652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=twBToGCgUgneWAz+U/oWiWpZQqbm5ZYs6Bza1m8gtg4=;
 b=q5UW2tmI/r3Jg3Zx7Ex43lFxVmlHZL6TexwnRvh1gtH0LBH7VXroi9hmTvKLAQxlXn
 wKGISI5drbLmFOonIXVvXRmQU8R66YCu4T90LV4BEYJqrBD5mUnwmyvM3jDBeFaNzH4j
 xfMM5UBj7B0wlxYrg7zSHKZR+/EyswuiiDi8aJ52rDOMiEXqpKztCkfAhEGLdAVbyZGG
 mePN38SxT+CGx7vAGbwYyIiq3uYTEA4sZhj1xhpG35/c1uDSuSeoRRbURJfjHB7eBQVL
 AM/wUWsNAZ34H9mTvPt34BHUz5xGjSJR95RL+jup7f5YnV2v99HCtsVqDSa/Uu7EFHtB
 olqg==
X-Gm-Message-State: AAQBX9fny214D2T/g5JgSrW4yAzw5OGfgT2TyWEOSuMLsNc8+YIClnU1
 ikLXkCoQ1JxkJBdJ3Rk3u2wPMW2L6HY6xNePN58=
X-Google-Smtp-Source: AKy350b8oWFXDkrgyI2HkHy6+OeDrJQGTzIa6VGSzbo4HDHtwl9mbK52+MQHA/Yy5yA/1uE/V4K9jQ==
X-Received: by 2002:a17:907:7889:b0:92b:eefb:b966 with SMTP id
 ku9-20020a170907788900b0092beefbb966mr1552155ejc.0.1680961652285; 
 Sat, 08 Apr 2023 06:47:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-116-81-248.retail.telecomitalia.it. [80.116.81.248])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a50f687000000b00504803f4071sm1382691edn.44.2023.04.08.06.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 06:47:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  8 Apr 2023 15:47:13 +0200
Message-Id: <20230408134713.244958-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680961652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=twBToGCgUgneWAz+U/oWiWpZQqbm5ZYs6Bza1m8gtg4=;
 b=r5exeqKtuK2xN3m5rbIud7TelCaKN39ghmwhPD1+wZciZcOMOUp1bCtkS80Cnaxgz8
 3IFlFKgBIawmeDO0KfsGNRzgmi7AoN+9wyzmPnPYkaXX/IcbiuCybAegb1CH/MD0j3Jg
 dChVKUkexB3uTczxVyeWDwFDAzNmhv748VQpc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=r5exeqKt
Subject: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_sd_defconfig:
 explicitly set U-Boot version
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
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The version of U-Boot must be explicitly set because if you keep the
default setting, the bootloader is continuously updated in buildroot with
the risk of building a non-working image.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/stm32f469_disco_sd_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index ea1361efc02c..dc00a47e1da2 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -18,6 +18,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
