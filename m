Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41031C27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BD7960BAD;
	Tue, 11 Jun 2024 18:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIBxZlo-Ujcg; Tue, 11 Jun 2024 18:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9705660EC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9705660EC3;
	Tue, 11 Jun 2024 18:01:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21CDA1BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C841460A8B
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jHSfoLZWTF1 for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C565360AF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C565360AF1
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C565360AF1
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:53 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6f4603237e0so70442b3a.0
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128853; x=1718733653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A1ixujw6gtw60rlOn+96fVQtzw3fiIN5D58/kcxdvBs=;
 b=DMVK7wO75pOuKZhFCUfq/Zu1EhyPGW4AFr51I7gjtu5gAJLETg/TY6kwiHihVZFhJE
 1s+bulyuwydZt0L/LMVye0VgkZUvDLijkJGc9BCjS7GOynxQyOHZOnFaUqf1aOuG0Ztb
 feEkmabSgc5eA8HoiiOld9NA1KQtffIN5spg2+iUSJtSsqhVIYTicQvoS0MDjVHtSMEe
 HbCqWED2QPS/2Ah/FSwWlEGasJaI9ozjLajA3YNA0Y0pG2CaZPdPJnQ4LRuDVz22G4om
 ZzFhrvKYAszEe/zTOuikGC7fNNiZbNd6KCnb11N+hKetCDvS4WSxupqmi1Xyq6zFOLVH
 2vUQ==
X-Gm-Message-State: AOJu0YzDuT2UuQNQoKCGVEvhFLOcYLh7WksNxva/a6MOY7+F6yKx3lEC
 noVrYIqiAhXL8X2WjvMRi6oND1XFfjS3/qcGgkkSYlZ2Eq35dMvxck9qfvIC
X-Google-Smtp-Source: AGHT+IGMZvFPm31ijmh22h3Ovup+faYL06bo9i/F/hDFLqKi/fu3InhmQT33uKvvzlh7w6OwJ0sfdA==
X-Received: by 2002:a05:6a00:2f0f:b0:6ed:825b:30c0 with SMTP id
 d2e1a72fcca58-705a85b1547mr4281225b3a.15.1718128852393; 
 Tue, 11 Jun 2024 11:00:52 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:52 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:00:06 -0700
Message-ID: <20240611180007.2127244-12-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128853; x=1718733653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A1ixujw6gtw60rlOn+96fVQtzw3fiIN5D58/kcxdvBs=;
 b=RnDLTk8kw9tyXbXv0B4aM4ERdIFbSWatbv+ABLHUG646xSQ1QpAxa2j/JjtUyWaYbc
 tZs8LRdx/FTb//AMKt4uj0NAfYvitaOLvYH/JRScMLJZCT9BcQrUBK+sXVNF8LsODC4n
 ouyoNNVE9DpkoiL0vXoeoFjhohcz9uY3y85HmmcHR4An6/d+7UyjITxjwIXg7Qch9VpI
 m+Tj+nLMIXshEwa1is1IGhgq4+isgt1jWzt5A+LSB3LWRLu0FYJ0W7F48Pw7VwuR6v9S
 1kCvltrVIfL3qjqBZPH/x/3QdV5XT5UDOsY6itBgZrG7ZOD10uFsWRHKSWKihanXhPCB
 tqCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RnDLTk8k
Subject: [Buildroot] [PATCH 11/12] package/freescale-imx/firmware-upower:
 new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides NXP i.MX uPower firmware present on i.MX 8ULP SoC.
This version comes from the NXP 6.1.55-2.2.0 release.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 package/freescale-imx/Config.in               |  5 ++++
 .../freescale-imx/firmware-upower/Config.in   | 22 +++++++++++++++
 .../firmware-upower/firmware-upower.hash      |  4 +++
 .../firmware-upower/firmware-upower.mk        | 27 +++++++++++++++++++
 4 files changed, 58 insertions(+)
 create mode 100644 package/freescale-imx/firmware-upower/Config.in
 create mode 100644 package/freescale-imx/firmware-upower/firmware-upower.hash
 create mode 100644 package/freescale-imx/firmware-upower/firmware-upower.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 34ce1d1311..6d196a052d 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -165,6 +165,10 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
+config BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
+
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
@@ -177,6 +181,7 @@ source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-ele-imx/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
+source "package/freescale-imx/firmware-upower/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
 source "package/freescale-imx/imx-vpu-hantro-daemon/Config.in"
diff --git a/package/freescale-imx/firmware-upower/Config.in b/package/freescale-imx/firmware-upower/Config.in
new file mode 100644
index 0000000000..ca7486d2b7
--- /dev/null
+++ b/package/freescale-imx/firmware-upower/Config.in
@@ -0,0 +1,22 @@
+comment "firmware-upower needs an i.MX platform with uPower"
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
+
+config BR2_PACKAGE_FIRMWARE_UPOWER
+	bool "firmware-upower"
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
+	help
+	  NXP i.MX uPower firmware present on i.MX 8ULP SoC.
+
+	  This library is provided by NXP as-is and doesn't have an
+	  upstream.
+
+if BR2_PACKAGE_FIRMWARE_UPOWER
+
+config BR2_PACKAGE_FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME
+	string
+	default "upower_a0.bin" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA0
+	default "upower_a1.bin" if \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA1 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULPA2
+
+endif # BR2_PACKAGE_FIRMWARE_UPOWER
diff --git a/package/freescale-imx/firmware-upower/firmware-upower.hash b/package/freescale-imx/firmware-upower/firmware-upower.hash
new file mode 100644
index 0000000000..dc5938ad16
--- /dev/null
+++ b/package/freescale-imx/firmware-upower/firmware-upower.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  1df3a03d69feb38a450ee63abc7713d78cf6339988476e4c9f95ebbf63790f66  firmware-upower-1.3.1.bin
+sha256  de37a0bcbf1717b910c1a53ea6eab853c404e61e8143bb6c081d39f532571e54  COPYING
+sha256  b158adaac5e2d1c7fa6e739ff168ab498957e3303070f1c0b0e66d9a8f02a354  EULA
diff --git a/package/freescale-imx/firmware-upower/firmware-upower.mk b/package/freescale-imx/firmware-upower/firmware-upower.mk
new file mode 100644
index 0000000000..dfdf75510c
--- /dev/null
+++ b/package/freescale-imx/firmware-upower/firmware-upower.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# firmware-ele-imx
+#
+################################################################################
+
+FIRMWARE_UPOWER_VERSION = 1.3.1
+FIRMWARE_UPOWER_SITE = $(FREESCALE_IMX_SITE)
+FIRMWARE_UPOWER_SOURCE = firmware-upower-$(FIRMWARE_UPOWER_VERSION).bin
+
+FIRMWARE_UPOWER_LICENSE = NXP Semiconductor Software License Agreement
+FIRMWARE_UPOWER_LICENSE_FILES = COPYING EULA
+FIRMWARE_UPOWER_REDISTRIBUTE = NO
+
+FIRMWARE_UPOWER_INSTALL_IMAGES = YES
+
+define FIRMWARE_UPOWER_EXTRACT_CMDS
+	$(call NXP_EXTRACT_HELPER,$(FIRMWARE_UPOWER_DL_DIR)/$(FIRMWARE_UPOWER_SOURCE))
+endef
+
+FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME))
+
+define FIRMWARE_UPOWER_INSTALL_IMAGES_CMDS
+	cp $(@D)/$(FIRMWARE_UPOWER_UPOWER_FIRMWARE_NAME) $(BINARIES_DIR)/upower.bin
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
