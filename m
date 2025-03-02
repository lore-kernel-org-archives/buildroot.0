Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5524EC282CD
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18A6160725;
	Sun,  2 Mar 2025 21:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkMNLeFj84Gi; Sun,  2 Mar 2025 21:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E783760909
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E783760909;
	Sun,  2 Mar 2025 21:52:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D72FE182
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C471E408E2
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adPvV802N__O for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45FFD4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45FFD4022B
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45FFD4022B
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-390f3a5b2d8so134165f8f.3
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952365; x=1741557165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VzzLhA/BaEE77Cx9NY7SLuHqo5eJFvimDW8FDNz+4iM=;
 b=oHo1E/kzQhBkgitDJZJMpvwhVhMilSmXRmBTj8FfMH+FyQdCLT43kVFU6+ZKeq4lm7
 E8tNiWsiUPKxCIZ0g82LnFv+zwkw043Wcpy41guGNAv7kJ03G6hhpb9QG6kubZ/TMQcy
 sqfrl8bWlS7St5cDryz5S1v1qY0aOuhyqekvs/PdEALpDkCSMGAu00mboeqvWYI04oXZ
 Xgs+/ZIRqQfNqqGj5XgzElizTDSfFcQ+zukSw2VUq2SgmSmG5F6FLR48rJM3zrqq7851
 +K5qFBAHGWEOlL0+S34mlcx8WnhMH0qb44h3Tk9afyYp6qJVfcezhF80leA0OfrDxjRa
 Vbxw==
X-Gm-Message-State: AOJu0Yxe0YfPI9itn13WiNbeizquw1vCDn2xQaSPETsBVZ6SsRyyG2Ok
 lFpKILk0/0USngPyPOMxUgNKtFGxMhWlwM26wcM7kpUsnFR4bM+ABC0rm5Y+
X-Gm-Gg: ASbGncv3Fpvv1VVeeLRbKI2gIgYru2vG3f45SCLKxtFFF6M2T/winFD/XYZaDx4CilK
 2jNFWJIiuTi7FenSke69ztE40hywZvnjUwotWgKT7swpuJzYHwVj+ujz6CMIuuFUia6/bL1by3x
 +DwMaTaxC9yp3Wlas24YO2y/7v66+T0WRLiV1q/+iG1e+xBBFTO5VK6dFUv+j+PmtVVkbO239yW
 n31cQiHuFxW/WEZ4p8oPXdN5DE9MBeFAQMLz1SjgmiEBPqs3qaraqlPrJlXquYCo3xNT1SgHRx0
 +IiV/zxbBH9NSkLxZW8CA1K3EgJ94QZXKba+aw==
X-Google-Smtp-Source: AGHT+IFsbHA8TCsMqeCqrS+0bBt3YyPuJ/aPBz9h2pCcwy6LjmxZkCe5JhgfQCHtUjslE1dGGUli0w==
X-Received: by 2002:a05:600c:1d23:b0:439:8bc3:a699 with SMTP id
 5b1f17b1804b1-43ba83f924dmr34480535e9.1.1740952363700; 
 Sun, 02 Mar 2025 13:52:43 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:43 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:09 +0200
Message-ID: <20250302215219.1276480-6-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952365; x=1741557165; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VzzLhA/BaEE77Cx9NY7SLuHqo5eJFvimDW8FDNz+4iM=;
 b=HexwKcYHU8/R4EbM3L60dGaMPsYDC1qbdMEfrAp4UtkIl1TMNeNEpfvUOIvQzwnyta
 F+vFIAWvWenWEFy40UWwSnyZXfwJR1w+eBqRSDjdAdHhv/u1WDoT24N6ww+07UO7+T0s
 G37Mi2xILdEMp68DEhtTT0x0SuOU0R17EpBN/wGxWPt3vE+zpSiMiMAjecSiCXI2HSAQ
 KmRD+NLHFKtIABDRBZI71LlazncVHVfuaXeIUAClF7eQtIIkBozrheta0e7DXxVBiL9R
 N9P+ZAQGly56W8WviyFjYItVgGh5UJ+EMpSoFwhLBtQJDhG2WRARXVtR6B/weRf+DHe8
 t4YA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HexwKcYH
Subject: [Buildroot] [PATCH 05/15] package/qoriq-mc-binary: new package
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

Add a package which deploys the NXP MC (Management Complex) firmware
to the target. This is necessary for NXP DPAA2 SoCs (LS1088A, LS2080A,
LS2088A, LX2160A).

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
- Shorten help text a little bit
- s/BR2_PACKAGE_QORIQ_MC_TARGET_*/BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_*/
- s/BR2_QORIQ_MC_PLATFORM/BR2_QORIQ_MC_BINARY_PLATFORM/
- s/BR2_QORIQ_MC_DIR/BR2_QORIQ_MC_BINARY_SUBDIR/
- s/MC_PLATFORM/QORIQ_MC_BINARY_PLATFORM/
- s/MC_DIR/QORIQ_MC_BINARY_SUBDIR/
- s/MC_BIN/QORIQ_MC_BINARY_BIN/

 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/qoriq-mc-binary/Config.in            | 47 ++++++++++++++++++++
 package/qoriq-mc-binary/qoriq-mc-binary.hash |  3 ++
 package/qoriq-mc-binary/qoriq-mc-binary.mk   | 22 +++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 package/qoriq-mc-binary/Config.in
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.hash
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 500330fc1f5b..1146920e1c74 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3358,6 +3358,7 @@ F:	configs/ts5500_defconfig
 
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
+F:	package/qoriq-mc-binary/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 323c32801790..8f46c2ef8b4c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -450,6 +450,7 @@ menu "Firmware"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
+	source "package/qoriq-mc-binary/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-mc-binary/Config.in b/package/qoriq-mc-binary/Config.in
new file mode 100644
index 000000000000..fc340e9c3ab8
--- /dev/null
+++ b/package/qoriq-mc-binary/Config.in
@@ -0,0 +1,47 @@
+config BR2_PACKAGE_QORIQ_MC_BINARY
+	bool "qoriq-mc-binary"
+	help
+	  The Management Complex (MC) is a key component of the
+	  networking subsystem named DPAA2 (Data Path Acceleration
+	  Architecture, second version) in some NXP Layerscape SoCs.
+
+	  The MC coprocessor runs a closed-source, NXP-supplied
+	  firmware image that simplifies and abstracts the allocation
+	  and configuration of the networking hardware primitives into
+	  DPAA2 "objects".
+
+	  https://github.com/nxp-qoriq/qoriq-mc-binary
+
+if BR2_PACKAGE_QORIQ_MC_BINARY
+choice
+	prompt "QorIQ MC firmware target"
+	help
+	  Select the target SoC for the QorIQ MC firmware.
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS1088A
+	bool "ls1088a"
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2080A
+	bool "ls2080a"
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2088A
+	bool "ls2088a"
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A
+	bool "lx2160a"
+
+endchoice
+
+config BR2_QORIQ_MC_BINARY_PLATFORM
+	string
+	default "ls1088a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS1088A
+	default "ls2080a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2080A
+	default "ls2088a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2088A
+	default "lx2160a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A
+
+config BR2_QORIQ_MC_BINARY_SUBDIR
+	string
+	default "lx216xa" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A
+	default BR2_QORIQ_MC_BINARY_PLATFORM
+
+endif
diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.hash b/package/qoriq-mc-binary/qoriq-mc-binary.hash
new file mode 100644
index 000000000000..7afa62183c6c
--- /dev/null
+++ b/package/qoriq-mc-binary/qoriq-mc-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  912ad8effd5c7b08eb277719b1e021b8b1fe4022dc3d961b419562e1d2d7a860  qoriq-mc-binary-10.39.0.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.mk b/package/qoriq-mc-binary/qoriq-mc-binary.mk
new file mode 100644
index 000000000000..8b1f3ff37640
--- /dev/null
+++ b/package/qoriq-mc-binary/qoriq-mc-binary.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qoriq-mc-binary
+#
+################################################################################
+
+QORIQ_MC_BINARY_VERSION = 10.39.0
+QORIQ_MC_BINARY_SITE = $(call github,nxp-qoriq,qoriq-mc-binary,mc_release_$(QORIQ_MC_BINARY_VERSION))
+QORIQ_MC_BINARY_LICENSE = NXP Binary EULA
+QORIQ_MC_BINARY_LICENSE_FILES = LICENSE
+QORIQ_MC_BINARY_INSTALL_IMAGES = YES
+QORIQ_MC_BINARY_INSTALL_TARGET = NO
+
+QORIQ_MC_BINARY_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_BINARY_PLATFORM))
+QORIQ_MC_BINARY_SUBDIR = $(call qstrip,$(BR2_QORIQ_MC_BINARY_SUBDIR))
+QORIQ_MC_BINARY_BIN = mc_$(QORIQ_MC_BINARY_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb
+
+define QORIQ_MC_BINARY_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/$(QORIQ_MC_BINARY_SUBDIR)/$(QORIQ_MC_BINARY_BIN) $(BINARIES_DIR)/mc.itb
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
