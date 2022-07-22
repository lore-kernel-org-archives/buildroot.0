Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEBCC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8A034097D;
	Fri, 22 Jul 2022 08:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8A034097D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DySue4U1C40x; Fri, 22 Jul 2022 08:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD27E40929;
	Fri, 22 Jul 2022 08:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD27E40929
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC88E1BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9758560F05
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9758560F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nfzqMvL9hO68 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:53:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 047FF60EEC
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 047FF60EEC
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:53:33 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y4so5030749edc.4
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 01:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gT8EXQbM1O7ep0u8+Eo2vRmR3R/nsH0asDEFRlvp3Qw=;
 b=PKPqO4990kZ2a6SqNp5RgzLa/CDZe7H5NLoyhcDgvbwOruhCevYHLLCiFCa+xSSorc
 1AjsRCwqHeMhB1niWXN+n4EqhI3l2Jjp8Xmt/GaY87zWFY8UURx6SeJoP+CWJeqB+x4E
 TgO4a4OEoR39OIlUjlArVHlB+hPUI+0zuKVTnznxLT+GpHdBChT7rwo6oGHeh8zplMFU
 g3CkOGSacfVsKdhYufUpay4SN4WabPsKIs4WYvqYA3yM7am3q4vnVMgX/5Ob3Oig7rKG
 L79gvi7SmTr0bnDKLHBT17Fs1fvV6OvIUOliwXThgr5oEqxZPonLmhy6+0RKaDYfy8KG
 hGnA==
X-Gm-Message-State: AJIora8HrWOmwcDhaEonS3szP2fhn/ErI95CEizBEVygCSr/8mJjnA1f
 HTmr4Ix8w4ybUmODPlIgfqGw7/6txQHGQfCZ
X-Google-Smtp-Source: AGRyM1vZLrDpBheGMZFeFJxwnN1v9ReBYuI2ROJbmgvllHRJ1oxncgBi9nqQUcZvreyo0awHB2HsLA==
X-Received: by 2002:a05:6402:370c:b0:435:cb14:9aa8 with SMTP id
 ek12-20020a056402370c00b00435cb149aa8mr2426109edb.35.1658480011801; 
 Fri, 22 Jul 2022 01:53:31 -0700 (PDT)
Received: from lmecxl1178.lme.st.com
 ([2a04:cec0:10fe:4180:33f2:cfe8:3447:ab97])
 by smtp.gmail.com with ESMTPSA id
 op9-20020a170906bce900b00722e31fcf42sm1752359ejb.184.2022.07.22.01.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 01:53:31 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:52:46 +0200
Message-Id: <20220722085246.645440-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gT8EXQbM1O7ep0u8+Eo2vRmR3R/nsH0asDEFRlvp3Qw=;
 b=GGOl+Fj/n4shnHrttbwsf/9M6aM3v8seeUZphf53RPfNNdTqaHl7YxZLrhP9Q7Hk0R
 9M5tGRT3xQtNdXErmO+1HE8Ze7vj6tRvJB/Sjt888tkouAtEFd8Anq+9j1RcnadWLhU6
 4AxLIH8UZU9fguriBvqOzlFV+X71abJvtfTnZ47q+GMXPzqR8zY2IGC5y8VVnPbKAnnC
 U46MhFhd3YMaTTxtAri88TGR+J8IWgbDb/iFKH7nR3BWVGrfiKGwyfv9f5ErRiQg+xrY
 44vcGajFI85GDOukSsBHxe0YoD1wk7fXIP2Ee4Cv57gWhj6QhKEH10HIebp8fRHzT7P+
 SIMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=GGOl+Fj/
Subject: [Buildroot] [PATCH] configs: qemu_arm_vexpress_tz: bump tf-a and
 u-boot versions
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps TF-A to version v2.7 and U-Boot to version v2022.04 for
Qemu vexpress/trustzone board config.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 configs/qemu_arm_vexpress_tz_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index f8956f1c05..576c441154 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -29,7 +29,7 @@ BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragmen
 # TF-A for booting OP-TEE secure and uboot/linux non secure
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.4"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -56,7 +56,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/u-boot.config"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
