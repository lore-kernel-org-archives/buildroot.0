Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99D0E67802
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 15:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 708FD82073;
	Sat,  2 Nov 2024 15:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FC2Ryf711t2u; Sat,  2 Nov 2024 15:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652D582105
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 652D582105;
	Sat,  2 Nov 2024 15:21:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9E5E27E1
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B4E761513
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMRXfv5RosT7 for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 15:21:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7F4EC61510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F4EC61510
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F4EC61510
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:24 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a1b8d45fcso48526666b.2
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 08:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730560882; x=1731165682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GqklD+NVplJYLh9oSaJ3UMqizMsZaRIHb4FdFJVXMKQ=;
 b=j2qNUuChQWJbPz/pj3UMWNMrWZnqPJLYa4A4/XBTNLxS+E6jGYxg1/g4P3Bwdgeh3U
 /LPSEFZrDEKFUHXzWgILKLeLr/wvIPb8Wnd+ijsnQH21kutqC0y+SAbovy+LQekY1LMy
 5Pxf7DM+m/mObCLrE9PvdtcbahGfRaUaSrWvySqOOifL4aPGEEZIspg4DPNZhJbzHce/
 UAXii+vot9/OqFyqziH8/AkO30bfK35wKY0+TwwerPlzYGW+TbUxhNl66e9pbbouShqq
 Dd5e2YNVnVjRdPJaU4u3BZs4y9ZRuzGxS8zqrXzB96OX2HSmw3bL2YWzFRn2gRbMAnGd
 L8Hw==
X-Gm-Message-State: AOJu0YzfCSLxtPHKhhu+7KePY+QYpBa0QOR1XxndtgDf6Aizj7Q2L121
 ckRu/fs+UYo+dnWueG3qY4UsN//OozLYjsICNlrlxyMyce/WgtgQe4BKfud0
X-Google-Smtp-Source: AGHT+IHB0JywCwfzo+tzZraNxbEGd7pfBCM7tg6T7C6iFHijiDZiuA3mCM2IsCWObgA9Za/ySryTxw==
X-Received: by 2002:a05:6402:1018:b0:5ce:cf30:6829 with SMTP id
 4fb4d7f45d1cf-5cecf306b23mr360630a12.0.1730560881992; 
 Sat, 02 Nov 2024 08:21:21 -0700 (PDT)
Received: from skbuf.lan ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74ced8sm2587535a12.17.2024.11.02.08.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 08:21:21 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sat,  2 Nov 2024 17:21:02 +0200
Message-ID: <20241102152106.2153747-4-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241102152106.2153747-1-olteanv@gmail.com>
References: <20241102152106.2153747-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730560882; x=1731165682; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GqklD+NVplJYLh9oSaJ3UMqizMsZaRIHb4FdFJVXMKQ=;
 b=eQe/N0IJN02dirlvUJGeA6G07touM6p4vF2OKBmTG2knvZAgGVkQkcHnj6YDuh68e1
 Lpixhpkvvlfz5SNmxNCpSb8EX8yFSQ5fIzovPd18xTLQKhGagmQ9/DMRJhNKyQofsR1B
 aumkbaNBjB1pMhyS0lNx9FBA1FHo0nwKAYeTljXJP9roKfjyrbII5sN5styFtixOtPFd
 PWSHi5GSjgvQuYG4xnpbcpO7r46y6LbnYsDP/gVnbAGOrRcO+2pzCled+zz8iwUwRRdh
 6e4UIzL3dwNOfso4t/Lbugp9cBgD10+quA4Qs3wl7RrEZ1WsYBaXGOgWyimvZX9Gd+N3
 UajA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eQe/N0IJ
Subject: [Buildroot] [PATCH 3/7] package/qoriq-mc-binary: new package
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

Add a package which deploys the NXP MC (Management Complex) firmware
to the target. This is necessary for NXP DPAA2 SoCs (LS1088A, LS2080A,
LS2088A, LX2160A).

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/qoriq-mc-binary/Config.in            | 48 ++++++++++++++++++++
 package/qoriq-mc-binary/qoriq-mc-binary.hash |  3 ++
 package/qoriq-mc-binary/qoriq-mc-binary.mk   | 22 +++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 package/qoriq-mc-binary/Config.in
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.hash
 create mode 100644 package/qoriq-mc-binary/qoriq-mc-binary.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ffe2d053efd0..adfdd97a044a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3307,6 +3307,7 @@ F:	configs/ts5500_defconfig
 
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
+F:	package/qoriq-mc-binary/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index a23d12c40247..92f2f43a0bb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -456,6 +456,7 @@ menu "Firmware"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
+	source "package/qoriq-mc-binary/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-mc-binary/Config.in b/package/qoriq-mc-binary/Config.in
new file mode 100644
index 000000000000..fa0983759082
--- /dev/null
+++ b/package/qoriq-mc-binary/Config.in
@@ -0,0 +1,48 @@
+config BR2_PACKAGE_QORIQ_MC_BINARY
+	bool "qoriq-mc-binary"
+	help
+	  The Management Complex (MC) is a key component of the networking
+	  subsystem named DPAA2 (Data Path Acceleration Architecture, second
+	  version) in some NXP Layerscape SoCs.
+
+	  The MC coprocessor runs a closed-source, NXP-supplied firmware image
+	  that abstracts and simplifies the allocation and configuration of the
+	  networking hardware primitives into DPAA2 "objects". The MC firmware
+	  exclusively manages the networking control path, and not the data path.
+
+	  https://github.com/nxp-qoriq/qoriq-mc-binary
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM # sign in required
+
+if BR2_PACKAGE_QORIQ_MC_BINARY
+choice
+	prompt "QorIQ MC Target"
+	help
+	  Select the target for the QorIQ MC firmware.
+
+config BR2_PACKAGE_QORIQ_MC_TARGET_LS1088A
+	bool "ls1088a"
+
+config BR2_PACKAGE_QORIQ_MC_TARGET_LS2080A
+	bool "ls2080a"
+
+config BR2_PACKAGE_QORIQ_MC_TARGET_LS2088A
+	bool "ls2088a"
+
+config BR2_PACKAGE_QORIQ_MC_TARGET_LX2160A
+	bool "lx2160a"
+
+endchoice
+
+config BR2_QORIQ_MC_PLATFORM
+	string
+	default "ls1088a" if BR2_PACKAGE_QORIQ_MC_TARGET_LS1088A
+	default "ls2080a" if BR2_PACKAGE_QORIQ_MC_TARGET_LS2080A
+	default "ls2088a" if BR2_PACKAGE_QORIQ_MC_TARGET_LS2088A
+	default "lx2160a" if BR2_PACKAGE_QORIQ_MC_TARGET_LX2160A
+
+config BR2_QORIQ_MC_DIR
+	string
+	default "lx216xa" if BR2_PACKAGE_QORIQ_MC_TARGET_LX2160A
+	default BR2_QORIQ_MC_PLATFORM
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
index 000000000000..21f9468e7c45
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
+MC_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_PLATFORM))
+MC_DIR = $(call qstrip,$(BR2_QORIQ_MC_DIR))
+MC_BIN = mc_$(MC_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb
+
+define QORIQ_MC_BINARY_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/${MC_DIR}/${MC_BIN} $(BINARIES_DIR)/mc.itb
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
