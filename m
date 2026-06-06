Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB29DCD8C8E
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 22:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BE3C428E2;
	Sat,  6 Jun 2026 22:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRrjUToUN0h3; Sat,  6 Jun 2026 22:51:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FCDB428C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780786299;
	bh=seghiLxgPms1hyRwPHQ3Z4D5ecnAPohJagjZ7Jg45+I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RQNeqXD3XNGMc0HkB7AtRKMwVMWA0veRXm6GnaZVFjc7QS4NB87Kq3awj/AAifsEi
	 2xIgByE27/LSIq6o8PQBLX74zv2DdnbUuwdrG66Dw4SYAtmrQyJI9tPcqXIfUcDIMw
	 5/n8EmsENLUFNXkXX4ZCczb3xNlczPwTbk7ujvNBKgiBD2J9TvQtJVJcThaOlQwOmU
	 QBSk9UlAQ7rqs8Oc3sFgFCM1eYxKYgoWLa3Zx8NTUP7WPnBCI0MAtVkuJ+X+Oacbs9
	 8j9tWdDDoXpyo1wPBCZLKucsfwVNuGMSb815DNFgBJ2sCARZ/48IGtni1sqNHbKHmu
	 WnuLQab5L3ROA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FCDB428C6;
	Sat,  6 Jun 2026 22:51:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD1B42EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEC04428A6
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvqZBRf30Lhw for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 22:51:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E8E842637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E8E842637
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E8E842637
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-490b4e1ade7so33486105e9.0
 for <buildroot@buildroot.org>; Sat, 06 Jun 2026 15:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780786289; x=1781391089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Frb19jJjflYesCwKGcmV/2kb0rvWuASnvRv7vjCBYb8=;
 b=oPuZlL4ACT3om+gx+ltD4/ACl+vS5MJlDeJ0CrZQxRyp113ckW/25RmDzSNBGY+rRU
 7EjpKYCu6uU4fUkKI9t3kayIkoTvF/2fhncmu3BWFVkKfqjoCQsJFU6IgwLyNG9vKkur
 smOPYvED7Dxa1cPN9TiA7uFCovkt9AiTCB503KWzDhpPpu7CWduBKoRZn0XPHVaur251
 MWfIucopSpwVW/fT2aHRkDRZ/+6nHXEcgpDEawZUM90xnV8+pZqAtKfQbDhSUbJGmSiu
 rV/wP/eFfrp59dEqcVlkMtsw0LSYJ6+j99/ESBc7vQk7qcYznlzY1jWqwezn2BtooJFH
 zE2w==
X-Gm-Message-State: AOJu0YzpT/gc/AFLb0Ak4zbWODrV0DqcVQkEgstEiNohNC8SYeuxPITu
 qs6ZbNClBlaWN2tt1iu7WzG9bGo2yv7Dpx7qWH73WLFzJOqGVhfma8jq+vrpMehpw4t3Kskhc1w
 tpRSp
X-Gm-Gg: Acq92OEx9k3JtDCzePMuBibc1mbLnbQ1itH8AcEKYFR+yBE8VZMXex1bhqU8CE3tRCX
 tMzvZIkdcQjqvYxuBh0KM4bP39iy2N8hegWGWH+GuAZuoO8Mn+SoWGz2O0gOTUhwBl/CfgRk0ZN
 R5wHqVOD7hWSDOYffEBRBSyyk9c69buIRfATJxHgLXbpkl/VZApHH/gS3qrB95M4wRD/4cFSt/v
 Cub8srzNPuJCJmgtoFU09CReQFScQUs4exoWRbLjDjECihdxU9vKkbVoPKN6E7lErNRHncAbUHY
 Vk6k2NFAWztjda5s8bhtmGxNPBVewtopXWoqKwxymIcOPKc7bHDkOpaY0aMoZ13dabyO07jrFDj
 W5QpCgHotVt3aEK+SsoAEEDjtIHshPLusXCR/PTqdBfnmHP8Y2Al4rnOWF2EzVmKkgRutg0KS+h
 M1zRJPdHTbG2qlTzELUtnAzFoRIzxUxBTfRauq0bl4I8neXD4t32Q2pNa5g9Xf6r8mcMhcNX/oX
 MiCzpHs5+eCPrKHIVMSZWAESrn573qo8Nwz
X-Received: by 2002:a05:600c:348b:b0:490:be78:1861 with SMTP id
 5b1f17b1804b1-490c25af9bbmr152750895e9.4.1780786289420; 
 Sat, 06 Jun 2026 15:51:29 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm67014650f8f.27.2026.06.06.15.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2026 15:51:28 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  7 Jun 2026 00:51:16 +0200
Message-ID: <20260606225120.409046-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606225120.409046-1-romain.naour@smile.fr>
References: <20260606225120.409046-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780786289; x=1781391089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Frb19jJjflYesCwKGcmV/2kb0rvWuASnvRv7vjCBYb8=;
 b=cXhTnTbiicOivBfDX2MzNmFTVIMaY+7VINbvQwATAjO5DZU4jIM7M/5jBsGsVVZx0B
 XJSwYZWTvBdUI/eOKFerTL76HSObQl/rU3UYvSCORv37WLsWBjFuWnvjDITPyUmpZOYb
 t1JdAZPkiyGE4Y3EIcN8SwS0AOWDoZiG3LN3I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=cXhTnTbi
Subject: [Buildroot] [PATCH 5/7] configs/acmesystems_aria_g25_{128mb,
 256mb}_defconfig: remove defconfig
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

This configuration for the acmesystems aria g25 were added back in July
2015 (commit 2e52be798276fe0c28949f4a16fce0ca20e52153), and has not
been updated in any significant way since 2019 (the last major kernel
update [1]).

This defconfig still use a 4.19 kernel that is no longer maintained.

Remove its support.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913801 (acmesystems_aria_g25_256mb_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913800 (acmesystems_aria_g25_128mb_defconfig)

[1] ab10b5b3ee6aa1e19aa6264153eeed9054d4c2e7

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/acmesystems/aria-g25/genimage.cfg       | 36 ---------------
 .../at91bootstrap3/at91bootstrap3.hash        |  2 -
 .../patches/linux-headers/linux-headers.hash  |  1 -
 .../aria-g25/patches/linux/linux.hash         |  2 -
 board/acmesystems/aria-g25/readme.txt         | 44 -------------------
 configs/acmesystems_aria_g25_128mb_defconfig  | 26 -----------
 configs/acmesystems_aria_g25_256mb_defconfig  | 26 -----------
 7 files changed, 137 deletions(-)
 delete mode 100644 board/acmesystems/aria-g25/genimage.cfg
 delete mode 100644 board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
 delete mode 120000 board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
 delete mode 100644 board/acmesystems/aria-g25/patches/linux/linux.hash
 delete mode 100644 board/acmesystems/aria-g25/readme.txt
 delete mode 100644 configs/acmesystems_aria_g25_128mb_defconfig
 delete mode 100644 configs/acmesystems_aria_g25_256mb_defconfig

diff --git a/board/acmesystems/aria-g25/genimage.cfg b/board/acmesystems/aria-g25/genimage.cfg
deleted file mode 100644
index 29dc697153..0000000000
--- a/board/acmesystems/aria-g25/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-# Minimal SD card image for the Acmesystems Aria G25
-
-image boot.vfat {
-	vfat {
-		file zImage {
-			image = "zImage"
-		}
-
-		file at91-ariag25.dtb {
-			image = "at91-ariag25.dtb"
-		}
-
-		file boot.bin {
-			image = "at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.10.3.bin"
-		}
-	}
-
-	size = 16M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
deleted file mode 100644
index 6edf3d3345..0000000000
--- a/board/acmesystems/aria-g25/patches/at91bootstrap3/at91bootstrap3.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash b/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/acmesystems/aria-g25/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/acmesystems/aria-g25/patches/linux/linux.hash b/board/acmesystems/aria-g25/patches/linux/linux.hash
deleted file mode 100644
index 81824a41ee..0000000000
--- a/board/acmesystems/aria-g25/patches/linux/linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
diff --git a/board/acmesystems/aria-g25/readme.txt b/board/acmesystems/aria-g25/readme.txt
deleted file mode 100644
index cb9e9abf77..0000000000
--- a/board/acmesystems/aria-g25/readme.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-Acme Systems Aria G25
-
-Build instructions
-==================
-
-To build an image for the Aria G25 choose the configuration
-corresponding to the Aria variant.
-
-For 128MB RAM variant type:
-
-$ make acmesystems_aria_g25_128mb_defconfig
-
-else for 256MB RAM variant type:
-
-$ make acmesystems_aria_g25_256mb_defconfig
-
-To customize the configuration choosed type:
-
-$ make menuconfig
-
-When you are ready to start building Buildroot type:
-
-$ make
-
-How to write the microSD card
-=============================
-
-Once the build process is finished you will have an image called
-"sdcard.img" in the output/images/ directory.
-
-Write the bootable SD card image "sdcard.img" onto an SD card with
-"dd" command:
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-
-Assuming your Aria G25 baseboard has a MicroSD socket, for example
-with the Terra baseboard, insert the microSD card into the baseboard
-slot and power it.
-
-To get the kernel log messages you can use a DPI cable
-(http://www.acmesystems.it/DPI)
-
-You can find additional informations, tutorials and a very
-comprehensive documentation on http://www.acmesystems.it/aria.
diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
deleted file mode 100644
index 0aff8f92e0..0000000000
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_GLOBAL_PATCH_DIR="board/acmesystems/aria-g25/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/aria-g25/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
deleted file mode 100644
index e75ca9cf34..0000000000
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_GLOBAL_PATCH_DIR="board/acmesystems/aria-g25/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/aria-g25/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
