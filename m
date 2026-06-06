Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15016CD8C85
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 22:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D30EF428C8;
	Sat,  6 Jun 2026 22:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZU1r13FMGiL; Sat,  6 Jun 2026 22:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81D5E428D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780786300;
	bh=yzw2u2WhA/lqsqybgMbpj2NVxvIuDD62pjKa9lQvfA8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jFJdQD8Tcky9QW/4EKFVdFzesAUOHsdkvVA3IOaMLCInpwJJJlny1fgWIQjPVToY6
	 pC3UZ1KhwHImaIZqyVNv6NkBGW4gJEobUNEnj0obHpc1Ywu1dZavQ6jMSXeBMvS01u
	 y/bJAd6n9tp5siPYtlJFy2rKC0DPEi/bH/KZSXEYUt9j4Dwt+dSH1kujx1w2qby82T
	 Bf5eAZIilHhyALBaJRcps0QQtFt3o8Uxmu6jkJEWaZydR8JpoV7PLOSbGJiQQCyZQ6
	 kAfTsykfJTJodHvxI5jBeixFmZI0sAYiQfKuaLeS4rcyaI4Q7/ThwYe2DaL3Uj2IpW
	 3w4zYu1zCl7zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81D5E428D2;
	Sat,  6 Jun 2026 22:51:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C56E8345
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB99C40278
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OZEjvXrxNg3 for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 22:51:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89AD34020D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89AD34020D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89AD34020D
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:32 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef29c5561so1609816f8f.0
 for <buildroot@buildroot.org>; Sat, 06 Jun 2026 15:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780786290; x=1781391090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zBwyXXmPG1HcWDCU91KJjYLswVYgOktXiC4W/A4zLzc=;
 b=WjSuEfEPcLSpNrrxCrVqiIitEBgs+q2n5M3VTVYx/gRXHex9K55DSstWE7Wp0BZSfe
 2C8j1Yoyb18XORp3L2DCeRhhqr8bEczbIi/B6phtBJJTLgScxxID/1xy9KUyzHT8TMTV
 y6f4Z63BUXAZQsc14kkZqnykDIEZaMgJiBNohr3KiSEnTZ9IW7pxat3/YtuNuHSbMXae
 AMVrtixT/8hi5i8IfDKV4qolDhvRCnuMK8cadvi3hviETJnpYh3a/Apm4uDUw2WFArey
 enrWsoQ2oK0PHJ7pGjlvfk1oWg41uqZ6tm82vIOjFKIa+joYvJYSHg8kUrRyhvuZFO6j
 9MsA==
X-Gm-Message-State: AOJu0Yy1LL4Kkx2qO6LRyuBqHtG2NMZw6GYiEyY2oCLo/ia9M/QWIurC
 nmgSBqPpIbTn1tKU2uEme69IULSyXVVGoC6A4XBrKJGRhKC2I+vtw2QYeiG128Q0bpzvJkKKqd5
 DYRco
X-Gm-Gg: Acq92OF6b9OzFdXjqwOs4Ck9gQ2YCR9cdrQAs8/Ty4wAcn4i/Mbxn/dm4RNSbM0WRxG
 pO5qIxuHmB6WG5kt6dFdEVPD9yTzEJRfkr6AbmMs5oAHbTnlOYCpJo4aFc4HrJ7Lj5X3p9UpYAu
 lWrnI1oWFQ6ld3gbz4JDHCraBLoc+tJWzb+9TPPXW4Pp9HWiS1DWLto+f3uH4wGfwupmQVtPWGs
 1N/zqfPi+2+elt2mFUz0HH191ck/VD+22xe6CnpERV2WhmqsOCXUbrnCvCNzh7BOXv2LFSDAxmi
 5DKzNPJmVkp5sfb5eH0dD+qqV7jfV6bu0InrfTL1HjAc+jfA6q9ZFV7BXZ00zgge+tgbZE79hX7
 fpYKac66pNXm3MBhxn2U7qQJZ2Uc7blpFV3EscnpjpoT0nJCwjmX9XSuOkCOLFDAVIz5xRkiixr
 5w2JQ6zwVLCjrDhgghSxIbZ9AA0NbeMP2bf/VaM05fRGpCQ4LEzECLiJG83vbFhHPeEKuvwvqKG
 IyjW0N3dz/yxO05FlfyNF8K3GkzOpFTonGI
X-Received: by 2002:a05:6000:161e:b0:45f:1bd:a053 with SMTP id
 ffacd0b85a97d-460302dc4f3mr9644639f8f.1.1780786290333; 
 Sat, 06 Jun 2026 15:51:30 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm67014650f8f.27.2026.06.06.15.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2026 15:51:29 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  7 Jun 2026 00:51:17 +0200
Message-ID: <20260606225120.409046-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606225120.409046-1-romain.naour@smile.fr>
References: <20260606225120.409046-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780786290; x=1781391090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zBwyXXmPG1HcWDCU91KJjYLswVYgOktXiC4W/A4zLzc=;
 b=mZx6dTpbOY8MgoKNH+r0XNjuInIBW/Mid6+jDzlTsfooQZ+n8ZekHN0ELerIwVUwoo
 PC/IsFpKa53Xxj1AdafDd0RjQISNjaIBKxSz6SxCvp+ncOxLirkw0Zoqb9YStUBjdmne
 CNOssIPfq8WgbH0fjHg7kOu/szlAPNxE+5sCQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=mZx6dTpb
Subject: [Buildroot] [PATCH 6/7] configs/acmesystems_arietta_g25_{128mb,
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

This configuration for the acmesystems arietta g25 were added back in
February 2016 (commit e173aeece51852d652c557546d9944ee42c91e4f), and has
not been updated in any significant way since 2019 (the last major
kernel update [1]).

This defconfig still use a 4.19 kernel that is no longer maintained.

Remove its support.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913803 (acmesystems_arietta_g25_256mb_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913802 (acmesystems_arietta_g25_128mb_defconfig)

[1] 42ea31c114f32a100923e51cb2b6b6d67c38ca3f

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/acmesystems/arietta-g25/genimage.cfg    | 36 --------------
 .../at91bootstrap3/at91bootstrap3.hash        |  2 -
 .../patches/linux-headers/linux-headers.hash  |  1 -
 .../arietta-g25/patches/linux/linux.hash      |  2 -
 board/acmesystems/arietta-g25/readme.txt      | 49 -------------------
 .../acmesystems_arietta_g25_128mb_defconfig   | 26 ----------
 .../acmesystems_arietta_g25_256mb_defconfig   | 26 ----------
 7 files changed, 142 deletions(-)
 delete mode 100644 board/acmesystems/arietta-g25/genimage.cfg
 delete mode 100644 board/acmesystems/arietta-g25/patches/at91bootstrap3/at91bootstrap3.hash
 delete mode 120000 board/acmesystems/arietta-g25/patches/linux-headers/linux-headers.hash
 delete mode 100644 board/acmesystems/arietta-g25/patches/linux/linux.hash
 delete mode 100644 board/acmesystems/arietta-g25/readme.txt
 delete mode 100644 configs/acmesystems_arietta_g25_128mb_defconfig
 delete mode 100644 configs/acmesystems_arietta_g25_256mb_defconfig

diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
deleted file mode 100644
index 3b67a474cd..0000000000
--- a/board/acmesystems/arietta-g25/genimage.cfg
+++ /dev/null
@@ -1,36 +0,0 @@
-# Minimal SD card image for the Acmesystems Arietta G25
-
-image boot.vfat {
-	vfat {
-		file zImage {
-			image = "zImage"
-		}
-
-		file acme-arietta.dtb {
-			image = "at91-ariettag25.dtb"
-		}
-
-		file boot.bin {
-			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.10.3.bin"
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
diff --git a/board/acmesystems/arietta-g25/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/arietta-g25/patches/at91bootstrap3/at91bootstrap3.hash
deleted file mode 100644
index 6edf3d3345..0000000000
--- a/board/acmesystems/arietta-g25/patches/at91bootstrap3/at91bootstrap3.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/acmesystems/arietta-g25/patches/linux-headers/linux-headers.hash b/board/acmesystems/arietta-g25/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/acmesystems/arietta-g25/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/acmesystems/arietta-g25/patches/linux/linux.hash b/board/acmesystems/arietta-g25/patches/linux/linux.hash
deleted file mode 100644
index 81824a41ee..0000000000
--- a/board/acmesystems/arietta-g25/patches/linux/linux.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
diff --git a/board/acmesystems/arietta-g25/readme.txt b/board/acmesystems/arietta-g25/readme.txt
deleted file mode 100644
index f356b0a264..0000000000
--- a/board/acmesystems/arietta-g25/readme.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Acme Systems Arietta G25
-
-Intro
-=====
-
-This default configuration will allow you to start experimenting with the
-buildroot environment for the Arietta G25. With the current configuration
-it will bring-up the board, and allow access through the serial console.
-
-You can find additional informations, tutorials and a very comprehensive
-documentation on http://www.acmesystems.it/arietta.
-
-Build instructions
-==================
-
-To build an image for the Arietta G25 choose the configuration
-corresponding to the Arietta variant.
-
-For 128MB RAM variant type:
-
-$ make acmesystems_arietta_g25_128mb_defconfig
-
-else for 256MB RAM variant type:
-
-$ make acmesystems_arietta_g25_256mb_defconfig
-
-To customize the configuration chosen type:
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
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-
-Insert the microSD card into the Arietta slot and power it.
-
-The image just built is fairly basic and the only output
-you will get is on serial console, please consider to use a DPI
-cable (http://www.acmesystems.it/DPI)
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
deleted file mode 100644
index 788818c118..0000000000
--- a/configs/acmesystems_arietta_g25_128mb_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_GLOBAL_PATCH_DIR="board/acmesystems/arietta-g25/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
deleted file mode 100644
index c483ae4c57..0000000000
--- a/configs/acmesystems_arietta_g25_256mb_defconfig
+++ /dev/null
@@ -1,26 +0,0 @@
-BR2_arm=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
-BR2_GLOBAL_PATCH_DIR="board/acmesystems/arietta-g25/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_TARGET_GENERIC_ISSUE="Welcome to Arietta-G25 Buildroot"
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/arietta-g25/genimage.cfg"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.315"
-BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariettag25"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_AT91BOOTSTRAP3=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.10.3"
-BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
