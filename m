Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1A6C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 14:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98334605F5;
	Sun, 14 Jul 2024 14:21:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQjNsre3Ipvy; Sun, 14 Jul 2024 14:21:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B170E60610
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B170E60610;
	Sun, 14 Jul 2024 14:21:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E27FD1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 14:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF5BE810E6
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 14:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXsneT6x0NUB for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 14:21:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8C10810B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8C10810B9
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8C10810B9
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 14:21:27 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5854ac817afso4342300a12.2
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 07:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720966886; x=1721571686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MCtKe9+cXaW9gNxl0XkmiC7IC2sWlxercPYw1xDyxRE=;
 b=b7mU0qZaledsN2XIvA5+RQZQKFxgH6c+Auh9wvrkoV5mwUCFV3xkdhi1kZcaoT3QM5
 tjC5qqc+t9ePqpHV0j3+SqcvmsCuolnEOMH7EPp1nJOmLz4OK//6JzN4ui2ML7sx3k9m
 FU0a7lFT3JtgdlWauTFOa/YriT0S1fvcjhNtuSJAGDtLmRZNUeadscBj20W3M72oL9G0
 9/V9GiMl1EbyGnCLR+36pBoxBeQWecMmchR6modLlDrw7ct5bssHYxKI6PCnVd1bNWIU
 Pfxh8AQQOyew2et9YbZ45xGHNy1g3NyeKiWnWWtP5WTrqdSoMu4Zbr4/82d/p5Lbul8b
 MVKw==
X-Gm-Message-State: AOJu0YzAYkgglyC7ikVkvlnBYSL30U1NnxlcM6IBW3O9NReqg11PgApI
 M/T7MA8OlwJ/H2ZV1Uv94TYxmNW/+fBLfD5Ortw0+Zp5MrwQMaSxH656+Mt43xoHnlCOqZET/Eo
 /2hs=
X-Google-Smtp-Source: AGHT+IGCK5vn/w6l/FXwA9/PTAXdzdAoObKhjcZYqoboLqDSnN8BDnA/8O7QKoT3IuWYFCZWgWYvMA==
X-Received: by 2002:a05:6402:17d4:b0:582:9fb8:11a1 with SMTP id
 4fb4d7f45d1cf-594bcaaf426mr10379205a12.35.1720966885551; 
 Sun, 14 Jul 2024 07:21:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-44-29-159.retail.telecomitalia.it. [79.44.29.159])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b24a77201sm2118396a12.8.2024.07.14.07.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 07:21:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 16:21:15 +0200
Message-ID: <20240714142116.3479594-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720966886; x=1721571686;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MCtKe9+cXaW9gNxl0XkmiC7IC2sWlxercPYw1xDyxRE=;
 b=FfmDTJzrM7UhrrwGrb6b78yYrgYWrVtfyryZvy0aW30FHHJQ18QTr3N27Gj/1B7YYw
 dLM6f5/O918stwmjHvqBoO/CdK3r/WKqIyUjB2aaisLk/j38RpbV3tmltDCHp63OAwZ2
 inH8ELzLRDZsu6XSHn/YTJ+mqew0CTMmfsny0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FfmDTJzr
Subject: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_sd: bump U-Boot to
 2024.07
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

The patch bumps U-Boot to version 2024.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash | 2 +-
 configs/stm32f469_disco_sd_defconfig                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
index 97a2b4eaf95b..fe9b4f53dc63 100644
--- a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index d440d6d2017f..c00c043896a3 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
