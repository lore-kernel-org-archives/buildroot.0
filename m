Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA53C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 12:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B1D60D51;
	Sat,  2 Dec 2023 12:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84B1D60D51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dgs31ke4bas8; Sat,  2 Dec 2023 12:34:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C44B560C0E;
	Sat,  2 Dec 2023 12:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C44B560C0E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA3F51BF299
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C174040158
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C174040158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7NEGblX7l1f9 for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 12:34:10 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 223D4400D7
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 12:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223D4400D7
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bee606265so124115e87.2
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 04:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701520447; x=1702125247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XqsWQ85MxuvnyQSm5iG6WbhFpv0ptkhg26aXDgEnQDE=;
 b=eoRNvdH74zUvTSmGmkItWqIA+sVIDTJgEOaLyXcHsFu4J0wgyqZ8BLdzAgZ7NZylRl
 x0vugtMTFZ6w+BKr1L2HL0Jd5is8osFG2QQ1CAC35CO62uTEHG916Mwg8I61HDsSj9kp
 oRhXlTpotQ5YN4/WAdZtrwzRd1q0c1yeaCK8Jdfj6xlQ7I4T0/dTGLuRBrHBLxg9u3Ih
 mn+EM7xYWgpdQ57VZaRsp2t+y9si3ou0hAAvy8cBWG0EoA7fETkTTpsmtM5GFeMFFEkQ
 W6xcvibSW7RlWyOgd1+dzCRzJa7s/LSrvd2oT3F0i9W8otYSwReNr3QYxeSj7CGSp6XD
 LK4Q==
X-Gm-Message-State: AOJu0YwL4V3Z92LIBRE81Rmr5DCgicXuNvq+9XmDx9bhtL/kCnAfYbcW
 htl78S9uRQLXuvwnUnwXiIEnBWpIW4g=
X-Google-Smtp-Source: AGHT+IGvp8aFMSJtuK57HP1OHi6iVBVb/2pp5veeo128gsW3mQYSmRWXV3ph3zwe5bcKkhJCU4UvwA==
X-Received: by 2002:a05:6512:6c8:b0:50b:ae1f:ecd8 with SMTP id
 u8-20020a05651206c800b0050bae1fecd8mr2079017lff.41.1701520446881; 
 Sat, 02 Dec 2023 04:34:06 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020ac2546e000000b0050bbcd68e8bsm705672lfn.47.2023.12.02.04.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:34:06 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 15:31:37 +0300
Message-ID: <20231202123400.2327151-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231202123400.2327151-1-geomatsi@gmail.com>
References: <20231202123400.2327151-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701520447; x=1702125247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqsWQ85MxuvnyQSm5iG6WbhFpv0ptkhg26aXDgEnQDE=;
 b=MgmJWaiFwuQLzEf00xVWYr4gO8WF27WQ7Gcf/oWPuAYfIEGRhVi78gyAmTNVxXVCBB
 nb4SMygQoW2Mf7OdUZ8G1fyYL8wgDUUjw7f54yCWXDrb9TLvn57rITDUC97WOwIfeMNZ
 7tLdqGrMEYhLXKSRHn5Wk4DS4AwU+nju3KX/gTht3OoIftLmtKoI5yuOFmXMC8JgwryG
 Bx1xCidqD7ADodBjR49vS27S2XuQNyx/WVYwYwdZ5/CiQyYO1QundP0ru0axnyEqi9eJ
 zQzvoUfkxZ/l58orthsVWzsNRCV6XjjCNehxjfm0UrrqzLN9u+k+GVyIRcTI7rkO55kB
 WzTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MgmJWaiF
Subject: [Buildroot] [PATCH 1/5] configs/linksprite_pcduino_defconfig: bump
 BSP versions
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the new Linux LTS release 6.6.3. Swtich to the
latest U-Boot 2023.10.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/linksprite_pcduino_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index cf58e021ba..2b215201cb 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -18,16 +18,16 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 # For kernel modules autoloading
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-pcduino"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/linksprite/pcduino/linux-extras.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
@@ -40,7 +40,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
