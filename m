Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F05C282CD
	for <buildroot@archiver.kernel.org>; Sun,  2 Mar 2025 21:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 201EB4142F;
	Sun,  2 Mar 2025 21:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2fYTdyyiBPq; Sun,  2 Mar 2025 21:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC7404140E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC7404140E;
	Sun,  2 Mar 2025 21:52:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3C6B182
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42E2F408B4
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AurkFXIPqGCc for <buildroot@buildroot.org>;
 Sun,  2 Mar 2025 21:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF8E2408C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF8E2408C3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF8E2408C3
 for <buildroot@buildroot.org>; Sun,  2 Mar 2025 21:52:48 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-390e0f7b272so352845f8f.0
 for <buildroot@buildroot.org>; Sun, 02 Mar 2025 13:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740952366; x=1741557166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n0w6Au1egUfMV7D4GHwGeX3JXaQqp3YqtynhLR0f7ws=;
 b=CsZS6faR+3fawL5jeAj74Y/iza06Es4fuEgCd4u6W3hOaoU+FzvwGBBujAIgnDYIG+
 TMVfwH69PzbEYoKmYvEanga1tbZlrSaekfXdZLXCDH+jUen7195NpPmNmaaI9mTAjfq0
 dqZWuC0lt//pDOualZoKP9oicNHyCyA+BUio5rOQukzm7WGeFSn1CaHSLlIBWVEf5FNG
 o/pKTpsYLWbFoN4D7D2PhVKWiG5iycrTz21f2lox2qiHcc7e2dO+e1UYElHpsN96roMi
 6+Ow0Q420CoY4gdektqbPDMwJVSKLJ5P0Z52gD7eRK8sE5F42IbkrI2G+S+P1OVS26I2
 oXKA==
X-Gm-Message-State: AOJu0YwNjI5IRKCXTy+Ou0ZO4cbyIyK4ZVuL23o6sFY1d0hpOd75QkvF
 EE1ZGwpSBgPmvIf2ItRZ3cJNBwcdJNnoo2L33MfM+0hIQjkmDOonhF96u+Dq
X-Gm-Gg: ASbGncsS8LV19efXFLcY5aP7Cng6fZGG7tleTZJQJmBUNtVNpIofHsKHhtoVpMUHG1k
 HeZNustR04eDGQlpcApP8dnc39UpWiQKxXWrUYMbIo4o8jzYL6NkF84s+Xef3gO+oun6TfIleX8
 2Z4+Ff+BIiPg7sgm+4S75nDxZSo0WqEOGnEwHj9T9WLvKWzxMFRULHJEw1SpV9OCm+UvJvmFsop
 +5TrSeGB5XIftk9GUTux4XaQ134pPsoozmAUHAKdR733+UfFNsktkEmoKXbCSYoG70MzXTvwIMX
 A75nfS98YPFQqJ4+xZu2b0ziJzCZaoutJft+dw==
X-Google-Smtp-Source: AGHT+IHvWa6uQRbrQV8QF5Uuj+amLr7kwPD3ARMjLBNTM916iOzQ1VVg337tiDPIoZmoNzJ3B00Xlw==
X-Received: by 2002:a05:600c:1548:b0:439:a3df:66f3 with SMTP id
 5b1f17b1804b1-43ba675b090mr36400925e9.6.1740952366277; 
 Sun, 02 Mar 2025 13:52:46 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab2cb1063sm113389645e9.2.2025.03.02.13.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Mar 2025 13:52:44 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Mar 2025 23:52:10 +0200
Message-ID: <20250302215219.1276480-7-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250302215219.1276480-1-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740952366; x=1741557166; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n0w6Au1egUfMV7D4GHwGeX3JXaQqp3YqtynhLR0f7ws=;
 b=cRXTL6FfBL06ePvypz9u6EptC79fjPa6WWR6KDcpkJPNe2T6IlUTep2c9XxlT7up79
 cMivFzVt1Uk3FUNdGdD+Pv2iqKr2va3xhKPKquzR2p/d5U8eCPqESd6COw94q/EsFv+a
 oSjZz1L/iAT0pVSE4PSz4/PxPdMvwheLPueHdETpDRQNudaXG8sXZTsPD+EEtFXb0Yu1
 2FIePnYa1ND8W45RqAkhV3rGAei4XmEnV5gxS4a3S7/X9eL8TKK31WaQaVQK+UTOWefS
 6EchSeOjj4qOHtTL7UYC8wRTjY2NTbk/ZM9O/FdFR8p4vPBt1S9oY782SFqI3Eml8YaQ
 13sA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cRXTL6Ff
Subject: [Buildroot] [PATCH 06/15] package/qoriq-mc-utils: new package
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

The configuration files for the MC firmware binary are distributed
through a separate repository on GitHub, and need a different package.
They are licensed differently than the firmware itself, and unlike the
firmware, they are customizable.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
Change log:
Reindent help text.

 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/qoriq-mc-utils/Config.in           | 37 ++++++++++++++++++++++
 package/qoriq-mc-utils/qoriq-mc-utils.hash |  3 ++
 package/qoriq-mc-utils/qoriq-mc-utils.mk   | 22 +++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/qoriq-mc-utils/Config.in
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.hash
 create mode 100644 package/qoriq-mc-utils/qoriq-mc-utils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1146920e1c74..55854a77e0c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3359,6 +3359,7 @@ F:	configs/ts5500_defconfig
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-mc-binary/
+F:	package/qoriq-mc-utils/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 8f46c2ef8b4c..f1df62658f58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -451,6 +451,7 @@ menu "Firmware"
 	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/qoriq-mc-binary/Config.in"
+	source "package/qoriq-mc-utils/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-mc-utils/Config.in b/package/qoriq-mc-utils/Config.in
new file mode 100644
index 000000000000..45dfcdc8e0a0
--- /dev/null
+++ b/package/qoriq-mc-utils/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_QORIQ_MC_UTILS
+	bool "qoriq-mc-utils"
+	help
+	  The Management Complex (MC) is a key component of the
+	  networking subsystem named DPAA2 (Data Path Acceleration
+	  Architecture, second version) in some NXP Layerscape SoCs.
+
+	  The MC firmware is configured through two distinct files
+	  named DPL and DPC, which are customizable by the end user.
+	  Example configuration files for NXP reference boards are
+	  distributed through this package, and are frequently patched
+	  to produce the configuration required in other scenarios.
+
+	  https://github.com/nxp-qoriq/mc-utils
+	  # sign in required
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM
+
+if BR2_PACKAGE_QORIQ_MC_UTILS
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPC
+	string "Data Path Configuration (DPC) file"
+	help
+	  The DPC file contains the settings defining the behavior
+	  of the MC firmware. Its source code follows the device
+	  tree syntax and is compiled to a device tree blob, which
+	  is the file that must be specified here.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPL
+	string "Data Path Layout (DPL) file"
+	help
+	  The DPL file contains a description of the initial
+	  networking objects created by the MC firmware when it boots.
+	  Its source code follows the device tree syntax and is
+	  compiled to a device tree blob, which is the file that
+	  must be specified here.
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
