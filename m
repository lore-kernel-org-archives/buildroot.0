Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597B1E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 20:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B50141521;
	Wed, 11 Dec 2024 20:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXdr_-g26Wkg; Wed, 11 Dec 2024 20:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C61E041512
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C61E041512;
	Wed, 11 Dec 2024 20:12:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45F581137
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37FDD41519
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ff_Zg5rqJaIq for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 20:12:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F378441512
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F378441512
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F378441512
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 20:12:06 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso3947712e87.3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 12:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733947924; x=1734552724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHtTOq75t+n+49kusGSwykA9fkmhCOJpAvWEdOu3TJ0=;
 b=WzvIyAt/n/mlo7ENpJVke3pCDXG5HHbAIJ/aV3FhRFS2ve21pj3J8Ni+lIZWuFYqlb
 W6222L81w1CIknKTFLZ2KXJXl8Ac8BD6FkGUSKCQo2wUGYHpKVGjQ97mgzLSLsZjovNV
 4SE+BBxA9stGNL5a5+RwW4Q+ovQQI6jbtsnhHk9hD4+RIHmrGFmFK6QIpq1SEhLgFMMs
 uPbMu2pndMBgrrfSlVyyscZWGSRMOx5ShfvWX+3mIL4oFEE0Fh5qTRk9EZRuHZoJsECA
 McAZX6k4Mz8YCR3WOvUMNAOq0GJYMJDcHIPVXJY/1+r0i6LXn192SG2eceSh2+uaB+CX
 CL9Q==
X-Gm-Message-State: AOJu0YzvMXcbuIMopGUc1bsWwysDsik5Uhlh5YVUoJru5v8QGqXcf/+e
 L9i6hO38K6443hrycYXyvpdohZ9iDjbcfx2wMazl0UOwS+5zrM9C0HQP+etT
X-Gm-Gg: ASbGnctgeZGKTQe4wRpJEeG9H4H6oMcr5KS/aqqxw/LwG6CZ4TMdf81uyojZONeCz++
 5+jW1o71oKzXZ3eR0cn+4rHOXzFNoIF+6k8J19fRnUXNacBOrUah/31tZ+ygaPu22PK1ZVOOZ9i
 AhaXjH97V07Yu+7QPgagZWo8S7vh/17C/6byG5IMVxlykDzwusclj5HSN84V4PxbiGuwbCNOHsW
 7Zvp64Xt5k8bO4ThaDe9ZBhFRdK18yo4fjB1CR7gHVf0OEjAAh6lCjR9DlvQA==
X-Google-Smtp-Source: AGHT+IHsxhxk6cP9bgieVWRbU4f7rKof/swywoz5/AS1MI9k/x4JXhUkJwsuXi5fGtSRDnRwWgiXTA==
X-Received: by 2002:a05:6512:3f12:b0:53e:f507:3801 with SMTP id
 2adb3069b0e04-5402a60be14mr1504561e87.48.1733947924001; 
 Wed, 11 Dec 2024 12:12:04 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-53e398cbf0dsm1638165e87.213.2024.12.11.12.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 12:12:02 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 23:09:41 +0300
Message-ID: <20241211201146.4057892-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211201146.4057892-1-geomatsi@gmail.com>
References: <20241211201146.4057892-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733947924; x=1734552724; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHtTOq75t+n+49kusGSwykA9fkmhCOJpAvWEdOu3TJ0=;
 b=DR0Z9h0PPXwDIS6WvH2DsUkXpap6Zf0Gwl+2aDcDjyGDAWlgXavcXweBFzIK+gabaE
 FD3MV2pzm7GoSyzv8GBTutJ+krrsyKP/Fbzh3rQ6tHu8e6uPu3P6FFx5onTw183pVTjm
 j3Xts291fcixKMVpe3BCeFEkG/bBvLN6RbZQ0BGtH98M3TGf3MtumRu7JyVbdTpLSImB
 6L1RiokxKawe6RSufBr21OBXSWQsE62LefUSq3ThqtnqCQ8q2TGar5Hq+urF0s9qZwdy
 YyRl9xTydWUBFYDdBUcgzMa88/mUPDbShPXlSsrho0HlfvtpueYr0ntzXLaQ1DsdcfEw
 bXOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DR0Z9h0P
Subject: [Buildroot] [PATCH 3/3] configs/orangepi_one: bump BSP versions
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the new Linux LTS release 6.12.3 and to the latest U-Boot
2024.10. Add hashes for Linux kernel/headers and U-Boot. Finally,
add BR2_TARGET_UBOOT_NEEDS_GNUTLS option required by new U-Boot.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 .../orangepi-one/patches/linux-headers/linux-headers.hash  | 1 +
 board/orangepi/orangepi-one/patches/linux/linux.hash       | 2 ++
 board/orangepi/orangepi-one/patches/uboot/uboot.hash       | 2 ++
 configs/orangepi_one_defconfig                             | 7 ++++---
 4 files changed, 9 insertions(+), 3 deletions(-)
 create mode 120000 board/orangepi/orangepi-one/patches/linux-headers/linux-headers.hash
 create mode 100644 board/orangepi/orangepi-one/patches/linux/linux.hash
 create mode 100644 board/orangepi/orangepi-one/patches/uboot/uboot.hash

diff --git a/board/orangepi/orangepi-one/patches/linux-headers/linux-headers.hash b/board/orangepi/orangepi-one/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/orangepi/orangepi-one/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/orangepi/orangepi-one/patches/linux/linux.hash b/board/orangepi/orangepi-one/patches/linux/linux.hash
new file mode 100644
index 0000000000..c4a80927a8
--- /dev/null
+++ b/board/orangepi/orangepi-one/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
diff --git a/board/orangepi/orangepi-one/patches/uboot/uboot.hash b/board/orangepi/orangepi-one/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/orangepi/orangepi-one/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 167527235e..11e407cde3 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_One"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi One"
 BR2_SYSTEM_DHCP="eth0"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-orangepi-one"
@@ -22,11 +22,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_one"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
