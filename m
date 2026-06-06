Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B84CD8C88
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 22:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B11F42888;
	Sat,  6 Jun 2026 22:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgcY9p7nDYwo; Sat,  6 Jun 2026 22:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9AAC4283F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780786292;
	bh=IG1McWPXt3y6+a11rRUuyvPBSBwviggewybRH19p03o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cNtVwsF9bSZc9DUwL/3+iA5KcBX4jaRZbvo8SpBgxEPt7cy3EiJlH84io6kfR0T9H
	 7svcW3xuuJNdMlzR8sZi4cQc2vWCM4vn4gjFOvnTW0U/e+rdbC4bCvfMnTomZTzrxs
	 eGaLl1LrZlKmtHqMAKPTp8znq6EWHsZClK3rFoTg4XA+WxaID8wK9I/myg2SDOzhwg
	 3ssyCpbAw2mFTyV7epEYNp5qnyTSfI9LK+wC+sspm+LevcOhLSvRxrtWs1DjfVgAoT
	 QLsB+X9SOnkPvgeehZVFm5be1E6iqrGYRGgGFu45DPOKEHWwFtfA//rlfVB3KfPJAp
	 HS/FUHMJUQcxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9AAC4283F;
	Sat,  6 Jun 2026 22:51:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ECF22EF
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74CAF607A9
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9Fjb-g1rPfi for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 22:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4908B60763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4908B60763
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4908B60763
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 22:51:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490b2b037d2so26580885e9.3
 for <buildroot@buildroot.org>; Sat, 06 Jun 2026 15:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780786287; x=1781391087;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MZ0AS6adzOnRgxZ3ZQTqJRfJanXgC+zun3wyOXlRpNE=;
 b=X3JKcKY1Pfaj7LvupsHHvVB0EUo7C0nDO92E5Yqqw3u8kK8LDYv0eN/JOF4GCruxFQ
 1roKgYRCLClk3rfZWz/8Mls5bsi4tgHlo7j02QFFNw3LA9G+NqhlGdivNZUF/3QhewCV
 HPJszfGbKCgdObce269dwS92XKut47DVE6bf2orsVXCe1n2WeuSGLF2KnLn27g2BENqd
 jkcxj8dnCmxpoOLwsIFwIE2693+kP+EH0jY3111A5TYeCOsGqhvj4nXOaAcgozop8Nzs
 KZ+yNwLXMznixwgoo322olKxYT8qUT8RT+obP4EV86qBI01AZ9ah+PFBd0iw5NABgUPX
 SUXw==
X-Gm-Message-State: AOJu0YwkRaTn4icWOw32kNnWZbJTtnMqwPaT06Yc6eDPaUKjY4+1gz5b
 bC70tl5OkluzZxCniFZydVV5S5h+BKqW/51nbiqaBClbGz4RPzu0UYixpn3rHEMofwjnA/OiE5S
 u02QU
X-Gm-Gg: Acq92OHUrN+pAi8cJlgRaDpNL8vURcDkLkBJGASnthu2HMg3o2HaqSGJEpIE1n9fgX6
 dSkVzJ7zpCYTitS8+ZNF1Mpjt835MNPupyvsX2z/b/5RLBmWOG7gnl6TzC04cxvKE+gW2urrz2z
 nDLvj9h68gXY6c4e4hnxuN7l0DlMe2wOMxxl6iVuI/G+AX6bwdwahBneEiRVDh1DloW27x/gUKl
 i4rYoC/Qn6fGbXyQ2J2jwW7jTIu1vzvio0AK8fflhkFDaZRw+VABRo8rSKoWwmZtiksBNiaP+4C
 H1hvxg84wGNd2fMurGwbNtE+AE5eiA2EJ+jQFgSHAIS8VP6UWGfKE/lU6En8i7tepRt/PXRkuQK
 9wFyag3qCQfVxq3FzpNoyG7uMfDBIgLdSYyuFwN4aslbX6FhRzCJncWVMznPjiczyKNflSlEedf
 P8d4guMZV6BKsAzAyjxia/P7msyltDHNIPspDFbuDBdv9/q/gdWJzM9+F8WjB8YltemyaYX/czX
 U2Kzn/L5EcPPr0zEkTiP0fzCdLTx16Cb5FU
X-Received: by 2002:a05:600c:8b6a:b0:490:44eb:c1d9 with SMTP id
 5b1f17b1804b1-490c26217damr140609575e9.28.1780786287145; 
 Sat, 06 Jun 2026 15:51:27 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm67014650f8f.27.2026.06.06.15.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2026 15:51:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun,  7 Jun 2026 00:51:14 +0200
Message-ID: <20260606225120.409046-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260606225120.409046-1-romain.naour@smile.fr>
References: <20260606225120.409046-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780786287; x=1781391087; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MZ0AS6adzOnRgxZ3ZQTqJRfJanXgC+zun3wyOXlRpNE=;
 b=n/z5frq7mZRCgZ24qlkJow513vKkwYEhF5PFburee3PVpw8V0IMAgDk24UVSYd7nrA
 xR15EE64V8sw5vclIfktzvnWKRH62/Yzp+fQGiHNBB3muL5tmmY1xYrUgtBEMx1i0OTf
 ukqv5EWFv72pwuiexnIduPbm5pUGVzdghR6xg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=n/z5frq7
Subject: [Buildroot] [PATCH 3/7] package/ts4900-fpga: remove package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ts4900 defconfig was removed, this package is no longer used.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                     |  7 +++++++
 package/Config.in                    |  1 -
 package/ts4900-fpga/Config.in        | 11 -----------
 package/ts4900-fpga/ts4900-fpga.hash |  5 -----
 package/ts4900-fpga/ts4900-fpga.mk   | 21 ---------------------
 5 files changed, 7 insertions(+), 38 deletions(-)
 delete mode 100644 package/ts4900-fpga/Config.in
 delete mode 100644 package/ts4900-fpga/ts4900-fpga.hash
 delete mode 100644 package/ts4900-fpga/ts4900-fpga.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a36e331593..140b85da97 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_TS4900_FPGA
+	bool "ts4900-fpga removed"
+	select BR2_LEGACY
+	help
+	  The ts4900 defconfig was removed, so ts4900-fpga package
+	  has been dropped.
+
 config BR2_PACKAGE_PTPD2
 	bool "ptpd2 removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 630662477b..ab115451d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -447,7 +447,6 @@ menu "Firmware"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
-	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
diff --git a/package/ts4900-fpga/Config.in b/package/ts4900-fpga/Config.in
deleted file mode 100644
index 9f704fbc8c..0000000000
--- a/package/ts4900-fpga/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_TS4900_FPGA
-	bool "ts4900-fpga"
-	depends on BR2_arm
-	help
-	  TS-4900's FPGA implements clocks, UART MUX, and GPIOs. One
-	  of these GPIOs is used to enable the wifi module.
-
-	  It is loaded by U-Boot during the boot sequence, the default
-	  U-boot script expects to find it in the /boot folder.
-
-	  https://docs.embeddedts.com/TS-4900#FPGA_Changelog
diff --git a/package/ts4900-fpga/ts4900-fpga.hash b/package/ts4900-fpga/ts4900-fpga.hash
deleted file mode 100644
index 1d3c62bfd1..0000000000
--- a/package/ts4900-fpga/ts4900-fpga.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga//ts4900-fpga-20170510.bin.md5
-md5  86c7c3d7fb9c607af1ef55e1222b4416  ts4900-fpga-20170510.bin
-
-# Locally calculated
-sha256  f15edd6813ee5e93e7f380d85df2dc31e764ebca465093fb9006d56ee15b476b  ts4900-fpga-20170510.bin
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
deleted file mode 100644
index 73e7a28e31..0000000000
--- a/package/ts4900-fpga/ts4900-fpga.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# ts4900-fpga
-#
-################################################################################
-
-TS4900_FPGA_VERSION = 20170510
-TS4900_FPGA_SOURCE = ts4900-fpga-$(TS4900_FPGA_VERSION).bin
-TS4900_FPGA_SITE = https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga
-# No license file provided, Yocto recipe from the vendor claims MIT.
-# https://github.com/embeddedTS/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
-
-define TS4900_FPGA_EXTRACT_CMDS
-	cp $(TS4900_FPGA_DL_DIR)/$(TS4900_FPGA_SOURCE) $(@D)
-endef
-
-define TS4900_FPGA_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/$(TS4900_FPGA_SOURCE) $(TARGET_DIR)/boot/ts4900-fpga.bin
-endef
-
-$(eval $(generic-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
