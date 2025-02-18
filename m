Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF179C021AD
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 12:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5123561011;
	Tue, 18 Feb 2025 12:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnyZS7Ou1R2D; Tue, 18 Feb 2025 12:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2885D60FCA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2885D60FCA;
	Tue, 18 Feb 2025 12:37:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADB63E05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99220403A2
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XjQXYNC0uvZ for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 12:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=tim.gover@raspberrypi.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C70BB4011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C70BB4011D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C70BB4011D
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 12:37:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce319so3260933f8f.2
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 04:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739882242; x=1740487042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dO2whtyZhqQsW7GXu+A3prHq8O/yKaY/vA5LxpBaBDU=;
 b=WiG4vDFA33hokFFWTGHmsvSAfJPqc9n7nm3DS+so4QxISykgmUqf3Y3cDsckzuWtnm
 O3ENvgHbL5wNv/wQ6c+ZaRajuO7HJL7NH4VM3y+22CXwZjs8PU8gQKq+7Du6t5KWaJpp
 8vWSc2bMZZ7LFpZnzJJtFHtvlwTtXrNAc7D6UyEYNAjS9V5rAKzdLIQ0E9cRq4ojUyxw
 XWseaExwsyIXX/0vwm9VC8QMVMScaV+tMYgJtBTKKUW0OCy3IE/VQWqdXMNFkDu4XuZ2
 GAlLh5vjqDa1GaoGcKcVIV5jqyLzOWMzu3eHrS0TiRnZzMo3p6B7wIYsVO3tG6M8C45H
 z8fQ==
X-Gm-Message-State: AOJu0YylT2Zxwqz9yt24qJcvFVYdY4O02WMukmJD4Ujv8fLnlQbhOgXT
 B5cbzpKEou+HCL8VF/JZtLJhbiRjnl4yvth5ahxyLdgApCxeC8s+xC9GesCvbdkJOBVpGmqkcxl
 M
X-Gm-Gg: ASbGnctCVxmZIV08bIE7yPx3LZwV7Mc8n/az/G4bJgaGzTf78ysSIUV3LZRBPshVfDr
 ZgtqoO4Hr3VlhnnabwXDSbLTWaK4Mam6BVPmMq4BFBi1lpi2KlKVZVkpbMPt2qnvdymADL1g2en
 CD4hNXyo66Q20S1wUQ6z4WsgRPhrXTQxcJ1VCBQMxGVJkbBEzDXiCvICL2osRAHr/6Tb66BoKit
 Qa+0Ccb2FF1Y1xKZAaD8VGldBQ5198CxfbzCohMyKVQgCvHD7idS5tmpePqp5DcWUn7+HTEaIXk
 fkkcx+2HciHBqeI9vlbnypWm5V5BCNkx/nf4
X-Google-Smtp-Source: AGHT+IEyi1liSC/eqaZU3x2cVHX+a95hP9vqjqSbayJyfhz3Itk/n3EDufvP1A+cIyPCXva8vj87tw==
X-Received: by 2002:a05:6000:184f:b0:38f:4cb4:b849 with SMTP id
 ffacd0b85a97d-38f4cb4cdfcmr5364341f8f.27.1739882242398; 
 Tue, 18 Feb 2025 04:37:22 -0800 (PST)
Received: from localhost.localdomain ([147.148.179.43])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5c36sm15079213f8f.67.2025.02.18.04.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 04:37:21 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tim Gover <tim.gover@raspberrypi.com>
Date: Tue, 18 Feb 2025 12:36:48 +0000
Message-Id: <20250218123648.928906-2-tim.gover@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218123648.928906-1-tim.gover@raspberrypi.com>
References: <20250218123648.928906-1-tim.gover@raspberrypi.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1739882242; x=1740487042; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dO2whtyZhqQsW7GXu+A3prHq8O/yKaY/vA5LxpBaBDU=;
 b=bF00mVhlNCccyngcf7OjhYCDrckq53oJ65QpH2Qk/jezVkek8Cd+LJ2D+7iMADq/p7
 OFLHn9mrsn8kwNdSYSvTC6QNxWjiwrcwrqWGHw29MbujJKBPco33l8cUOa2TZAH27soc
 OoB9h+kqEVdNG0bv/jvganEJmcVQaLqtCSOWw2idArjWQk+bphIi8mALdUtQucFGa3hq
 zhSwBg8MsJjdXRP3R4+5LXk7qIz9/VTRRghl9wPWUabojQaWyTisK2TgtpOGKo4AL8nI
 56/U5+KagpRMRCAydGmMOcaGJQrFoZegjdMFLoJaNbNEegAgtRFE/aRyMdgl4NacVlyh
 6cLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=raspberrypi.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=bF00mVhl
Subject: [Buildroot] [PATCH v2 1/1] package/rpi-eeprom: New package for RPi
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
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/Config.in.host             |  1 +
 package/rpi-eeprom/Config.in       | 16 ++++++++++++++++
 package/rpi-eeprom/Config.in.host  | 11 +++++++++++
 package/rpi-eeprom/rpi-eeprom.hash |  3 +++
 package/rpi-eeprom/rpi-eeprom.mk   | 29 +++++++++++++++++++++++++++++
 7 files changed, 64 insertions(+)
 create mode 100644 package/rpi-eeprom/Config.in
 create mode 100644 package/rpi-eeprom/Config.in.host
 create mode 100644 package/rpi-eeprom/rpi-eeprom.hash
 create mode 100644 package/rpi-eeprom/rpi-eeprom.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 4914acba0d..b3cf2a7ad9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3261,6 +3261,9 @@ F:	support/testing/tests/package/test_python_unittest_xml_reporting.py
 F:	support/testing/tests/toolchain/test_external_arm.py
 F:	toolchain/
 
+N:	Tim Gover <tim.gover@raspberrypi.com>
+F:	package/rpi-eeprom
+
 N:	Timo Ketola <timo.ketola@exertus.fi>
 F:	package/fbgrab/
 
diff --git a/package/Config.in b/package/Config.in
index 6f79eafc4b..f9b306befe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -450,6 +450,7 @@ menu "Firmware"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
+	source "package/rpi-eeprom/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
 	source "package/ts4900-fpga/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index bf04f5fa97..45075d0c32 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -102,6 +102,7 @@ menu "Host utilities"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
+	source "package/rpi-eeprom/Config.in.host"
 	source "package/runc/Config.in.host"
 	source "package/rustc/Config.in.host"
 	source "package/s6-rc/Config.in.host"
diff --git a/package/rpi-eeprom/Config.in b/package/rpi-eeprom/Config.in
new file mode 100644
index 0000000000..4f41f8c643
--- /dev/null
+++ b/package/rpi-eeprom/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_RPI_EEPROM
+	bool "rpi-eeprom"
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL # runtime
+	select BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX # runtime
+	help
+	  Raspberry Pi 4 / Pi 5 device side tools for signed boot
+	  to enable reading of the device bootloader config
+	  and the customer public key.
+
+	  This also includes the wrapper script for
+	  programming and reading a customer defined device
+	  specific private key.
+
+	  https://github.com/raspberrypi/rpi-eeprom
diff --git a/package/rpi-eeprom/Config.in.host b/package/rpi-eeprom/Config.in.host
new file mode 100644
index 0000000000..923e3031c5
--- /dev/null
+++ b/package/rpi-eeprom/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_RPI_EEPROM
+	bool "host rpi-eeprom"
+	select BR2_PACKAGE_HOST_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_HOST_OPENSSL
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON_PYCRYPTODOMEX
+	help
+	  Raspberry Pi host tools for updating the bootloader config
+	  in an EEPROM image plus signing a boot.img for secure boot.
+
+	  https://github.com/raspberrypi/rpi-eeprom
diff --git a/package/rpi-eeprom/rpi-eeprom.hash b/package/rpi-eeprom/rpi-eeprom.hash
new file mode 100644
index 0000000000..acef17d92f
--- /dev/null
+++ b/package/rpi-eeprom/rpi-eeprom.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  dda0904e5b58e265c73180792c50fca1b452e8eee03c81e821b11f8742c382dc  rpi-eeprom-c954a72f6301b8ac0fc4b0fe252e1c5024d2862b.tar.gz
+sha256  594b7565fd3ccf8acd4711a2ec1b199181aafbc3426d0bacaa50ef40edbf7c4a  rpi-eeprom/LICENSE
diff --git a/package/rpi-eeprom/rpi-eeprom.mk b/package/rpi-eeprom/rpi-eeprom.mk
new file mode 100644
index 0000000000..911d35e13e
--- /dev/null
+++ b/package/rpi-eeprom/rpi-eeprom.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# rpi-eeprom
+#
+################################################################################
+
+RPI_EEPROM_VERSION = c954a72f6301b8ac0fc4b0fe252e1c5024d2862b
+RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
+RPI_EEPROM_LICENSE = BSD-3-Clause
+RPI_EEPROM_LICENSE_FILES = LICENSE
+
+HOST_RPI_EEPROM_INSTALL = YES
+RPI_EEPROM_INSTALL = YES
+
+HOST_RPI_EEPROM_DEPENDENCIES = host-python3 host-python-pycryptodomex
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
