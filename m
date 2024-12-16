Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347AAE77180
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 12:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA5FE60B3F;
	Mon, 16 Dec 2024 12:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEq3DOQ84ywB; Mon, 16 Dec 2024 12:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3E060B42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE3E060B42;
	Mon, 16 Dec 2024 12:58:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F66EC1
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8023060B42
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qy_h-z-O6IYA for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 12:58:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=tim.gover@raspberrypi.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AF5B60B3F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF5B60B3F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AF5B60B3F
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 12:58:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e2880606so3730826f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 04:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734353889; x=1734958689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCxOniBsKNOTo1mH8D6gZtNiIXnpnvraFljftejpHBY=;
 b=jRybYva5KOUoK6SsLFXU2TQo85HzM4GfxCOqcBWzWaeDAfMl48TktB8EoA8A6ScKeG
 GBG7Lh6TlMUDVgxwHsut9oaCqTrAuDmnm+hlbUO3pMyIFsxBV2HoMllL83dnN1rFBBPi
 u7o/aAQVmGffLm+7p3+vq2WdDwZR0P6C+JiFQf4BWQqQbrF60yVBt8e/iIzvfma1AOCH
 zt7MVPow3vZkjMxwZfME0rkqgM254o59ImObZGE9AkJx7bOfZ7eQC1gWJTIIb1trhKcq
 eFnOiwgojOG66RBg16PVLuk0jxNsZI6zyFZunG3qY7l+ieNdrldKb5RQ/hWtBjKLNdbg
 XRpg==
X-Gm-Message-State: AOJu0YwvubDhQKoxv5hl/AI3Ejz2E2vczyJd0sU7zlZQv9jgcjjChG8R
 OfwBGt+vsZWJrybGiL60RF0Q0/rTH++w1G8vOZYCklVrDDXIem1RS7lU9zF9xTRBYWiRXvSx411
 FGXM=
X-Gm-Gg: ASbGncuHLND5o95jzfwYZNWqmXnoFta4t2U6JETk58rzrfPkJvfnRpHPPApBR5qN/b1
 /rNGGtNDEOC2Apj5MV50EImiJVHXC4m7Q0Yh5LYRiQ1sMCxKjlQsKX10LYyC7Foe3qn7bWbLlsh
 d5zyrsedK4Enaik6pGIEZrqCPXWB3lviOyTvXQlToOhzqM1gF5IJTxeCuypzaDTVXCAgGffrPga
 5eiEvV8ojvA3CxGuqwPrVlcInk1pPRNUARqgI0EZQAOQw57ChCoN1VmssjvuhEL1CyCtC3gurZp
 ESuPgAmMklmAHNnR7TrfgFFF2w269qifWLBRu3fIgXsJkQbJ5LpWIZgXkQ4=
X-Google-Smtp-Source: AGHT+IF47KL9dzslG+fiBo1L2KoqnH4z2N1J9qA8Cs+o88mW39biR15+WMUcLZYjK+KaTU6lqFwzUQ==
X-Received: by 2002:a5d:6da8:0:b0:382:46ea:113f with SMTP id
 ffacd0b85a97d-38880ac60e7mr11249577f8f.10.1734353888520; 
 Mon, 16 Dec 2024 04:58:08 -0800 (PST)
Received: from TIM-G-DELL.pitowers.org
 (host109-145-9-171.range109-145.btcentralplus.com. [109.145.9.171])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-388c8046c05sm8228584f8f.73.2024.12.16.04.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 04:58:08 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tim Gover <tim.gover@raspberrypi.com>
Date: Mon, 16 Dec 2024 12:58:00 +0000
Message-Id: <20241216125800.219227-2-tim.gover@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216125800.219227-1-tim.gover@raspberrypi.com>
References: <20241216125800.219227-1-tim.gover@raspberrypi.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734353889; x=1734958689; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCxOniBsKNOTo1mH8D6gZtNiIXnpnvraFljftejpHBY=;
 b=S0ZKk50jFN+dkA2pauQXDzfIrzhgTWe0WCN6RRTJbdDBKwNN43EK5pCfXn5llxwpXr
 SGLPRP8MFwIkotmPElGv8xrgx1IybmaEqrjYL6IZ1mWOWW+EKF1TQ8wlmdcbqLnYx5XF
 KSrtkiMyRdfLII0F+XwlO/RCVtcnsKlrUGhd1NgyofXPW566dG4G5B66J0puVk7rSbNd
 OrDROTht1Po6btNXzgyB83iW5s1clXIxPhZjAAsFeoimoND2LMTx8zDoBb8RGT1NxCua
 1Ejh/DuGcG+z8VNXvNtJJNdiFhtAegOKSGOOlVickQ9RFI+o7MQbhMrOHWuzkyn0d2xn
 /ujg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=raspberrypi.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=S0ZKk50j
Subject: [Buildroot] [PATCH 1/1] package/rpi-eeprom: New package for RPi
 bootloader tools
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
From: Tim Gover via buildroot <buildroot@buildroot.org>
Reply-To: Tim Gover <tim.gover@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package adds the host and OS tools for configuring
the bootloader and building/signing tools for signed boot.

Normally, the host tools would be invoked from a post-build
script to sign the boot.img file. The device tools would be
invoked from a custom on-device software update process e.g.
using rpi-eeprom-digest to verify the signature of a boot.img
file against a public key retrieved from the EEPROM.

The current version does not download the EEPROM images
because the bootloader EEPROM is not normally updated via
a buildroot image. However, future versions might provide
the facility to generate both a buildroot initramfs and
accompanying signed EEPROM image e.g for network install.

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
---
 configs/raspberrypi5_defconfig     |  1 +
 package/Config.in                  |  1 +
 package/Config.in.host             |  1 +
 package/rpi-eeprom/Config.in       |  9 +++++++++
 package/rpi-eeprom/Config.in.host  |  9 +++++++++
 package/rpi-eeprom/rpi-eeprom.hash |  1 +
 package/rpi-eeprom/rpi-eeprom.mk   | 27 +++++++++++++++++++++++++++
 7 files changed, 49 insertions(+)
 create mode 100644 package/rpi-eeprom/Config.in
 create mode 100644 package/rpi-eeprom/Config.in.host
 create mode 100644 package/rpi-eeprom/rpi-eeprom.hash
 create mode 100644 package/rpi-eeprom/rpi-eeprom.mk

diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 8cbd533eee..6d364ad32f 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -31,3 +31,4 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_KMOD_XZ=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_RPI_EEPROM=y
diff --git a/package/Config.in b/package/Config.in
index 5fa344c321..c62e3cd6f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -456,6 +456,7 @@ menu "Firmware"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
+	source "package/rpi-eeprom/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index e06824ad6b..91959494be 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -100,6 +100,7 @@ menu "Host utilities"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
+	source "package/rpi-eeprom/Config.in.host"
 	source "package/runc/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
diff --git a/package/rpi-eeprom/Config.in b/package/rpi-eeprom/Config.in
new file mode 100644
index 0000000000..02e1109264
--- /dev/null
+++ b/package/rpi-eeprom/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RPI_EEPROM
+	bool "rpi-eeprom"
+	select BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX
+	help
+	  Raspberry Pi bootloader tools.
+
+	  https://github.com/raspberrypi/rpi-eeprom
diff --git a/package/rpi-eeprom/Config.in.host b/package/rpi-eeprom/Config.in.host
new file mode 100644
index 0000000000..3d36d7bec8
--- /dev/null
+++ b/package/rpi-eeprom/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_RPI_EEPROM
+	bool "host rpi-eeprom"
+	select BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX
+	help
+	  Raspberry Pi bootloader tools.
+
+	  https://github.com/raspberrypi/rpi-eeprom
diff --git a/package/rpi-eeprom/rpi-eeprom.hash b/package/rpi-eeprom/rpi-eeprom.hash
new file mode 100644
index 0000000000..27cd0bfdf3
--- /dev/null
+++ b/package/rpi-eeprom/rpi-eeprom.hash
@@ -0,0 +1 @@
+sha256  90970fd9a72c29449a8f4f27577395a1fb418f87b979adeb81d51300f959dab9  rpi-eeprom-fe7bfc720165464d9dfe2f85fe090ca22a625bd7.tar.gz
diff --git a/package/rpi-eeprom/rpi-eeprom.mk b/package/rpi-eeprom/rpi-eeprom.mk
new file mode 100644
index 0000000000..db1634315f
--- /dev/null
+++ b/package/rpi-eeprom/rpi-eeprom.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# rpi-eeprom
+#
+################################################################################
+
+RPI_EEPROM_VERSION = fe7bfc720165464d9dfe2f85fe090ca22a625bd7
+RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
+RPI_EEPROM_LICENSE = BSD-3-Clause
+RPI_EEPROM_LICENSE_FILES = LICENSE
+
+HOST_RPI_EEPROM_INSTALL = YES
+RPI_EEPROM_INSTALL = YES
+
+define HOST_RPI_EEPROM_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/rpi-eeprom-digest $(HOST_DIR)/bin/rpi-eeprom-digest
+	$(INSTALL) -D -m 0755 $(@D)/rpi-eeprom-config $(HOST_DIR)/bin/rpi-eeprom-config
+endef
+
+define RPI_EEPROM_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/rpi-eeprom-digest $(TARGET_DIR)/bin/rpi-eeprom-digest
+	$(INSTALL) -D -m 0755 $(@D)/tools/rpi-bootloader-key-convert $(TARGET_DIR)/bin/rpi-bootloader-key-convert
+	$(INSTALL) -D -m 0755 $(@D)/tools/rpi-otp-private-key $(TARGET_DIR)/bin/rpi-otp-private-key
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
