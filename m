Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1A6E7C4F2
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 20:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 694E0400D7;
	Wed,  4 Oct 2023 20:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 694E0400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pn037nRWAGlx; Wed,  4 Oct 2023 20:07:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81C4F405B9;
	Wed,  4 Oct 2023 20:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81C4F405B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 86DB91BF3F4
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 20:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FCF9405B9
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 20:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FCF9405B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3goFVUK0D4pT for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 20:07:44 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E90E400D7
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 20:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E90E400D7
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so227641f8f.2
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 13:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696450062; x=1697054862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNLu5tAqbirU0K9g9mUH7Yx26BzBO31/ZtVp1eOHkLA=;
 b=DvIoJnMV4KITpxXSK8amJKzTRt0uKbm1jllSBZB0yPK7Pe7+TBR4jrWBg+Rn8gJ4FD
 Q61NB4oPO4vfxDOpVwIyKEWehrmRP1vi3tIMy/PYpo3SZZlcz8QmAvtcwFEFHjMjVxnd
 LT4qJylTG5NEvXq1J6KSMYdS5JVoEu+0FGp0Aldda3U64dtQZ5tsuL7hDKaHJ9N/RZo6
 JjjxU1G63cxj5XK/TYP5k2W57Whxs71CcfWsvTYgvA++yzNuGUtWH503w/2lCIcsVNSg
 1l3Dz6aGglTaVY+jIZojReAzeaC8x19JFqm3jZzeVAezF7ybDioZGM9nW9xoyPDO0GTZ
 NPaw==
X-Gm-Message-State: AOJu0YzDOrlrudpMLDtJmR3HeiL+nbwz+awjJ+5P886J04mnlm1uIilQ
 b/F3LnsSsrsSvJdBzOmZXy7+mUhnvUUDAg==
X-Google-Smtp-Source: AGHT+IF72R96cdDCYhlqij5bYy5NMlSXJ0cqQY7fcJQ1fk5vHMtPStdhxyxaTILVSh2skVJk0XAtSg==
X-Received: by 2002:a5d:62c8:0:b0:31f:eb6a:c824 with SMTP id
 o8-20020a5d62c8000000b0031feb6ac824mr2719990wrv.10.1696450062006; 
 Wed, 04 Oct 2023 13:07:42 -0700 (PDT)
Received: from comet.lan (adijon-658-1-12-16.w86-223.abo.wanadoo.fr.
 [86.223.115.16]) by smtp.gmail.com with ESMTPSA id
 o16-20020adfead0000000b003266ece0fe2sm4710412wrn.98.2023.10.04.13.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 13:07:41 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 22:07:24 +0200
Message-Id: <20231004200725.1952143-1-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696450062; x=1697054862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uNLu5tAqbirU0K9g9mUH7Yx26BzBO31/ZtVp1eOHkLA=;
 b=mFgf7WlrLQ9W/FG9cg6j+LmhnZu0Nt7lgrfYvaW1tJ1UNK/Ho0M3RodhVvfJ1CDJy2
 p6Ugf2TDw18+AFzx2aj5Yw/wv8+56Zh9F6yOEE1mecQdivWRpqcgvAHbNGwzsR160cjY
 2NVyUFusA8h1B6gZvP9npOGhrelYPi68ZNVoqNxuphB+10VvVqfnENWkegoXt4PPrt5l
 fzelCMUI99HdxC2jzo16F27eJ8/7vokWQBXg/J6NK9oQrW5tat6qDjdbMAd6GhNYVHtj
 RgNAjih3z4reP55IiQCIVgI1RKvnnro9VxxAIbwGdSsJMab+gJYg02bEiDtC0ncz4oNi
 BkYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mFgf7Wlr
Subject: [Buildroot] [PATCH 1/2] board/licheepi_zero: move board files to
 their own directory
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
Cc: Michel Stempin <michel.stempin@wanadoo.fr>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Group files for board licheepi_zero under a new directory. This is
to prepare for a new board also coming to the licheepi directory.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 board/licheepi/{ => licheepi_zero}/boot.cmd     | 0
 board/licheepi/{ => licheepi_zero}/genimage.cfg | 0
 board/licheepi/{ => licheepi_zero}/readme.txt   | 0
 configs/licheepi_zero_defconfig                 | 4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename board/licheepi/{ => licheepi_zero}/boot.cmd (100%)
 rename board/licheepi/{ => licheepi_zero}/genimage.cfg (100%)
 rename board/licheepi/{ => licheepi_zero}/readme.txt (100%)

diff --git a/board/licheepi/boot.cmd b/board/licheepi/licheepi_zero/boot.cmd
similarity index 100%
rename from board/licheepi/boot.cmd
rename to board/licheepi/licheepi_zero/boot.cmd
diff --git a/board/licheepi/genimage.cfg b/board/licheepi/licheepi_zero/genimage.cfg
similarity index 100%
rename from board/licheepi/genimage.cfg
rename to board/licheepi/licheepi_zero/genimage.cfg
diff --git a/board/licheepi/readme.txt b/board/licheepi/licheepi_zero/readme.txt
similarity index 100%
rename from board/licheepi/readme.txt
rename to board/licheepi/licheepi_zero/readme.txt
diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index 0d3115a996..c8f74a7f04 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the LicheePi Zero"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/licheepi/licheepi_zero/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
@@ -45,7 +45,7 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/licheepi/boot.cmd"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/licheepi/licheepi_zero/boot.cmd"
 
 # Required host utilities for building an SDCard image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
