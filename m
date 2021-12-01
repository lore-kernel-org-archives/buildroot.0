Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D81DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 07:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DF0380F64;
	Wed,  1 Dec 2021 07:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obVo73AhTkm4; Wed,  1 Dec 2021 07:39:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65DAF80F47;
	Wed,  1 Dec 2021 07:39:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D01D1BF32A
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7989F605C3
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ElmuAw-EP-ft for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 07:39:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC4EA605BF
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 07:39:46 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d24so50173534wra.0
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 23:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2TVytqONdZILobhZ6Canv+kpqvc6OLQqZUu57xtDO8c=;
 b=o5m8Uqjd/Pv3iS78S3QGSUTk3+HnLdtkL2JBzCjZRjzwBniU4WeSSNS2t8n4myQlHo
 Fmh/ErOQHL9doXTpimzruNNWTw2+W5nV3LqmhBWlc5zBFXUIijdbQPHNBWFuvRihYif5
 ROY4Dogz3Gq0TE7Z8V8Vl4jKcw88+aNL0AbUGCE+dE8QYNYSEkwuoGOFJKo6tySBJYEh
 VDNQuBeBSu5JdQGiqsbU4PQAtoGXcm0+LqfxLAhS07D/L1mE1mi5P2OtpMrR3Uw4C87q
 A2Jug6QzY81CBcgKDC6kCzf4rWxJJS0zpoL6q/zvqnbUlPqXv8DOCSGx968A1d7MPAlB
 0Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2TVytqONdZILobhZ6Canv+kpqvc6OLQqZUu57xtDO8c=;
 b=gJZS5c1TtsHYpNFkW8zmYFs7E7b5SYECVPpJeuhoqAmT8RvEvjjR9ls7kzBMeLxkXM
 A6gEMnP4Xp+WEm79sqkfecI5padVr8mHWIrMva99oINhBo8hBNSeJgLq7Fm9Q440eN7K
 MBbYD+5YON8F9gSzK85oByL++fpVZOiad9tmgDExVtk2xB1B/VrF9NR4yIAeuMy+XXJ+
 DWV9H6wF3PA4Z7uxl+xzs06H6yfhyUF0tio11GgDKl8/ncxsJILL4LuXol6RVnzDWUc8
 KsbBkR3E6lHnsAPN7OGxUJGiggoSm+2bXEE3UzWsJwcFnkYnAwJ4EO31hXZl0xs+OZgj
 NNbQ==
X-Gm-Message-State: AOAM530B9cf5mJRZY/gz4lgp5g2OR+y9WHnTmlduR5ekoBKUCO9yV3O7
 luQ0ayyyIpLUVibTKNai7DP8P/MSOnhw7Q==
X-Google-Smtp-Source: ABdhPJzuSyTz8mOfXHTFAeF9AYZ9xIu6uUxykZ6zH06QBZVRGCVHcwoS5wLlTBUSz5ApxRmKOegXIw==
X-Received: by 2002:adf:db11:: with SMTP id s17mr4648493wri.573.1638344384996; 
 Tue, 30 Nov 2021 23:39:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o12sm193415wmq.12.2021.11.30.23.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 23:39:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 08:39:59 +0100
Message-Id: <20211201073959.566568-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ktap: drop spurious space
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
Cc: Anders Darander <anders@chargestorm.se>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
3e1e7db3cc677e9d68a7f0ec74406ab986dcc512

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ktap/ktap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ktap/ktap.mk b/package/ktap/ktap.mk
index 09daba5c53..eec8b75b7f 100644
--- a/package/ktap/ktap.mk
+++ b/package/ktap/ktap.mk
@@ -20,7 +20,7 @@ define KTAP_BUILD_CMDS
 endef
 
 define KTAP_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m755 $(@D)/ktap  $(TARGET_DIR)/usr/bin/ktap
+	$(INSTALL) -D -m755 $(@D)/ktap $(TARGET_DIR)/usr/bin/ktap
 endef
 
 KTAP_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
