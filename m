Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1CCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Jun 2022 22:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E78C760BDD;
	Sat, 18 Jun 2022 22:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E78C760BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCZBhpW6qmOC; Sat, 18 Jun 2022 22:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E99A360BD1;
	Sat, 18 Jun 2022 22:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E99A360BD1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B8C51BF2C7
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 22:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1171660BD1
 for <buildroot@lists.busybox.net>; Sat, 18 Jun 2022 22:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1171660BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwGTF8JcfMUj for <buildroot@lists.busybox.net>;
 Sat, 18 Jun 2022 22:58:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07A7E60B0E
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07A7E60B0E
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 22:58:34 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id gl15so14756318ejb.4
 for <buildroot@buildroot.org>; Sat, 18 Jun 2022 15:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPDzJjmTlv8oyP5FZo8rW4TjTedMaHJhowM6WBglmxQ=;
 b=rsobk5YHPjgQglSg0+zfod/xXFff+QX3YN6b1Ic73x16Qic5jJ0oszT6K6WYfYGs1C
 9QyVxZcOzrX48SzgAKjKOzVVQ7PRGJOIYXlV7cqYmzm9Wjve+cBseWHO4sj8CNPhZlyi
 Iky7Ee+aOrNd5iocyZz5voTsULS7aMUPiix1iHi3xJ/DIuvs4c+kyV8THE0OIxuHgSeP
 hUPfkw15scFc53EUX0oAmX3PL7nWO3dEXpcHGWlAsCuhvKm0FBUY2TUHoOEotuwzWTsJ
 aX1UpPVKGQ/YI828vxHFTzlGybf6Pj/UNeYlMBBoUR+OPP57tp41VXKAwqAaxutewvwz
 /rCg==
X-Gm-Message-State: AJIora9uY8PKjM3L4JlL37i13G4VJbiHJIcMv1reXh3Co2/h6dXFuKjj
 QomVfurhfRrVCBvzorbt5FFTdzsfiC/VdA==
X-Google-Smtp-Source: AGRyM1t1PnBjWUst6dnwTM8hMjp53ffcyOwhA8a27BHaoxgWQp93UL28M00bQlfP0c4Ua4p4ybeczg==
X-Received: by 2002:a17:907:6e25:b0:711:c6ce:b7bc with SMTP id
 sd37-20020a1709076e2500b00711c6ceb7bcmr15598422ejc.752.1655593112929; 
 Sat, 18 Jun 2022 15:58:32 -0700 (PDT)
Received: from olheureu-ThinkPad-E560.fritz.box
 ([2a02:578:85b9:1300:5ac4:bd96:ccec:c1c4])
 by smtp.gmail.com with ESMTPSA id
 21-20020a170906329500b006fe8a4ec62fsm3898351ejw.4.2022.06.18.15.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 15:58:32 -0700 (PDT)
From: Olivier L'Heureux <olivier.lheureux@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 00:57:10 +0200
Message-Id: <20220618225710.8640-1-olivier.lheureux@mind.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WPDzJjmTlv8oyP5FZo8rW4TjTedMaHJhowM6WBglmxQ=;
 b=I8t8RAc9VRsnsSTPpKF7My7GXHf6W8W+uOXwTaIelUP2kAt0dWrX61qkBsIJN1X/Hu
 talbNGnGXmt+pQA+gFgqT2K+HsmR0CjbClYmoGAnWDlTMHs69rF1yGH7a324atwheAvt
 HpTn+rYcZ7I5eZiJK2q3l6GAR4Gdm9NQc4TLpVvL3TdEVuC0vYZvZMWSLh9EswD80tVI
 b1z3WUoZ2JtAQDT5fda43sF1dqfaUOj6grq4M4Qp3JzQea7Sy7nPFVzfnlM3DZmKHWiQ
 OaVRqRxlJUV+ni46k2aaKpUr3/19CJpFdTEcgVS709OX8IJmJq2G0Ntq4KJMhZXr6LfW
 Ew6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I8t8RAc9
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: bump version to
 2.7
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
 Olivier L'Heureux <olivier.lheureux@mind.be>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumped the default version of the "arm-trusted-firmware" (a.k.a. TF-A)
from 2.5 to 2.7: updated the config and the tarball checksum.
Work-around CVE-2022-23960.

Updated the "qemu_aarch64_sbsa_defconfig" accordingly: it was using an
"arm-trusted-firmware" v2.4, it nows selects version 2.7.

Updated the license checksum because the license file changed
slightly: it mentions an additional file ("irq.h") released under a
dual GPL or MIT license.

Tested with the "qemu_aarch64_sbsa_defconfig" and QEMU: it boots
without new warning or error message.

Release notes:
<https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html>

Signed-off-by: Olivier L'Heureux <olivier.lheureux@mind.be>
---
 boot/arm-trusted-firmware/Config.in                 | 4 ++--
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 4 ++--
 configs/qemu_aarch64_sbsa_defconfig                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index b1fc03e10b..f61b62b27e 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -15,7 +15,7 @@ choice
 	  Select the specific ATF version you want to use
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
-	bool "v2.5"
+	bool "v2.7"
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION
 	bool "Custom version"
@@ -43,7 +43,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE
 
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION
 	string
-	default "v2.5"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
+	default "v2.7"		if BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION
 	default "custom"	if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL
 	default BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION \
 				if BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 80402ec374..d931610dc4 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d12a824afcc5cb90d005f9820f3274f1319cef1bb282e40a6a190b75900206d3  arm-trusted-firmware-v2.5.tar.gz
-sha256  0171b0795501ee90634fbc4a7835e2fb215d9423daf1cf5b0d0682adde12c597  docs/license.rst
+sha256  327c65b1bc231608a7a808b068b00c1a22310e9fc86158813cd10a9711d5725e  arm-trusted-firmware-v2.7.tar.gz
+sha256  130d0c6e5159fa454b1e969fd281fa1d388819aefb203f65dd282544b5ab7ba9  docs/license.rst
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 2d6134e78c..0d4e8b2c29 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -39,7 +39,7 @@ BR2_TARGET_GRUB2_ARM64_EFI=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.7"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
