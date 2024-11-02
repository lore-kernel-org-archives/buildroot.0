Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAC7E67805
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 15:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F6E161519;
	Sat,  2 Nov 2024 15:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I951parigV69; Sat,  2 Nov 2024 15:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F55761521
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F55761521;
	Sat,  2 Nov 2024 15:21:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06A1B27E1
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4B0F41681
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rqz6gxtFcuuz for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 15:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 529A5401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 529A5401CC
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 529A5401CC
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a99f9fa66fdso57500066b.0
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 08:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730560885; x=1731165685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S5UJAkPOhSEqcx4TWlc0waNb3LKhCG2y/ayJFICNtbg=;
 b=ffhZPqxd2S8L11OAIQEUvt1trVGoEAYzMAzXQMSP9dCNmExvSWdod9HmFpRWwqh7bo
 I/i2zv7MsfZivxYYiWRI14BvnZ3+bgPU29L3BfOTn+DV8W0BbbfSnFA/VFjUsqxjVprl
 sSZli0MkkuS39fhrSXxpZrO+eIZDG7avxXFwG+Qi++aueZ71Uuz+orN8plWGCBar+c97
 Y2YatyxS2jybEDmCPzcUQgtvQpkN7Wz/MIWiHSEpwawxTUJoOc8PEII5sOYgEWeppV3k
 29jJHqkQKL7SfrnoPNbbcgRTtOwhfir6KcVLxtoFYoxkhYyTiNvNce9VduL4Cm9wxISl
 WnHw==
X-Gm-Message-State: AOJu0YwX2JofeQzGbvRkJiUwUIkA9poXkpEm+ejR1PTtR/AS/nZjk8aV
 kgsdTdTkJ2e7cPhn4JqU88puSEW8SULwfJlH8Hp/tQpvVk5kb/B7QYL4tR+m
X-Google-Smtp-Source: AGHT+IGLz/Ow+VL7Zm2kySfNpQwtHlCUfYNkiLeP6lydj7MiWa/nWTnfScILWdp7r1GhCUu2idXt4A==
X-Received: by 2002:a17:907:72c2:b0:a9a:7f84:9408 with SMTP id
 a640c23a62f3a-a9de5d0aebdmr1076090166b.3.1730560884559; 
 Sat, 02 Nov 2024 08:21:24 -0700 (PDT)
Received: from skbuf.lan ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74ced8sm2587535a12.17.2024.11.02.08.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 08:21:23 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sat,  2 Nov 2024 17:21:03 +0200
Message-ID: <20241102152106.2153747-5-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241102152106.2153747-1-olteanv@gmail.com>
References: <20241102152106.2153747-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730560885; x=1731165685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5UJAkPOhSEqcx4TWlc0waNb3LKhCG2y/ayJFICNtbg=;
 b=U9W201jJbIIMyevKJAYAWHsjgQtmBQgzGH62G2RetxKOu3dLPo9GjgzTElDWwQXqJ4
 NDN+JWJJ/PUP7RZQnrMvsVbObI20La4rogeRDV+TCHdcU/IxYgRV/wGKZlVWddFh+YX8
 ia12bfwfuyLqnvoUpf00pa9GEBJGtz4gEcC8vORRcy3ZAE+CaYAjaF5qnTQsrhNpIupe
 gxiHXcJe9KtzIuG/kkiVjN1oVQWBKx9hjSmh5ObB0yIbfm6E6XC/3I+NSNStG+zVi+1U
 L2LGYT+R3NxvJ6BFCI98oZRJ4HFtX2qTXKyEfI0sdmVRRhOqbiUwPogBcekztTkexvG4
 e74g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=U9W201jJ
Subject: [Buildroot] [PATCH 4/7] package/qoriq-mc-utils: new package
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

The configuration files for the MC firmware binary are distributed
through a separate repository on GitHub, and need a different package.
They are licensed differently than the firmware itself, and unlike the
firmware, they are customizable.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/qoriq-mc-utils/Config.in           | 35 ++++++++++++++++++++++
 package/qoriq-mc-utils/qoriq-mc-utils.hash |  3 ++
 package/qoriq-mc-utils/qoriq-mc-utils.mk   | 22 ++++++++++++++
 5 files changed, 62 insertions(+)
 create mode 100644 package/qoriq-mc-utils/Config.in
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.hash
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index adfdd97a044a..ace48c35961c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3308,6 +3308,7 @@ F:	configs/ts5500_defconfig
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-mc-binary/
+F:	package/qoriq-mc-utils/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 92f2f43a0bb1..47a4648f49a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -457,6 +457,7 @@ menu "Firmware"
 	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/qoriq-mc-binary/Config.in"
+	source "package/qoriq-mc-utils/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-mc-utils/Config.in b/package/qoriq-mc-utils/Config.in
new file mode 100644
index 000000000000..bb45ffbc9ca7
--- /dev/null
+++ b/package/qoriq-mc-utils/Config.in
@@ -0,0 +1,35 @@
+config BR2_PACKAGE_QORIQ_MC_UTILS
+	bool "qoriq-mc-utils"
+	help
+	  The Management Complex (MC) is a key component of the networking
+	  subsystem named DPAA2 (Data Path Acceleration Architecture, second
+	  version) in some NXP Layerscape SoCs.
+
+	  The MC firmware is configured through two distinct files named DPL
+	  and DPC, which are customizable by the end user. Example
+	  configuration files for NXP reference boards are distributed through
+	  this package, and are frequently patched to produce the configuration
+	  required in other scenarios.
+
+	  https://github.com/nxp-qoriq/mc-utils
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM # sign in required
+
+if BR2_PACKAGE_QORIQ_MC_UTILS
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPC
+	string "Data Path Configuration (DPC) file"
+	help
+	  The DPC file contains the settings defining the behavior of the MC
+	  firmware. Its source code follows the device tree syntax and is
+	  compiled to a device tree blob, which is the file that must be
+	  specified here.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPL
+	string "Data Path Layout (DPL) file"
+	help
+	  The DPL file contains a description of the initial networking objects
+	  created by the MC firmware when it boots. Its source code follows the
+	  device tree syntax and is compiled to a device tree blob, which is
+	  the file that must be specified here.
+
+endif
diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.hash b/package/qoriq-mc-utils/qoriq-mc-utils.hash
new file mode 100644
index 000000000000..f0234b9d1ff8
--- /dev/null
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1d3f4a6b2661cff9cfb5d4fcba3b181eb6febdd88a127fa069e306f51d778fc5  qoriq-mc-utils-10.39.0.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.mk b/package/qoriq-mc-utils/qoriq-mc-utils.mk
new file mode 100644
index 000000000000..d4fc5e27385e
--- /dev/null
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qoriq-mc-utils
+#
+################################################################################
+
+QORIQ_MC_UTILS_VERSION = 10.39.0
+QORIQ_MC_UTILS_SITE = $(call github,nxp-qoriq,mc-utils,mc_release_$(QORIQ_MC_UTILS_VERSION))
+QORIQ_MC_UTILS_LICENSE = BSD-3-Clause
+QORIQ_MC_UTILS_INSTALL_IMAGES = YES
+QORIQ_MC_UTILS_INSTALL_TARGET = NO
+
+define QORIQ_MC_UTILS_BUILD_CMDS
+	$(MAKE) -C $(@D)/config/
+endef
+
+define QORIQ_MC_UTILS_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/config/$(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC)) $(BINARIES_DIR)/dpc.dtb
+	$(INSTALL) -D $(@D)/config/$(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL)) $(BINARIES_DIR)/dpl.dtb
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
