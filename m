Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A1FC77B60
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 08:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F5044032B;
	Wed, 26 Apr 2023 08:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F5044032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUey_XHOlTvz; Wed, 26 Apr 2023 08:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC5B641CB5;
	Wed, 26 Apr 2023 08:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC5B641CB5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51E251BF5DA
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 08:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B1F960E02
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 08:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B1F960E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlzdjsCAtO2q for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 08:09:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EFE261390
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EFE261390
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 08:09:02 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94f109b1808so1282520766b.1
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 01:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682496541; x=1685088541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZWKrvGWB5luk3vzGRRKK2aitdNS5qbohzsHXzg8jds0=;
 b=MaCZRQnnapOcd21TfMwHgZ5koVV17LLZhfJD8JTtzQHwpZR81noyNeUpWy3ch8NmIX
 wqu/pX4ey/9yevEIydbKZJVfwmOtca1durHv/TMAtU8Ug4ZvEb8RMpwINpOoXX8Cq6fI
 LG6GuCObwYe5bbfyIqZDMhS98BWcrKPoN2LU5jg5DtZrD4fYP5RE4+ylQsKetLSSrqpN
 9HUQRRW4sJwVwhsQ0xlXL5DS2UwfkCmhmprDx1Bc7i/csu4QxsumW3Rm/bQmrTS69Bbj
 42KyRDdEGrnuU6k9DMFE4uas9FNpjH4Ou/kXT88t9PmA4E5gsQoX1GcauR0rTe12FIeQ
 R7PA==
X-Gm-Message-State: AAQBX9fIEKnfkqVUAclGeoCQS+ZtoHxyUzUgjvsgguwDXWSS47xMYsEr
 p9Y9Dqg7fG/elYuU317ygt+tQGHn+R4=
X-Google-Smtp-Source: AKy350Yocfv6D6CPQlKea7YEA8JuGFnWemltbzJOOmO/+pMQye0S7KvL7fFZJotRCwN161tcXGddRg==
X-Received: by 2002:a17:906:2457:b0:94f:5d1b:d33a with SMTP id
 a23-20020a170906245700b0094f5d1bd33amr14744359ejb.40.1682496540739; 
 Wed, 26 Apr 2023 01:09:00 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906230d00b0094f2f1c5ea1sm7983235eja.174.2023.04.26.01.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 01:09:00 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 26 Apr 2023 10:08:24 +0200
Message-Id: <20230426080824.2094413-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1682496541; x=1685088541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZWKrvGWB5luk3vzGRRKK2aitdNS5qbohzsHXzg8jds0=;
 b=J1h8MgUiKSBCSRZcObWi7WsIYXPF2A8fCvXRiX7++V5C+C9o7ssowmfXIt9qv0RXf8
 cRulWA9ropfA0dT+epZJfnn4fOd9vFTw+nTiOCHyAs3GoM+uhLFxqHAUVzk2L/qS4ppP
 lmAYRDL4BZ4ubhglCr3X30Ve7E4MzXjJuT4Crx+ZIPNGzeDv0QI0V4LuM6vp71KxXr8O
 pM5cxbBXLD3t5G8/S5sfS+4TSW6HF+EzViX3IGT0XMQ2Wp9PdwFXa2tOq/jqVXhwoY4z
 h5JB1O6Gh7RaID5ddX5QAz1I7sU13Q5bPCyQKxdIczqjMNh1jVpOpaxMlIIdz/UVyjM/
 i9FQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20221208 header.b=J1h8MgUi
Subject: [Buildroot] [PATCH] package/mdio-tools: fix Config.in
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Add project's site and add a full stop at the end of the description.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/mdio-tools/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
index 237f4454cc..790c9c534a 100644
--- a/package/mdio-tools/Config.in
+++ b/package/mdio-tools/Config.in
@@ -14,4 +14,6 @@ config BR2_PACKAGE_MDIO_TOOLS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	select BR2_PACKAGE_LIBMNL
 	help
-	  Low-level debug tools for MDIO devices
+	  Low-level debug tools for MDIO devices.
+
+	  https://github.com/wkz/mdio-tools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
