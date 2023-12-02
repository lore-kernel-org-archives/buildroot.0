Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61833C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 12:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1582960D6C;
	Sat,  2 Dec 2023 12:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1582960D6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsCGINioYlYz; Sat,  2 Dec 2023 12:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE3860AC0;
	Sat,  2 Dec 2023 12:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE3860AC0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 371791BF865
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EF6A42223
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EF6A42223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSqjuCjnjuF5 for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 12:34:10 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 980CA42201
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 12:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 980CA42201
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50be10acaf9so917992e87.1
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 04:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701520448; x=1702125248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=28sFjtT5EqQslbWceir62maRjl9ipyRRNYOb4UD1YLY=;
 b=P/hjt7JV01PRlhRxV6VtHDbYtWn3m/LXpWuyXEFyVWw+Gulz66Z1uPq2l7e4Qd6IS9
 Z25wqtVYMzlmzO0hyni6xb3f4yRnRGFGTweMAwFyIBrMrM8fcp8UEHLhVZuUrh7kCfa1
 eXXeXuUUTgoAF7qlqeUBZ6o7GSs/LoHCNlVL4pfoAlYhMBdmKPrDsmogjAZX34l5YXpz
 TRvE1QTCP8EbjXVZNnEQVqp/zkPAH9Znhjs+UWTLpM17A0m/N6qJsCuLcA0pEez/mgL+
 sbZ6xk6yf3cq26MjOWl8Nc5DMhMkdS56NEliHb8wHfe1Ahu7G84IxSztZItErkNjaFO/
 IBuQ==
X-Gm-Message-State: AOJu0YwElv03b7AXLEBkk7pIANia+TefhAIWdiuqBqTr4XIVlLbqqEUH
 RlwnA1chWHdlPCT4biDGHGPPT3cr4pw=
X-Google-Smtp-Source: AGHT+IGgBR8d7sK+FqNOVHA8pOR7CmceFeBlyMRfbbNLdPGEixZB8OfRVA2ynnGHlpQJqVfKhRi5+Q==
X-Received: by 2002:a05:6512:3189:b0:50b:e6e0:cae9 with SMTP id
 i9-20020a056512318900b0050be6e0cae9mr463796lfe.26.1701520447795; 
 Sat, 02 Dec 2023 04:34:07 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020ac2546e000000b0050bbcd68e8bsm705672lfn.47.2023.12.02.04.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:34:07 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 15:31:38 +0300
Message-ID: <20231202123400.2327151-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231202123400.2327151-1-geomatsi@gmail.com>
References: <20231202123400.2327151-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701520448; x=1702125248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=28sFjtT5EqQslbWceir62maRjl9ipyRRNYOb4UD1YLY=;
 b=VTLIgTrtaXR07/f27iO0KWfIBqqLtOqJITgojRfKqNLz1rKvdhYAeiSIXuzAB13I5r
 WVyB0Y0GAfnlDPWhnXRc5xHWrVsrCNh6RbEUbQ3/Jcj2wmPp6m+CwkQ6h1HCE980ojtk
 6nmX5fs9y8EnSqddYFUqVI8HR4ntkHZPYbpCNGVpO2nP2vT0Ju7c7nu6uXpX1OaACDSJ
 bEPTLs44+rNTcbqCxerz3RJzXDZW0GxQE3G5Wq/Lm7YtbhRlw+/UJQW7qRzNHTlBBrt6
 RauIoH0Vi3genEa4iSqvmDC2Q5ZKC7/wvHhh+uc+nGMj+h4MvDFGXSdkjq429eMQs/Yc
 d+WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VTLIgTrt
Subject: [Buildroot] [PATCH 2/5] configs/orangepi_pc_plus: bump BSP versions
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
 configs/orangepi_pc_plus_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index 9dbf808da7..068eb09636 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -2,16 +2,16 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC_Plus"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC Plus"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc-plus"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-orangepi-pc-plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc-plus/linux-extras.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
