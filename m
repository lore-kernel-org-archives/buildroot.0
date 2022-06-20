Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1FEC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 21:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2693740B67;
	Mon, 20 Jun 2022 21:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2693740B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zeN-VnPHhhJX; Mon, 20 Jun 2022 21:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D76C402C3;
	Mon, 20 Jun 2022 21:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D76C402C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44DEA1BF9B9
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D472402F7
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D472402F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJ6AhATd1-w0 for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 21:41:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D5B1401DF
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D5B1401DF
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:41:04 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id pk21so482050ejb.2
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 14:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8azgUmT5ugFWM53+ubIFzoE+rS0HXB0IwLwLhhKHXiM=;
 b=OhlePzzcuUOC2ZX165z/j7t/Fk7x/j/i29Ki/OdcfIdrwJgExeoZUR500u8iHjVo5n
 2HURrMAH6ScyLny0FL43xSGDWjqev8jzc1TTz169jISzPt016V12/VHgZ2bABmo1/Dtx
 A2DzAht+uBFeBaKHrIwUFz7O5Oz16Cc5r2mN7DXh+E0Hr56pC8RGO0B0oXMW37S+cOr1
 zSEQTALW6IVp75NPzlvzqjudHw/P48Am5vEkAgEKI3O9B/42HwqROj+Ov7tDuWfeamNN
 0n2ICV4kxKhTb121CkFHPYzlfBjTGqcKgUjm/YQy3hmhUwuCRpdo3xaHxzdNyB630FwK
 ibDg==
X-Gm-Message-State: AJIora+MHsCN/aZKJhSAIS3DcICAE0zyqY2ee81q65BKTpv7XXiR3qYd
 siwrgBvpRykklBtF9O+vCTAO4ceakqwlmA==
X-Google-Smtp-Source: AGRyM1tngjVe+IStIjkHhfpnWJF7lYGrzRcyrN+CoHb8fkjzP1Kh1/2l7ub6dSzpyq7gincNZ+uCWA==
X-Received: by 2002:a17:907:7e91:b0:721:9b87:7095 with SMTP id
 qb17-20020a1709077e9100b007219b877095mr11858616ejc.564.1655761262408; 
 Mon, 20 Jun 2022 14:41:02 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 q11-20020a056402518b00b004307c8e1c3fsm11696111edd.34.2022.06.20.14.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:41:02 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 23:40:55 +0200
Message-Id: <20220620214058.1435436-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620214058.1435436-1-angelo@amarulasolutions.com>
References: <20220620214058.1435436-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8azgUmT5ugFWM53+ubIFzoE+rS0HXB0IwLwLhhKHXiM=;
 b=qdChr0s3ZOixIT4Vpa11UI6RMwI+IYGKOlxUZl89Q+jysz2r+AjcpQmqb5eByT9oj6
 RxErD3kzukTeytdzb7V9kDaI9YClyRpQfEX8/v6VrGmfTeoQWevChGmHxyIrFfXD8v2j
 H+I+JbcWEidUg6pW8eqwmLkf5LM0+IS4gXfSg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qdChr0s3
Subject: [Buildroot] [PATCH 1/4] system: adding options for configuring wifi
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

These options can be used by packages to configure a wifi card
to connect at boot.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 system/Config.in | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 888c24ce81..9a5bdb2932 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -418,6 +418,21 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
 	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
 		BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)
 
+config BR2_SYSTEM_CONNECT_WIFI
+	bool "Connect to a default wifi access point"
+	default n
+	depends on BR2_PACKAGE_WPA_SUPPLICANT
+
+config BR2_SYSTEM_CONNECT_WIFI_SSID
+	string "Access point SSID"
+	default ""
+	depends on BR2_SYSTEM_CONNECT_WIFI
+
+config BR2_SYSTEM_CONNECT_WIFI_PASSWORD
+	string "Access point password"
+	default ""
+	depends on BR2_SYSTEM_CONNECT_WIFI
+
 endif # BR2_ROOTFS_SKELETON_DEFAULT
 
 config BR2_SYSTEM_DEFAULT_PATH
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
