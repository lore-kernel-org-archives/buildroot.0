Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A8DC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 23:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F26B740B3A;
	Tue, 13 Dec 2022 23:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F26B740B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcPWCKMCU2q1; Tue, 13 Dec 2022 23:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3402940141;
	Tue, 13 Dec 2022 23:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3402940141
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F0901BF356
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 23:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 463B760E3C
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 23:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 463B760E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pv5qnlKLIqw8 for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 23:22:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FD9C60B5E
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FD9C60B5E
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 23:22:05 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id qk9so40622764ejc.3
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 15:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+dKmTxwXg/1MYw8M2H0u7VFDyizmBNgmFAyP9riy/u4=;
 b=sgZdJOgyAVukDIX3e7MFAUH0x48clbAwwlcMkO0Cc4NssNFqPdlvCyG/1ZwJ5w04SX
 C43LYgn6YwfJr3Lzw7k/5bN6zLFDg9bt4FWLy7uCT8K81cxbUCPtpLUCIkUZ38AtgE96
 CkfDfSESIajWCToAJwWQ23jH22fFF31koINkpClGVkJWbSL8CI+rUgoEka9MZgnJ9k/m
 aW+cgwGmQRwIFWw6UfTxdRDdQPqD0DYM5Lye9ux48+ogqE51xXwV7PcDgdP/lHv09JDI
 MXN0VwNht+3U4HAs2gmecJdyST0ZfX2/I9EiAr76QAIeK8RYg+imHyD9APdH2zgkvpqL
 CTHA==
X-Gm-Message-State: ANoB5pk5+wxU0zbs7sxzLxPy+mFk0XTZP9kkmNN42X5bX32bXj9pFQAp
 5t+BB0o1cr4U6HC5/XE6cf9zAjDwlZNvKgiqyrk=
X-Google-Smtp-Source: AA0mqf6uR7ibWWVWKi6ZOQrwT2/ljTaoZu0yRIe3bJBzch9RSwFQoFPoSFEQCNvjX3Z869EvDnoKQA==
X-Received: by 2002:a17:907:d609:b0:7c1:4fea:cf2 with SMTP id
 wd9-20020a170907d60900b007c14fea0cf2mr13013229ejc.0.1670973723892; 
 Tue, 13 Dec 2022 15:22:03 -0800 (PST)
Received: from angelo-ThinkPad-X270.. (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 fd5-20020a1709072a0500b00779cde476e4sm5107645ejc.62.2022.12.13.15.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 15:22:03 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 00:21:57 +0100
Message-Id: <20221213232159.855265-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+dKmTxwXg/1MYw8M2H0u7VFDyizmBNgmFAyP9riy/u4=;
 b=giXP5wU7DXslbENScDVigAYeAvuqomke9Sq5OSdx4x3qnmcwOsurrWHIbQlUCBxacv
 LU3TSsk3krnYTMk3I5emDpRlYqIycYkQ1MYJ67UB6pneW2YH3oJrWWqevbnkq98J0t/O
 G7J6fIOZZLwZj5b/krVUoYg0JKuUW9E600COo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=giXP5wU7
Subject: [Buildroot] [PATCH v4 1/3] package/rtl8723ds-bt: new package
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
