Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F900C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 21:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9D2A83E63;
	Mon, 20 Jun 2022 21:41:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9D2A83E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUzZsDpC41ex; Mon, 20 Jun 2022 21:41:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E03B182F3D;
	Mon, 20 Jun 2022 21:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E03B182F3D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E5691BF398
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37147605A5
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 21:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37147605A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORdwydzn0rjH for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 21:41:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95E7E60674
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95E7E60674
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 21:41:05 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ay16so4227731ejb.6
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 14:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUWeFJ2fz8gjJsQbSJ0KVCvaTjQlMtc94Jse7UtcNOY=;
 b=p3OnZ8fsaBvqauh78JXmScmSkBaWJCeMUf7ru6zHzJ2Q92+uG+5efWPD6L8nSMCg/R
 aHmFzacXzzYc+DcCZIPq9mCN4CXZEMaH1CHigGxK5kitZA69ms3U3xG/XVhuEQOVnRdE
 dNbLGiLGaXhczdX6ZLo/1XP18hxXnjVoSkdINUaFEIDLSHMMgxdR/h/O1TxRjXC3Wdvy
 ngnlZYsOxa5nFXJGuBcdLiD4483CPZIrBwWxHbA2SKNf4d1Ajxc5XjVuNR4QlPLzcIN0
 uZw7nykZm0L383Iec2XVWt2gdtWJWFu7Tv6hkXJzPlwNw2GdZ1fVFjw+Yt5IieE2R+dI
 kwsg==
X-Gm-Message-State: AJIora8dNTrXwkS2dIFF7RxudrY3XhnXkhEmc2dMOOkKjXWoPYsfFib3
 jSgu7IEMI90fBjvjl/HX89ftH1uxEtqi5g==
X-Google-Smtp-Source: AGRyM1v+0QSxWhAK1mgyjJGXzhRkbgvrV0t6jYtrAdS/mcBB/P38svXuHYcedoO52WyEnBNcmZItSA==
X-Received: by 2002:a17:906:4f:b0:712:af2:29d9 with SMTP id
 15-20020a170906004f00b007120af229d9mr23319308ejg.751.1655761263836; 
 Mon, 20 Jun 2022 14:41:03 -0700 (PDT)
Received: from localhost.localdomain (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 q11-20020a056402518b00b004307c8e1c3fsm11696111edd.34.2022.06.20.14.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 14:41:03 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 23:40:57 +0200
Message-Id: <20220620214058.1435436-4-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620214058.1435436-1-angelo@amarulasolutions.com>
References: <20220620214058.1435436-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUWeFJ2fz8gjJsQbSJ0KVCvaTjQlMtc94Jse7UtcNOY=;
 b=MYKuzIDSRmIjdTMer5dzS3zc+TL7/UcNNcmGE+YALJAQuSpr2pmLK3ve2RjVtpQ/Y3
 E475Ru6lcsdnOUgQ8RibJjQu3HnD59LyyjvKsyvl24FKZKUfWg+220MgdEIe9Tmga0bv
 PJW1BwwaBHdJQtYpDv2tLfRJEWyASU4h67+XY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MYKuzIDS
Subject: [Buildroot] [PATCH 3/4] package/ifupdown-scripts: add wifi
 configuration when enabled
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

Add a proper wpa-conf line to the interfaces files to let the system
bringup the wifi interface and the related wpa supplicant.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 5ef032142c..e3830aa1ad 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -28,6 +28,8 @@ define IFUPDOWN_SCRIPTS_DHCP
 		echo "  pre-up /etc/network/nfs_check"; \
 		echo "  wait-delay 15"; \
 		echo "  hostname \$$(hostname)"; \
+		test -n "$(BR2_SYSTEM_CONNECT_WIFI)" && \
+			echo "  wpa-conf /etc/wpa_supplicant.conf"; \
 	) >> $(TARGET_DIR)/etc/network/interfaces
 endef
 define IFUPDOWN_SCRIPTS_DHCP_OPENRC
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
