Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18689C6FD18
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 13:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADCC660E29;
	Sat, 22 Apr 2023 13:41:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADCC660E29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zsHEoMamJGkb; Sat, 22 Apr 2023 13:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E356660E22;
	Sat, 22 Apr 2023 13:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E356660E22
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF4021C2909
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 13:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B030A83BF8
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 13:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B030A83BF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbz23-JWfwOh for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 13:41:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C30CC83C2A
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C30CC83C2A
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 13:41:07 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-956ff2399c9so394508466b.3
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 06:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682170865; x=1684762865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J4pKwixkeXg0r2K2gXnvYoJEemazPMp5Y3QSfUwbKmM=;
 b=KPYnLJbGPq6rCNFK4bahfqYUauH/y9v4mVZ/qOn1DzjNkhIwnGnarvdU+HsUvt+4Za
 +PysstQ9FIZQqghN/2ZhvqvWhcEbaNGBaF5BOYpNBrtVZ/qtbtaEn/wBeUhErXplmwnT
 SRX52Zh/pxxmXk+58pFgI3yJHiKgYQfa9/02C229skRTjmODTWoDw2s+k2QKOZpGwkJJ
 7mqVv0YpjHwu5uujhKpZdAo0+cssBD92EPbZy3EH1IZwqmqJLziqJd0aepCH9aQwxxoI
 NHsPlDCr8TfJrT+jPyfTiTVCGiIpxZ2mJQWAz137juP6L30ApOK415Tj/FloTb1hsE0f
 ROjw==
X-Gm-Message-State: AAQBX9f0xFgXOAXqCIjMmg+qA8ZaGQHlANW63p6t115lIAI3O5FDWQRq
 wEyYi3b1UfinYDmVPEv08CKmC0xt8e+Bw39fmWBzMQ==
X-Google-Smtp-Source: AKy350an4qDBEEezwbMb/O0K3EQmOMboLfIg3BKOe1G5ITwAgDB74dmXUy6ffsaqq96FzNWHJa2zGw==
X-Received: by 2002:a17:906:39c4:b0:94e:dbf7:2dfe with SMTP id
 i4-20020a17090639c400b0094edbf72dfemr4790195eje.11.1682170865587; 
 Sat, 22 Apr 2023 06:41:05 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-99-194.retail.telecomitalia.it. [87.5.99.194])
 by smtp.gmail.com with ESMTPSA id
 jo2-20020a170906f6c200b009538cc79241sm3305755ejb.56.2023.04.22.06.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 06:41:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 15:41:00 +0200
Message-Id: <20230422134100.609825-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682170865; x=1684762865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J4pKwixkeXg0r2K2gXnvYoJEemazPMp5Y3QSfUwbKmM=;
 b=R6MfldKVvjNXhEUt1az9V220oSf7gVH4sJnOjjJF9i/ZdzyOqUEO9Jz3D77W21jnxw
 xKkmBxREOYtXMSMAbcQNJ3dod2Clk9WoFPgV+KXk/PinqVzeTN51cqlDyMIf38C+kLNO
 eWEkZn5MZtUjjOpUPhZw7uj++7+f9wSfnkyhw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=R6MfldKV
Subject: [Buildroot] [PATCH 1/1] configs/stm32f4xx_defconfig: remove
 BR2_PACKAGE_IFUPDOWN_SCRIPTS
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kernel is built without network support. It is useless to compile the
package and then remove it from rootfs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh | 4 ----
 configs/stm32f429_disco_xip_defconfig                         | 1 +
 configs/stm32f469_disco_sd_defconfig                          | 1 +
 configs/stm32f469_disco_xip_defconfig                         | 1 +
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
index e324afe59a98..2ac9c653c327 100755
--- a/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
+++ b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
@@ -2,7 +2,3 @@
 
 # Kernel is built without devpts support
 sed -i '/^devpts/d' ${TARGET_DIR}/etc/fstab
-
-# Kernel is built without network support
-rm -f ${TARGET_DIR}/etc/init.d/S40network
-rm -rf ${TARGET_DIR}/etc/network/
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 872e4b6a306c..9edbbab387e1 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f429-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AFBOOT_STM32=y
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index dc00a47e1da2..24791178f46f 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index fc3b3f921396..ae2780556ad1 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_AFBOOT_STM32=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
