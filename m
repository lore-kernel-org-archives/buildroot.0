Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C234FD13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 19:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61FB0811C8;
	Sun, 27 Oct 2024 19:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXhdi7OFVcw1; Sun, 27 Oct 2024 19:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7150B811CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7150B811CC;
	Sun, 27 Oct 2024 19:43:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AC894112A
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D0166064B
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPKjFdGdLdmB for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 19:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 37310605AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37310605AC
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37310605AC
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:43:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4315f24a6bbso36006735e9.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 12:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730058221; x=1730663021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5g3gvXAqySMr32EjmujYx9aHUfoTBW+YtTg7qGvXv38=;
 b=ZBly5CxjeWKK50BegIEpcoL1dkQzuHqEmt91T1g+n+tuX02iiP06YTmFZ+FUrrKKVR
 akYRREXJz9p1aXIaOZK4ZBcyym3XOE/wW/VVvOs+aQMzKrGbentb/rIZaYfgI+FwIqUh
 Qty9S45NRS9KwXHVd61GGdYEYLMogabBtSdFCMSLAFHXor107uvRvPXIGaGBtdNH7z5M
 rQChNcJrCHgRTat3g7VpLeWhuNoUtAYYXAhv8z7BJ8kUUq320j3TEnusFQNE6AJ9NbJK
 vy1R5xeJsc04Ktzy53PMRwMaIGfdVnhPvoRpqeWAzxBnOfge5Y5cD5jTx19NTInt2Yft
 jPyw==
X-Gm-Message-State: AOJu0YxCYIrBDTy9s2fOfDIaPn1GemES8f/Zk0QLIa0M7LvdNa5xiJZ/
 6Oq37KuhSTpInZ/ogMIrXBvZYtH0P3uCp3DxfKyWYcb3T66W2aBEYwFnkEH8uGjecAKDVeK429x
 m
X-Google-Smtp-Source: AGHT+IFdoiUHiVsDKyISOX706VO2c08mfVviu+OMDEHNVUge4ZaaFd557qliUXUse/9v5L9hR4h1ow==
X-Received: by 2002:a5d:6192:0:b0:37d:4956:b0b4 with SMTP id
 ffacd0b85a97d-3806122fc7emr4985459f8f.59.1730058220811; 
 Sun, 27 Oct 2024 12:43:40 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bb57sm7495010f8f.38.2024.10.27.12.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 12:43:40 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 27 Oct 2024 20:43:35 +0100
Message-ID: <20241027194337.2444930-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730058221; x=1730663021; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5g3gvXAqySMr32EjmujYx9aHUfoTBW+YtTg7qGvXv38=;
 b=qHPzv3738bjEJA8Rltz9tcngU1kU9PpIjiaSw1roAtONR7tO8h4pzFYR9Lw0H1yMhh
 LV6epUyAJk4GU5HdVnWuKEjMjKL1VtZAiGJorwMm7TMmeCNY5koFYyz1ZNW7uc51+uAq
 CpV8sQ5/DdDLAkvhIYyyqQoXghKKvgEDKGv8I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=qHPzv373
Subject: [Buildroot] [PATCH v2 1/3] configs/qemu_aarch64_sbsa_defconfig:
 update ATF to v2.11
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qemu_aarch64_sbsa_defconfig doesn't boot since the qemu version bump to
9.0 [1]. Sync the ATF version with the one (v2.11) used by Qemu tests
[2].

Since we use a released version of ATF, we switch to ATF custom version
to use the official ATF repository instead of the read-only mirror on
ARM-software's github.

This doesn't fix yet this defconfig due to a bug in edk2 as mentioned
in the qemu commit log [2].

With the edk2 version bump applied, this defconfig doesn't boot with
ATF v2.10-lts but boot successfully with ATF v2.11.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/103a55028c75dace312470ba05a197886c6b6100
[2] https://gitlab.com/qemu-project/qemu/-/commit/24a7cd6a7c21f82f1ce9bd5ecf6fb54eb7bf4602

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: add missing hash board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
    arm-trusted-firmware-v2.7-git4.tar.gz is not removed since it still used by
    qemu_arm_vexpress_tz_defconfig
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash   | 1 +
 configs/qemu_aarch64_sbsa_defconfig                          | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 5632db01f8..4a0534d1ba 100644
--- a/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/qemu/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  c9f0d0bf967d690edbf34b621728a6271856f2e26ed46081a285b6d627a358c5  arm-trusted-firmware-v2.7-git4.tar.gz
 sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
+sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 8da4331b30..23d274b529 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -17,9 +17,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_EDK2=y
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
