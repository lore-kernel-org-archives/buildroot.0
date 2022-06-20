Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73948C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 21:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1151360FC2;
	Mon, 20 Jun 2022 21:41:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1151360FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O418HgYsuIEE; Mon, 20 Jun 2022 21:41:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2184060BAE;
	Mon, 20 Jun 2022 21:41:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2184060BAE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5675B1BF9BA
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31B6882F3D
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B6882F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYpRsbNu124d for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 21:41:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4BBD81AD7
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4BBD81AD7
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:41:04 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id v1so23543945ejg.13
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 14:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JoBXZedk2w0JYcCNb4K9vsPqEWa3eTn83IBb95FaRMc=;
 b=NcGwRTQQkFe7C2saRjcq6KLXkhM9jY0N1Qm0iGafDJ5VMYgjWUO9Rj+YN8Xtbf91yk
 jPr3rVIc/cUONo3C8irv9t9E4EP6ZyTiJoERKKHBvpoOpa1nHJBCkR7r77Cb6n6LJ9X8
 bwgUwUR5OyqiE3saVM6go+dVLnJQ1/di2xfjhBde3F2OQ8EW5t1aLMcMp5kLqZ9PT1KB
 VgOm/uyEpU+xDMjvNKiF/Dg5yK6bln0NiSycF/BJYBM54r3xXtnqAvLdWfRsARginDsX
 6WGIIrDTVffMBimOXbECuU1Vxtyd+ZH/bIZ7OfXO+x9m20ioAcwQtdYhM9uIB9T0suUS
 5ctw==
X-Gm-Message-State: AJIora+puKxWTVKlvTiLfdsMCCKlUIqOXZozIN3jCMNdJRICeDlspda0
 QyhQ5chduSX6rI2Ac8OoLe4yeJK1L59EWw==
X-Google-Smtp-Source: AGRyM1vO0UYVU7DHb/IJ9qqaWXE+ztZ1RjCaisRFLnCSC4li9GokHQA54lF/Iwq2rVykl3ehgURxOA==
X-Received: by 2002:a17:906:2252:b0:711:d2e6:9e7e with SMTP id
 18-20020a170906225200b00711d2e69e7emr23997220ejr.161.1655761263084; 
 Mon, 20 Jun 2022 14:41:03 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 q11-20020a056402518b00b004307c8e1c3fsm11696111edd.34.2022.06.20.14.41.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:41:02 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 23:40:56 +0200
Message-Id: <20220620214058.1435436-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620214058.1435436-1-angelo@amarulasolutions.com>
References: <20220620214058.1435436-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JoBXZedk2w0JYcCNb4K9vsPqEWa3eTn83IBb95FaRMc=;
 b=EDuN7cUzS32Lf/AReCl8U5QcWcfFXK9LvUm46XnKXMj5Lb8P0/aIVZfUFXo1CLSyrg
 YATuYmTIBLukIeS1R+DPXYgiG86tWLcZtpu+JSfuGP5GYQvsOUnXdlc4AXBKw3+ReL1E
 NQag5qmXchYVNCMUi9PkPWw4CXQtvWFq2d5V4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EDuN7cUz
Subject: [Buildroot] [PATCH 2/4] package/wpa_supplicant: configure wifi when
 enabled
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
