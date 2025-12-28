Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739B8E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 15:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24B9E40535;
	Sun, 28 Dec 2025 15:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dta4gOme_FQ; Sun, 28 Dec 2025 15:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CC584053D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766935349;
	bh=Hcsuzd8Td1U/vxpQ09V492Xv0S9PtnHcMCfFRKVma2U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XiCVPDyZwLNbe6omrcyv1/p+YTvz3v/q9V/6Y0MAyyky3ifEecykim9k72AwtuR3e
	 R18+N1u7FCwLeqMNx5178UQRV6K7l6mV29EzV6gBOgEdCAcqQOfZIBkCpPyfD7Brxf
	 TlVZ7weE2mCLrn+6+DhtvrpuuIiOsmJNIzzxazPX9YCF2SwjjzK3bjms0rovg4rweh
	 WBHfjR1YftEPwSNdaaYwbjgKCztPuHiNwWHhAtAj2cSjSBzrZrLkVJ5XyiOeDToSKT
	 kx8unDeDLFAF7LQ8cCLAF6nvqHFk/03RiS9sqKf8YqAZlK4OTl3iqKetF7V8yTMBL1
	 UqHbSw+JZXzsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CC584053D;
	Sun, 28 Dec 2025 15:22:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 076DFB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 15:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0452B80D34
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 15:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLLZu_m75aia for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 15:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 073F180D2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 073F180D2D
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 073F180D2D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 15:22:26 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b73a9592fb8so1598200266b.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766935345; x=1767540145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pW76ACBCS/Ai+7IYsxC2EA2wyM9IYze+hywKKPuGu4Y=;
 b=FTDEwkpcAjE3Q7/uSmymcPnq4iczNpaIKHXNJTw1qDLQr2TiG7he/GiDCwMx1tAc3s
 nzO4CsXjgYhR6VJn1uaOiCcuY6Ur6y998JFg/ZEP7dRcIwmgTKwD3dW0GJhp94QP6Ea9
 49GyL4bIILR2oonOFWRJOW9BZbNg49W0K4G/l7K37/lTSz+TWjaK7RWyNMsnBreo9tR4
 2VnW5faEWwR10d9rXsktxNPjuupq+DyBl6cAfaIO+Ey+KSQ11oYb60l32TsWa2vBLq6C
 sqm4C5igZPjyUIordADqreXc3yA+cQulsDyKTY/DlspYvGHuHBA2JAEtIuSOg/Ko5+zg
 8QLg==
X-Gm-Message-State: AOJu0Yzit94UGcrCny1eO350C30cLExruojkWyNz/tBFti/PZZ6yZuO1
 VQdjbPlnPuJTONSzIgPIMNjZWZM5Bs5XCFjZ4xTq8LTEwCBEMW7J0Kl+tOVN6xFleZNfggCA8gL
 OSbW1
X-Gm-Gg: AY/fxX71K2yMq3SEE7bmKwIYf+xgCzYMWDh8QxKoJyiINH2wCWAMfhIXBC5mCo9D/DP
 X6JCURz2s/2zb6XIb5L3r0keGz5Pr/7MnPfxfMHrJNGpqYS2jh5hyegdsZsYIAxeTU67AB2o/sX
 qmdDHNtQqX5VTtKmhp7iBGrOYegIJawfB61Gi/OLJ6vLaB4Q9mGc2Vnb/4bxBtjv5AQApSlm6An
 O7fC/wYIVFAinWgADyJEW1C/vCmbqgQkdKyD+nQdlfi8BXvXPNBMIiSCo6o/U2jOeW7pZnGOHvS
 C75HwPfLEqWNxXYMpe1Xp7WAkczZhbG3Wx3igyfqR5NFRC1c/xaesW0bMVRsR+E781dpScrWSy5
 YyntI6ijav2Akm1HnNtNuwFkhj0DnaEpuMNLUeIK/371EjjoH8NuVkLL+qVa8ldw8eMbX+NK1Gz
 UtCRIY3eiZ4ef947v9vPscrYkISal6rWVePwqxp3eUw7lvU/Mv573x9yYDhvhEojwsSr2k3p/MM
 PHhac2U0/ZtF4T5Uvo3Rn3Fge9pJZABLFAnzp6hBiWYv7hni3zm9cJfAhQBFFBBo2ubImRJp583
 RGFdJIMhPZg=
X-Google-Smtp-Source: AGHT+IGK3a1kVqfKbduio8JSFD44IXbM0EvbpGhrdHpq6qg+aCizM9gxz6rk8/mfeeDUk1SOJ1oHFA==
X-Received: by 2002:a17:906:aa16:b0:b72:dcda:fe5a with SMTP id
 a640c23a62f3a-b802040097fmr2509921166b.5.1766935344670; 
 Sun, 28 Dec 2025 07:22:24 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b80620c4520sm2447192466b.28.2025.12.28.07.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 07:22:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 28 Dec 2025 16:22:21 +0100
Message-ID: <20251228152221.26838-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1766935345; x=1767540145;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pW76ACBCS/Ai+7IYsxC2EA2wyM9IYze+hywKKPuGu4Y=;
 b=jK4PERy2r5rF6HXM8UvCOe3pJhcFqw/LqKMp/R6rGTxIJCV7DV/256DkYmuOqqtVOv
 7fcBQo7+WXWhQWUxC6MuX+ydeBXk5x015RPv6iE2OzsLknpXBDhXMfAW9TNkazB9gLpP
 d0YqxUYvCBly0PD/0IWl53vyeEJXo5FMA2Zpk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jK4PERy2
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: add support for
 mkfwumdata
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mkfwumdata U-Boot tool can be used to generate FWU metadata images
for the meta-data partition to be used in A/B Update imeplementation.
Add an option to cross-build it and install it to the target filesystem.
Also, build it and install it unconditionally to the host dir.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uboot-tools/Config.in      | 11 +++++++++++
 package/uboot-tools/uboot-tools.mk | 18 ++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index da6cd652521d..fadb9b2eb76e 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -107,4 +107,15 @@ config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
 	  The dumpimage tool from Das U-Boot bootloader, which allows
 	  extraction of data from U-Boot images.
 
+config BR2_PACKAGE_UBOOT_TOOLS_MKFWUMDATA
+	bool "mkfwumdata"
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Install the mkfwumdata tool on the target system
+
+	  The mkfwumdata tool from Das U-Boot bootloader, which allows
+	  to create a raw image of the FWU metadata for initial
+	  installation of the FWU multi bank update on the board.
+
 endif
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 1135fb9c03b1..60b9e2ae78a7 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -15,7 +15,7 @@ UBOOT_TOOLS_INSTALL_STAGING = YES
 
 # u-boot 2020.01+ needs make 4.0+
 UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
-HOST_UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY) host-gnutls
+HOST_UBOOT_TOOLS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY) host-gnutls host-util-linux
 
 # the available hash algorithms and the way to enable them are the
 # same for host and target
@@ -59,6 +59,11 @@ UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_MKEFICAPSULE=y
 UBOOT_TOOLS_DEPENDENCIES += gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKFWUMDATA),y)
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_MKFWUMDATA=y
+UBOOT_TOOLS_DEPENDENCIES += util-linux
+endif
+
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN),y)
 define UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
 	$(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign $(TARGET_DIR)/usr/bin/fit_check_sign
@@ -103,6 +108,12 @@ define UBOOT_TOOLS_INSTALL_DUMPIMAGE
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKFWUMDATA),y)
+define UBOOT_TOOLS_INSTALL_MKFWUMDATA
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkfwumdata $(TARGET_DIR)/usr/bin/mkfwumdata
+endef
+endif
+
 define UBOOT_TOOLS_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/tools/env/lib.a $(STAGING_DIR)/usr/lib/libubootenv.a
 	$(INSTALL) -D -m 0644 $(@D)/tools/env/fw_env.h $(STAGING_DIR)/usr/include/fw_env.h
@@ -115,6 +126,7 @@ define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
 	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
 	$(UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN)
+	$(UBOOT_TOOLS_INSTALL_MKFWUMDATA)
 endef
 
 # host-uboot-tools
@@ -134,7 +146,8 @@ endef
 HOST_UBOOT_TOOLS_MAKE_OPTS = HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOST_CFLAGS)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
-	CONFIG_TOOLS_MKEFICAPSULE=y
+	CONFIG_TOOLS_MKEFICAPSULE=y \
+	CONFIG_TOOLS_MKFWUMDATA=y
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
 HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
@@ -237,6 +250,7 @@ define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	ln -sf fw_printenv $(HOST_DIR)/bin/fw_setenv
 	$(HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE)
 	$(HOST_UBOOT_TOOLS_INSTALL_BOOT_SCRIPT)
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkfwumdata $(HOST_DIR)/bin/mkfwumdata
 endef
 
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
