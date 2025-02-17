Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B71C021AA
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 14:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4735D6063A;
	Mon, 17 Feb 2025 14:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rul_9qVt8F0m; Mon, 17 Feb 2025 14:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C5FA60902
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C5FA60902;
	Mon, 17 Feb 2025 14:34:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0CC4DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 14:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE50540410
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 14:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSUz1TCXp1u3 for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 14:34:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFFC240258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFC240258
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFFC240258
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 14:34:51 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e5372a2fbddso3384220276.3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 06:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739802890; x=1740407690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=os+ZtxD5ZMPz4NAdbjFw/iiMbBcpgM5GZSn4tdykLjw=;
 b=eSSMJevL0aA6j6U1pis6okzEHgyMaZisr1/Eg9xVRhcppnu/QqYRiA0eZWWRkF7bjn
 9TPeQE6ElBhpkEnDgUb4VpUDA6UT5h3Dqfgj4WJnaR657yfoc4VyJVZluRw2bO/1RsnN
 64tO0Rn1thuzEnx3iPojyJJxCiy3y1T26nNmekwTG3SypmwgoeYQfaFJltdjkEjEF7Zs
 7CYLHg+Plz0e6zLkpcIskfTiH8LaeGOgjxAL0icos9VBg//Dv70nbM8OpGvYcG3DXBPV
 xHRuG5l1XJeCZ4odnTwqhwXQeI+ShZ8Ootp0tFxskvugNAE6tsQl96tqsLxoi4JXhWdl
 +ueQ==
X-Gm-Message-State: AOJu0YxDfUKsM8WwXrcmw3m3igAdTbCazT7dmZ+vL1Qlu1qmXeGi1fvW
 0ijipKPbi6HFDu1oYHZ4wF/TT+2i+7ylH7NoBZMcoXrmo35JemVO4Y2MXQ==
X-Gm-Gg: ASbGncsGFFJz6y+KcyQG+Q5PVQyM1lK3FwEIrJvHqkxFI4ran30xQDUBXO0Ct7IlkSL
 jGar1ERFflRdhfXd41j86gyv6hpgNry92quTZkY7c7s001m5IPDZvGoFmwpy3gG8ueFQ5lEmeic
 M9qP09uGX9WjXZ/NSbP8KSGUYuF+irxe1aaEOaF+uvZqtS8fWNtw5NIsGQgkaC/qJsFCfHOKxrl
 HQx2f1sjje6HHa1jG+15WUbR15W9/zczwaHjFdPSrKwxrHWdpdv2Tin5OPgyKJBtuek9ydE9ZUn
 e0z8FgFj/hOR
X-Google-Smtp-Source: AGHT+IEMO41T2TN7gDAlnSCXH7t9pvv2n/JEKtcQHV34jlFowhwv1jfbY9FiQaxa9krN8SOWPPQGrA==
X-Received: by 2002:a05:6902:1407:b0:e5b:5fdb:9afb with SMTP id
 3f1490d57ef6-e5dc930368amr7411441276.44.1739802888534; 
 Mon, 17 Feb 2025 06:34:48 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e5df230815fsm223703276.16.2025.02.17.06.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:34:47 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Mon, 17 Feb 2025 22:33:57 +0800
Message-ID: <20250217143422.1853181-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739802890; x=1740407690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=os+ZtxD5ZMPz4NAdbjFw/iiMbBcpgM5GZSn4tdykLjw=;
 b=DPiQBBt4QEmrJwAwkN1YTVoDO77DnYhkePUq5FzZHR7IbOvdka87IRSUJEgbzIF6MX
 WjOr7OgdVEKA06t9wNuKHFWQLAsdURuDXlqDiJxg0f+A+WA/TzOqgQGrv/a6HgB/bOsQ
 wWzr1NZKHL5tRL1hrVbrKz5RZBlep7LlJCAX1s1EyyHf0h59Hxm2Mf8+c28InaXVI/wn
 /acPQEqEBeGNiSHPed7GN8Tx/WQcXjbJaw1VIbbSxs4la24tGMEeBxIXdiwmPrxFYaQG
 9mi9UyOJTIss3XRs8/gEuSbCTSUgVQgWhR1jeRq6w6Zv6B/DvrMsnWiVJvgS31Fi+q5c
 zCWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DPiQBBt4
Subject: [Buildroot] [PATCH] configs/cubieboard1: bump Linux to 6.12.14 and
 U-Boot to 2025.01
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 450cb12423..2e30d90bb1 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  39207fce1ce42838e085261bae0af5ce4a0843aa777cfc0f5c49bc7729602bcd  linux-6.12.5.tar.xz
+sha256  9423f4bfb4d875417e39cb0b017b5499fea47da56119f0cd28a201735d898f14  linux-6.12.14.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index 904fa56c02..50674352d7 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index 6fcdfecfb7..4a4d932f32 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.14"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
