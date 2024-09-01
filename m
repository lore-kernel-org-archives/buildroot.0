Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B160CD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 16:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F7FF80EA5;
	Sun,  1 Sep 2024 16:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLGW1dg-Riv2; Sun,  1 Sep 2024 16:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69FE880DB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FE880DB0;
	Sun,  1 Sep 2024 16:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E18001BF30C
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CECDF40499
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ri6F9Q3Mxgi2 for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 16:49:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B8FF9403CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8FF9403CB
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8FF9403CB
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 16:49:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-374c84dcc64so382481f8f.1
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 09:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725209384; x=1725814184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nIyvmRrElYXJarEc7waX7twSxyjQPqXn8XvFPkVxD3I=;
 b=KWuDL8V0vye2p8o3kxqGgs1FwZMWw2BBhltg5/xdRWOJzmjTR3hvTrVI5y2snZFHvd
 e9uw7zGZTq6beedW7oSc1KcEX0vTJUi+uDBhzN6uzsapr4Xmd1TQBQG+tnVJHzNh0aIW
 I/Hg/DuZ3x3JahfLUURQFjcSaM96paBYSYDK7K+hcIKfK+G8GieovO4NDpPtTU0JARt5
 dza/CJLLUO8kHw3pmds4plwNQEwWCuvG0uf+MGkPN/xUnzZeFLgoGlMExGDNlyucR1m8
 CzI207SrT8iU9g/WaX8QkJQ9cRoWhdcVjEuz5p18PSjj59+/NKnz7x4IUQCvgf5wobsP
 KJ/A==
X-Gm-Message-State: AOJu0Yy064oTbpD+pChQ8c+ioAndciTzv/AZMP6ImeA1xntqE6DMTCyj
 /mjPPiK2d5sPhCz88YB+ixDr6nhhalgIcK/0TlKWC76peSyZY0sibvCodQ==
X-Google-Smtp-Source: AGHT+IG33xrZzvtesS7mT/EzKD8M3m/ncNqTKzYMUqivIrJCSYh/7kvQtVGRtmhIpduJ/UzdeCqZpg==
X-Received: by 2002:a05:6000:cc1:b0:366:f04d:676f with SMTP id
 ffacd0b85a97d-3749b526222mr9775118f8f.12.1725209383558; 
 Sun, 01 Sep 2024 09:49:43 -0700 (PDT)
Received: from localhost ([212.38.43.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b23f20d1sm6595396f8f.35.2024.09.01.09.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 09:49:43 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 01 Sep 2024 18:42:58 +0200
Message-ID: <1913421.tdWV9SEqCh@localhost>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725209384; x=1725814184; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=nIyvmRrElYXJarEc7waX7twSxyjQPqXn8XvFPkVxD3I=;
 b=fpCLWds+kPuq/V5k8ok4u+JcpanRxsvHa9q4tpk+4Boaw5QHbOrYI7Or5ZUV87doKI
 nJNsF6p53onyRr+d6mE+tNAb1mGhz+rlQPvBzqXNl9vnEN3wJDm/v0mTCRh+DOp0DU+o
 iZuJ6FLE/EwBUOetKiWtPFUNMXlRYF/c+FURH3DCuQyxfo79MbrP64YT6YEOGC78O8hG
 R4zjWgaaFJsS1it1//nLqZcF/sMXaeJXoLRBINVk5XkaGSIWkXGzSxtGKIMaDksaAnKp
 4/PGHEeE7aSoozm2XbF6dk3vygpPi+7QeYsetE4O7AfyBol/NegS4zHBQLPC4/pb3jJf
 J8AQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fpCLWds+
Subject: [Buildroot] [PATCH 1/3] configs/pine64: bump U-Boot version to
 2024.07
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update U-Boot to fix the following error when building with
python-setuptools >= 69, that is, since 6b62384e3d
("package/python-setuptools: bump to version 69.0.3"):

  packaging.version.InvalidVersion: Invalid version: 'u-boot-2019.01'
  make[5]: *** [scripts/dtc/pylibfdt/Makefile:27: scripts/dtc/pylibfdt/_libfdt.so] Error 1
  make[4]: *** [scripts/Makefile.build:434: scripts/dtc/pylibfdt] Error 2
  make[4]: *** Waiting for unfinished jobs....
  make[3]: *** [scripts/Makefile.build:434: scripts/dtc] Error 2
  make[2]: *** [Makefile:508: scripts] Error 2
  make[1]: *** [package/pkg-generic.mk:289: output/build/uboot-2019.01/.stamp_built] Error 2
  make: *** [Makefile:83: _all] Error 2

Use SPL and U-Boot FIT image combined into u-boot-sunxi-with-spl.bin.

Do not use the optional System Control Processor (SCP) firmware pointing
the SCP env variable to /dev/null.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 board/pine64/pine64/genimage.cfg | 12 +++---------
 configs/pine64_defconfig         |  8 ++++----
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
index 06b4ed1056..3555869036 100644
--- a/board/pine64/pine64/genimage.cfg
+++ b/board/pine64/pine64/genimage.cfg
@@ -14,17 +14,11 @@ image sdcard.img {
 	hdimage {
 	}
 
-	partition spl {
-		in-partition-table = "no"
-		image = "sunxi-spl.bin"
-		offset = 8K
-	}
-
 	partition u-boot {
 		in-partition-table = "no"
-		image = "u-boot.itb"
-		offset = 40K
-		size = 1M # 1MB - 40KB
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index c454114d2a..a6ddf6e57b 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -16,15 +16,15 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/pine64/boot.cmd"
-- 
2.45.2




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
