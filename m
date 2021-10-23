Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D5B3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 07:13:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D045160FBF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 07:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D045160FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95E9D60794;
	Sat, 23 Oct 2021 07:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0aw5ksJac6G; Sat, 23 Oct 2021 07:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086506078E;
	Sat, 23 Oct 2021 07:13:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8FE71BF349
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 07:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C48281CA0
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 07:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbxx--M299vR for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 07:12:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C527681CE9
 for <buildroot@busybox.net>; Sat, 23 Oct 2021 07:12:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d13so3887152wrf.11
 for <buildroot@busybox.net>; Sat, 23 Oct 2021 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CE/tHbps4/KnwPwmiLQ54I7a+kxYDIeIeNW+bjK9FAQ=;
 b=bq5jvRWjoMhAJYGTwNH20407RVzX+T8zPVAyQruM6mp7YAvzhRtVZRae/POBazA/DC
 qci9prm0tx2PCi+24RGawFytLjJu7g/N8+Xr08nkD+ceG1j8yLj2byqSG/lFE+u6bB3A
 y5LSorl0SxPhoQ8foXoB4wu9eDew0TZsGWKD0Ce9RUVm0qFoWyy9EYiez57rmECYV6jx
 nKuqOKvNoCbEG8Wr1+leMLuoOdDG+U4GUv6Fx7TqujpQKvKkTd3NVLKtal1oHQ7V1CdZ
 OQJ2y1IF8PZTbVngRXgff7KADATJadtmTtyrf0NPNJIArUGbCJ203tdhB2O2JNgHDhbQ
 C8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CE/tHbps4/KnwPwmiLQ54I7a+kxYDIeIeNW+bjK9FAQ=;
 b=zuhvRwYNxSrlcFddMvMH4OrJ8XW6aEIMDRfX2hCfgwkpWWRtAndt6TktRXUkL7Qd2v
 34zyKwSL2od/HYyZDWaTXoufVhQjadbyW4Kioq0j+nW2g6XYTtBXn77euArGDHWb/3xW
 F0BmcFJoNearVP1/AVrInoLHNPkPSvsMt3wtslmX1F1FPOlSqr+QyPi20R+XI7QGEM4B
 XhQEO7QHNmS9raC/tazv6RHwh8YI5n0ffylBF2cFEpgHcbZB6MlFGekfOGVQSDJYEGbk
 yQpTnIFe+DQBOa8yDzwmJIuUg5BAXyUFy/YUzbXhSmtjvmGTsZk7Ndk+vJr5dAibeTf1
 sbIQ==
X-Gm-Message-State: AOAM5307Sf7Kze+JiGTN1dlkVQJfV8pu3mXdZl5fTCheW8xsNYnVD8g+
 lu7GLFQuKIr9itjVzY3eXIASOe7GuKw=
X-Google-Smtp-Source: ABdhPJys4IlCcyJV6wL5wqiV47KcsMM1bntqUVbJyMsD81Q3+QhSQJYVYGdt+8yGubhJSBBSp2f8oA==
X-Received: by 2002:adf:b34c:: with SMTP id k12mr5868202wrd.1.1634973153171;
 Sat, 23 Oct 2021 00:12:33 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id o1sm1211223wru.91.2021.10.23.00.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 00:12:32 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 23 Oct 2021 09:12:00 +0200
Message-Id: <20211023071201.1016688-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211023071201.1016688-1-francois.perrad@gadz.org>
References: <20211023071201.1016688-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] configs/stm32mp157*_dk*: bump U-Boot version
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/stm32mp157a_dk1_defconfig | 2 +-
 configs/stm32mp157c_dk2_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 0ecdf09c5..126fd30f9 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -36,7 +36,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 1d426f28d..2b550b5c5 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -37,7 +37,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
