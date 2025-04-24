Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70998C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 06:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03A5C80C7B;
	Thu, 24 Apr 2025 06:01:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-NjZbniYTZx; Thu, 24 Apr 2025 06:01:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3451D80C86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3451D80C86;
	Thu, 24 Apr 2025 06:01:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BCAE12A6
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0E826078C
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmdGfCQjVvJU for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 06:01:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B9F776062B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9F776062B
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9F776062B
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 06:01:51 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5edc07c777eso754236a12.3
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 23:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745474509; x=1746079309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FL0mfAFu6W7gb5XqOUegtsaXWjvq9LqR3MFb5gL0Sx0=;
 b=AWrpGll1bvk6iA/AHNwgrxOMYmAG5bGZw9HyHbuFnhorwx6zuieMl3El6i3h9OAM9t
 a5cNGX9weJubitplDGo9IY/UsvzFY6dEw3rliCzeu+W16aAain385ETuR4zcIDnrBnWh
 fX2Wa/FiZbBsLfHVLJMtmu2Ht4FeoZqBwOSe4eZgIcCHzT8zZf5D7ci4ykAzgqPNvlCt
 aiN0QqXpho38oSq6RwqomLI92zKlsd3RzHSlSp0wTxRjSlWNFVlI5cO7iWqz/0kknYgE
 8XbnpS/0Xv0iE626thfeIHaM+oKoqdW0B7DqYLgWenqFfOEQUZaGj/JMRq9KCoSHWUye
 craQ==
X-Gm-Message-State: AOJu0YxLyiG0em1QIH84lMzfHykQo8K6LYqT7doHZFAiwpYPkK8dIT0q
 06GwE35e4dl6O76GwpKNihT1mvs4ecJEjG/BqsYWfAo/RWfMY5GWSEWGFbW5Os66E1CBlalxkqO
 Wh38=
X-Gm-Gg: ASbGncvJnInbPj5UtsIJ/GWLRApNvmXxqJkWiX+Ypz9juXb9w+F55lPvIJlEIBpDN1R
 +FkbK2rh6wckn/yY8FYTeC7WaqsuaY/ZghMyXnkbnvNIPUcV48h4Yp88Of2eLPhGDxKsk9u4vlh
 GQjx/CxKUFzBgSfOTFWpjw41/In2HYFHrFZ54iro/DwEBSlMWXAEtB9nHHRB+ngtgrM9m2JFUGm
 kan+2mPsaHX3enJRE7TsN0SBsyeWJOT98fWkw9aM/8AMzlzgcgfUQLtUtwoG1Gi5Pjt0VuuQGH3
 GLg/9jkB3j7fMLniHDnGpaITnQZ+aJfCn+9+gYsk2CyhvbxBiW7iI9tkphJBBVhhwuhR7ZNeYG2
 sUXOJQeMLrv6a1QbiziyL4bYcPOqrAwj1CrImIY5qzdhXoCaMfsTuzc44chaAFs150MaJuS1eml
 fJr06VnFQ=
X-Google-Smtp-Source: AGHT+IGUSfo8mxLuHCm98Inx/AEyT1BkwuWvP1aYnBrjIiqqkQpQQMxZlCJ5B21+yjI+UTD6WHlPdA==
X-Received: by 2002:a17:907:6d1e:b0:ac8:1efc:b993 with SMTP id
 a640c23a62f3a-ace57494c8dmr137289966b.44.1745474509140; 
 Wed, 23 Apr 2025 23:01:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-86-232.retail.telecomitalia.it. [79.25.86.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace59bbeec1sm49672366b.111.2025.04.23.23.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 23:01:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 24 Apr 2025 08:01:43 +0200
Message-ID: <20250424060143.2985301-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745474509; x=1746079309;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FL0mfAFu6W7gb5XqOUegtsaXWjvq9LqR3MFb5gL0Sx0=;
 b=RNBFyn/vAo8SK4Pz3V/ZFVEhblhPuzkWsVUWaASOYk32reeE1J+/ioxBw1Ij7ZDMwV
 vPgN/2/fFVYuBX+rbcMY4r0a744M89uOLDLpN+FXLpg6cz4d6DlZt/yTczF96OoN9VN9
 aGWRDnQ5AP/CMn0KFZzGx1if2RxHTIofhC6kU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=RNBFyn/v
Subject: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump TF-A,
 U-Boot and Linux versions
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

This patch bumps:

- TF-A to version v2.12 (LTS)
- U-Boot to version v2025.04
- Linux kernel to version 6.12.24 (LTS)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 9 ++++-----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 4885d0b08648..1213da86b178 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  475172fdbd87a153f123a57952672e773bdb6daf5b58a417d1a5e419fcfeec49  linux-6.12.11.tar.xz
+sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index 50674352d71d..80ea21b7cb4c 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 69f800240925..98c4839179c0 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -18,8 +18,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -27,12 +26,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
