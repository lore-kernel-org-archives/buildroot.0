Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB728C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 21:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955AB853F2;
	Thu,  8 Feb 2024 21:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wTFpmbPXXNi; Thu,  8 Feb 2024 21:16:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F728556D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F728556D;
	Thu,  8 Feb 2024 21:16:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 749D21BF378
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 622B0614CF
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vynhVAKWWN9M for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 21:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=tekieli.lukasz@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71027614EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71027614EA
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71027614EA
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 21:15:59 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55f50cf2021so505289a12.1
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 13:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707426957; x=1708031757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=loYqme2V3R5x4YYsCAbc48OgjZ58r5KefZ6YjUS+I0Y=;
 b=hRdtL/8rwpSrFjXVkuZWpzuNUfQYhQiDK7vcutNOqZ9bhLFPrQfIacY0Zy57VzbfT9
 sMb9R7TxzcYYnmv1fL3mF6BFTr6FdzQGIFfGxdoQspwOaVOOFUBj907/ce3dA2m14+14
 ddHT+Wrf8qPNVnL2hcakOFnIfA2atjSKLHtMUac1sjED/VGHJb8BsbbxFMKRVXB5YWvl
 lw70B4qCf/QDEXUFADOn82L/gPgQ2n+ZmwQkj0e27yhWIHvgzKh5BRO4OeinsBPBZcDF
 ueFg2rUoaI921Or1VZs0j4I+R4IKVgZfcKSzl7S5hMtkBx25UsFFuoqLpfqy0ZAUEJu5
 jVHQ==
X-Gm-Message-State: AOJu0YxpaPtZ2o8H7QtVV00uNzTl0SnFfLTT7d2hwXpys2zQWG+24hg3
 1kGZxNEbwEeVh83kr5H5qdg2CK9fYhEVfTDvPAKYALTqxUp1olD1fa8S2RCDRcc/gg==
X-Google-Smtp-Source: AGHT+IF4JVxhyiHPElbQ6R46kGCqPNsYZtWkhAwHnLF/viIySqI0+JGdQFlBR/kMMq6zTjtshOJg6g==
X-Received: by 2002:a05:6402:289:b0:560:c0da:43be with SMTP id
 l9-20020a056402028900b00560c0da43bemr283205edv.11.1707426957378; 
 Thu, 08 Feb 2024 13:15:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVr09xRjRWLSYOxhOP+VQrMFpuvJ2hUyuzUIMnmMfOrREP3kGULIxHOtUbAgitK1CiZaImkymokHMAWErL9+2vjAlDkt5Lj6WmLkcrugXQdqXCLaRpp9CtZ6xsAtsFYAIfWh0nizBU=
Received: from yoga7.fritz.box (ip5f5bff47.dynamic.kabel-deutschland.de.
 [95.91.255.71]) by smtp.gmail.com with ESMTPSA id
 f10-20020a056402004a00b0056003b75400sm126217edu.44.2024.02.08.13.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Feb 2024 13:15:57 -0800 (PST)
From: Lukasz Tekieli <tekieli.lukasz@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 22:15:17 +0100
Message-Id: <20240208211517.9234-3-tekieli.lukasz@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
References: <20240208211517.9234-1-tekieli.lukasz@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707426957; x=1708031757; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=loYqme2V3R5x4YYsCAbc48OgjZ58r5KefZ6YjUS+I0Y=;
 b=R2P3DOOnsgaeadDQtI2uwvKuGWcb1fSidq2Q6ju1EUNw6Co98Q1xs6uUp8cRJvlNh9
 NHKPafPvG0MeSRzGmYWXaJ18lAoUUmr322m92MGVBj4vQGELaEjyU7SBYBRetMVk03sd
 cUut/yFZJvhTBwq8Cyz3wQ2EYU3mrbbXEajXtUMIjm6Jfl6aUHfKngSG2/xQgHBwsLxa
 004eLIAsUgvxKgFS1rDPNG28ovzE3Ay4ANAhrN5o6SxUKkdG0S1FPFM7e3jxXL08Bkf1
 QW4DJzDAVnUJm+oYNgnk2OUSJJWVQONMKwQ9gU3XrgllGVggcbf6frWl9b0q7wtECfo+
 dgyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R2P3DOOn
Subject: [Buildroot] [PATCH v2 2/2] board/visionfive2: enable u-boot
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
Cc: Lukasz Tekieli <tekieli.lukasz@gmail.com>,
 Francois Dugast <francois.dugast.foss@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enables U-Boot and required OpenSBI builds for the VisionFive2. Changes
the sdcard.img to use GPT and adds the SPL and U-Boot to partitons
specified in U-Boot's documentation for the board.

U-Boot config uses BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME with value
"u-boot.itb". Using BR2_TARGET_UBOOT_FORMAT_ITB fails, because the
build does not support u-boot.itb make target.

Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
---
Changes for v2:
- added fixed U-Boot version
- added fixed OpenSBI version

---
 board/visionfive2/genimage.cfg | 16 +++++++++-------
 configs/visionfive2_defconfig  | 19 +++++++++++++++++++
 2 files changed, 28 insertions(+), 7 deletions(-)

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
index 3a1a4f527c..c8576a35a7 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -15,4 +15,23 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.4"
+BR2_TARGET_OPENSBI_PLAT="generic"
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
+BR2_TARGET_OPENSBI_ADDITIONAL_VARIABLES="FW_TEXT_START=0x40000000 FW_OPTIONS=0"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
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
