Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF798C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 10:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FACC409BE;
	Tue, 28 Jun 2022 10:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FACC409BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PwIAivij7lD; Tue, 28 Jun 2022 10:14:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17314409AA;
	Tue, 28 Jun 2022 10:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17314409AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15DBD1BF599
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1DB840598
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1DB840598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHcG47tre-u7 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 10:14:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99084405A9
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99084405A9
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 10:14:13 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id eq6so16817255edb.6
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 03:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nlFAp1mCT74Ux7ULX0KXwfvIKlZwxvD3KwNxZlej07k=;
 b=1u236+xqtV/CygcWDT7QetsGxExGpC/wL72l5rgnEcdg9EaXxOqWlx2PHmD4DcNuGC
 hXWFh1NtkolhlhOYc6QlLo6Bi/ZDihJ9bDOfdY7iD7eMKNVebqgHDgqrcRo370ElU7dL
 S8gEU9r0an6aUeuHvp0I1rG9mhN4GDGKFxzzYVVJji7YhThhTCqr8CiOIopJcCqXju81
 HWnhriZ0DuRvhhVnU70m5YhTxgZTQjnSUFV1ZISpV+EHzDoJEv86fwPhUviELyhzVkhI
 kvKkN7TBos3KrYkwMdkGzTtxjIU7TWfM0e+ItkBv6dtWG7bCIgvoqFLEGIWX8YUtKdW+
 iNlQ==
X-Gm-Message-State: AJIora+bqk9RxPGThccP58cIDvG1GH7yrBlj/qwuCX4jwgXtK/Yss4mw
 5lHVtmXr4enPrABk2CUo1/fUAHVsiGMCqQ==
X-Google-Smtp-Source: AGRyM1u3he3nrcIcWz8cKZpx2lGFsUVuHButkB009htempkOHairEO0paouuHQQQPZ05iNaxayzOxQ==
X-Received: by 2002:a05:6402:448a:b0:435:3fbe:2593 with SMTP id
 er10-20020a056402448a00b004353fbe2593mr21999786edb.226.1656411251843; 
 Tue, 28 Jun 2022 03:14:11 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm9308401edb.56.2022.06.28.03.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:14:11 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 12:13:50 +0200
Message-Id: <20220628101352.1786434-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628101352.1786434-1-angelo@amarulasolutions.com>
References: <20220628101352.1786434-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nlFAp1mCT74Ux7ULX0KXwfvIKlZwxvD3KwNxZlej07k=;
 b=XerLwo4YtCcl/3vfUvYoc56nGSRa9h+gYJJyYjtwC1slKA11qYBu/61OSRRNYp1fw3
 HJMkR70AxcHmw2W5ySu3ZTyXlQg83xLni1mY6tzG+AJ+gSPr5mQWPvNqoc2PcB/BpWFg
 EMTg1F9UHjA5lvtbngLfV0Xe6IAcym+IaSvIU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XerLwo4Y
Subject: [Buildroot] [PATCH v2 3/5] package/wpa_supplicant: configure wifi
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
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
