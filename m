Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B3BC02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 827508456A;
	Sat, 14 Sep 2024 11:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRp_rcDxHKZM; Sat, 14 Sep 2024 11:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DDFF8453E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DDFF8453E;
	Sat, 14 Sep 2024 11:43:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F02F81BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8086072E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6O8vkL4oltlQ for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:43:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B6866060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B6866060C
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B6866060C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:43:25 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2054e22ce3fso32347455ad.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 04:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726314204; x=1726919004;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hQYOomzhMnPVLYpcIBlV/vFkfQHIGaV67pOnDFUaqLo=;
 b=JMDo3Q7nXPlI2b0ej1mrFBofKVDJ+1CQcmGk5EZdjat9rKL62k/C9w0qkimDgy+hXm
 BAAdozxOqXCe1vl09kSinXPnZ5ISv8gBhFm5e7buV2MVxAhDqIoAVTHkxTMEoeVc/8P3
 FGFCom+Y6qv+xxyqigItfL4YBUuR91i81FNZ4hayq9X7oeM6GdubX6ljSFnAZVckHnFu
 YSCZOQjTyv/YmhzxUGaE2LSj0h+AmLW/ntCwajfXuasM/4x1eJ5+TTgT+JAxs3V3D2K8
 uti+3JgAwzUgb6nHl9LxG4EIU0SOvmmynF3mVaS2YWTBlSwENkqlkJ3ynfRIDLMUaG9b
 OyaA==
X-Gm-Message-State: AOJu0Yy/6f4i6sIzFcrGMJdYMqfBLgBxf1ev2eRuGXV94a2w41Rxslkl
 tIBOIqakfxyidEqSKTnPgqsXRtQ7DDWoiVYGixz4Ik+QK4z2p4rnZwCTzg==
X-Google-Smtp-Source: AGHT+IEuS+Mn8fIfSMbqbhf3BON89jqFqUSR8wS1c702JP05RzVJI92YSOxPC2jrwUgUxSiVkFHM9Q==
X-Received: by 2002:a17:902:e5c8:b0:1fc:2e38:d3de with SMTP id
 d9443c01a7336-2076e315577mr151707285ad.7.1726314204349; 
 Sat, 14 Sep 2024 04:43:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f375:804a:5c89:62a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2079471af10sm8446185ad.239.2024.09.14.04.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 04:43:23 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 08:43:17 -0300
Message-Id: <20240914114318.1912121-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726314204; x=1726919004; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hQYOomzhMnPVLYpcIBlV/vFkfQHIGaV67pOnDFUaqLo=;
 b=Sbd/azFXgiGVjO3DsQUUhD0MXifseCZpQko5Thpt/YVn9qmFHhhNainHYykR/8reTh
 0UafYPKShgoKuP2VOobcYo4BaXdpTkUMRzT8306Wk+/BmCWYKdMdLebw8jL1lw3LaWBN
 NP0HoJzzcnzkcyx2Q9jo9BO3j2CWue5HV18K3SRC2qv4gxZ1iHrQygdGfFTbTixMMvma
 iJ2Yfx97IQ73RLDAkjNxV5LCs+vBNH4hn3kXNtKGdGX3XnMKnIVsgfH9yfrghxeJYUDL
 LmKL5YLUGIZN54n+FkPQQQh1NukSWmC+eXAMBWX6T0TILQLtd/GRAvJkKYG6DWgugkyS
 tzvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Sbd/azFX
Subject: [Buildroot] [PATCH 1/2] configs/imx7dpico: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following
build warning:

include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
 1471 | #  include <openssl/evp.h>

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199869

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx7dpico_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index b0a4b3dd12d1..eaaa0202bb16 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -26,6 +26,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx7d"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 
 # wifi firmware for brcm43439
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
