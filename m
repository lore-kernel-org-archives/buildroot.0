Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D35C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 16:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96EB68293D;
	Sat, 23 Mar 2024 16:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2b4y0dMdrPsS; Sat, 23 Mar 2024 16:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12EE82974
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B12EE82974;
	Sat, 23 Mar 2024 16:37:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E86471BF299
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 16:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E275882974
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 16:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Dv1vYo8oqRN for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 16:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C479E8293D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C479E8293D
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C479E8293D
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 16:37:02 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1e0000cdf99so23073795ad.0
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 09:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711211821; x=1711816621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CqBOZ6Yp+G3MGmpgEoVpF0JHPsxQg+K5+F3muSDxDuA=;
 b=J5dAb3n7RyNmCouq8Ip9dYnc7W+gDcqRE917bwyOdwGf/xkH9sJdjH1yVYENQSScN2
 0dM5hMjvzH0ubPd5K+LHKRtTJQ0VlQBohe4sFWoOGOA/rH/+5Ew/xU5jOxB4aIphC1EH
 C1d3WNwGFDd1mnQZeHikT29ZBoKfZDlyUCVRi5atAhxN33gFHXZDwWM24WV0FIdD6lyg
 385We2dUDneWxSKfUX1uBY2D8v3HVwlowxcgwNedkxd+427BLFEdXDYe7qMHgMuikDFJ
 DDWdDbPyTeD2NM+k8aK3WdUQwm1wyglBhm7cJdMwUGEZTiCqkMIWi5xoofn8fkKNz8lL
 8UiQ==
X-Gm-Message-State: AOJu0Ywd7KOuOjP1aKTI1mKjAYd1NwdP9y36WrH67L7Ilfy9YmCUpu8P
 g2lZQwAZIf32K+8SZ8ZiB8N8KKCrHd4iDuVd+QIgWlEuPY+WRyEGV6sderOY
X-Google-Smtp-Source: AGHT+IHxSmGekIrp6RuBZoM0t6m2OluLiHJQbx9MDOvK9htS/0EVKuXB80x71B7+bbhKH1ubREEUIQ==
X-Received: by 2002:a17:902:7447:b0:1dd:7485:b4c9 with SMTP id
 e7-20020a170902744700b001dd7485b4c9mr2521964plt.22.1711211821185; 
 Sat, 23 Mar 2024 09:37:01 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 y11-20020a170902700b00b001def18c0cfdsm1741055plk.300.2024.03.23.09.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 09:37:00 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 00:36:52 +0800
Message-Id: <20240323163653.1299442-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711211821; x=1711816621; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CqBOZ6Yp+G3MGmpgEoVpF0JHPsxQg+K5+F3muSDxDuA=;
 b=WbpTOoEqxiT/7wyIK6TgQzlOO9z7PaIresEksyM65nE14FAB0LIKzekc910hBuiAFH
 XYDPyrRi31FeUGB7wF6Jak+yweisx2vgDJwLtiKXAhjqovNddXcmCnammwEyLpr1fny0
 d4HHHNeERxGkxjPNzchuFLSBPfTzRKt4wVoHpVFgMkO4SPLVX0h8zc3K6pbEar+zw27j
 +Q4CyWuVRIBn1d28LANd4P24CPmOHILIyIjvImC5cEYB3tjDkk9wRw3ByRdfpFs2eiG5
 h/HeWVQ2bOdX/y4QZeCZ7CxtoeahmZG8WlUlgzLf5TLV+RP57yVUQvhBWd9HcVefSrIr
 Ix7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WbpTOoEq
Subject: [Buildroot] [PATCH] configs/beaglebone_defconfig: bump Linux to
 6.1.80-ti-r34 and U-Boot to 2024.01
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
Cc: Lothar Felten <lothar.felten@gmail.com>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested on beaglebone black.

[1] https://github.com/beagleboard/linux/releases/tag/6.1.80-ti-r34

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 configs/beaglebone_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index e2d67019b1..064f283489 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -17,7 +17,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.46-ti-r13)/linux-6.1.46-ti-r13.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.80-ti-r34)/linux-6.1.80-ti-r34.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
@@ -31,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
