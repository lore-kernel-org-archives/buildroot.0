Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A922AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 07:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FD9F40354;
	Tue,  5 Jul 2022 07:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FD9F40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U8PtcEOZpSaj; Tue,  5 Jul 2022 07:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAA8F40302;
	Tue,  5 Jul 2022 07:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAA8F40302
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 350641BF2B3
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D70760E9F
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D70760E9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yW_1jZzxHImg for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 07:32:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BE1F605B1
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BE1F605B1
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 07:32:17 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z19so14109932edb.11
 for <buildroot@buildroot.org>; Tue, 05 Jul 2022 00:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JoBXZedk2w0JYcCNb4K9vsPqEWa3eTn83IBb95FaRMc=;
 b=z3+eKYjC/TdatQuXohZ95ff9s1/0cj5iYftL/4RCe/CiXaJyxdeSwEJUUjljvGYwYC
 ur+exp0jTWf5bYIikw44vMAiPVJknm8LLZCuRntqolfOrvwunqVkGplB7+nOLKmoOfrD
 p4QXK6aFWD+cyvt+Gs/iQUcZvAAjL1dAdL3Y14iAwGDwWnrkRyaedt2uO2LZUFEx/qOX
 f4yPL9d+CeeiVFbCOVWBKusJnWUZ2QlH9TNCg1FPrFHPVrgBO5rV9Oz9BJJ+1g2U8voM
 gpZuNOpjnu11HWVEK2nrnzxW9OT5FMjxqFvEc40DRNwlvqcCCDhIGMuhIuiWfoFjX1P/
 EjBQ==
X-Gm-Message-State: AJIora9/PsfPtPMh1kJOe4iXlINg7ZLnKWlfG8mbU+EhdIxC/gm8dQec
 CI3570auYfZVbZQUzodRWBg4wjoFzeLnQg==
X-Google-Smtp-Source: AGRyM1saeW4jfd5Fm0VaP8KhyyNj4p+fa2B75hzWXIFg34kpk+8MJEBvmhClcfXmxQlGPf54Rk343Q==
X-Received: by 2002:a05:6402:520b:b0:435:c2a4:f822 with SMTP id
 s11-20020a056402520b00b00435c2a4f822mr45693883edd.198.1657006335321; 
 Tue, 05 Jul 2022 00:32:15 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 t27-20020a17090616db00b0071cbc7487e1sm15274562ejd.69.2022.07.05.00.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 00:32:14 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 09:32:03 +0200
Message-Id: <20220705073206.1442280-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705073206.1442280-1-angelo@amarulasolutions.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JoBXZedk2w0JYcCNb4K9vsPqEWa3eTn83IBb95FaRMc=;
 b=H2pI/LfJM08V86vKXiUiUcvS5kbocZoBpw2Q30bIkEBFRYdHX45jZDozWJSRTp4PrW
 gPjetbVNVcOWVFqt5Wz5IL3DUT+HcWJm39RIsI2t92Kw4QDXjZ40DfOGoJmV5FFg12JQ
 qs+DaDRoERJLQ4yN+CwNOdRuCdzKlJFXA81HE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=H2pI/LfJ
Subject: [Buildroot] [PATCH v3 2/5] package/wpa_supplicant: configure wifi
 on systemv when enabled
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

Configure a default basic wifi setup able to automatically connect to
the selected access point.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index afcd6502e3..09971654fe 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -264,6 +264,19 @@ define WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS
 endef
 endif
 
+ifeq ($(BR2_SYSTEM_CONNECT_WIFI),y)
+define WPA_SUPPLICANT_ENABLE_WIFI
+	$(SED) '/network={/,/}/d' $(TARGET_DIR)/etc/wpa_supplicant.conf; \
+	(	echo "network={"; \
+		echo "  scan_ssid=1"; \
+		echo "  key_mgmt=WPA-PSK"; \
+		echo "  ssid=\"$(BR2_SYSTEM_CONNECT_WIFI_SSID)\""; \
+		echo "  psk=\"$(BR2_SYSTEM_CONNECT_WIFI_PASSWORD)\""; \
+		echo "}"; \
+	) >> $(TARGET_DIR)/etc/wpa_supplicant.conf
+endef
+endif
+
 define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_supplicant \
 		$(TARGET_DIR)/usr/sbin/wpa_supplicant
@@ -275,6 +288,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
 	$(WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS)
 	$(WPA_SUPPLICANT_ENABLE_CTRL_IFACE)
+	$(WPA_SUPPLICANT_ENABLE_WIFI)
 endef
 
 define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
