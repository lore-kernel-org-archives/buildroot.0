Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4F6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 10:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2844182EAD;
	Tue, 28 Jun 2022 10:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2844182EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9CVg-6hEz7pH; Tue, 28 Jun 2022 10:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B4782CF1;
	Tue, 28 Jun 2022 10:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B4782CF1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C9491BF599
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4753082C04
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4753082C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iDAd5Vz9XGpx for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 10:14:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0506F82B97
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0506F82B97
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 10:14:12 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id d2so12985059ejy.1
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 03:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JoBXZedk2w0JYcCNb4K9vsPqEWa3eTn83IBb95FaRMc=;
 b=FKXg9Qo0wAzL7z+7YYsBD7YCwyvRu8DndPUIRYKrJWoQoOT7NUWVk+/mRcRI9mi/NU
 Z+/hpD6QlwOqBgrQ42GqGJBgi+b2OAIHAo0GtaJexsXIDQqRCx9p1rjplGLQYZzCWe/k
 V1U7ZNWU/0kSyxSUl+ml4h8mVD/vGlM1HhkIhs+WdsGO8nWqudMym2GR2mG0iJeAnXtu
 DnnuzoJN4AlxX0kJoJqdV5oQ4LxWz7Q2U64Gi6jxVDtJA6DXOdnIIRwlIXj1Hf76AOwy
 SLrUco6P9QvyTxyRNyswluS20zZYR5I+PfTRI6lK6PNc9RlmYL4VKuthUSSPxUyKQrW5
 N1lg==
X-Gm-Message-State: AJIora9curFq6+Pg9PCaBwjbqn54khAHfIdMuP6fg1qyCeOIa2jjB0AU
 vVJOpzhWSMtOykK3UHTmJYx0WO9krzjTvQ==
X-Google-Smtp-Source: AGRyM1vjxlNuQ4aXE1311g+KEm4nkxx1xwAE3znIcfGN3hkNTkuVgVDdhVihBz72b9HwU1ZGRaslPA==
X-Received: by 2002:a17:906:51db:b0:722:ea9b:ff9e with SMTP id
 v27-20020a17090651db00b00722ea9bff9emr17370243ejk.16.1656411251104; 
 Tue, 28 Jun 2022 03:14:11 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm9308401edb.56.2022.06.28.03.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:14:10 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 12:13:49 +0200
Message-Id: <20220628101352.1786434-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628101352.1786434-1-angelo@amarulasolutions.com>
References: <20220628101352.1786434-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JoBXZedk2w0JYcCNb4K9vsPqEWa3eTn83IBb95FaRMc=;
 b=XJTWsO82kvKLO3R1MeI9JAaIO0Pn4VBLxUSWmhDntC/idOnJfLdGBE45wWJy4mCdSZ
 NvIH1IcYEyZuEUPYz4rmdPrnGSoqgTm1XXngdTtGsdgH8lRuuMvMjjOPDsB6wp43UjhK
 8WbjLlKzbeehgPc9CtpIkvd9hUTWMGJ1/POFg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=XJTWsO82
Subject: [Buildroot] [PATCH v2 2/5] package/wpa_supplicant: configure wifi
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
