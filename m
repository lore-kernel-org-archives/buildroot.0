Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61870C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 21:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CD244026F;
	Wed, 29 May 2024 21:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGxMn5CWF5sV; Wed, 29 May 2024 21:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD450403AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD450403AA;
	Wed, 29 May 2024 21:38:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10ABB1D3B5F
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 21:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 065C1403AA
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 21:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AKsf7vWTvE9 for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 21:38:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98DF94026F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98DF94026F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98DF94026F
 for <buildroot@buildroot.org>; Wed, 29 May 2024 21:38:06 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4210aa00c94so2266935e9.1
 for <buildroot@buildroot.org>; Wed, 29 May 2024 14:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717018684; x=1717623484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+YwzxkGTAikv6oKpdF+2pl6bHKRxJvex7WsLoy9oVkk=;
 b=KWRf965zunyWguFnpLns26Yv3HgU+eTwKn/4o01x/NDUOM60BCPapd0WrSd9wMAvFK
 KJGybTTiuWg55We4SoWzaVYTM3K08w/Gw1XovTVl8D48FR47r97G5+z4Z4wYh7hcE3Q9
 iBNePM2pWAa708po1EArIYSLYajshrVoUk38+0KVlVp4Lc8iELp2WV7fwYW3xEs9QVuz
 fvoc7X3ZtPsvVl8/aJeWOTSQ0t0HdK9jO94VoI4A8JL33M64C54QhsvOsuwCG5CNhITC
 kliFW6fiKB9fJNBvE2Dmnmle2NXu24Z/aBrruCM0FsVO1yrXNd4oOWt/LWedtzK9UQSJ
 mkZg==
X-Gm-Message-State: AOJu0Ywqb4UZZAgoL4wOg920L3Bqz9bYJ6tz/pQZKthwxR6Dyk3+gHAs
 4SjzWdl2I+yCrCjnh2eAlVeIiAhU8nmbO47a5ovHLeyf9vCvAW4WNMNwIzO10o6N9SZcd6Fg8EM
 nPsE=
X-Google-Smtp-Source: AGHT+IE5OzFUhB0FKvnEzNx23VVLiRiLpz7NHGabOlBG6Sbup3eTBDdVJEmVeHJ5iNQmz+Mt3XvOqw==
X-Received: by 2002:a05:600c:a47:b0:418:2b26:47a3 with SMTP id
 5b1f17b1804b1-4212792412fmr4236195e9.32.1717018683543; 
 Wed, 29 May 2024 14:38:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3564b762ca8sm15144296f8f.112.2024.05.29.14.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 14:38:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 23:37:51 +0200
Message-ID: <20240529213751.3919280-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717018684; x=1717623484;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+YwzxkGTAikv6oKpdF+2pl6bHKRxJvex7WsLoy9oVkk=;
 b=ERaPHuD/ha/SWIwbJct3q4hMkRPTsNftOtewJCInFf+3+gU0GyJgcnIRzRk1/NowFA
 QTw9riqIyU0THQZbnL/DjbSzke83BkzcjdzAi38hS5LSiwKQIjg3huUJ6TJAKk258qth
 +rdlOhK9orrBRTMhWO4uf2SVzBJQbhnFjw5RE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ERaPHuD/
Subject: [Buildroot] [PATCH v2 1/1] configs/at91sam9x5ek*_defconfig: add
 hashes for at91bootstrap3/Linux/headers/u-boot
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Furthermore, the use of the directory board/atmel/at91sam9x5ek/patches
for all 4 at91sam9x5ek*_defconfig configurations automatically fixes the
Linux compilation failure for the at91sam9x5ek_defconfig,
at91sam9x5ek_mmc_defconfig, and at91sam9x5ek_mmc_dev_defconfig
configurations as well.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
- Put the patches under board/atmel/at91sam9x5ek/patches and use them
  for all 4 configurations (i. e. at91sam9x5ek_defconfig,
  at91sam9x5ek_dev_defconfig, at91sam9x5ek_mmc_defconfig and
  at91sam9x5ek_mmc_dev_defconfig).

 .checkpackageignore                                           | 4 ----
 .../at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash   | 2 ++
 .../at91sam9x5ek/patches/linux-headers/linux-headers.hash     | 1 +
 ...ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch | 0
 board/atmel/at91sam9x5ek/patches/linux/linux.hash             | 2 ++
 board/atmel/at91sam9x5ek/patches/uboot/uboot.hash             | 2 ++
 configs/at91sam9x5ek_defconfig                                | 2 ++
 configs/at91sam9x5ek_dev_defconfig                            | 3 ++-
 configs/at91sam9x5ek_mmc_defconfig                            | 4 ++++
 configs/at91sam9x5ek_mmc_dev_defconfig                        | 2 ++
 10 files changed, 17 insertions(+), 5 deletions(-)
 create mode 100644 board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash
 create mode 120000 board/atmel/at91sam9x5ek/patches/linux-headers/linux-headers.hash
 rename board/atmel/{at91sam9x5ek_dev => at91sam9x5ek}/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch (100%)
 create mode 100644 board/atmel/at91sam9x5ek/patches/linux/linux.hash
 create mode 100644 board/atmel/at91sam9x5ek/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index f6d54361bc10..84834edda9d9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -134,10 +134,6 @@ configs/at91sam9260eknf_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9g20dfc_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9g45m10ek_defconfig lib_defconfig.ForceCheckHash
 configs/at91sam9rlek_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9x5ek_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9x5ek_dev_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9x5ek_mmc_defconfig lib_defconfig.ForceCheckHash
-configs/at91sam9x5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash b/board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash
new file mode 100644
index 000000000000..6edf3d3345ec
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/patches/at91bootstrap3/at91bootstrap3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  5ea2a8fed1ba0024229c6f6d77176679e1b24791bdbce8e285634013d4a93551  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/atmel/at91sam9x5ek/patches/linux-headers/linux-headers.hash b/board/atmel/at91sam9x5ek/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/atmel/at91sam9x5ek/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
similarity index 100%
rename from board/atmel/at91sam9x5ek_dev/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
rename to board/atmel/at91sam9x5ek/patches/linux/0001-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
diff --git a/board/atmel/at91sam9x5ek/patches/linux/linux.hash b/board/atmel/at91sam9x5ek/patches/linux/linux.hash
new file mode 100644
index 000000000000..baf48c8a64b6
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6cc67b3d2d550c3f0b201d7850bdb25503bc6a51e41b98d2c0fbd531b56f3a20  linux-linux4sam_6.1.tar.gz
diff --git a/board/atmel/at91sam9x5ek/patches/uboot/uboot.hash b/board/atmel/at91sam9x5ek/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..f6d9f29bc8db
--- /dev/null
+++ b/board/atmel/at91sam9x5ek/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  cc72d6a36ebf5f0970e18788b1e1dc9b76ba9237ec6745c6f16f1b2e1d8fb3a0  uboot-linux4sam_6.1-git4.tar.gz
diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
index 70e2d94826f1..a87b2cb8d722 100644
--- a/configs/at91sam9x5ek_defconfig
+++ b/configs/at91sam9x5ek_defconfig
@@ -2,6 +2,8 @@ BR2_arm=y
 BR2_arm926t=y
 # Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.1)/linux-linux4sam_6.1.tar.gz"
diff --git a/configs/at91sam9x5ek_dev_defconfig b/configs/at91sam9x5ek_dev_defconfig
index bc034019b441..7c95ec568369 100644
--- a/configs/at91sam9x5ek_dev_defconfig
+++ b/configs/at91sam9x5ek_dev_defconfig
@@ -8,7 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
-BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek_dev/patches"
+BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 
diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
index 79a300a81b36..2ddf8d64b09d 100644
--- a/configs/at91sam9x5ek_mmc_defconfig
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -9,6 +9,10 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/at91sam9x5ek_mmc/genimage.cfg"
 
+# System Configuration
+BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index 3b2016b97044..d261985b186e 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -8,6 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # System Configuration
+BR2_GLOBAL_PATCH_DIR="board/atmel/at91sam9x5ek/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 # Needed for usb-utils
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 # Creation of the SD card image
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
