Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94676C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 09:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BFBB814A0;
	Mon, 18 Mar 2024 09:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJLMacdqO1ta; Mon, 18 Mar 2024 09:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E555814A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E555814A9;
	Mon, 18 Mar 2024 09:30:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 810981BF365
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 09:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E627400F8
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 09:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21TbExAtVE9y for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 09:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42B70400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42B70400D1
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42B70400D1
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 09:30:30 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5148ea935b8so194111e87.1
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 02:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710754228; x=1711359028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tkOGWUoTaiPH8aglaq9mJifUJPXzlqwbI0ceMZjDTvs=;
 b=WMxyUplAjakWd6EeGLAT32TuNFAey8Z3xkNcN7z6eBg7nJYqXT8eCxRzD4g6hguZVp
 3wllTfKTYBA9gMp/zS4c2ioi6kSpomwVsw2dFic552c82nSNiQRlTO0LXDhCJmPsUrsr
 o1uG9uSesavIyPlVKYifBduUYrd6zAbezyObbnC7RK6garJbA/YQH7ZCNs6IaQOGBpvR
 aMhE7YI08v6wXbNXH57pwF9QY4QILgcsWmOrbk2V8v4U8zk6Riw5B22WqmMBqB2+J84E
 QQB/M5LZQfDVwI7QeMjoYoG19/zPMXxfGZPWIrIxtWwIzXuaVbblI4en2Cv+78hzYv9A
 9J5Q==
X-Gm-Message-State: AOJu0YwdxpDkOFYelIt6lGD/gWMrxCYdU6H9MDFTTVz0qmoLDj3YsXYs
 EBMQZtxgdQY2C35uGTff2OCmGmG7Lj7jchR24c7Q1Xf76PMfDVPq4JwNeQ3F/SIKF+pB/YuLjVM
 URvQ=
X-Google-Smtp-Source: AGHT+IGEwnS7/DznZ7J4zqMC/bmXFjS7jtvtXKnyd442FpM1WWwQO6CBNSFlZL3iL/WHWO1bdXAkVg==
X-Received: by 2002:a05:6512:44a:b0:513:952d:ac62 with SMTP id
 y10-20020a056512044a00b00513952dac62mr8208947lfk.52.1710754228551; 
 Mon, 18 Mar 2024 02:30:28 -0700 (PDT)
Received: from mind.. (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0041409fa57c4sm5825360wmq.34.2024.03.18.02.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 02:30:28 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 10:30:25 +0100
Message-ID: <20240318093026.8193-1-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710754228; x=1711359028; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tkOGWUoTaiPH8aglaq9mJifUJPXzlqwbI0ceMZjDTvs=;
 b=aBHqm8ThC59fyi1upPOT6vvHdmqb24BZ0s4k5jGRmwh13tEWH97O8dHbmwYObKjOkW
 xhpRhsRk3g/ryQcD/MzmbY/yDahG517d8LDKS7zMCyvVh9dWfkDdLeBhCuH0sUu3EeMB
 5zc6iC97vCkvQ7Ci8pFRJ0Pj2351bVfAxMAhWwWo2Ui7gBghoh7oEIHtucpL5lunNqUD
 7wkq7L3jlmMgOp62i/55kAwkKtlLUU+AK/CLMfizKLiksE4QxxRzFU20XF8Lm9QBf/8h
 DXEDKo8YtSz66EJMBDxBHJKbqSADsvozq8/hre2AQd1WzpICdms2jwwbDpMEf5SUJ+Sl
 yjlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=aBHqm8Th
Subject: [Buildroot] [PATCH 1/2] configs/avenger96: bump Uboot version to
 2024.01
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch upgrades Uboot version on Avenger96 board

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
---
 board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf | 2 +-
 configs/avenger96_defconfig                               | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
index 5d506b3dae..7d6d7f8a44 100644
--- a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
+++ b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32mp157c-dk2-buildroot
   kernel /boot/zImage
   devicetree /boot/stm32mp157a-dhcor-avenger96.dtb
-  append root=/dev/mmcblk1p4 rootwait
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 536899583c..45600ef2fe 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -29,13 +29,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 PLAT=stm32mp1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
