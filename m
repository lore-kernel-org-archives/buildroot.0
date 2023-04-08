Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EC0C77B6C
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 13:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8707241E4A;
	Sat,  8 Apr 2023 13:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8707241E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pDZgc1q1qaea; Sat,  8 Apr 2023 13:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A586141E42;
	Sat,  8 Apr 2023 13:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A586141E42
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B58831C32C8
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 13:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F35E60E37
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 13:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F35E60E37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6YRXFZOv6m-C for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 13:55:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5A7E60E33
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5A7E60E33
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 13:55:42 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id sg7so14190609ejc.9
 for <buildroot@buildroot.org>; Sat, 08 Apr 2023 06:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680962140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6zUoyjC8TkGdWTlmwp7ACBqEwYOW5QlHNHsZUaaGMeM=;
 b=oSiPdTJwil4WMopMNV24Yyh9ffFwJEnmOku5AeCy98F7xm1O2HyIvdkkLklq7ZJhpq
 zub4VrzxDM1bBGYlAdh1EK+LwEWfh1x3v/7f9Rwch/r2H1xk9CksRKaiinvey8JzfTZd
 CbZ/UpwUOaxWzDhvjfYihAj4YrcTN2owcW1EnmZzZX/3fOn7IKmHxkRHZ11QY3oupieQ
 Et5CXhqRNze1J0PcliRu/9soSLxzsyVFUwyMB8yyeFVHE0S32zPofxH5dfuQ70bGIGkK
 EVBtvMgIHtqA0fz1HSO5ePe1xIPW2uDJSXrYBStQ2wA9gOmajRcSSyTfq9XcsI/lw8ro
 RXSQ==
X-Gm-Message-State: AAQBX9cYL9K0vnoY824/HafoDPnManKU1Woh7EVXrBKl0S1ETv9/SvWd
 UjUzuL22a6xOMnQ2k9Clv/UlVXF/FGksRIGKu8Q=
X-Google-Smtp-Source: AKy350btxtnvPf/LmUo4SYEj9eftyix6Iv17yKX6cPP4fIsykYTlK5Pw90WiUdszPXz1TRDk9i1TPA==
X-Received: by 2002:a17:907:3f1b:b0:905:a46b:a725 with SMTP id
 hq27-20020a1709073f1b00b00905a46ba725mr2484221ejc.16.1680962140501; 
 Sat, 08 Apr 2023 06:55:40 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-116-81-248.retail.telecomitalia.it. [80.116.81.248])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a50d546000000b00501d39f1d2dsm2975025edj.41.2023.04.08.06.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Apr 2023 06:55:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  8 Apr 2023 15:55:35 +0200
Message-Id: <20230408135535.246758-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680962140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6zUoyjC8TkGdWTlmwp7ACBqEwYOW5QlHNHsZUaaGMeM=;
 b=TaiHUB1hwAz423NbnOEA6FpPp0YVWEYJhch7JCz8gzhAMT7heE4jaMw6yuDnGZjhmR
 zIcamElKtA71WUWcz6nlJw51t/JeXSFm/8p4t6StXe2gdOqWsJweZS91SvJxMNjGimrA
 Vt9hPsmGCtTWkYGEfmcWvmsx+acWG6i5ILJpM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TaiHUB1h
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone_defconfig: bump Linux
 version to 5.10.162-ti-r59
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
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/beaglebone_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index c2d444c3ce6d..3e7ad8d4027d 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -20,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.162-ti-r56)/linux-5.10.162-ti-r56.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.162-ti-r59)/linux-5.10.162-ti-r59.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
