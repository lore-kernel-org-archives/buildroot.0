Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB75C76196
	for <buildroot@archiver.kernel.org>; Sat,  1 Apr 2023 17:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C90CA41BD5;
	Sat,  1 Apr 2023 17:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90CA41BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c10l8dVFwiQ2; Sat,  1 Apr 2023 17:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FC5441B94;
	Sat,  1 Apr 2023 17:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FC5441B94
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBD021BF318
 for <buildroot@lists.busybox.net>; Sat,  1 Apr 2023 17:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2FEE41BEB
 for <buildroot@lists.busybox.net>; Sat,  1 Apr 2023 17:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2FEE41BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ly8IufoEOkPU for <buildroot@lists.busybox.net>;
 Sat,  1 Apr 2023 17:37:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BB564174E
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BB564174E
 for <buildroot@buildroot.org>; Sat,  1 Apr 2023 17:37:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id y15so32907995lfa.7
 for <buildroot@buildroot.org>; Sat, 01 Apr 2023 10:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680370625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uyHpvSFIoKVgTebtLu2wcVZjLes5vh0WZTA950sku6g=;
 b=4smU7P+X0MZy7NloRj3SNyMpPL2WPeMFW/1jYRxL+idusldLBgIng/wppey6IMvE2D
 qZ75Mk6dFg3mDbiFoD66gmDtPbYo4pvETf+2vU/5++PC9TfALOB4WNKVdl6zyWIfZHUA
 Xr4I6Xd/YOpgCuPNDDsw+zYeZq29idTtKtTAWneSgOGKmZrgUttoKcx5IRj2MGZ5SQ6H
 1TM127swXSrcxHMbzBud72zopahMi2LZTFGP5JHTnjPmNdED4Cm46KMNqRW4uXOPZJmW
 NwMgD7YOxe+ZVzTImsKqXwE4R6Ogh2PjjWEh2pQU3/KlBOHZnmhT6pRUbthh9Je80loW
 p+0Q==
X-Gm-Message-State: AAQBX9d9v8tnsKGJ8Ie0CLXKOcTlajTmhT4uNWSy8minNAW97DEQo9IZ
 6ygMPCvgttBjp9hv7pGten3a3n4RsdwjWixK
X-Google-Smtp-Source: AKy350YUFGlhtLC1bzJF6vBAqcqdQa9bqnmiVOm29YngcldXwgKvClpfblijdi0biDohtCnVa2gtAg==
X-Received: by 2002:a05:6512:143:b0:4e9:9f10:b31d with SMTP id
 m3-20020a056512014300b004e99f10b31dmr9394030lfo.2.1680370625086; 
 Sat, 01 Apr 2023 10:37:05 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 v5-20020a056512048500b004e8451948desm892056lfq.227.2023.04.01.10.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 10:37:04 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Apr 2023 20:36:58 +0300
Message-Id: <20230401173700.3341224-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230401173700.3341224-1-geomatsi@gmail.com>
References: <20230401173700.3341224-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680370625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uyHpvSFIoKVgTebtLu2wcVZjLes5vh0WZTA950sku6g=;
 b=GQvG0DW197iOqAQw78lB7/rrltA5DANs5jOYVy0fZ8wL+jsUKSSQiNliisKygQJbK5
 +U7yrTy93zrpcmJ4hV8PHn8PTvHoLrU/z1iAPrilyKhCYrrGA94Dpf9oiRz059dFY9N+
 S705u+soBIJ+a3/Mv1DA03yEsZhL+DR7Y5TLlvZ1h6zpA/ADJ+5w2Z8xpg4hIzat41s3
 P5qxAVlDJ86TW+NxZ6H0mT9aW3o8pFB7ljHGTpOwSl/obzkQXbCbDd7X3aDZ1stc3keQ
 u3lWex5UPTkWZG59Rwz9RPTRLvO4DE/VqOUCCxm65zp1TUeflgP2t6C5ynxxTbk8KRV9
 3ONw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GQvG0DW1
Subject: [Buildroot] [PATCH 1/3] configs/linksprite_pcduino_defconfig: bump
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

Bump Linux kernel to 6.1.14 and U-Boot to 2023.01.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/linksprite_pcduino_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index 806c4f0697..cf58e021ba 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -19,12 +19,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 
 # Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
@@ -40,7 +40,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
