Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C7DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 21:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC82081BFA;
	Mon, 31 Jan 2022 21:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RW477XuC0aLD; Mon, 31 Jan 2022 21:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1962F81BC2;
	Mon, 31 Jan 2022 21:25:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F7481BF973
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CD4540947
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BUlK9-3GHnE for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 21:25:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05FCA4093A
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 21:25:01 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id n8so29609633lfq.4
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 13:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UwM5/CA2TkmbPbeyk95vEUFU0qXIME9rK3PhIf8vKfc=;
 b=oPE8yS/meaYdEsJm7bxhTGLbxXIPwjXMjjZMHJNdfwYeafnTR8YAp1tWasKg/aTZq6
 Gz4si/qfKTibMaURRM+ZwM8FKnUHMgXq/HfsMW8N0V4lJL0xmLB23teMcBgwMYlUPnYt
 UDcwb7qYRmTg0n47QevR4GG3ZSR45pWByQWH1ur+tvwedF5guZD9dLDNWbD00iJMI2FN
 KxaV4bMZCdZBXLNCa1PAnAbeCZbfh3879HOQ6O5EIxQXzXIERYVC6ZgHkbxmGufOb1pU
 vF2QEToEnqrwnBI7ia3uvhs3Ob0yEibbQnC3HCDW98BQcRb0DcWIuQRjq0TAuRAv7kdJ
 Mbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UwM5/CA2TkmbPbeyk95vEUFU0qXIME9rK3PhIf8vKfc=;
 b=d/d76O2k11FALzDHrJOISch2KYFKwgg+GffToz4KtAbeZPctB6JTOhGPMe3i0h9MwD
 nWWiQx7Avy3EigOw4E1lzir/ylAL0ctSW1eNIVKoMxPfEIRdj3+7tXjxoEWSPh4JTtFb
 qfg9RS2vjPU7dmnSEXAHrrrImV2f2Q6+8+dgpfROJMJOAe/k2XszmFl1ocg1Ewp8g4ot
 KaUaVcbNEFVazPD7+V+squLZvI7ScJk6k4QXtwfvRrYYWuMWihOqoigQYjLTHXraus4m
 M/6oN7GWUOsXLxMxi0TR79xS6jkGM9O2bo5BApKZ+pa1skUEQSUPf89Iyunpi89R2nVC
 NzTA==
X-Gm-Message-State: AOAM531wkGy0iqn6cgAWwIhKl+c6xcEybQAEh5Y/nG3KHoZdUSkqa+Sz
 jOCAhuFKtLuzksdWZAD+S2+wiws1vZE=
X-Google-Smtp-Source: ABdhPJyuymF6y8Rn7jFwQ6cLiiKM/JW1jEsL/9my0CbmuXNUYDYphAFagoCsPO6U/KtmuI2miJ0gOg==
X-Received: by 2002:a05:6512:32c8:: with SMTP id
 f8mr17139241lfg.222.1643664299746; 
 Mon, 31 Jan 2022 13:24:59 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id k2sm3773927lfe.213.2022.01.31.13.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:24:59 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 00:24:56 +0300
Message-Id: <20220131212456.3176156-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131212456.3176156-1-geomatsi@gmail.com>
References: <20220131212456.3176156-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/orangepi_zero_plus2: BSP update
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump Linux kernel to 5.16.1 and U-Boot to 2022.01. Select option
BR2_TARGET_UBOOT_NEEDS_OPENSSL since U-Boot requires openssl.
Root filesystem does not fit into default 60M anymore,
so increase its size.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_zero_plus2_defconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index da2d3b4178..9d88b37ac9 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -2,7 +2,7 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_ROOTFS_OVERLAY="board/orangepi/orangepi-zero-plus2/rootfs_overlay"
 
@@ -17,9 +17,10 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
@@ -33,7 +34,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-pl
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
@@ -56,6 +57,7 @@ BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi Zero Plus2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
