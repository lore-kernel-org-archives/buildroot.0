Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA02E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F3DC60BA8;
	Sun,  8 Dec 2024 14:38:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2dNLgwmfn2Fp; Sun,  8 Dec 2024 14:38:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB7BC60A82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB7BC60A82;
	Sun,  8 Dec 2024 14:38:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 641506F
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4150140A44
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1NKA2kGQcaA for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAE7940A45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE7940A45
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAE7940A45
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:30 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa67bc91f87so7858566b.1
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668708; x=1734273508;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eyjWBUoFirVn7shxEGOwP+aYgU2/V1AYiK647KDqPYw=;
 b=gq9SpkEoFfKIgcK0pCAI6Oc53hRXKZWKm5B8h2kJQkCsRonNNHaYQc8rNBWX73gVFT
 YwItJ1ajfZpLERQkMXB651AD3YMyacvmHhxf1nF1z5UJD0HKokZsULacoOzlNWhTCtwy
 ux393vm2ZapsQrhOTEqLxjy1wS8ECZzCl3KOE123MreWjE0eBUKmNB93pyXBrQTwT12o
 m+AavZ5iSMdxwpLNKf0BRFBqKb0dOSIHX92k8EnJdQYhhls3JU6UZV9PAOghADKxk9No
 Av48hgmnqFAi+gSksmPgOpmeiNugmd8luCpx0hl5YtERxuTS04/dmXiNAN1YBQh3MQDL
 fdzg==
X-Gm-Message-State: AOJu0YyRaUBnME4w4XLuRsamRoQ1UqPjz+m8KOlT7SFehuZvMQ2E88SS
 07MlQCrCDWa0Pi4LLIbJ7IQSeOPCf9GM3yfO6Su9dB6naMPjzF24JnTNaQ==
X-Gm-Gg: ASbGncsHfMUlF2LWraPzl22QF3oY2u9naJopEAgCPbWBOZ2h7EgOYAS2z2QaJbrJ++5
 ZUiVRQrBjsbGVd2W1LGGWDQ98Kg6U0NG23nzwxsiGzo3hNPOKOEjmZxvyWZTCsHel2RhJvCQbIu
 u/CVspvgTWHL4YkdkrZ/lBtpkJ4m3sGG9iCk5zmcfMA1KwIUJ7gM03LSpWkBXY/xI1FG8CK4SiK
 CUtS45RrnTowymZZQ1KgRXwGcUhKmGl46YbjOjy168=
X-Google-Smtp-Source: AGHT+IEYpqRCzjVNs2b+jBqN5PtRt5qpogaddiSifi0eDEG0cU2KKs3FO2gE1ZgeQ9eVl139Kzv0lA==
X-Received: by 2002:a17:907:1909:b0:aa5:46ee:9545 with SMTP id
 a640c23a62f3a-aa639fee4d0mr301878366b.5.1733668707599; 
 Sun, 08 Dec 2024 06:38:27 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:26 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:37:54 +0200
Message-ID: <20241208143802.1048266-4-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668708; x=1734273508; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eyjWBUoFirVn7shxEGOwP+aYgU2/V1AYiK647KDqPYw=;
 b=SjrxBpNxliOliwXk2/XDNnbgmUifYV1CqmYBMDMeozzGKlejWOHJR0uN5HuP9DjH9l
 wFAiHB09+q7P6wypipVfH0r6v5MvWxT6bKvqrqjjtt/SHxEYNdhF3CQKmqDvhzxdatmW
 oX35lxcS/3oaps4wwswcvEnVA+NyCKHWf/mrDjI7mrsK2vj7wZ+d2TyduJ5ijf3+rhcX
 ERcZw9rBUXomn/Bl9O22ykK7g80QpHPnRdBPhMWgcSQOa8VcnqDQ1NWkZOcP4ti8oTtl
 MGV6lddrxx4Mxi2SpgNkh9Kcp9D6p4Aj+nXJybZ4+dxEALaBLkLmj5zCt0mHCDVHY2W0
 zvVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SjrxBpNx
Subject: [Buildroot] [PATCH v2 03/11] package/qoriq-mc-binary: new package
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
v1->v2: none

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
index 0260fc52e4e3..68c8af0ddc15 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3303,6 +3303,7 @@ F:	configs/ts5500_defconfig
 
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
+F:	package/qoriq-mc-binary/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 53e3170ea0f6..36337834f284 100644
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
