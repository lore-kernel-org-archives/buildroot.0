Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07839E67804
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 15:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 850B06151F;
	Sat,  2 Nov 2024 15:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4XUnRZUbLy9; Sat,  2 Nov 2024 15:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48C636150F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48C636150F;
	Sat,  2 Nov 2024 15:21:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31628979
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 132044247F
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjXVYtf83Pj2 for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 15:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CA1EF4247B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA1EF4247B
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CA1EF4247B
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:22 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99f9fa66fdso57498866b.0
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 08:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730560880; x=1731165680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2oNXPOlgRlRkx3lQHqfZj1nllFzuJZ04EoW9MXG/GUo=;
 b=AkMu6TQEuWCDzFU8dTIZ6hrz3pzvkXTF5hdOmr7ajzRt6T9jH6D9r2tQAvDi0npA6Y
 PJ3S/UasqKdJUsu8KPE/bp/uCw1T3Fxz7Y8b1LGB/Hr1snDWY7RpmXG2ERNcFrjGtbRM
 ihn1YrA+p6eKGWLUMK7Ph02VJNumGmOL5T95Jq8vF7fQuze4qvcHzyFeOPZ+NjqlmX+e
 5QLuR11DP77MBWoe7jgVMyyUTWCuMpu2wIiEsyIZIWEpX2DvDP0zFXJ9mY2r5QJt6ueU
 GGv3l8m7oay9HgzjOqYBZo04C4lxcS1yYdjH5FUoLcMgNk4a68359fFgeqJki25tkbcW
 4Fnw==
X-Gm-Message-State: AOJu0YysnR/RdMXGcIMo6mMoZVV7puKo6zUxqnw28yBQibkCGbB+pTEM
 AiD4+Xmg1xyAUcOf3HSWZrpLdr6GfrEw4OL+KaBL+1afbGHa2Lz9f1AzupPL
X-Google-Smtp-Source: AGHT+IGtCugI4tnITHpt00qwPt893HXBv4a4NSpRpxK2T0a8U3LOlk08aD4N3ERbOOM3TtHgV51Y9A==
X-Received: by 2002:a05:6402:13d3:b0:5ce:cd60:8ecc with SMTP id
 4fb4d7f45d1cf-5cecd609132mr542726a12.9.1730560880076; 
 Sat, 02 Nov 2024 08:21:20 -0700 (PDT)
Received: from skbuf.lan ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74ced8sm2587535a12.17.2024.11.02.08.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 08:21:19 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sat,  2 Nov 2024 17:21:01 +0200
Message-ID: <20241102152106.2153747-3-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241102152106.2153747-1-olteanv@gmail.com>
References: <20241102152106.2153747-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730560880; x=1731165680; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2oNXPOlgRlRkx3lQHqfZj1nllFzuJZ04EoW9MXG/GUo=;
 b=eFG64+w46Y1Pra0J0CyCjJT4CVQtyxkRmXgGPpG88cgIok/iYWtvlHfK0ghE1PY06j
 ccDVyp/22SrCK1hMQOSe4q3ToB7+HID7CXLS/79UfxsVdDWC0M+sncPoRZvlBe2ywUlO
 b+f6Gv77Ph3SRFpwyDRulT5EanevH4g+LPVAozUTH/fv4nRTaqOBweCyhBBrAXvrdt7j
 +oaBxzb28+HqVyLarHB0jV1dOYyIzQCabDQywCfl5CtlGjf/HSIHvp6kFm0HSevq7i+7
 d8C66MLvQ4XUk8LWQvnWsthOqlNhNeLNIwW3GqjnxCdWEytGzMTh9I1yWcYtTxMy4fwY
 RbsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eFG64+w4
Subject: [Buildroot] [PATCH 2/7] package/qoriq-ddr-phy-binary: new package
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

The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
as prebuilt binaries by NXP through GitHub.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 DEVELOPERS                                     |  3 +++
 package/Config.in                              |  1 +
 package/qoriq-ddr-phy-binary/Config.in         |  6 ++++++
 .../qoriq-ddr-phy-binary.hash                  |  3 +++
 .../qoriq-ddr-phy-binary.mk                    | 18 ++++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/qoriq-ddr-phy-binary/Config.in
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
 create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 327b2e64db71..ffe2d053efd0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3305,6 +3305,9 @@ N:	Vivien Didelot <vivien.didelot@gmail.com>
 F:	board/technologic/ts5500/
 F:	configs/ts5500_defconfig
 
+N:	Vladimir Oltean <olteanv@gmail.com>
+F:	package/qoriq-ddr-phy-binary/
+
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
diff --git a/package/Config.in b/package/Config.in
index 876b340a8a67..a23d12c40247 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -454,6 +454,7 @@ menu "Firmware"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
+	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
diff --git a/package/qoriq-ddr-phy-binary/Config.in b/package/qoriq-ddr-phy-binary/Config.in
new file mode 100644
index 000000000000..301a2c197421
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_QORIQ_DDR_PHY_BINARY
+	bool "qoriq-ddr-phy-binary"
+	help
+	  Firmware binary for DDR PHY of NXP LX2160A family of SoCs.
+
+	  https://github.com/nxp-qoriq/ddr-phy-binary
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
new file mode 100644
index 000000000000..7357e741fcfa
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b49cb34f941f7e534ec31d3d14d18d4e565e4875b690ecb0d7e2992b72c64dc7  qoriq-ddr-phy-binary-lf-6.6.36-2.1.0.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
new file mode 100644
index 000000000000..ab25ff541d9c
--- /dev/null
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# qoriq-ddr-phy-binary
+#
+################################################################################
+
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.6.36-2.1.0
+QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
+QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
+QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
+QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES = YES
+QORIQ_DDR_PHY_BINARY_INSTALL_TARGET = NO
+
+define QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/lx2160a/fip_ddr.bin $(BINARIES_DIR)/fip_ddr.bin
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
