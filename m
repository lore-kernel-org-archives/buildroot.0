Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798B0C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 11:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F82840492;
	Sun,  5 May 2024 11:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-mFbgxDW5cp; Sun,  5 May 2024 11:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13DC5404C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13DC5404C3;
	Sun,  5 May 2024 11:52:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEA2C1BF36C
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB1B5822CB
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbf5h2Ag6zB1 for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 11:52:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E647F82120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E647F82120
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E647F82120
 for <buildroot@busybox.net>; Sun,  5 May 2024 11:52:13 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e8so6739665e9.1
 for <buildroot@busybox.net>; Sun, 05 May 2024 04:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714909931; x=1715514731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/1xgvYX3ezvgp+FYlAIutodNU3EBeXvf3OF83qLqnmQ=;
 b=r9g2rR7RpyKbDAbTHlV5c8cQQkBZlO5ClDn8uO9hxeLLyumgDSR4fnhdAWMaCq+xQP
 Ohm9pv8QLEZ2yR+CoSJEoAZk0CvRzvS2DYLCHABsvZbOL2YYmcMDI7cHalrW83bEMfMP
 p+zT22+Eqm2pfL9gMFN9Pje7AVNxN4kBxiJe+fY/Wsd+ykdWQNiUkNdT1B/56hfKPNzR
 fX7hk6/ct2Rpzi8Y3EI3aAiCyKfSqTFk/VTWsDVntLCwwidMC/JS+jWirmUQzCXUeAvx
 SEAxJThq0rhDzwGj9MCpeNF3LkOYIT6cYCl+QSBMQvPnHmNb6X+aQtHFJjNIM3sf9jOO
 DiZg==
X-Gm-Message-State: AOJu0Yxw02Myw9iXjT83L/UFBmHb/2UxnIiukfam9gn4ZPA9ecQo2V1p
 BvNLc+GIAIFOcxHj+GTmlUQw+KLK96NO3+oyBbOEHHfVE17a2UaLDdNr/D8Xfgd6JM0rbTogl3a
 +fA==
X-Google-Smtp-Source: AGHT+IEc2Wvhg4fQdZgQBt08kBqPFHxK6Kap1QdwyZp2DlkA8KYXo6TEJoZ/OW/XabduhLfMZlNXWA==
X-Received: by 2002:a05:600c:458e:b0:41c:83aa:18b7 with SMTP id
 r14-20020a05600c458e00b0041c83aa18b7mr5627991wmo.33.1714909931289; 
 Sun, 05 May 2024 04:52:11 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 bh10-20020a05600c3d0a00b0041c130520fbsm12254212wmb.46.2024.05.05.04.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 04:52:10 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  5 May 2024 13:51:51 +0200
Message-Id: <20240505115152.24857-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1714909931; x=1715514731; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/1xgvYX3ezvgp+FYlAIutodNU3EBeXvf3OF83qLqnmQ=;
 b=nyJNTyKTppTTZAgbIilQj5r6tXTUT/Qp3kSiDmetLfrJAMYfPjh3IKImme0tKrkS2J
 EewPBoSWkc0Dy0DyJj2IEmbyO4T4eXDncbjIqJJj5kVNo5XU/SnScH/oXTi4Zm1Cdfm9
 siaQbzbIbJ0jwcKm+5MGwpu3Jt54Wz8c6ABl2lBgfJpUULXNybdMhHCXaCiB3z+gZJWy
 6rOqZzzSzaCa1lPOZLZ6T3vuOojNtuoNrf/Ygr7LSBcmW1fTEupKxCe7xn1MSD5qn8ao
 8okxll7XLKu797StcZJuRXM5OWLz2/pBJ4Dt5TRx6Gh5JGHqztfIS+qFHgXYa3tQE9Yh
 qXwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=nyJNTyKT
Subject: [Buildroot] [PATCH 1/2] configs/olimex_imx233_olinuxino: bump Linux
 and U-Boot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_imx233_olinuxino_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 275dd98af..647292899 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -14,7 +14,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.83"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/imx233_olinuxino/linux-wifi.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -40,7 +40,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
 BR2_TARGET_UBOOT_FORMAT_SD=y
  
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
