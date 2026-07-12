Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED750C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 13:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A64FF81395;
	Sun, 12 Jul 2026 13:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KopYg8xlVUOe; Sun, 12 Jul 2026 13:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BA228137C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783861730;
	bh=jWdfgPW4IYBPyWm18jIhKvbDRXySNXRm1oNKdaYKguM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bMhMs01eAnumeQoYvlYT2WP48el24vj4E+7YksSLm3EU1QjKRE9SmVxpx9u13uqGR
	 hTenW70HG7AXVs5eCzG5U29gYyFMAxpFNz3EvQ1VPLJaX6MSGOjHm4jS9fYRkdKWJH
	 Ud5yI2R8yZsP4M3GBvdkJpc8dZzT5wJgnm37DBlToHz+307tGojGWewucRaHlpqvSm
	 pmFhDTqPrRBkf1LCUkF5W8ckR/AccBJyKaHtruuW0GOaMG7bm/2yuI1efVT1INc48c
	 3fD6AxKTkj09LZv+B4ni+cmm7qIKE6UT4l/pqnGVtZ5jMJp+FtK1Vb8knXSjOnTECg
	 ly50+NEu71kVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BA228137C;
	Sun, 12 Jul 2026 13:08:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 440C12EE
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 220E58137C
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZP799MTsKDyZ for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 13:08:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52FCB81373
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52FCB81373
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52FCB81373
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 13:08:47 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3811074a8c5so1744127a91.1
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 06:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783861726; x=1784466526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=crFkFSrc4fZQSh6WPW1Lmy4pETckMvUgNKOxD5aT6Lw=;
 b=ItESG1Q+f+SALbs2sJci414aX95YfzX8wuOeLX7EJDxY1qwcLcRnYJSbTzIVq6oLmq
 PEhQVsnqQFsGisNKiiKjTpt6VtCZTIdhDkR4riTGtmEt8O8PjaKfhvCL3SY0786RzhWf
 p+b8eHJp1rqXpXspMLpnnzF35sLUNv3u0uJZ7EVeYvCesKUpexpNyVAynchXJOyZ8Lby
 KjYMVfgavNtqdWiUQgEMw9erNkkwaSYezKQ5lTAPTMD23HR56T0g/304gUH1rjZijvNA
 qicYCO8hIuqytRP1/w/Ut2zAJaEMImuSictfEa88vK48BVSAtfkpM85bPhw4E+Qd/qru
 DwlA==
X-Gm-Message-State: AOJu0YxNsPygh10ayE2NPCczXHtjpQ7A5umACBAR1bf0VMMadsqrE3rX
 06UAhT+qlOsiLjnV7LcprrB54LVf8L/YQaxTowAQXOlvphpLCWhuFbqnQrzkng==
X-Gm-Gg: AfdE7cmE8G4uMPlsfZaEzWsA9h8jwGfwQifrlnxTUeSThq0wlCnH5bkUMLqjWv8qEP3
 sp+rLfpGeedPY5SYYur31BseETvymbmzvKQPM3xwkrvsbxt+5bS1LYmyNxi6NxKX2whgJqTM1Ua
 rh7KOK9R/NgABVJtc9W82LqL8U1puU4qazA/MC3wma5C0/iMo5gdZlwJW1w09kZRhmcJrRG4LJH
 aIwejcsL0Z9T7wkbhAaAbORQBEynEXvpESl/olxSW1OCEjmmomV8MgV0YWcnEJsLKVi4LEj3dKP
 JGHYCZVfZhsWVZR6hsC8dpB9fjWZAaCzIKIya3vpAV7zPBxKKe4qeWvQbXMs7d4TPe0JrCbII2z
 bA+Rnh6BXn3T2JEEoKOAAqyKUVsDhXpHYe73yOKApzxkPigaOhSHilov9Famn45zVkXrlPNsPVj
 8Xqgkk29bF
X-Received: by 2002:a17:90b:2f50:b0:387:e0db:bc26 with SMTP id
 98e67ed59e1d1-38dc77c61camr5123368a91.38.1783861726338; 
 Sun, 12 Jul 2026 06:08:46 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-313b4b97661sm27068953eec.7.2026.07.12.06.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 06:08:45 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Sun, 12 Jul 2026 21:08:35 +0800
Message-ID: <20260712130836.821439-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783861726; x=1784466526; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=crFkFSrc4fZQSh6WPW1Lmy4pETckMvUgNKOxD5aT6Lw=;
 b=Efm9un4xLYWB+5Ct7miCUz11nDbKMyIKGiVOo6ZmdmdBhGeyj7OMRohT2VoUAdcEpS
 tS4/SDOyq1S8bhaHSgMqn13VPS60AQx6m697QwGXEp4RgM1CVpoRAg0MJikc3j2P3Dbn
 PFaEBxvSgRzsrjt3gdo92YBrMUOwFW1iuOBwWtLEyW46lntrzw8H6jYmNoLuMkIV3iW6
 HyNQfEIn9XfWyWnqJuZoNXEVEeWsHyt46ONTWmQKPd+TiHZcqfN/3Av8rqvs1iiKPnJv
 8zdzICxhp/Eb96ZMlGbdD+MDItswzS8uuvu5WMcT/yAOlrkOWnHRJu8vzCNG53DGT2U1
 ddEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Efm9un4x
Subject: [Buildroot] [PATCH] configs/cubieboard{1,
 2}: bump Linux to 7.1.3 and U-Boot to 2026.07
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
 board/cubietech/cubieboard1/patches/linux/linux.hash | 4 ++--
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 board/cubietech/cubieboard2/patches/linux/linux.hash | 4 ++--
 board/cubietech/cubieboard2/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 4 ++--
 configs/cubieboard2_defconfig                        | 4 ++--
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index aac576b5f9..cd7c9607f2 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  be41c068e88f5242a19bccdbffbe077b18c47b45f627e2325504b4fab79dd1dc  linux-7.1.3.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index b6a925ea4e..ff6e4ed2e2 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash b/board/cubietech/cubieboard2/patches/linux/linux.hash
index aac576b5f9..cd7c9607f2 100644
--- a/board/cubietech/cubieboard2/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
+sha256  be41c068e88f5242a19bccdbffbe077b18c47b45f627e2325504b4fab79dd1dc  linux-7.1.3.tar.xz
diff --git a/board/cubietech/cubieboard2/patches/uboot/uboot.hash b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
index b6a925ea4e..ff6e4ed2e2 100644
--- a/board/cubietech/cubieboard2/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
+sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index 47d882c04f..217303dc47 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.19.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.1.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 0de3edb93e..a0d6d968c4 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.19.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="7.1.3"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
