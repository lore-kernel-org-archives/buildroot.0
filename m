Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E810C47DA9
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 21:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D17194062A;
	Mon, 29 Jan 2024 21:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D17194062A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FV1hk-ZX-wtj; Mon, 29 Jan 2024 21:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3C85403B3;
	Mon, 29 Jan 2024 21:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3C85403B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 363011BF39F
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 21:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B0B660B3C
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 21:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B0B660B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3oMpbttiN3o for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 21:13:01 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 927A560B3B
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 21:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927A560B3B
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so411930066b.1
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 13:13:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706562779; x=1707167579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g0Y6xhltSdp/u1aPGTR9KQUu9I5wH4YHfJrQb/nmOFI=;
 b=ByF00vWnRUkIFsI2pUPxC45Hk2l5Zhes2PhQ8SdDCFn/YXUqzrLu1lMY+PfUJ/2kRP
 En09BZW1IsD8rESKiimNfdyXoMFCVZFunnyGv4/9b3T95wynn4DtvoIcasrX3nmILB/g
 efJLy83P/xwckewhoPPJVvllEUvfWrxYBQEKP23hY8mlX3MxP/zYz2O+2lKZojAoHQlg
 oogXU3O2NfTwX2JGZR5xXqfsgphyWcq5rv1Amo5slwcxlaU4uZcWW6plBwF1ci8iipaD
 DcEFrIuBFB0GjAWn2QoRu1Z4NObZxqp328keWvgUU9CDpbp5zeGIcKnRycrq9RT5AIzR
 6EcQ==
X-Gm-Message-State: AOJu0YxwDA1i4M2f4dVLioq68nOelTQ2p/w9q5ka3Xbccmc0thpdYY59
 88pQ8Uhm/UU7dHneXSNkn6sCDcXpY70cRIQJkJqGPHWkcdiGdFZlg9FAwrrd4rI=
X-Google-Smtp-Source: AGHT+IEnFj5OK85n3hQ9IgYRjGyHDXzb+PJw1g1XEdSwDkJlXaAQXFaZE+vUOp2KK58VV8RBDHCmGw==
X-Received: by 2002:a17:906:4ad9:b0:a36:133c:bd12 with SMTP id
 u25-20020a1709064ad900b00a36133cbd12mr205470ejt.63.1706562779350; 
 Mon, 29 Jan 2024 13:12:59 -0800 (PST)
Received: from yoga7.fritz.box ([95.91.255.71])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a170906a10500b00a35cf6727c1sm1139934ejy.105.2024.01.29.13.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 13:12:59 -0800 (PST)
From: Lukasz Tekieli <tekieli.lukasz@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Jan 2024 22:12:48 +0100
Message-Id: <20240129211248.541383-1-tekieli.lukasz@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706562779; x=1707167579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g0Y6xhltSdp/u1aPGTR9KQUu9I5wH4YHfJrQb/nmOFI=;
 b=HMvTsarN1370pebeIa0/HQC6DKeCrhlv0x+a5jBKlWfBLKKsXVTuJ691e5594DhrAw
 9XtPFHEOBE6Wk1/ZbivgYDyOP9b/PWPtOcgdiLFrQzOt3mmSpy1rIhkn1SX5WwmBMFdx
 EPdzKO8XvbLUB+KUmjQu7JucqiF5pFpcyIUE4H6f305Cqot33UBTZRrF0pKLdPXhHuvI
 STsYhOxs9Z3OiaoSodsdhciIk0qapH6HC5dMlVb1tRrVmiMppvfk8x9ePGoXlAiOVm1K
 pWlgBGUf/OFfOgi1Z2u8zh4BsLCwMY0P3W/DuUxcHgCOC3Vs1DzUIjK3ZKc1qBwe/yyg
 Bkug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HMvTsarN
Subject: [Buildroot] [PATCH 1/1] board/visionfive2: enable u-boot
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>,
 Lukasz Tekieli <tekieli.lukasz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enables U-Boot and required OpenSBI builds for the VisionFive2. Changes
the sdcard.img to use GPT and adds the SPL and U-Boot to partitons
specified in U-Boot's documentation for the board.

BR2_ROOTFS_POST_SCRIPT_ARGS now points to correct directory.

U-Boot config uses BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME with value
"u-boot.itb". Using BR2_TARGET_UBOOT_FORMAT_ITB fails, because the
build does not support u-boot.itb make target.

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
---
 board/visionfive2/genimage.cfg | 16 +++++++++-------
 configs/visionfive2_defconfig  | 16 +++++++++++++++-
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/board/visionfive2/genimage.cfg b/board/visionfive2/genimage.cfg
index c221b49c7b..8133e740c0 100644
--- a/board/visionfive2/genimage.cfg
+++ b/board/visionfive2/genimage.cfg
@@ -2,20 +2,22 @@
 
 image sdcard.img {
 	hdimage {
+		partition-table-type = "gpt"
 	}
 
-	# u-boot is hard coded to look at 3rd partition
-	partition dummy1 {
-		size = 512
+	partition spl {
+		partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
+		image = "u-boot-spl.bin.normal.out"
 	}
 
-	partition dummy2 {
-		size = 512
+	partition uboot {
+		partition-type-uuid = BC13C2FF-59E6-4262-A352-B275FD6F7172
+		image = "u-boot.itb"
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+		bootable = true
 		image = "rootfs.ext4"
-		bootable = "true"
 	}
 }
diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index dc086953a0..51b72eb468 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -3,7 +3,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/visionfive2/overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/visionfive2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,linux,05533e9c31d6f0da20efc2d436a3b0f6d516ed4b)/linux-05533e9c31d6f0da20efc2d436a3b0f6d516ed4b.tar.gz"
@@ -15,4 +15,18 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_visionfive2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin.normal.out"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
