Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1531FC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 22:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DD8540BE9;
	Wed, 14 Dec 2022 22:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DD8540BE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ig3yeD0weCNS; Wed, 14 Dec 2022 22:15:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C927D40BC4;
	Wed, 14 Dec 2022 22:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C927D40BC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 978941BF947
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B7060F5D
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 22:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B7060F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzjHv85cwdlN for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 22:15:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6956260EC4
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6956260EC4
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 22:15:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id m18so47923403eji.5
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 14:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+dKmTxwXg/1MYw8M2H0u7VFDyizmBNgmFAyP9riy/u4=;
 b=WSuoFNRGhxJPf7F2npNlyS8a6bdxGhhr5+PDE7gWpBfQqO0YWz/Ge4cE015Ga89BOU
 v+v688nk/pfcb5KDwhIQXKnOMlebVwnWHF5W4RDoi/i9ZMTuGSL1BAKwn8cSKgTm1DLe
 lLO16XN4v4To3cq2BQvmK1+a2hgVqfyVXj5WiJWdtTEVkBg1jGMGL5vg7RZMJMZYkVsO
 y2L90EVfLrYxdKOvhNWJSg22Igzyuj5eDz7hm+i8ttSGiT6DvguZeyi8qujy8uOQer54
 d3P3OTMYgb9zeao6YRH7U8EEXN5ehVaArni29PFu++Cll/Xrsk9pCbz/WQjKB1Qp4pU1
 ZmbA==
X-Gm-Message-State: ANoB5plXlPnf0M2p+4BxXq4XErHc90Ork3CyzcN3GCu6AIPo0P5jHw62
 vj9oWcefE3UdG94ih+mMcUZ1jgHtjH+zLzaEoFU=
X-Google-Smtp-Source: AA0mqf7MaT0kR9+WMEp69HLX0dkrtNUf2Jvs2NIjL4x2PiOkaonlXu666e3iNWiV1oxyNugtPrA+zw==
X-Received: by 2002:a17:906:c348:b0:7c1:235d:2a2b with SMTP id
 ci8-20020a170906c34800b007c1235d2a2bmr22367464ejb.24.1671056113269; 
 Wed, 14 Dec 2022 14:15:13 -0800 (PST)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 f13-20020a17090631cd00b0073c8d4c9f38sm6502684ejf.177.2022.12.14.14.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 14:15:12 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 23:15:04 +0100
Message-Id: <20221214221506.43849-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+dKmTxwXg/1MYw8M2H0u7VFDyizmBNgmFAyP9riy/u4=;
 b=QMClWfSyCcuR0tyDEIy5yMy42IONQISb1ba73yu6g3Ip3Hjhu35nR6Q9G4W6LFy1yG
 hPOCTiQKNKlT17Nu8aX5C7gkbpuL+qk/klMotac4lYGkbxGcbihyXGIznBTWSEs/ZWyg
 Fp6i9wiStJBRnbL73rkYJz2dCicdiZ3D/nvno=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QMClWfSy
Subject: [Buildroot] [PATCH v5 1/3] package/rtl8723ds-bt: new package
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
Cc: indrek.kruusa@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package install the required firmware for enabling the
Bluetooth device embedded in the RTL8723DS chip.
The driver is included in Linux main tree and can be enabled
with the BT_HCIUART_RTL symbol.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v3:
* Simplified package (Thomas, Yann)
* Package now only installs firmware (Thomas, Yann)

 package/Config.in                      |  1 +
 package/rtl8723ds-bt/Config.in         |  6 ++++++
 package/rtl8723ds-bt/rtl8723ds-bt.hash |  2 ++
 package/rtl8723ds-bt/rtl8723ds-bt.mk   | 17 +++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/rtl8723ds-bt/Config.in
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.hash
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.mk

diff --git a/package/Config.in b/package/Config.in
index 914c3584e9..999feae08a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -585,6 +585,7 @@ endmenu
 	source "package/rtl8192eu/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8723ds/Config.in"
+	source "package/rtl8723ds-bt/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
diff --git a/package/rtl8723ds-bt/Config.in b/package/rtl8723ds-bt/Config.in
new file mode 100644
index 0000000000..0a604310c0
--- /dev/null
+++ b/package/rtl8723ds-bt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RTL8723DS_BT
+	bool "rtl8723ds-bt"
+	help
+	  rtl8723ds UART attached Bluetooth module firmware.
+
+	  https://github.com/wsyco/RTL8723DS_BT_Linux
diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.hash b/package/rtl8723ds-bt/rtl8723ds-bt.hash
new file mode 100644
index 0000000000..1ec4e350f9
--- /dev/null
+++ b/package/rtl8723ds-bt/rtl8723ds-bt.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  9e70a981946abeeb6437d9a27d8437cea15aa4df72f8d56ded0ae28af484d2f4  rtl8723ds-bt-14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08.tar.gz
diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.mk b/package/rtl8723ds-bt/rtl8723ds-bt.mk
new file mode 100644
index 0000000000..efd0a5bae9
--- /dev/null
+++ b/package/rtl8723ds-bt/rtl8723ds-bt.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rtl8723ds-bt
+#
+################################################################################
+
+RTL8723DS_BT_VERSION = 14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08
+RTL8723DS_BT_SITE = $(call github,wsyco,RTL8723DS_BT_Linux,$(RTL8723DS_BT_VERSION))
+RTL8723DS_BT_LICENSE = PROPRIETARY
+
+define RTL8723DS_BT_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware/rtl_bt/
+	cp $(@D)/8723D/rtl8723d_fw $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_fw.bin
+	cp $(@D)/8723D/rtl8723d_config $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_config.bin
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
