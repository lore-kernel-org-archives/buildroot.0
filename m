Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F217EC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECF45413CB;
	Sat, 13 Jul 2024 14:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SztqpTkkFme; Sat, 13 Jul 2024 14:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6919A41513
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6919A41513;
	Sat, 13 Jul 2024 14:01:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF27C1BF861
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBACF413CB
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhODh0M_-c5K for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:01:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12ABA413C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12ABA413C7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12ABA413C7
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:01:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so22597875e9.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720879298; x=1721484098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dkfSPlJf+vKipljSzRs8hqn+GJcUqwzBQ3J/DBTmjmA=;
 b=PCsmxkl1eYLSFPkxYjd7+AKEsHQNhe/4OuTTaoLh2TCr0gzlfLAHm6vSzIevgtknLL
 ODyYlWTJUyEXeSJtKFdQ1e+Hz3lWxWbZSTfJzwVfJ64XOP1wOl1unebbVxV6lc6zhnJn
 ggLGB6ulHdmdRqPk2DGzfe+00apxOR+eK7c1/HIUclgxTqNUwKt3HH6gTd+S1RKAc6cU
 mKXIoFozGAAUpQUiyA6783PSXDRfXlum4M+XU2vOEuQR2wsJoYaHtXOrBSIwvs5aKuCT
 qp2y0Di0/AC3OUNg987zC3j7ng1cLj6kQ0gt0XHaloEwUd2Ht3sIBMAxQppjbIJMK00q
 8rjw==
X-Gm-Message-State: AOJu0YztapbD0xfZwRQoP6eyo/helJ4z+B3ipFcffuxu9wp5scPOshVA
 kpVxHN52qWGxdTMjeYNFccXSYFfZzbdv08qttH13M+YNYliDO39x+2d28XRiQEyhobt9P7cXSHR
 c/KA=
X-Google-Smtp-Source: AGHT+IFpg9BurcTgPq+TGUjgsDdEvKhwLBHGAij0TQcMBT/QXR5Kaaqmh530CDe89Zz+2TBQbTlWeg==
X-Received: by 2002:a05:600c:4712:b0:426:6416:aa83 with SMTP id
 5b1f17b1804b1-426706c91fbmr113839285e9.6.1720879297958; 
 Sat, 13 Jul 2024 07:01:37 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f27877dsm55342055e9.26.2024.07.13.07.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 07:01:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:01:32 +0200
Message-ID: <20240713140133.2107977-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240713140133.2107977-1-romain.naour@smile.fr>
References: <20240713140133.2107977-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720879298; x=1721484098; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dkfSPlJf+vKipljSzRs8hqn+GJcUqwzBQ3J/DBTmjmA=;
 b=b8Qw2TDuG2gU2ca551LQfPJPIQ0WEK0tJTYyqLJEm3rRAMW2NbqN3EL3RVFY5Vj5dD
 c5l/HDI6lsbYF8cz8CXOTvUbqC/BqWu4sYj1cl+xVx41eAa554Wv03hzXsZO7GAWcRUu
 dOl/UucjQVEguoe++ryGcLhmE83diywH0avd4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=b8Qw2TDu
Subject: [Buildroot] [PATCH 4/5] boot/beaglev-secondboot: remove package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The beaglev-secondboot was meant for the BeagleV-Starlight
board (beaglev_defconfig) but the support was removed.

Remove beaglev-secondboot too.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                              |  7 +++++
 DEVELOPERS                                    |  1 -
 boot/Config.in                                |  1 -
 boot/beaglev-secondboot/Config.in             |  9 ------
 .../beaglev-secondboot.hash                   |  3 --
 boot/beaglev-secondboot/beaglev-secondboot.mk | 28 -------------------
 6 files changed, 7 insertions(+), 42 deletions(-)
 delete mode 100644 boot/beaglev-secondboot/Config.in
 delete mode 100644 boot/beaglev-secondboot/beaglev-secondboot.hash
 delete mode 100644 boot/beaglev-secondboot/beaglev-secondboot.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 78dcabed63..28cfce3ce1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_TARGET_BEAGLEV_SECONDBOOT
+	bool "beaglev-secondboot has been removed"
+	select BR2_LEGACY
+	help
+	  The beaglev-secondboot package has been removed after
+	  the beaglev_defconfig removal.
+
 config BR2_PACKAGE_ONEVPL_INTEL_GPU
 	bool "onevpl-intel-gpu has been renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 181e5ef174..8a438db9cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3069,7 +3069,6 @@ N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/stmicroelectronics/stm32mp157c-dk2/
 F:	boot/beaglev-ddrinit/
-F:	boot/beaglev-secondboot/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	configs/stm32mp157c_dk2_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 25a50265d2..8f504fee34 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -5,7 +5,6 @@ source "boot/at91bootstrap3/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
 source "boot/beaglev-ddrinit/Config.in"
-source "boot/beaglev-secondboot/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/edk2/Config.in"
diff --git a/boot/beaglev-secondboot/Config.in b/boot/beaglev-secondboot/Config.in
deleted file mode 100644
index a9695fc138..0000000000
--- a/boot/beaglev-secondboot/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_TARGET_BEAGLEV_SECONDBOOT
-	bool "beaglev-secondboot"
-	depends on BR2_riscv
-	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
-	help
-	  This package builds the SecondBoot firmware used on the
-	  BeagleV platform.
-
-	  https://github.com/starfive-tech/beagle_secondBoot
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.hash b/boot/beaglev-secondboot/beaglev-secondboot.hash
deleted file mode 100644
index d35d3a3856..0000000000
--- a/boot/beaglev-secondboot/beaglev-secondboot.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  bf152500e9f7e467bb1dee95a2291f9ecfaaebe1d64b93f6d403cfaf50e540e0  beaglev-secondboot-e17302063c9a4b74475b18ff24dd149c27257354.tar.gz
-sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-secondboot/beaglev-secondboot.mk b/boot/beaglev-secondboot/beaglev-secondboot.mk
deleted file mode 100644
index 7e5f5681f4..0000000000
--- a/boot/beaglev-secondboot/beaglev-secondboot.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# beaglev-secondboot
-#
-################################################################################
-
-# Commit on the 'starfive' branch
-BEAGLEV_SECONDBOOT_VERSION = e17302063c9a4b74475b18ff24dd149c27257354
-BEAGLEV_SECONDBOOT_SITE = $(call github,starfive-tech,beagle_secondBoot,$(BEAGLEV_SECONDBOOT_VERSION))
-BEAGLEV_SECONDBOOT_INSTALL_TARGET = NO
-BEAGLEV_SECONDBOOT_INSTALL_IMAGES = YES
-BEAGLEV_SECONDBOOT_DEPENDENCIES = host-riscv64-elf-toolchain
-BEAGLEV_SECONDBOOT_LICENSE = GPL-2.0+
-BEAGLEV_SECONDBOOT_LICENSE_FILES = LICENSE
-
-define BEAGLEV_SECONDBOOT_BUILD_CMDS
-	$(MAKE) -C $(@D)/build \
-		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
-		SUFFIX=buildroot \
-		GIT_VERSION=$(BEAGLEV_SECONDBOOT_VERSION)
-endef
-
-define BEAGLEV_SECONDBOOT_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/build/bootloader-JH7100-buildroot.bin.out \
-		$(BINARIES_DIR)/bootloader-JH7100-buildroot.bin.out
-endef
-
-$(eval $(generic-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
