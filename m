Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5E3C433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 09:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFC92418D2;
	Fri,  4 Nov 2022 09:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFC92418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdXI195bqDhn; Fri,  4 Nov 2022 09:17:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C0F3418A6;
	Fri,  4 Nov 2022 09:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0F3418A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0BD1BF2F0
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 09:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74684418A6
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 09:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74684418A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zpsDiwpmADv2 for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 09:17:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D80418A4
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11D80418A4
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 09:17:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l14so6196525wrw.2
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 02:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CRSx/5cA6FWS5XRPsAhnySkVnEIUeFmJPiR5IjO12Ks=;
 b=L8XgQlgQEiLvfEEkwMlLsbcfw6hhiQEppZdfoCs1bNxr41tmCylJ8yEntxe++89HZe
 sup95mm+lAAQgaJCzNuiVTn5nQRrv1xkb3eYzBSSK+Ug2MMXc6TTlk8DCTcXHNXi2J89
 9hjmE47DP+m5r9yAI5B/p6Y/qmFCHqcsBrm/FooUIRNLQ2jd3Wv8JNdSHxMfqaWaaSZg
 FrdaA5TxoiykHRgUxkLx1FmCXEzE5z4l3o905xRdsKl4W4yw/nic4vVbytOCuQ+YLFXq
 CIuaEwFsubNM8msEipow15LEvs7Ab5mjXCzOkaFkNGs/k3VjV4oojfdyuyTIR49zC0ja
 maYg==
X-Gm-Message-State: ACrzQf3ZUDtZhBkGBqOz2afGIB8Ky+ryJ9aeiniObC5fmAlBNJl5aUJt
 tbMi/y04APaTn4pQeWGJSdozSf421KG06A==
X-Google-Smtp-Source: AMsMyM6CvFvvlGdGta3D5b42eJgfYDO89VMamUdAyviKrHMk7OuouAfVK3M989tRJWGWv6Yqyu5qXQ==
X-Received: by 2002:a5d:5410:0:b0:236:fe1:bb74 with SMTP id
 g16-20020a5d5410000000b002360fe1bb74mr21549727wrv.512.1667553452829; 
 Fri, 04 Nov 2022 02:17:32 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 by13-20020a056000098d00b002383edcde09sm3012137wrb.59.2022.11.04.02.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 02:17:32 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 10:17:25 +0100
Message-Id: <20221104091727.690022-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104091727.690022-1-angelo@amarulasolutions.com>
References: <20221104091727.690022-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRSx/5cA6FWS5XRPsAhnySkVnEIUeFmJPiR5IjO12Ks=;
 b=MJD/k+V3O9mL5kf41vwEv8vCx1i6jwWw6w2A3jj0RAhIZ/vlV201kaeSBaA0J6P2a/
 /aQlghsblS2sItw2UmS/l4ufCbp5mCs3PdrsMWUScCQw2BIZ32kT57WO5k49cxm1n+KQ
 bz5ctasO7zNKKapzYlNlue19dYVwtzRQUUIJ0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MJD/k+V3
Subject: [Buildroot] [PATCH v3 1/3] package/rtl8723ds-bt: new package
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
index 238d7813f0..19e0523a92 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -582,6 +582,7 @@ endmenu
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
