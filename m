Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4B5C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0F481D24;
	Sat, 20 Jul 2024 20:17:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbaF5gx18xKI; Sat, 20 Jul 2024 20:17:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3809E81D34
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3809E81D34;
	Sat, 20 Jul 2024 20:17:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E33901BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA4D040151
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BSkbh7y5HGZ for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:17:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFCC3400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFCC3400D8
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFCC3400D8
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:17:12 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efdf02d13so419279e87.2
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 13:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721506630; x=1722111430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9B7H98l+ru4stQfo1q8KJX9YQEi6QYvlQfucTtOyyI=;
 b=xKOAVClj8nYQcqVwiAd4n1ChUZe0Ty+dHP3ElqY/gKO4BxAK4TJNvNwm5EDY8zSeb7
 9z+7ExvCrAvuQ9VKNtoOWi3F6+lqm6fcy7Yg6fr/2JqkehIzXnO7Fk3N+YyWEEvrc02g
 wb9I8KsBAdG7KeeJdIVPRE6abvUDm3unWtgbk0RON6IxmZTkRCkfrLDgqEK7mJaE0b5D
 1LXx9SE9Cjz5cO5Lqm5aFEs8SvA4U5SQI+RS9jVA0qD4IXGysMKcWsEk+LriIqQI4X67
 u30KvvfZKSEMlpUrCJU2+4bLeZHU5A544bdVQhZkUIVr8m9tQ1xM6+Jc1GBxR1jgZSj4
 QLhA==
X-Gm-Message-State: AOJu0YwkZdVuiXLnrdrkFDDdaF+t8a4ACJgTI7qY+Kb4KOMa1lITtVf0
 4KY0YBuTaJmKigsKKNUtO0TqHqGLa5OoiL5gSaWRv93qoRh12xC1kPN3V5ap40Wz36sPdlQS9Ac
 JfMY=
X-Google-Smtp-Source: AGHT+IG183bg+G8XkdkuQIEGF6O8dmmKojkpu0OvFPUvgaTXXeyl//QM0CzEKkDu5Uao60aUVcs+qA==
X-Received: by 2002:a05:6512:a86:b0:52e:d0f8:2d43 with SMTP id
 2adb3069b0e04-52efb53bae5mr1736523e87.17.1721506630063; 
 Sat, 20 Jul 2024 13:17:10 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-80-180-25-123.retail.telecomitalia.it. [80.180.25.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7e7871sm204723766b.96.2024.07.20.13.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 13:17:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 22:16:55 +0200
Message-ID: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721506630; x=1722111430;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e9B7H98l+ru4stQfo1q8KJX9YQEi6QYvlQfucTtOyyI=;
 b=FRaWLPq5obSwjFTt7sRFmHHbwiaxV8C1+Vkekcb6Mq/I3VQyVx6EMgT6kXrPWaCu85
 yIgP2rH5reLfRr6DZfwbjYvg3jvwd9vKAIT40hTjf40iMbkZMPx992qycwUv5f6xUkMs
 1aOir5k3CyanysU8JS/IrEDLSLXCtyj05MUWg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FRaWLPq5
Subject: [Buildroot] [PATCH 1/5] configs/beaglebone_qt5: bump U-Boot to
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps U-Boot to version 2024.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_qt5_defconfig                      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index 4b82872f31e0..fe9b4f53dc63 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0d438b1bb5cceb57a18ea2de4a0d51f7be5b05b98717df05938636e0aadfe11a  u-boot-2021.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index e09a88e21b2d..6201507770aa 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -33,9 +33,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
