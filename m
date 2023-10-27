Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA29C25B67
	for <buildroot@archiver.kernel.org>; Fri, 27 Oct 2023 11:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75A3543460;
	Fri, 27 Oct 2023 11:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75A3543460
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b32Oz5uZnbTG; Fri, 27 Oct 2023 11:47:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6378F43463;
	Fri, 27 Oct 2023 11:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6378F43463
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4691BF33F
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 11:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 358967075E
 for <buildroot@lists.busybox.net>; Fri, 27 Oct 2023 11:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 358967075E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vevyy5KimmZc for <buildroot@lists.busybox.net>;
 Fri, 27 Oct 2023 11:47:21 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2A3E7075B
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 11:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2A3E7075B
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4084e49a5e5so16130645e9.3
 for <buildroot@buildroot.org>; Fri, 27 Oct 2023 04:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698407239; x=1699012039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNLu5tAqbirU0K9g9mUH7Yx26BzBO31/ZtVp1eOHkLA=;
 b=Ic13+R6e+CWQKHdwBXaIdrOnkQGTsg6AowmqAi71dYbRswES5BaT49EMOi04q0FDIM
 F1objspDsiYA0nh2wbKZQFKUruPxsQDaOgDs8mOVdTyUS7FiH91h7HIMpo/ndJg4F/3M
 omk1NrZtcyCEJ410xZSGAD9CAjBB5qZJQ7M2WOTcfnIf+LsiA1Oe379dZMypqgKD7IJ4
 TVYXqVqbPNxSER86+2JPRf42fM5t//EGydNAnPg7XF5HGWSa99UVszqvjd0zEWVWdbzO
 GVyBRGyQO4b67UKHjjZN7+RH/KC+QSpzj8xNB6h0y5Yi+Z4NNVH2WWiknm66E4oDbW5H
 ARww==
X-Gm-Message-State: AOJu0YwLkR9vfWjd5bI39dOMft1PPdCKcZQ3QDbBv6tacIB6D9Il47u2
 RA/2kvasdKV5IS3J0Ix977jsjePUiE4=
X-Google-Smtp-Source: AGHT+IGUojoXwB4RJWIhmoL4Koh1A/M1XKxysincN320+7gYR0nBq6RjXZMAn7ffEzMULHjUfGQi8A==
X-Received: by 2002:a05:600c:1c04:b0:407:5b7c:2f6a with SMTP id
 j4-20020a05600c1c0400b004075b7c2f6amr2111947wms.0.1698407238670; 
 Fri, 27 Oct 2023 04:47:18 -0700 (PDT)
Received: from comet.lan (adijon-658-1-12-16.w86-223.abo.wanadoo.fr.
 [86.223.115.16]) by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c471100b00407460234f9sm1437713wmo.21.2023.10.27.04.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 04:47:18 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Oct 2023 13:46:59 +0200
Message-Id: <20231027114700.1904-1-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698407239; x=1699012039; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uNLu5tAqbirU0K9g9mUH7Yx26BzBO31/ZtVp1eOHkLA=;
 b=HWMuR8fYOrfiXwaytr7kslfusYwmPVKtCbaFhkhCG5D5n4mpxAOWpzfFYNzUk/9h3P
 G7nd8TuwjJCB812PKHXPORGkPsD8HzhcNmsrZUON8Shv9BR0cDHX+FCx6ryZHNSTRfbh
 QC6yxPta/0lgfeu3/PPVO1iw4eTPohc//Ntod8X2YBsQGy8vJBqE0wRjfwPbnxSskoq8
 urolx3OavUUZqG217rKFU3gK6COicEQitV9TNu4cC7OkAwla4zAMIBIm7RcKwWHfK4KX
 ET/G3x1FYS6bHpCS7FTWR34rBT4oYg4HY8IYvPXx1n+1FZUjsTFJBhECth7aq9bF+1Pm
 ALwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HWMuR8fY
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
