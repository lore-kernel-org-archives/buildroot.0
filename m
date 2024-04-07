Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DE0CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2567C41E68;
	Sun,  7 Apr 2024 10:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPBes_XmTYac; Sun,  7 Apr 2024 10:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87B2441E65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87B2441E65;
	Sun,  7 Apr 2024 10:36:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4B01BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66C8E608ED
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39E20FJAQX8T for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 77D37608E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77D37608E9
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 77D37608E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4164c9debf6so3048525e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486122; x=1713090922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJoYKQNNosphuQHB3Z1qkwS6Ja+T5pY1g62jfExKK10=;
 b=INxjVtdqOkiHKiXZTdH24rjaIrgpcfrdG1VFm90KgTM3/OFNlXFG4VDCV8g08otyZU
 mZtPMmhZWtV1m3aNgjlPBBwQX34nN65HOG3cc6oc3Mu1SFs0VprALrzqgwWd+SM8FHOt
 /wKCsvJyQtO6JzLupFwKAcgywmciD3S9nMRCEaoM+Ul/rvflINZYBR/DBfHZko8S2A+V
 s4BXi4yKhSFHeu/BwzBEQGH26XnnhHcJMuKb10ViGLBy3NE4bD3dDA5H4mYfo1IxI6Ne
 bsHqgfN/Glox9LY+uyda8XG3CGTRg6Yk1IFVauD7i7fixeAfK4vrYiTfJ9Hv0gbpTQz6
 tvNA==
X-Gm-Message-State: AOJu0YwaG04a+90rWbK5VrA2KoAr+js+j98OBgyivp2YSUyLIcSDg6Vx
 Je1yrz3vC63mj1ygzY0Q1gh1KbJkNhi9t33cxtGmB0GsJhm9zTrOQ/Ko8VYNMaTW7KyvbmW7Dye
 O
X-Google-Smtp-Source: AGHT+IFP0J2/dKqjcidZJ6X7MAWRohtpwVARgp9gYtj8lEymyhpmdM/WWtkC+HG3J1bP0/Zaz5wzRw==
X-Received: by 2002:a05:600c:4f54:b0:416:6abe:2975 with SMTP id
 m20-20020a05600c4f5400b004166abe2975mr170605wmq.15.1712486122620; 
 Sun, 07 Apr 2024 03:35:22 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:22 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:35:06 +0200
Message-ID: <20240407103512.1112712-14-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486122; x=1713090922;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJoYKQNNosphuQHB3Z1qkwS6Ja+T5pY1g62jfExKK10=;
 b=k8b1ex6AcmNNMOvWL5pnkMuEiqhe7fR6RQYR91n73E1H/6R40Q35Z/1QO1npLzEMZk
 E9KqyqpTNDffFJmK+emfOL+cOaxMhUepnv6aRT8mDef06OCH3V4tJRUBVVj4JGqGLrBX
 bPlvPpm9n6g1MwnY4GE7vp6Ze5iHOQnAihzdGvAJK139mUijZtJCTdWIp4K9rvWfJRdf
 3OO+6+QeOG2nBL/eI6eHNK6uhbteRT7zCQJ79IyOLdX2QPjFdS74cjhsHAr2ORn36ouC
 E80UuHQrqRGLikqoOdrLOffMKImN7afV+ElEU6QA/3ksNiLjzsgruvHNCNhkyIrfOAuT
 lHww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=k8b1ex6A
Subject: [Buildroot] [PATCH v12 13/16] boot/uboot: remove
 BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previoulsy (without binman), when a TI K3 SoC using Combined binary
with a split firmware boot method was used (am62ax or am62x) [1], the
user had to select BR2_TARGET_UBOOT_NEEDS_TI_K3_DM in the defconfig
to provide Device Manager firmware provided by ti-k3-boot-firmware.

With binman, this option is no longer necessary since
ti-k3-boot-firmware package is already in the u-boot dependency and the
path to DM and SYSFW binaries are provided by BINMAN_INDIRS.

We are going to remove ti-k3-image-gen, so binman is now mandatory on
all TI K3 SoCs.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/52ce606c05ee3ac869f8087292bc3dbb0d25b79b

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/uboot/Config.in | 13 -------------
 boot/uboot/uboot.mk  |  4 ----
 2 files changed, 17 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 39e49d681b..8d2228dc7d 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -251,19 +251,6 @@ config BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
 	  j721e) also need the Device Manager (DM) firmware to be
 	  available for the U-Boot build.
 
-if BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE
-
-# TI_K3_DM_SOCNAME is only needed when ti-k3-image-gen is used for
-# TI K3 devices using the Device Manager (DM) firmware.
-# We use the SoC selection defined for the ti-k3-image-gen
-# package.
-config BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME
-	string
-	default "am62axx" if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62AX
-	default "am62xx"  if BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X
-
-endif
-
 config BR2_TARGET_UBOOT_NEEDS_OPENSBI
 	bool "U-Boot needs OpenSBI"
 	depends on BR2_TARGET_OPENSBI
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 398485195e..a894654698 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -195,11 +195,7 @@ UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_TI_K3_BOOT_FIRMWARE),y)
-UBOOT_TI_K3_DM_SOCNAME = $(call qstrip,$(BR2_TARGET_UBOOT_TI_K3_DM_SOCNAME))
 UBOOT_DEPENDENCIES += ti-k3-boot-firmware
-ifneq ($(UBOOT_TI_K3_DM_SOCNAME),)
-UBOOT_MAKE_OPTS += DM=$(BINARIES_DIR)/ti-dm/$(UBOOT_TI_K3_DM_SOCNAME)/ipc_echo_testb_mcu1_0_release_strip.xer5f
-endif
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
