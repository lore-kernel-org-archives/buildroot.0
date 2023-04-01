Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EABC6FD1D
	for <buildroot@archiver.kernel.org>; Sat,  1 Apr 2023 17:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0A0C416AA;
	Sat,  1 Apr 2023 17:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A0C416AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NL59pS9lTZpS; Sat,  1 Apr 2023 17:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6364641BDE;
	Sat,  1 Apr 2023 17:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6364641BDE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C53671BF318
 for <buildroot@lists.busybox.net>; Sat,  1 Apr 2023 17:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F4EA60F51
 for <buildroot@lists.busybox.net>; Sat,  1 Apr 2023 17:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F4EA60F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlL2QLRW-qA1 for <buildroot@lists.busybox.net>;
 Sat,  1 Apr 2023 17:37:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E17F560F5E
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E17F560F5E
 for <buildroot@buildroot.org>; Sat,  1 Apr 2023 17:37:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h11so25952704lfu.8
 for <buildroot@buildroot.org>; Sat, 01 Apr 2023 10:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680370626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W9hEP0r7aNdAO61qNFOsZBgOXffNTKDF5toBebH5DiY=;
 b=TGd9RIPjnGJrgldtDJLzuxBdIpfc6Hg1ZdzqQ+efdutuOi14uBKd0dNrSM5oZIsJGP
 R3XW1QEBWsaWJW86IxHz8K2LG4+nTxPPHxnL3GP7s8z6hPJoPLuDqwEldUAZLnsKpjvv
 7pniRlv6Muh5Mjba1Cw3igRVaatgY3yYRqgZMN3706bFtFg3Yy+38Npzv9e3RwFwstoX
 c9pk1Jm1D5CAOq8YR68obAV1UxpWftTBwuCanWGdBSCVmrOLTtijX4ZokiCS2RIg72WQ
 yIogpKj8MpeZ2Xo+0B9N9sCNEJNhaA7emuzu+yyJH5GtVXTVjlmhzzJhY3cxdHi4EpwH
 TsJA==
X-Gm-Message-State: AAQBX9dp4vrp50sEYjBjVVkTjlGQ9Q6FoshnH8eyDNgSeqss+R3biQar
 saDhTJawberiF2T6zzjTawLoVL8s/iYNEaZb
X-Google-Smtp-Source: AKy350bnX0KYIB81q0gliIaekxczKLu2bLNI2Wuw5FgDJpx+eJGdaQZI/hMW8izs2VFmKzuYJTNu/g==
X-Received: by 2002:ac2:55a8:0:b0:4d5:c96f:f7c7 with SMTP id
 y8-20020ac255a8000000b004d5c96ff7c7mr9110412lfg.23.1680370626232; 
 Sat, 01 Apr 2023 10:37:06 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 v5-20020a056512048500b004e8451948desm892056lfq.227.2023.04.01.10.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 10:37:05 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Apr 2023 20:36:59 +0300
Message-Id: <20230401173700.3341224-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230401173700.3341224-1-geomatsi@gmail.com>
References: <20230401173700.3341224-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680370626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W9hEP0r7aNdAO61qNFOsZBgOXffNTKDF5toBebH5DiY=;
 b=c5lkQvzzXuNggRVqRWYWbs8TdA/B2IdFF3N0zp08Zr6k3XLxJc6fOLnM57ga2/BmKU
 gzSTUMo0OVl35ytj5X0zcg+L4ZaDjKr0Yww8Lq8wwuiPx+b6v7YfduqnSdrr9eq4kn/j
 pQ+TwCfSkkcibXL2sqdyRkj2wGKZSkfJZEeFpl9jnGNdNN4kwv5Yan69XduIdrNB2ksY
 Gohle4jAMAEl3fRw2h98c8L8p2h6KQL5kMxJ0ZcnVO7gNH3UC5UeIMfYpp/sOCmvFg7E
 DzBtWIAau3B3vcf9wZTxkcman+e/96aN/lts4ur2qMN5R1/jHupmIYFqyyhZ55XklO9h
 mREQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=c5lkQvzz
Subject: [Buildroot] [PATCH 2/3] configs/orangepi_one_defconfig: bump BSP
 versions
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

Bump Linux to 6.1.14 and U-Boot to 2023.01.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_one_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index ba128424a0..3f383e337e 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_One"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi One"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-one"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
