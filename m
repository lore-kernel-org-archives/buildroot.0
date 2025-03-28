Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0E0C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE3374F347;
	Fri, 28 Mar 2025 18:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UH3SuIMxHNlR; Fri, 28 Mar 2025 18:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A79B34F341
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79B34F341;
	Fri, 28 Mar 2025 18:05:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD0C1B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBDE24F2EB
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY6PDalA-Frt for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF9694F337
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF9694F337
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF9694F337
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:05:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d64e6c83eso2577585e9.0
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 11:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743185102; x=1743789902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6wkYkGKk2J8gEioP5u2TEaoH6ZIoi+PrVTHcOxWPL4=;
 b=AsV4+Qdx1IGASsioH6JeT0t8iI5HMw8fjFSRev8zLxXJ4ItFawWb0N4xm/dI3lb8Io
 rKIANzfe014br3zC19EGoBGgVPriswdPQSuTPjxwXrABNSEAa9EHUVUE91Xarmk/amys
 n8qBcGP0LEaVPbA2zlPctFEanY2YZ8m2Aymclk+5TLbzSGc9inck1a9ZwwUgoMbVoGAo
 4lg3oWE2jxbxC5jQs+9zf03vNz/zJo1KJ+wmnD72ENOyA76R6u8Tsa0KkakrIaQ0fVOd
 NeBc7J9TAsY3mLNoMWWCdVK3MGyhDEVl1IgZgS9OSIJsEcWnuKVoWLt1JEMC/+rmPtix
 q9ew==
X-Gm-Message-State: AOJu0YyJ0KeuQcQzym62sKkHW6FGndr3TLT+wEBn5CRrK+YoiYcLOQUP
 1bgXSjtkqr7ocKEhnQDVFq3JdvwWOEpB0s/7NEn2Wj0xQXdk81ILImzv1ye7
X-Gm-Gg: ASbGncv/TU1VuravSd1G/yPigxn8V3dBw555btD86ZmteHyimZfNAtRGMe+4/M6+ULh
 8ErlBQnqSt5hE/yCEFNLcV4OBDeSB5ugRZRLGrs/vr2VCtOuPOi957vDWAE2R/ccKCUzk00kECe
 Oakq+6bglRuDf3Y7brsSdlIXBPdfnNsUFl+Cr7f3nlkq+4xUyUsAR5i4XrtTCpAfypfzEbEuE8N
 C3UKGGTPi/c47GD5LXc9ZXCaQv7PONTOIEIMQTHyMwoFTpWirZux7ED5bYOYqq946hGkC6w5UJu
 mjP0WbG+O/27ExdwYbuDF8q6Qq0n1FBNpdJmnQ==
X-Google-Smtp-Source: AGHT+IHX0n2KAFuJzbJlR7XhuUJGfDMDHGZCfgwweB6vduJIyoyyh0PU/kuLM3vejjtzRF2in0zZ8g==
X-Received: by 2002:a05:600c:4449:b0:43b:c0fa:f9c4 with SMTP id
 5b1f17b1804b1-43db62bbce0mr1319915e9.4.1743185102309; 
 Fri, 28 Mar 2025 11:05:02 -0700 (PDT)
Received: from skbuf.lan ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm34692995e9.37.2025.03.28.11.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 11:05:01 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Mar 2025 20:04:25 +0200
Message-ID: <20250328180427.3434693-18-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328180427.3434693-1-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743185102; x=1743789902; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6wkYkGKk2J8gEioP5u2TEaoH6ZIoi+PrVTHcOxWPL4=;
 b=RfYYI88rsPWqM2rtZvAzOiqIKt/9hbnzDaeY/rCPWmQM8YNwmbNBHBrtmBbPdXAxWN
 et/aabnKhTWL2oGYN0ZIfQuIAq5vRXI7ohiwrVE4UV4tkf0D+zZi2whdva9LVD21sjLF
 UhJIC2DduOBYydZXb54c/2y7QlRV6LbKODNHZufImKWF8rdJCNsF9lhDTv1uFErpTDQn
 hfpJnA4zfRBTq/WO+RipYx5MX4yRsPeKKmqOr/Z1wii+unYPf71OY4/CEhMHjEilJRxS
 9oDqDrdkcB4DWstwNqhlhdtpeHwKerG8hmskWS911xYQCjaXv07cG6EFrwua7mXZavDd
 ZF7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RfYYI88r
Subject: [Buildroot] [PATCH v2 17/18] package/qoriq-firmware-inphi: new
 package
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
Cc: Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>,
 Julien Olivain <ju.o@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The NXP BSPs have custom support for a 25G Ethernet retimer
(drivers/net/phy/in112525.c in U-Boot) for the LX2160A-RDB board.
That driver requires a text file to be located at a given offset in the
same storage device as U-Boot itself. The text file contains a list of
register addresses and values which are programmed into the retimer.

All in all, a pretty convoluted mechanism, but the driver is
non-upstreamable, and to support the board we need this "firmware" file
deployed.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2: patch is new

 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/qoriq-firmware-inphi/Config.in         |  7 +++++++
 .../qoriq-firmware-inphi.hash                  |  3 +++
 .../qoriq-firmware-inphi.mk                    | 18 ++++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/qoriq-firmware-inphi/Config.in
 create mode 100644 package/qoriq-firmware-inphi/qoriq-firmware-inphi.hash
 create mode 100644 package/qoriq-firmware-inphi/qoriq-firmware-inphi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4288172e8670..22f5e527471c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3371,6 +3371,7 @@ F:	configs/ts5500_defconfig
 
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
+F:	package/qoriq-firmware-inphi/
 F:	package/qoriq-mc-binary/
 F:	package/qoriq-mc-utils/
 F:	package/qoriq-restool/
diff --git a/package/Config.in b/package/Config.in
index 40b4bb5307ce..b3212cb0fe9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -449,6 +449,7 @@ menu "Firmware"
 	source "package/panel-mipi-dbi-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-ddr-phy-binary/Config.in"
+	source "package/qoriq-firmware-inphi/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/qoriq-mc-binary/Config.in"
 	source "package/qoriq-mc-utils/Config.in"
diff --git a/package/qoriq-firmware-inphi/Config.in b/package/qoriq-firmware-inphi/Config.in
new file mode 100644
index 000000000000..88ae96c07531
--- /dev/null
+++ b/package/qoriq-firmware-inphi/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_QORIQ_FIRMWARE_INPHI
+	bool "qoriq-firmware-inphi"
+	help
+	  Firmware image for the Inphi IN112525 2x 25GbE SFP+
+	  retimer, exclusively for use on the NXP LX2160A-RDB.
+
+	  https://github.com/nxp-qoriq/qoriq-firmware-inphi
diff --git a/package/qoriq-firmware-inphi/qoriq-firmware-inphi.hash b/package/qoriq-firmware-inphi/qoriq-firmware-inphi.hash
new file mode 100644
index 000000000000..df860e47a004
--- /dev/null
+++ b/package/qoriq-firmware-inphi/qoriq-firmware-inphi.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  bc04d6b7ca578ad4bba053a8ec3929af305f296f23c32557dc290540cb49ac18  qoriq-firmware-inphi-f22e9ff3bfed8342da6efb699e473b11fbad5695.tar.gz
+sha256  53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  EULA.txt
diff --git a/package/qoriq-firmware-inphi/qoriq-firmware-inphi.mk b/package/qoriq-firmware-inphi/qoriq-firmware-inphi.mk
new file mode 100644
index 000000000000..630c6634fd6b
--- /dev/null
+++ b/package/qoriq-firmware-inphi/qoriq-firmware-inphi.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# qoriq-firmware-inphi
+#
+################################################################################
+
+# Unlikely to ever be updated, keep a fixed version instead of following BSP tags
+QORIQ_FIRMWARE_INPHI_VERSION = f22e9ff3bfed8342da6efb699e473b11fbad5695
+QORIQ_FIRMWARE_INPHI_SITE = $(call github,nxp,qoriq-firmware-inphi,$(QORIQ_FIRMWARE_INPHI_VERSION))
+QORIQ_FIRMWARE_INPHI_LICENSE = NXP Binary EULA
+QORIQ_FIRMWARE_INPHI_LICENSE_FILES = EULA.txt
+QORIQ_FIRMWARE_INPHI_INSTALL_IMAGES = YES
+
+define QORIQ_FIRMWARE_INPHI_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/in112525-phy-ucode.txt $(BINARIES_DIR)/in112525-phy-ucode.txt
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
