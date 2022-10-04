Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621DDC433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E91F040B33;
	Tue,  4 Oct 2022 11:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E91F040B33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2EImLT34cu8x; Tue,  4 Oct 2022 11:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3389B40B83;
	Tue,  4 Oct 2022 11:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3389B40B83
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6448C1BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FBE460B43
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FBE460B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gY36kyjc2zUg for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:04:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B975360B2A
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B975360B2A
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:04:34 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id f1so10562657ejw.7
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 04:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Qkr+SoRYmoQplcz5P1J9gPzunzTmYhmu3lRVmIKafJs=;
 b=dhfVQRBe2bVC/BK+rBA8D2Rks2Sv+u9UgzEtYE99nZA4UGVIWwWSSMSwrOKOrfwizO
 zeMo5UgnucTmHz0mHR6PcPanArseuvfMlIpYIfoeugvG45GDCsHkjbYDAGLWhyAyrKjL
 zrudMBkHywDX/saEPDgm2Twfd0CEWdmtWy7VZkiiyE1//2pGo0wOAhGsap1xYvTc6L1T
 +LtMshZ3kfMamDJef962bE3vhLYNDt9lRTBVgKNnxyuHxRjk4VYfITGlyXzT0hh3VUTR
 R0XKsm3LSKMJjE3O6C6Qdd4rfMpy+bNdUBaz64jSUFMsGO84KCYyQwiolABkou0gg+1t
 o1Jg==
X-Gm-Message-State: ACrzQf0Lppn9lr1R7gd7S4J8nVHCtYsG0fAey+y6/NgB1OU0Zg8Wlxuo
 XAVWLAlxNbmViFN7wXllSg7mYpeOmrd8Lg==
X-Google-Smtp-Source: AMsMyM5tkX8uQprAt7TOQ4hm2DlcmkIAg4aXvsrlfTArGK8AE+/eMloEjYei9JvJjkaSzEZfs5pdEg==
X-Received: by 2002:a17:907:6d8c:b0:781:e30f:3218 with SMTP id
 sb12-20020a1709076d8c00b00781e30f3218mr18934690ejc.430.1664881472599; 
 Tue, 04 Oct 2022 04:04:32 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 p24-20020aa7cc98000000b00456d2721d93sm1427714edt.64.2022.10.04.04.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:04:31 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 13:04:18 +0200
Message-Id: <20221004110421.137795-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004110421.137795-1-angelo@amarulasolutions.com>
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Qkr+SoRYmoQplcz5P1J9gPzunzTmYhmu3lRVmIKafJs=;
 b=ZXuJ6u+WnfHnnTREFifIYGoJjNAizX5n/Aqd3eWKZ+hf5U4Pc1pfnZd4fNzX/wM/9m
 JIu99c/8aQdexHKKDRWwA/IBqqn5w3o/rwl2uLuLPCpGPlnrjZbIN/m15GlEvGOUWkwa
 GVaZonQoQc5+vrENl5SSCqsZ/2H3S2sFu+330=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZXuJ6u+W
Subject: [Buildroot] [PATCH v4 2/5] package/wpa_supplicant: configure wifi
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
index e5e3938be1..60ae290e26 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -266,6 +266,19 @@ define WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS
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
@@ -277,6 +290,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
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
