Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405D9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 10:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C35D4098D;
	Tue, 28 Jun 2022 10:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C35D4098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZKj4RsCN4Sg; Tue, 28 Jun 2022 10:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630B3409AA;
	Tue, 28 Jun 2022 10:14:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 630B3409AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 225371BF599
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0AE340598
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 10:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0AE340598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Npph0GlWTj4u for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 10:14:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DD3240123
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DD3240123
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 10:14:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id u15so24696663ejc.10
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 03:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8azgUmT5ugFWM53+ubIFzoE+rS0HXB0IwLwLhhKHXiM=;
 b=ID5oIq3f6UBrOZANoK6iN32LQNSNO4BMTFoqao9bj1Cwtw/ehqnVXGttb/12t01bB5
 6luP94tVgkrn2N2RCOTSKBD09zben7LH12SNNbfkysYK+uuP4X9732dVetRe+KC0bvO2
 ttTwq8MbTMPZXQiKBQ7SU4Mp12Kxz9BLSTvL8whArFkwzjaLaHnyqZXFq8hUfFsaGi52
 QgSqLXtQjM65AFHGLZKTwWz9gDFkPWg31JXuAW0O2jckxb1CnwkW8MzFdo2iahs5WTtO
 7TSmbC3EdLnJF6xRIjSj0FA2xwtV2t8PNZWIOUC/Q+P/i7MOWz1vnlhET3z5eUb9vVJH
 ouYw==
X-Gm-Message-State: AJIora+HRcIxrt92gi+vq1EyccX1eOZjz7UHDSpe9PLAX4883P2BzCsC
 3yFy48HoBPKWar8+kT747lG74kcDkvvJOw==
X-Google-Smtp-Source: AGRyM1vUMTOWeyt6Kgv4a700/Q2Z8idR6Wulx8mqwviMcRe9++GHKqWu/6nNC1akYd8qqxtlKQuHDA==
X-Received: by 2002:a17:907:6da2:b0:726:3ebd:9c9a with SMTP id
 sb34-20020a1709076da200b007263ebd9c9amr17318317ejc.628.1656411250336; 
 Tue, 28 Jun 2022 03:14:10 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm9308401edb.56.2022.06.28.03.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:14:10 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 12:13:48 +0200
Message-Id: <20220628101352.1786434-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628101352.1786434-1-angelo@amarulasolutions.com>
References: <20220628101352.1786434-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8azgUmT5ugFWM53+ubIFzoE+rS0HXB0IwLwLhhKHXiM=;
 b=SZxwGxf78dUaUde6Wi1jGw/lzxZIOj3rH8GCtfaDNo7/PEqW/tjAtuUQSHoOeOCPcN
 VhZFSSlYKp66xZ64App7zIX/py+6MV53Bxcj7yNSgcIOzvRs5tOFbMHv20sm32fVyTU6
 2L1z/K4kZmR1MsrIZ95gL6tuYgHP/KvKtGTBI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SZxwGxf7
Subject: [Buildroot] [PATCH v2 1/5] system: adding options for configuring
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
