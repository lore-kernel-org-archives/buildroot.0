Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C56EB64DC
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 16:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195F182001;
	Mon,  3 Jul 2023 16:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 195F182001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DQ7KUoenge7z; Mon,  3 Jul 2023 16:02:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ED4982055;
	Mon,  3 Jul 2023 16:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ED4982055
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C40E1BF59D
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56828401A3
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 16:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56828401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p3Gpv6JZ6bpj for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 16:01:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2549940C0E
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2549940C0E
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 16:01:57 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so1849299e87.1
 for <buildroot@buildroot.org>; Mon, 03 Jul 2023 09:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688400115; x=1690992115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+31ez36dhn5umztqpdXQbhmJyPNgXenX8RBfN9WQUo=;
 b=ZHbDsnkWEFuUsiHCls21r76ExRBhMuqoJxD9k9HTDZ66G1THB8NAqWOT1WtzZiUpmI
 URR+gUtca7NJEcNPXtaX7mK2qb4iPDgt0IrB9FG702g7aZs6axSN2mPHArsOSkhtwrcx
 VmU1EFv+3QlLAlLyK+XZxWkAkrD2f1f8WyEdYsp4hcv4FXk0+Q57evasBRAKxkd6/OOV
 AKnKIM0sTfb+87G7XF4pKxC9oQbmqjG1x1pNQ7BY/r2xQHIUEqqXaBe9Vna7Pwt+/i9A
 qrs2qsRlsAJgnXsUqZPGTjS6OYgpQM9KY8/F8o7vKYi2PZNYKTI2GLBSMc2H8eKV/es9
 kM2w==
X-Gm-Message-State: ABy/qLboJn4YE2degL58vXgk2CDAWj6bDNaYVFaUHMTXoAMpV3cX40ye
 kZhsaX0bhqCSVAmyRs2OFnpbcRrIT9k1ghKU6pk=
X-Google-Smtp-Source: APBJJlE4Yrvwsg0sjEsc6gyxhihPpm2qQEcyFREDBVi9RvfZLCR4y+zlO+1TvMr1lblrVLGdG/cIeA==
X-Received: by 2002:a05:6512:48c9:b0:4f9:5a61:194f with SMTP id
 er9-20020a05651248c900b004f95a61194fmr7182057lfb.11.1688400114876; 
 Mon, 03 Jul 2023 09:01:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a056402001100b0051a53d7b160sm10619687edu.80.2023.07.03.09.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 09:01:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 18:01:49 +0200
Message-Id: <20230703160149.2302949-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230703160149.2302949-1-dario.binacchi@amarulasolutions.com>
References: <20230703160149.2302949-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688400115; x=1690992115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+31ez36dhn5umztqpdXQbhmJyPNgXenX8RBfN9WQUo=;
 b=G1vs5J7zp/py5JDb4SN0Tu9FekAkX/UQFpr52EpZHva98jJHa7XOeRj3/WhAwVAZtc
 Z+GHmBOS+YzjCz3DeIkTIDVp2NjdufrM8yerwS92zHkuPVsWzQ2vQLA4ouWBKFr/q9Ja
 Y7WfMI463TO87JHhm1L1+Ikef7iFTd9W7Anak=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=G1vs5J7z
Subject: [Buildroot] [PATCH 2/2] configs/stm32mp157*_dk*: bump U-Boot
 version to 2023.04
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
Cc: Simon Doppler <dopsi@dopsi.ch>, Bartosz Bilas <b.bilas@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The u-boot.stm32 image is now created by binman tool, so the
BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY configuration needs to be
disabled.

Tested on stm32mp157f_dk2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/stm32mp157a_dk1_defconfig | 3 +--
 configs/stm32mp157c_dk2_defconfig | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 3b8fdea993ac..2ec063b51c61 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -36,11 +36,10 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
-BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157a-dk1"
 
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 8b83bfe44353..4427289ef2ae 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -36,11 +36,10 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_STM32=y
-BR2_TARGET_UBOOT_BUILD_FORMAT_STM32_LEGACY=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp157c-dk2"
 
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
