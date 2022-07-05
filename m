Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14EAC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 07:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B9B813DD;
	Tue,  5 Jul 2022 07:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77B9B813DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sv5lPLRleK2w; Tue,  5 Jul 2022 07:33:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FBB381342;
	Tue,  5 Jul 2022 07:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FBB381342
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC99F1BF2B3
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5303605B1
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5303605B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtA8mxeMcuRn for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 07:32:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E89B1605C9
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E89B1605C9
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 07:32:17 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v12so1526623edc.10
 for <buildroot@buildroot.org>; Tue, 05 Jul 2022 00:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nlFAp1mCT74Ux7ULX0KXwfvIKlZwxvD3KwNxZlej07k=;
 b=dc1sQVwiwUAvjlkLw7BlTY8RPASUivZDJhMMYIV07S5HdHOzuIRpyY8+wtFFeB3FBU
 SDX4NfLJJ+BenJT8OyZneGo8Y6ZPrZO18XE34DzI/YnhKVMjXcCpXF6DYlcX8amb32Xw
 9Oj7LaJxS5zTuvG5LHsyp7DMQm9Ge/ScGutRAJDT2ftIXLbl4Azqwt5hwE5yMPGAtSsU
 c4qfPBpWNDScrdYYkVGN/bEFcInGK+CEJ3myHke72ArJ10pLL4fkshPRwgLNVj04hrb4
 iRQTM+xWFA9SGoDRAOB5KY/7oyBmbFtvky9Mw7oeuulRHPWHrA3H3fLnymbocMzeF4kM
 JBhg==
X-Gm-Message-State: AJIora9MgBhkrzI0BL269kgtLu/nTOC2sVQO1aV6NJngbkQM8J6UDel1
 MSHiZvSIK60jDQ3aFzj/4AbGpH1Sx2Z3MA==
X-Google-Smtp-Source: AGRyM1tB+cJxFWxSVId2xqOW5kDDF1mpiDeGi9uphVgjoOlW+GJQ3RQctCwx1e8xY63vVZe60178IA==
X-Received: by 2002:a05:6402:3216:b0:435:a061:d662 with SMTP id
 g22-20020a056402321600b00435a061d662mr43898718eda.275.1657006336204; 
 Tue, 05 Jul 2022 00:32:16 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 t27-20020a17090616db00b0071cbc7487e1sm15274562ejd.69.2022.07.05.00.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 00:32:15 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 09:32:04 +0200
Message-Id: <20220705073206.1442280-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705073206.1442280-1-angelo@amarulasolutions.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nlFAp1mCT74Ux7ULX0KXwfvIKlZwxvD3KwNxZlej07k=;
 b=HZmzCgV4g7h/mp4etuR8WB2hN0iRDFIhqVUsuEkVEyH825QMQZSCYM0nrDxoFd104t
 iihnE31/bSof3/9n5ludd2v5utK45S9Tj8bmANSJHbzxLOCcY0tRpz0Wt+XNFp1dPdES
 9habTWyfIdUIL55xw0Cbak3bXcTHiLDL5jxco=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=HZmzCgV4
Subject: [Buildroot] [PATCH v3 3/5] package/wpa_supplicant: configure wifi
 on systemd when enabled
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
Cc: br015@umbiko.net, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Configure a default basic wifi setup able to automatically connect
to the selected access point.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 10 ++++++++++
 system/Config.in                         |  1 +
 2 files changed, 11 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 09971654fe..157d45ee7f 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -275,6 +275,15 @@ define WPA_SUPPLICANT_ENABLE_WIFI
 		echo "}"; \
 	) >> $(TARGET_DIR)/etc/wpa_supplicant.conf
 endef
+define WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/wpa_supplicant/
+	ln -sf ../wpa_supplicant.conf \
+		$(TARGET_DIR)/etc/wpa_supplicant/wpa_supplicant-$(BR2_SYSTEM_DHCP).conf
+endef
+define WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD_PRESET
+	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset wpa_supplicant\@$(BR2_SYSTEM_DHCP).service
+endef
+SYSTEMD_ROOTFS_PRE_CMD_HOOKS += WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD_PRESET
 endif
 
 define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
@@ -302,6 +311,7 @@ define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired@.service
 	$(INSTALL) -D -m 644 $(WPA_SUPPLICANT_PKGDIR)/50-wpa_supplicant.preset \
 		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-wpa_supplicant.preset
+	$(WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD)
 endef
 
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 9a5bdb2932..084340b1a4 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -422,6 +422,7 @@ config BR2_SYSTEM_CONNECT_WIFI
 	bool "Connect to a default wifi access point"
 	default n
 	depends on BR2_PACKAGE_WPA_SUPPLICANT
+	select BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE if BR2_PACKAGE_SYSTEMD
 
 config BR2_SYSTEM_CONNECT_WIFI_SSID
 	string "Access point SSID"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
