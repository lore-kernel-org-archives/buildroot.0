Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF835C3DA4B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91A0D41704;
	Sat, 13 Jul 2024 14:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yT796SLbiVnW; Sat, 13 Jul 2024 14:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD4864156F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD4864156F;
	Sat, 13 Jul 2024 14:01:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B9741BF861
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9187C413C3
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j23sJJyO1sRx for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:01:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D45D2413B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45D2413B1
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D45D2413B1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:01:40 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52e9f863c46so3199371e87.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720879299; x=1721484099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=88D8EXYx6cPt1O/o5iIg/GMFR3PawMFElQ0eiu9jxZ8=;
 b=Rg0qlecGFDSfg8frPnAiySRzAM1jLgNo3eUzucuNxmJ25JZV0zyA14EuuFdDBZKhY5
 6mWtt36Ly9V3dKB2Yn47D5xQPyGCsGqakpWuTcr1K0Vrgf8TZvT+ZwZbzghBLvDCv21Z
 f+yJ+BcH6CuOBxngaJOEQYgO5VAssd82OMtlEvKYcSw6Eh9/H5YpF8vhuB0dc8+xuWti
 L5ak+UdUdLR/uFrgQAI3tb6z8ndDNeaUDIYvbYZEgN9zskfTX+BVQtVHGvW4ULH6YLz1
 rA/2Yfg/iWineWXA/em+zhVp3cj81HFwO3pUHU6P6YJk3fcgkhRdRyvOdCxrFgC7q/NY
 QK9g==
X-Gm-Message-State: AOJu0YxwOwt/5LU1I+llXRvWmbgvJ+QEgjTPoRKC3RvsVcyqXE+S/nwB
 NUV+MTJDKrtPCYUddyi7wixgMwB81CrVsrXDoL1XtUpoq56M9JVvnkoVpaGawuCtAcEdbZebYKz
 8Bdk=
X-Google-Smtp-Source: AGHT+IEye6qKCMPI/nhsDSQ8VnNPe41XSUqJ7qjLcvalDa7a76saL2ZKBA+u96+xL3qEnkR06Um6vQ==
X-Received: by 2002:ac2:53ab:0:b0:52c:dea0:dd55 with SMTP id
 2adb3069b0e04-52eb9995376mr7487700e87.24.1720879298636; 
 Sat, 13 Jul 2024 07:01:38 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f27877dsm55342055e9.26.2024.07.13.07.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 07:01:38 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:01:33 +0200
Message-ID: <20240713140133.2107977-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240713140133.2107977-1-romain.naour@smile.fr>
References: <20240713140133.2107977-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720879299; x=1721484099; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=88D8EXYx6cPt1O/o5iIg/GMFR3PawMFElQ0eiu9jxZ8=;
 b=AmzCSveFB1yIEL9wqCImF3XSwpbpvX50RsTGO0+pN+S8bXryxKMcD5zRsu5Uxn6gzN
 erKrVp47tFGVirx5tUJ0x+Z+0ssFVuvxW3fiRcObrNueYXdCBSHvxXcvwQmRJoKK6ZLH
 eTDJIEZBxdEdg104ve16a9vMUNO3rgk/W3erE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=AmzCSveF
Subject: [Buildroot] [PATCH 5/5] boot/beaglev-ddrinit: remove package
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

The beaglev-ddrinit was meant for the BeagleV-Starlight
board (beaglev_defconfig) but the support was removed.

Remove beaglev-ddrinit too.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                          |  7 ++++++
 DEVELOPERS                                |  1 -
 boot/Config.in                            |  1 -
 boot/beaglev-ddrinit/Config.in            |  9 --------
 boot/beaglev-ddrinit/beaglev-ddrinit.hash |  3 ---
 boot/beaglev-ddrinit/beaglev-ddrinit.mk   | 28 -----------------------
 6 files changed, 7 insertions(+), 42 deletions(-)
 delete mode 100644 boot/beaglev-ddrinit/Config.in
 delete mode 100644 boot/beaglev-ddrinit/beaglev-ddrinit.hash
 delete mode 100644 boot/beaglev-ddrinit/beaglev-ddrinit.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 28cfce3ce1..36efcfb7af 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_TARGET_BEAGLEV_DDRINIT
+	bool "beaglev-ddrinit has been removed"
+	select BR2_LEGACY
+	help
+	  The beaglev-secondboot package has been removed after
+	  the beaglev_defconfig removal.
+
 config BR2_TARGET_BEAGLEV_SECONDBOOT
 	bool "beaglev-secondboot has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8a438db9cd..6acda869dd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3068,7 +3068,6 @@ F:	package/go/
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/stmicroelectronics/stm32mp157c-dk2/
-F:	boot/beaglev-ddrinit/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	configs/stm32mp157c_dk2_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 8f504fee34..5c8d0e7ee5 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -4,7 +4,6 @@ source "boot/afboot-stm32/Config.in"
 source "boot/at91bootstrap3/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
-source "boot/beaglev-ddrinit/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/edk2/Config.in"
diff --git a/boot/beaglev-ddrinit/Config.in b/boot/beaglev-ddrinit/Config.in
deleted file mode 100644
index 7ca92a7b9b..0000000000
--- a/boot/beaglev-ddrinit/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_TARGET_BEAGLEV_DDRINIT
-	bool "beaglev-ddrinit"
-	depends on BR2_riscv
-	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
-	help
-	  This package builds the DDRinit firmware used on the BeagleV
-	  platform.
-
-	  https://github.com/starfive-tech/beagle_ddrinit
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.hash b/boot/beaglev-ddrinit/beaglev-ddrinit.hash
deleted file mode 100644
index d4235904d1..0000000000
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  08a49355f89fc2cb4f5101183339c9c6f86b722545d0abbc319aab26a511dad7  beaglev-ddrinit-8d6318acfe71e790c983b34448c9abfcfcec3ed8.tar.gz
-sha256  284d26192537710910ec1f112ec5f4c981601ae23702391986d6ce0b8ba90813  LICENSE
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
deleted file mode 100644
index d9707de610..0000000000
--- a/boot/beaglev-ddrinit/beaglev-ddrinit.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# beaglev-ddrinit
-#
-################################################################################
-
-# Commit on the 'starfive' branch
-BEAGLEV_DDRINIT_VERSION = 8d6318acfe71e790c983b34448c9abfcfcec3ed8
-BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrinit,$(BEAGLEV_DDRINIT_VERSION))
-BEAGLEV_DDRINIT_INSTALL_TARGET = NO
-BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
-BEAGLEV_DDRINIT_DEPENDENCIES = host-riscv64-elf-toolchain
-BEAGLEV_DDRINIT_LICENSE = GPL-2.0+
-BEAGLEV_DDRINIT_LICENSE_FILES = LICENSE
-
-define BEAGLEV_DDRINIT_BUILD_CMDS
-	$(MAKE) -C $(@D)/build \
-		CROSS_COMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
-		SUFFIX=buildroot \
-		GIT_VERSION=$(BEAGLEV_DDRINIT_VERSION)
-endef
-
-define BEAGLEV_DDRINIT_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/build/ddrinit-2133-buildroot.bin.out \
-		$(BINARIES_DIR)/ddrinit-2133-buildroot.bin.out
-endef
-
-$(eval $(generic-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
