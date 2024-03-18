Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0128C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F21C40A07;
	Mon, 18 Mar 2024 13:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2kn6OTIQ3I8; Mon, 18 Mar 2024 13:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A15240A14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A15240A14;
	Mon, 18 Mar 2024 13:33:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4795C1BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A7F607B3
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:33:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DLLp6bCnLPo for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:33:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4ECA60628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4ECA60628
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4ECA60628
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:33:45 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33ed7ba1a42so1321757f8f.2
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 06:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710768823; x=1711373623;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9usY+A/zPa6NUoZprYSjdgGKeHu74XwlWjSCZWi7qvQ=;
 b=ZM+xSR2EXqTFK3QVpSlVcdjGcvldT3AeWp1T83jydQFJSux7PULugm4m8nVBZcKEv2
 SVW+jtM0y8rjgPHCmfMLJRO2dICxwwoZvaY2cOvmMrFNJ79yQl13a1jy6hS+zsN8sunn
 qGhGgMmN+OCocgt8tkHVvcRKCWfZSXKoi/Cy6kyaX+GXpba9Kc053862f51lZjnHlS7Q
 1hIGdfxQd0mPYjkNm+4W/X/sFkq5Xss1GPwnhjeY7W7BIuXOdWFSGtZ+We53jpDhNCMg
 sqEzU6+ZGgZo7QS78hLkW7mVd1bdR2z9RK9aip5nUIHf7/jaXWqUDznExXMP2RxlKFuc
 2+oA==
X-Gm-Message-State: AOJu0Yx0Skbe70phqSGAh41qpLB6WHDQVrC2mE1cyl1kSwaQsZMldR2b
 nTCGxDkLt7kG5mep4FL8u8VLSczJ1yYxK4HY3/h6g+6YXjUcN8I5q34KXn9XSaPXi0CsshHZeWf
 gwwc=
X-Google-Smtp-Source: AGHT+IGh9FeVo5Qa4N6sAcpvvtr1UevKog+RMDN/dTy5McFSCz8ZuYgwzT1bf7P99AC/TrjFcWo9UA==
X-Received: by 2002:a5d:4ac4:0:b0:33e:7f51:c2f9 with SMTP id
 y4-20020a5d4ac4000000b0033e7f51c2f9mr9095100wrs.49.1710768823402; 
 Mon, 18 Mar 2024 06:33:43 -0700 (PDT)
Received: from mind.. (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id
 t11-20020adfe44b000000b0033e122a9a91sm9816325wrm.105.2024.03.18.06.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 06:33:43 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 14:33:37 +0100
Message-ID: <20240318133338.1811892-1-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710768823; x=1711373623; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9usY+A/zPa6NUoZprYSjdgGKeHu74XwlWjSCZWi7qvQ=;
 b=A6e6HtcdRRtEA/h1KRSnLT5AGO/N/CGguIN0LEmLRct+Kh3GwIMWWOzcOm/IJn3kHO
 V+jJGm78Ftr5Om2+NPvIwuAbYJ42gfEpmvFJt/20oITJ9y1SbXXu35lSSvQikUT7bhrx
 amB+vPmJNipdUNgN49Te60hPCgQZZen5Qv9PA5p56aHQ5p+PhaevEiQdJtuDuAZtXFgT
 Ht/d1E1EQLS212vqg/11T+hnKSY1+6oN0QPSuM8ziNLI8RkqrbPYiNiFmcM/YzNflZVy
 8TWhUIVYVrYXahnGYsASbhfEt1miLiwAFJt9Oiiz6lmJfoB5ooDNfPcu3Zk0LmN3H5IF
 no7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=A6e6Htcd
Subject: [Buildroot] [PATCH v2 1/2] configs/avenger96: bump Uboot version to
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch upgrades the Uboot and ATF versions on the Avenger96 board.
The ATF version is upgraded to v2.8, and the DTB_FILE_NAME in ATF
additional build requirements is also modified to refelect the
correct board configuration.

Changes v1 -> v2:
  - Uboot version fixed to 2024.01
  - Unnecessary variable removed from ATF additional build args

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
 configs/avenger96_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 536899583c..0afdaacf8d 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -29,19 +29,19 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
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
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_DTB=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
