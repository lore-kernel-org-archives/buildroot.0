Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C776C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 06:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBAAD8401A;
	Fri, 14 Oct 2022 06:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBAAD8401A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EOX5Os4S6_Xm; Fri, 14 Oct 2022 06:59:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4E2C84017;
	Fri, 14 Oct 2022 06:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E2C84017
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8CDF1BF20D
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07EC94006A
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 06:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EC94006A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqzbgqlmAnqp for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 06:59:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81DBD42211
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81DBD42211
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 06:59:09 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bj12so8446633ejb.13
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 23:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ys0RsH5P5W8ruBvDVTa5LkNjcuMA2KR756mkKqI0vhw=;
 b=5/67jh/bfLjkqk1QOK3QMRJrTNDilCthCjBHk/iUVOT4Y5UHYASXt7Gp1X5R+QTS/w
 ipEfbtsHVm29bP/Y4QqkundysiZqIb8u3J0paP12xZ/sqWb1dWjZsqUFFjfyIfO1haXv
 yAfcblTb4qYW7yaUyIAMBzlp7ewg/Z3UX2+cE280UGoO8mk6xZN5dWdSA5e8tC01eUlo
 nu9wudb/FQgYFJVqBnLNFK71fN+nM0kywdExUMzvdmVsPKzGTpB4sNyDOxUa8Wr0oGRX
 PeeJcizuPP2LxlHd9YuL8fZPqxs6C8qApw5uZ9rTiHC2CFQ4JvjyUTUHoMImWpcETbe5
 IQgA==
X-Gm-Message-State: ACrzQf1+/lwsW9v0r+09SClOXbZC/lL3Lf+niGruzjm/EQS79JFWOCHO
 cCdARdxzOMl1oibxMeGRo+xYZrAo/dG+JA==
X-Google-Smtp-Source: AMsMyM4lC574K0KeV1d2OOBzijvf7Vu+OQJYu8kj2C2QjpUW0v12MBvZn9kWAQyM0ACDFlp1kkGjmw==
X-Received: by 2002:a17:906:5587:b0:78d:b6b6:7872 with SMTP id
 y7-20020a170906558700b0078db6b67872mr2502829ejp.72.1665730747409; 
 Thu, 13 Oct 2022 23:59:07 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 u13-20020aa7d54d000000b00458478a4295sm1285550edr.9.2022.10.13.23.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 23:59:06 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 08:58:58 +0200
Message-Id: <20221014065900.3311604-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014065900.3311604-1-angelo@amarulasolutions.com>
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ys0RsH5P5W8ruBvDVTa5LkNjcuMA2KR756mkKqI0vhw=;
 b=f0m7E8gAqYMnXIiVBFhe/v6PSQMpr4ovVFC0mKA1dDoC4xqIafvX93vAeI51wgcB3f
 IXkKgsly0ukykXDYIntMmO9O3ot6FUFjdZeEitY2RJJIJYvsQJSUJA/jVDXBZtTHN/Nn
 3WwtC0adH5v7Qh6Gb96mmTUjisJH0N4j/0MNw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=f0m7E8gA
Subject: [Buildroot] [PATCH v2 3/5] ackage/rtl8723ds-bt: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package enables the Bluetooth device embedded in the RTL8723DS
chip.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/linux.mk                         |  3 ++-
 package/Config.in                      |  1 +
 package/rtl8723ds-bt/Config.in         |  6 ++++++
 package/rtl8723ds-bt/rtl8723ds-bt.hash |  2 ++
 package/rtl8723ds-bt/rtl8723ds-bt.mk   | 28 ++++++++++++++++++++++++++
 5 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 package/rtl8723ds-bt/Config.in
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.hash
 create mode 100644 package/rtl8723ds-bt/rtl8723ds-bt.mk

diff --git a/linux/linux.mk b/linux/linux.mk
index 9a909c7d7b..8ae5a97a80 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -78,7 +78,8 @@ LINUX_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
 	$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
 	$(if $(BR2_PACKAGE_FIRMWARE_IMX),firmware-imx) \
-	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
+	$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb) \
+	$(if $(BR2_PACKAGE_RTL8723DS_BT),rtl8723ds-bt)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
 # shipped with the kernel sources, so we need flex and bison, but
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..4f6e508106 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -578,6 +578,7 @@ endmenu
 	source "package/rtl8189fs/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8723ds/Config.in"
+	source "package/rtl8723ds-bt/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
diff --git a/package/rtl8723ds-bt/Config.in b/package/rtl8723ds-bt/Config.in
new file mode 100644
index 0000000000..ab4ba0bf11
--- /dev/null
+++ b/package/rtl8723ds-bt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RTL8723DS_BT
+	bool "rtl8723ds-bt"
+	help
+	  rtl8723ds UART attached Bluetooth driver
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
index 0000000000..be1b9a9cc2
--- /dev/null
+++ b/package/rtl8723ds-bt/rtl8723ds-bt.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# rtl8723ds-bt
+#
+################################################################################
+
+RTL8723DS_BT_VERSION = 14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08
+RTL8723DS_BT_SITE = $(call github,wsyco,RTL8723DS_BT_Linux,$(RTL8723DS_BT_VERSION))
+RTL8723DS_BT_LICENSE = PROPRIETARY
+RTL8723DS_BT_INSTALL_STAGING = YES
+
+define RTL8723DS_BT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SERIAL_DEV_BUS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SERIAL_DEV_CTRL_TTYPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART_3WIRE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART_RTL)
+	$(call KCONFIG_APPEND_OPT,CONFIG_EXTRA_FIRMWARE,rtl_bt/rtl8723ds_fw.bin rtl_bt/rtl8723ds_config.bin)
+endef
+
+define RTL8723DS_BT_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/lib/firmware/rtl_bt/
+	cp $(@D)/8723D/rtl8723d_fw $(STAGING_DIR)/lib/firmware/rtl_bt/rtl8723ds_fw.bin
+	cp $(@D)/8723D/rtl8723d_config $(STAGING_DIR)/lib/firmware/rtl_bt/rtl8723ds_config.bin
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
