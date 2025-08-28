Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774DAC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B45883B6D;
	Thu, 28 Aug 2025 13:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wvDiFtXC4sZ; Thu, 28 Aug 2025 13:28:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E784A83B63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E784A83B63;
	Thu, 28 Aug 2025 13:28:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D934B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4369660DFA
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3clZHnEelWv9 for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:28:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::641; helo=mail-ej1-x641.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA94860DEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA94860DEC
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA94860DEC
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:28:19 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-afede1b3d05so166040366b.2
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 06:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756387697; x=1756992497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZSFRND42hXpg9f9somr7ACcgJAXtcdJ5M+8k97Qaqas=;
 b=knEIAfjSsfVhGXSX/VY+jaPwHusAMXrhZjZuK7SOG/UGWg5PhNKGQqpe/z/XB/5+Oe
 wyWNl3myBBTWbd+P0MX9UIi8cvle28bPrX0ctCZRcpKVtxtmBfw1GXQ3QV+Wwxxzo6+Z
 fFqFvI9nTQSk/7dXZxz0v00FOFF4q12WPKaOWLOnZ2924lgs7G++JLfCE9fVsO1pUhbc
 D0x5GUR5uUN4AC56vLS0CCDwe6owRYumKMnKoHxmEPtQejACaAe+5kf0RelNh9ptXQ8L
 fCO3/gf4gQ7SmdgBf7sidZaka8uGfWAATbwa1Vx4O1+49HHQurez6C2gGVYp5LMgGSfe
 AIag==
X-Gm-Message-State: AOJu0YzwasgE+MqDxasFt0LKAhcDrgT+jEUW9m1DFfpdpVOUrwYBDixq
 KIUVE8ucEGGTkDZby4CNwV+SIXB8zZe8oE/BQHEo1CZiGadL3ivElT+Ds5nRtG2uzjJAObReEwJ
 yCeVdTEpX8knNXj+yNA==
X-Gm-Gg: ASbGnctgb1inZPCMWEXbmpPcWgrlY2LWbRVwJxDEnxoBo8bI7eODBatKtZsnrV5eSqJ
 brXNLY/3Xe0zwZS6YAM82+hkyIM+OXvViYj+XMn56JcfJrFW6OzoSd5nTjA6NKymCgLRVXh4txV
 jGuQS1amfYPYYZ1OXgBgdfD8Fvn7zr8ZbccFoMuIGfCcZ5JDRHcdVMl1+7Zt2mC9eU2e0oYH0qr
 XjTsNgDGs/0WuwqjxnNQ2C3RZucb0tR1kCbDPZbiHpSWYWlvZ3xzI0Ar6aPfNGM6/2Xx/VzO17Q
 U7v7HnFV0xJsIjwWsj5cJ13DxTPXvav32xmBBsyAPuf51RrCyIrSkPA12eGH+1uJ0gA/xlYgL1i
 eJo4NsCcK2G9Q/s0BkwNaS2t1/yKhPl5ugmyAVZPakMSzApkbGLZrSfi4Fw0faT6huR54QplfZU
 dN6MwsnTfWrRqtBfhS
X-Google-Smtp-Source: AGHT+IEyWSobwqCwoOTBXM+wzsd65UpyUP5l8P0J6v7RqI6tp4rf42fyOZAxCZJk+0lIAFSO9/79Vg==
X-Received: by 2002:a17:907:3e96:b0:afe:8b4f:bb64 with SMTP id
 a640c23a62f3a-afe8b4fc306mr1312861466b.14.1756387697455; 
 Thu, 28 Aug 2025 06:28:17 -0700 (PDT)
Received: from dragon.local.ess-mail.com (31-207-9-44.static.ef-service.nl.
 [31.207.9.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afea4b5eafcsm614140766b.9.2025.08.28.06.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 06:28:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: David Lechner <david@lechnology.com>
Date: Thu, 28 Aug 2025 15:27:49 +0200
Message-ID: <20250828132749.41538-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756387697; x=1756992497; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSFRND42hXpg9f9somr7ACcgJAXtcdJ5M+8k97Qaqas=;
 b=UCl1V8fgKB2elTaZEsG2dbgPJ9wyd3Dtc4PJIZ0cyro54+nBhc/vFkBMwtTIaRrWSN
 QKhjsyAQW+LmJh+80SHbe4d0Cl5361s42mWL9cxcFRIlx5SObJjCzthC3fcxYqImlhTv
 DOlEfOj87aHQ61McgMZQNzqXiphj/86v3vG6RwdTvB4yXM7YiUxipVL0Cd8vj33MULMH
 Dtklym4oPztmEqbJ3aCsgr8IiMNiGwT67oxLLcUGHpOs9v6ybZcv6+tQcSUKkUxOdvRV
 pIm4H/36hn+6olkwboNG2AYfTR6+Xsm5gnVJIgWI1N6lmLBARPSEoj40NsCC2e/zIi0R
 3IgA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UCl1V8fg
Subject: [Buildroot] [PATCH] package/ev3dev-linux-drivers: remove package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These external linux drivers haven't seen any activity in Buildroot
for a while, and are anyway aimed at an old kernel version (4.19).

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                                     |  7 +++++++
 DEVELOPERS                                           |  2 --
 linux/Config.ext.in                                  | 10 ----------
 linux/linux-ext-ev3dev-linux-drivers.mk              | 12 ------------
 package/Config.in                                    |  1 -
 package/ev3dev-linux-drivers/Config.in               | 12 ------------
 package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk | 11 -----------
 package/ev3dev-linux-drivers/lego-linux-drivers.hash |  2 --
 8 files changed, 7 insertions(+), 50 deletions(-)
 delete mode 100644 linux/linux-ext-ev3dev-linux-drivers.mk
 delete mode 100644 package/ev3dev-linux-drivers/Config.in
 delete mode 100644 package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
 delete mode 100644 package/ev3dev-linux-drivers/lego-linux-drivers.hash

diff --git a/Config.in.legacy b/Config.in.legacy
index 0bedc24dce..82e6e25558 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS
+	bool "ev3dev Linux drivers have been removed"
+	select BR2_LEGACY
+	help
+	  Linux drivers for LEGO MINDSTORMS EV3 from the ev3dev project
+	  are targetting an outdated kernel which is no longer supported
+
 config BR2_KERNEL_HEADERS_6_15
 	bool "kernel headers version 6.15.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 537a8bc516..80a9c4e227 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -836,9 +836,7 @@ F:	package/libtalloc/
 N:	David Lechner <david@lechnology.com>
 F:	board/lego/ev3/
 F:	configs/lego_ev3_defconfig
-F:	linux/linux-ext-ev3dev-linux-drivers.mk
 F:	package/brickd/
-F:	package/ev3dev-linux-drivers/
 
 N:	David Pierret <david.pierret@smile.fr>
 F:	package/bat/
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3cbf42d344..229d6b8c76 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -55,16 +55,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	help
 	  RTAI Kernel part.
 
-#-------------------------------------------------------------------------------
-# ev3dev Linux drivers
-config BR2_LINUX_KERNEL_EXT_EV3DEV_LINUX_DRIVERS
-	bool "ev3dev Linux drivers"
-	select BR2_PACKAGE_EV3DEV_LINUX_DRIVERS
-	help
-	  Linux drivers for LEGO MINDSTORMS EV3 from the ev3dev project.
-
-	  https://github.com/ev3dev/lego-linux-drivers
-
 #-------------------------------------------------------------------------------
 # fbtft
 config BR2_LINUX_KERNEL_EXT_FBTFT
diff --git a/linux/linux-ext-ev3dev-linux-drivers.mk b/linux/linux-ext-ev3dev-linux-drivers.mk
deleted file mode 100644
index 3bb12db38d..0000000000
--- a/linux/linux-ext-ev3dev-linux-drivers.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# Patch the linux kernel with ev3dev extension
-#
-################################################################################
-
-LINUX_EXTENSIONS += ev3dev-linux-drivers
-
-define EV3DEV_LINUX_DRIVERS_PREPARE_KERNEL
-	mkdir -p $(LINUX_DIR)/drivers/lego
-	cp -dpfr $(EV3DEV_LINUX_DRIVERS_DIR)/* $(LINUX_DIR)/drivers/lego/
-endef
diff --git a/package/Config.in b/package/Config.in
index 899301078e..02d9a27d0f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -512,7 +512,6 @@ endmenu
 	source "package/esp-hosted/Config.in"
 	source "package/espflash/Config.in"
 	source "package/eudev/Config.in"
-	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
 	source "package/fbtft/Config.in"
diff --git a/package/ev3dev-linux-drivers/Config.in b/package/ev3dev-linux-drivers/Config.in
deleted file mode 100644
index 9be2f282e9..0000000000
--- a/package/ev3dev-linux-drivers/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-# Prompt-less option, because this package is not doing anything except
-# downloading the ev3dev driver sources. The real work is done by a Linux
-# extension.
-config BR2_PACKAGE_EV3DEV_LINUX_DRIVERS
-	bool
-	depends on BR2_LINUX_KERNEL
-	help
-	  Linux drivers for LEGO MINDSTORMS EV3
-
-	  This is only the download helper for the kernel patch.
-
-	  https://github.com/ev3dev/lego-linux-drivers
diff --git a/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk b/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
deleted file mode 100644
index 92e8927817..0000000000
--- a/package/ev3dev-linux-drivers/ev3dev-linux-drivers.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-#
-# ev3dev Linux drivers
-#
-################################################################################
-
-EV3DEV_LINUX_DRIVERS_VERSION = 0e551eb25ae8600c1f178814781bfb42dc835496
-EV3DEV_LINUX_DRIVERS_SITE = $(call github,ev3dev,lego-linux-drivers,$(EV3DEV_LINUX_DRIVERS_VERSION))
-EV3DEV_LINUX_DRIVERS_LICENSE = GPL-2.0
-
-$(eval $(generic-package))
diff --git a/package/ev3dev-linux-drivers/lego-linux-drivers.hash b/package/ev3dev-linux-drivers/lego-linux-drivers.hash
deleted file mode 100644
index cc48f65395..0000000000
--- a/package/ev3dev-linux-drivers/lego-linux-drivers.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  9d2740b348c8d43e7e15fedc4cec99bf351a3a2ba8691f2a07c439a9c034bc04  lego-linux-drivers-0e551eb25ae8600c1f178814781bfb42dc835496.tar.gz
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
