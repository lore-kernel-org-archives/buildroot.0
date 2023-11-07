Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF733C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 23:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BBCC417CF;
	Tue,  7 Nov 2023 23:14:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BBCC417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3BQ7TS8ZiCX9; Tue,  7 Nov 2023 23:14:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B77F1417C3;
	Tue,  7 Nov 2023 23:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77F1417C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 349141BF39E
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 23:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BE4381E03
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 23:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE4381E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbPEBuqmiJRf for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 23:14:06 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C65F813C5
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 23:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C65F813C5
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40859c466efso45226455e9.3
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 15:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699398844; x=1700003644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KyncazLqTO4xlaQ2ZMrpmbzHZfoMzb/k+eRljB6wEJU=;
 b=fESrdj1K6ugK8eRO7pDl9jJACqACYhhUUBpBFMzoA7c2rom96s/wi0SYT5YUk41tQa
 I/qCgWOQacKYK1sgwEGYralZGAgGYLWjy2JcFGteolFwiXWuQw3koprDhcmKXGbrkb+M
 CRWgupB8k+WYnwznsjZjhawTm3EolHcLsqaeE1ZKtWK5ZC9NLNGjfV6Nd350wXx6YPa+
 2BlY/0XxbwAVTNRQMa6QbkoyQnBmS1dPT4jjDUpFW+InmLKBih8TIvZRQRZGZuXakqKm
 LW21wn8H8wOBbhV9k8FgRNfag29owAlL4Q8aUOrMIcYbxUqvi/WVV8HIVCFWdQv2NWTI
 LAGQ==
X-Gm-Message-State: AOJu0YxamBCuGsAgGeUoTMAe5M8TCfawdKK9TA0w79fnX5t6z1mgx1UF
 zQjlTIIxdsygWsgKs4kVqm9Cd6JFabz3Bv8M6Xs=
X-Google-Smtp-Source: AGHT+IEdj9r7Bkf4QzWZNGIEksCOYgFZvj4afvjy9kM9qcvNXh796SRVM/nK6N64brKhH6YZMNLNVQ==
X-Received: by 2002:a5d:4b86:0:b0:32f:a6fe:9c00 with SMTP id
 b6-20020a5d4b86000000b0032fa6fe9c00mr161461wrt.35.1699398843431; 
 Tue, 07 Nov 2023 15:14:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:8084:983d:f980::84])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a5d530e000000b0032daf848f68sm3494545wrv.59.2023.11.07.15.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 15:14:02 -0800 (PST)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 23:13:51 +0000
Message-ID: <20231107231351.8369-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699398844; x=1700003644; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KyncazLqTO4xlaQ2ZMrpmbzHZfoMzb/k+eRljB6wEJU=;
 b=JqnFaUSfj3eT+6cE5T+mXKp5ENTcMGheCSdq6d3DWXXK53urLPsWNWK710kIM8Hb6F
 tsXFuqqa3K87yg+otv94yyQNCgFys0OgSU8nHMajYKn5B16DLWLsnjkVJ6N/E0cS5wOF
 Heo0MzCF7x+TllVhsLEmFGZNWahqITCVhXNWxwQrjdoVoYH+X+/Uolfkor15K7m0VG8s
 r7ZZKzz2IsIJQ8r8Oybf2eJLalHbBIy+6lrAP9iGOYxSpPRoVyP8/g9kpMH3AQaj3oIk
 HmLoSEOKbrB4bfhYslwWgzOy/Ph3WsNH/JThzHCAI8F/60Y3F1jd2PtsF/O4+6LZi1X0
 WdEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JqnFaUSf
Subject: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bump Linux and
 U-Boot version
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
Cc: Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump version of Linux to 6.1.61 and U-Boot to 2023.10.
    U-Boot requires enabling pylibfdt and pyelftools
    We need to increase the size of the rootfs, and we get rid of a
64bit warning on `mke2fs` by passing `-O 64bit` as an argument.

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
---
 configs/roc_pc_rk3399_defconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 79a51a8230..1323752683 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.45"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
@@ -16,7 +16,8 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="130M"
+BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
@@ -27,10 +28,11 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
