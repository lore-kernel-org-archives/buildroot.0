Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF0FD5B874
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7F0C80E4E;
	Mon, 15 Dec 2025 22:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kD3BlsChLWyb; Mon, 15 Dec 2025 22:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 248C880E52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765839006;
	bh=uSSoeVU/d/Htuvt34cbdMwurnIuZQVmFBHcjRmJDsT8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kyhnQpXBJTccXzzQCMNfTgZNS88XPOhON5/Bli/KUPfe9Z1C2z1b0v/wHdhR/9RRL
	 vBg/e/V+c4Pw7xBVV4Bxy1/OhHpUjuob6jg0TK6Sijoi2/wXfGj9thPRNEaLLoERJF
	 Unz0LmnJJ37RVQ1lwmSfuN7jKkBygcMsH6ZvFhCh7/zNNB7OB8nSegAT52b7irf1LN
	 KGOT2cybRbUzIRyxITPJehU6QcxP4BddPVhC535EdrPRfUC5cJycQCaHxRnO5OOPJt
	 FpcCOjKXD7JNtFhqE9eEheX0fMNa/ZB+iGVmr9vjjzTiQKaofLp8O6fz9W2nhAusDW
	 rlGNfkido1wNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 248C880E52;
	Mon, 15 Dec 2025 22:50:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52989219
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 395F560F2B
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEf2NLLQzRmV for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:50:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A30660EE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A30660EE3
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A30660EE3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:50:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7DA5C4E41C1B;
 Mon, 15 Dec 2025 22:50:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 533C860664;
 Mon, 15 Dec 2025 22:50:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E06411942977; Mon, 15 Dec 2025 23:50:00 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Dec 2025 23:49:34 +0100
Message-ID: <20251215224952.1253359-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
References: <20251215224952.1253359-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765839001; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=a30ruIkUBfc/sEz4ai9t8XB2AwE+AmzUgG10SVjui2c=;
 b=Yv20m8YI2epwVGYnswYL6en59nAtefYwJwGo7k1V+kkMXg/r6RahK0YBT4dduZUF56UzA4
 x6kbrBrNVLLHyOqVoYitjqMRe3PAsMLWjjWico881lfnBQ1nkhbezBnGfI2uH/4j1PZb7e
 iT8NWzSOdvYUHcvkwd8FhVmJ66AhMrg37XPX9FWyA7u0d64Xak4Wmn9MPrsR1Q3OCVg8Z8
 LFW11JsDQz1ue3b1tQln9q9dKTeFnCd5U2ajlPGmP/Efj7AbgxB1F2WmdmJSnM/k5tXiwb
 dwEZ0Or7gRqaHiGmIZ/uGF2X8KK3w0QRXIP8NI8rE9pNysj4DomDm/cQh4bqzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Yv20m8YI
Subject: [Buildroot] [PATCH 02/13] configs/raspberrypi3_qt5we: drop defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the rpi-userland package, remove the only
defconfig that uses it. This defconfig is according to our DEVELOPERS
file, unmaintained.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypi3_qt5we_defconfig | 43 ----------------------------
 1 file changed, 43 deletions(-)
 delete mode 100644 configs/raspberrypi3_qt5we_defconfig

diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
deleted file mode 100644
index 8cbb8b0d41..0000000000
--- a/configs/raspberrypi3_qt5we_defconfig
+++ /dev/null
@@ -1,43 +0,0 @@
-BR2_arm=y
-BR2_cortex_a53=y
-BR2_ARM_FPU_NEON_VFPV4=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
-BR2_PACKAGE_XZ=y
-BR2_PACKAGE_LIBERATION=y
-BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_EXAMPLES=y
-BR2_PACKAGE_QT5BASE_GIF=y
-BR2_PACKAGE_QT5WEBENGINE=y
-BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
-BR2_PACKAGE_RPI_FIRMWARE=y
-BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
-BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
-BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3_qt5we.txt"
-BR2_PACKAGE_RPI_USERLAND=y
-BR2_PACKAGE_CA_CERTIFICATES=y
-BR2_PACKAGE_NTP=y
-BR2_PACKAGE_KMOD_TOOLS=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="400M"
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_KMOD_XZ=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
