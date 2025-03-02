Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA24C282D0
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6755983F65;
	Sun,  2 Mar 2025 21:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2IL-jMtuCSr; Sun,  2 Mar 2025 21:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E22B83F67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E22B83F67;
	Sun,  2 Mar 2025 21:52:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A473958
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD2B04022B
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJEe-v0ChZII for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 759C340529
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 759C340529
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 759C340529
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:43 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-439999d2bbfso4367705e9.2
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952362; x=1741557162;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3Ozj/Zba1jkVgkIS9Fnb2geGLMNLTp6D3hf6+FtWCU=;
 b=ELonQTWelRZWngouiSqM9Wm+jm/sZe/6Z3JcLUuvGW0S/LUKZc9HJgbv4crb06DEA5
 oqY5SAGIydThTEjIg5JNAJ6jKWZH1CD5s7klWaLrAt9AjzIc2Plz52M5Fzc9SbVuQXsc
 RN8yrnHXeU7GEWOGLEqcK1ijjR9+4m2sQe86DP7DnpiNHQxbUvLyt4uvItH0BH+n0RIy
 pDlcHVpbaVZ6rBlFTeonlEjRjcgcVWWuleXrJWa52GjzukNX/AHiUYVE5laU+K6gXRVU
 b3vyj3eT+kCdxUTGZPI1lTt2luuuRkkmYVZ0tcpovXAQgc5pF0h0sxw8FAq7Wn3CsufA
 8gog==
X-Gm-Message-State: AOJu0YwwXplPrL2dPpn5Ej9bkErWL3qKRvJTX2IiBq10BbxGJZkv0HSo
 zCu1gdAk09Ts8JnulHA1hrY+dsB07j2CWX6zZtPX8q6GK5k3T6zSIuZ7qsha
X-Gm-Gg: ASbGnct70tv5EgTt8moI2ULMw9eeTPluGxudiSlE5LkRzsFppxtleqO4nCl80imDB/N
 wPzc76JPePxgSJm7aZzAa10iMaG97aLbVb4jFxyyG4RFBpqXMg73VQqpdBKyue+PXKQmB3VAnRZ
 s/+UR10gApKbCBoDNKGD28kUfeN89yafI5uNuKc8N5MOslXeJW3Mv2jFXnTSEdHzRkCAOhVJvNX
 mc2wN6rf5jYeQFZdDYawNnWIqbulfkMONyJhcpBxbObwrSTco33f3k3i2AZw3lp1E3lcophUAOL
 6WWIE5K0YHyJMvvPjsDErMHx0WMLF3gDp3eo8Q==
X-Google-Smtp-Source: AGHT+IFdYqvKHAQmuju4EXKX9hYO9YJJB2OTuaW3hEy2iBvEMMZ1Ix3VSsXkQKS1Q9l+3fuSaJVZpg==
X-Received: by 2002:a05:600c:3ca3:b0:439:9595:c8f4 with SMTP id
 5b1f17b1804b1-43ba665e438mr35970695e9.0.1740952361557; 
 Sun, 02 Mar 2025 13:52:41 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:40 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:08 +0200
Message-ID: <20250302215219.1276480-5-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952362; x=1741557162; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3Ozj/Zba1jkVgkIS9Fnb2geGLMNLTp6D3hf6+FtWCU=;
 b=AYffwRq/NlzGLCrHcrn/mnLQKjr4dtnAo6FXhwPK8eiInmVF01l1m8evzriryDETFb
 VSMlEBZMZdYJD4YC8xmR226bOUyFJnVZkVlJ5nPG4kShEAsn2Sz9dw+zjSZvdm3Uew46
 iV7dfdQu2Uax8U1oWSoOAy6k7SmSKwciLxdRYs43Vjv1M4ep8I3eKuy5p1m3W0BnyK3t
 aSrtXwni2HTTzw2U9LL93t/VSbnBMeWHTSN8lac5IvnDFselWjy3DuwFdIUOEriBztdQ
 Ova8jXb5e8/jUCS9aWI89Kr6n6sAeAl9L2nku5WylqeCaXc5uDGgpPa58570QSUoQifr
 3WQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AYffwRq/
Subject: [Buildroot] [PATCH 04/15] package/qoriq-ddr-phy-binary: new package
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

The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
as prebuilt binaries by NXP through GitHub.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
---
Change log:
None.

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
index 1f04dd2a1e71..500330fc1f5b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3356,6 +3356,9 @@ N:	Vivien Didelot <vivien.didelot@gmail.com>
 F:	board/technologic/ts5500/
 F:	configs/ts5500_defconfig
 
+N:	Vladimir Oltean <olteanv@gmail.com>
+F:	package/qoriq-ddr-phy-binary/
+
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
 F:	package/zbar/
diff --git a/package/Config.in b/package/Config.in
index 4a81a62ec472..323c32801790 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -448,6 +448,7 @@ menu "Firmware"
 	source "package/odroidc2-firmware/Config.in"
 	source "package/panel-mipi-dbi-firmware/Config.in"
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
