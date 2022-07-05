Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296E9C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 07:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AAB560EE8;
	Tue,  5 Jul 2022 07:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AAB560EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Bj56Lj5_TgJ; Tue,  5 Jul 2022 07:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B97E8605C9;
	Tue,  5 Jul 2022 07:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B97E8605C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 905261BF2B3
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67C3A4175E
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 07:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C3A4175E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JlxQLdHAFrD for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 07:32:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7642A41760
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7642A41760
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 07:32:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id dn9so14836875ejc.7
 for <buildroot@buildroot.org>; Tue, 05 Jul 2022 00:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8azgUmT5ugFWM53+ubIFzoE+rS0HXB0IwLwLhhKHXiM=;
 b=7iy77zRvJFQgng+d94Sna7+mduSgwJSWidcuzIw1NBWfYVNVx+7XhwwsC2I+aQHF04
 Ma9Df9lsjX8FS3WCGNfmqtENtTyOe9kDsyExFwO3LxpI8dHrtog39Jl/Z9GVJH0Jx2d2
 Nzkcl3Dc0lFEnv2PSkG6QxoUEYV9AZonimL+S3Y+e1BuyZQB5igYM8aS0qgipkm1C+IQ
 fT206jnui8ILbGxR9ARuBeOEjjsK+tiUnJXvJzMcgZIvDPvPemklV7636DXMxOVjhAyj
 BR5LgmWXPNA2uVaEzexNFhp2WYFI9IJDQXqmmv/98I9m9Klo7SzzXdOk29nf8lUEkQlA
 Y2LA==
X-Gm-Message-State: AJIora8n+iZ6TRV1dhxmW1VQ/pUFo3Lfo2DyY9AotfjugQ4xHvZS5Ehy
 Spuiq0FglLGlk1+XnX19aQS/ttVdoWI3WQ==
X-Google-Smtp-Source: AGRyM1sDKSPetnDfrZlENNaiVmWJ47YNsGSONQHGY+X7ZHzdla+LGZlN+TFIiscfoONaZ6Xu8w4WvA==
X-Received: by 2002:a17:907:3e11:b0:726:372b:6c32 with SMTP id
 hp17-20020a1709073e1100b00726372b6c32mr33223956ejc.157.1657006334470; 
 Tue, 05 Jul 2022 00:32:14 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 t27-20020a17090616db00b0071cbc7487e1sm15274562ejd.69.2022.07.05.00.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 00:32:14 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 09:32:02 +0200
Message-Id: <20220705073206.1442280-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705073206.1442280-1-angelo@amarulasolutions.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8azgUmT5ugFWM53+ubIFzoE+rS0HXB0IwLwLhhKHXiM=;
 b=NWoqoLQcxWj9A7QRx1RMlDSN1iSdku7pJkToyYUhv0CF1/vbidtvpG++4qMeazMfWf
 Wpl2++wlnn9InkK3kkpyv6pUJ976TPMblEYqHjQ9An7mSfMxX604HEs0FymdVpbdgr+Q
 WF/bTAjlqry3P2SO6tIwPXooUmBbmWLmPwgOE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NWoqoLQc
Subject: [Buildroot] [PATCH v3 1/5] system: adding options for configuring
 wifi
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
