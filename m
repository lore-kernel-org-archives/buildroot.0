Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379C6C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 06:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0AD580CB3;
	Fri, 11 Jul 2025 06:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6n7VSvowyEW; Fri, 11 Jul 2025 06:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05BF380CAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05BF380CAA;
	Fri, 11 Jul 2025 06:15:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E7CE1E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 06:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8425E40162
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 06:15:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrvdYl7W4Aw0 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 06:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FAA3400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FAA3400FB
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FAA3400FB
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 06:15:14 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-60789b450ceso3329912a12.2
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 23:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752214512; x=1752819312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xP6pI1ipg9Jb9V5ehPJXM9ApjxlayrrLoTQiLknglms=;
 b=hNdyO2hIjLGnvuK8/Mo/AdO2DYmvZYAQUxUPtI/Bk2cmZnrYYMrzJbsiHM8GSU34wv
 kVSh1EJu1HAJ3IhSNxuSpufv7nNkmu3kxPtyEHxZRjDCTqHehTbZ2Q3FuGhkTxc58aDX
 MgoYspfpUTgrgQAD4iqD2WqHte2VZmPXffGJO1SJUpaJ/BQqOnD/uCGJ7/0I1gmkyzvm
 QsIJM2erHEjZqWZwltqi3Q9hwLFp3Dv8yBENzvkWUQVj2+B8IBkjGidRRn0H1pjSkiiE
 cyu+zEvm0jzHmdXhkYiOGrarfy2uNSlX3stS8LQypU2Je+ZteASVhy7UlnwdMo9Na49J
 MHfw==
X-Gm-Message-State: AOJu0YzE4Iz2BsMr7dAnlX64zHkW3+bB7Ce2NKtKUlpd/VmeoshrdhPu
 XycyoFbUSuOlnY5rDwq+zMUskPHWcdQIveI0tsJ1pc9o/t8K1QNmtUU8zZ9EOZZCMPiSfqMkVED
 0lasF
X-Gm-Gg: ASbGncvaNfAefGb+sCr+srzAlva1OJTwbWZbOuK5RQizX6vmzTdV0lbOVkRyIfrEvgJ
 yknYlKQTcpFFCpKq/OptJjOLtTWpC1ERBYZ7YldKVg13rzwLAdFnRZ/Rhm6jvo6QomEqZKCh96B
 2CmfGET/FyXS013t5hHweU3frZagzmQ3lZhb6bpEUTv+9XE15erY7Oz9Yhvzwd826EvT9h1p8GY
 aQzhuM+GQLixC23H6uQEWwTVzgnjldMYmCQ+y4l67YanpzsU/Gw+f+dk6Cyi3ilA2tmcs1eLwK2
 khlP8Xx4YfoCjcoz6NKWwOvBMh5fp7S0Dj+YWcbj4q34OuCZ5R5nrEdr/KXlYVPZ8stYt5JOeYY
 qA4Mqrw0zK466OOxRcrrO/HmcBCoY0G783ife+WUp9epJqyqG9/eEPPzS4GK2moZk7n8ydtjpxY
 qfSvlkEkVASOwfWv3aYxrA8bo3WYiL34qtLpsbPBf7avYJrvNY84fRXbVgkQ==
X-Google-Smtp-Source: AGHT+IFZY+feIXI/IxPJVxEL7/JWrTjg+iDyyLD8Qn+YFlDNjfPcepJD/6nkR2956p6pT6xA6AY8Xw==
X-Received: by 2002:a05:6402:254f:b0:60e:f46:326d with SMTP id
 4fb4d7f45d1cf-611e851680dmr1478001a12.33.1752214512460; 
 Thu, 10 Jul 2025 23:15:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611db7d59e3sm1023311a12.44.2025.07.10.23.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 23:15:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 08:15:08 +0200
Message-ID: <20250711061509.1772371-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1752214512; x=1752819312;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xP6pI1ipg9Jb9V5ehPJXM9ApjxlayrrLoTQiLknglms=;
 b=ex64sZRtz5EhwdgoprSx3UFX4unvV6Q/ipYhYj2PqzayR+ngFC9VOkgPS+Mk/C6+UD
 eFd2jsmLcFmxVhlhrE1OrJwvu8bMxrSPzzr5r30/G4lLbWCJ4DFbQ6ylXJJnr9u8exe4
 wUH8yOWU08GrJ/nXIOcz6J6e4Ql8+VY2yzLCo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ex64sZRt
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone: bump Linux to
 6.12.23-ti-arm32-r11 and U-Boot to 2025.07
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.12.23-ti-arm32-r11 and
U-Boot to version 2025.07.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index 5f6bd2bec165..f2c09d9872c2 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  203743e32c9fba3bb9f965c1b3799977961a9d25071d6d482d96d74adfdbaadb  linux-6.12.17-ti-arm32-r9.tar.gz
+sha256  3654ca31003d90d20b195b23f8d60b78fcffbf0fd7fed6116c22719e20ac933d  linux-6.12.23-ti-arm32-r11.tar.gz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index 80ea21b7cb4c..440526977bd9 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index b4035215dea1..bb63fda37592 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.17-ti-arm32-r9)/linux-6.12.17-ti-arm32-r9.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.12.23-ti-arm32-r11)/linux-6.12.23-ti-arm32-r11.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
