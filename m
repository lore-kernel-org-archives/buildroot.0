Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74C8C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE8883096;
	Tue,  4 Oct 2022 11:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BE8883096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2bqeYuRA_lxf; Tue,  4 Oct 2022 11:05:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9312F82F76;
	Tue,  4 Oct 2022 11:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9312F82F76
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 547C31BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D43D40B3B
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D43D40B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGHl58jyI13d for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:04:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BD99400CE
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BD99400CE
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:04:36 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id a2so7952042ejx.10
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 04:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LC7LouO0LMHHg0KxUIw00YtG//Y0YQiQMsJVBNOBDl8=;
 b=y2mVB5TLlsbDUEIhZZ8O13ovtvYKklV23hsi8yRhatafX/KzRjc41XJnHLYrjczk69
 7fhUWz6lfNbGi5wVwF0v735qHaKOqgE0PEP7jA7LUyl/5qoizBExcQQZeVG77nZk0Ccu
 7fmhw8Jgzh2KJ0YjClClCFQtCbt7gN3+YxeCgya6IF5iwV0eFWKZkHTfuKS3zB8szr0Y
 /4k0VaWChHG9M7pCFZi5S1WZ3CkDIgUav3Cps7pCKfTnC2EKifFs6R9icmUPR0rBrGUD
 aW7T8MtPd0DDBm4la7JcFrfpGk1nwHJaja+9VJYyKRBeOZ+UKQViIvs1c3b7pyGDNCTV
 wQgQ==
X-Gm-Message-State: ACrzQf0ei8Kj/DLx/jzJa22j0hkBRB5PAGjE/tz5nEh8Fl26xIkCu4H+
 410Wo5KgVHJWol8yE6zOpgQqQvkhhWjkkQ==
X-Google-Smtp-Source: AMsMyM5h1laqBDOFmVoESwK3lc46HyXFMTId+PaaaQfsQJQOa7yw5ns1j+EmcZGb0hx+uOaOi5vWNw==
X-Received: by 2002:a17:907:96ab:b0:782:2f88:cf29 with SMTP id
 hd43-20020a17090796ab00b007822f88cf29mr19007247ejc.72.1664881474137; 
 Tue, 04 Oct 2022 04:04:34 -0700 (PDT)
Received: from angeloc.amarulasolutions.com
 (host085115199111.static.fidoka.tech. [85.115.199.111])
 by smtp.gmail.com with ESMTPSA id
 p24-20020aa7cc98000000b00456d2721d93sm1427714edt.64.2022.10.04.04.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:04:33 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 13:04:19 +0200
Message-Id: <20221004110421.137795-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221004110421.137795-1-angelo@amarulasolutions.com>
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LC7LouO0LMHHg0KxUIw00YtG//Y0YQiQMsJVBNOBDl8=;
 b=h0CGUD5IpBR8rTWQ1G41ktqoDpz2/a/q23ol+QDyPntA86QonCvgJXPeO9+9ZV2Tkm
 agKiUWmFZRFAXpnSXqVXTBcYYE38kBnfvIavbGGf0VmIWahBI0Sv9GBE47KSnvRvfb3D
 9Yh+8/gamzAB9OJ7TM0jX9blzgfLHSjmnF/I8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=h0CGUD5I
Subject: [Buildroot] [PATCH v4 3/5] package/wpa_supplicant: configure wifi
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
index 60ae290e26..8611fc6577 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -277,6 +277,15 @@ define WPA_SUPPLICANT_ENABLE_WIFI
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
@@ -304,6 +313,7 @@ define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired@.service
 	$(INSTALL) -D -m 644 $(WPA_SUPPLICANT_PKGDIR)/50-wpa_supplicant.preset \
 		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-wpa_supplicant.preset
+	$(WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD)
 endef
 
 $(eval $(generic-package))
diff --git a/system/Config.in b/system/Config.in
index 647072b965..761a5a95c2 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -421,6 +421,7 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
 config BR2_SYSTEM_CONNECT_WIFI
 	bool "Connect to a default wifi access point"
 	depends on BR2_SYSTEM_DHCP != "" && BR2_PACKAGE_WPA_SUPPLICANT
+	select BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE if BR2_PACKAGE_SYSTEMD
 
 config BR2_SYSTEM_CONNECT_WIFI_SSID
 	string "Access point SSID"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
