Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD362C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 15:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4068340A90;
	Mon,  8 Aug 2022 15:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4068340A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQjRvrx9sUKK; Mon,  8 Aug 2022 15:34:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BE0D40A88;
	Mon,  8 Aug 2022 15:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BE0D40A88
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7701BF2FA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5564B60E67
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 15:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5564B60E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-bTKCLwych6 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 15:34:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6570460B00
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6570460B00
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 15:34:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id j15so11340422wrr.2
 for <buildroot@buildroot.org>; Mon, 08 Aug 2022 08:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hM2Ue2eGruuI2lnQIqLc4TIxFI2qtXh8C6RRKGK0oJ0=;
 b=vNomf0hScdI+2q3jeSHLIltTT5qehUJJFKz9A3MHpD6rsrNntaaUD8dKn7SpNOYM9e
 6e12oF5Xqqu54H//W9FcUqDbzNfPnSqYMITAMe2eII+5ddKb6o9s5UIdvj1bTo42LuGD
 BjOwBeqFDa+CwdGHk0Zuy1n03BDb/Sau4jUQxAYtCjZA4dpe7Zh90lG/mnJzWT6t6F7j
 WGmiqwkuzxrD2vWHJy8ZwqAbB6dwMU6up2RtvIX8ehXEoONrHTsi0NSIC5Vt9R5tLrDM
 OE52QvMJ+lqKV0IwFbPXUEPccUwEgr/drt/yJbTHALimIqqtg8lv78RX1aEe/lyGLRvP
 2pZw==
X-Gm-Message-State: ACgBeo0TUCPx1sQg2PDL0CW6Ii8Mzj6RIx0aNXGLeJc7nj8TaWipNvG/
 UatWhF0gDTrLcgRmavRq3bJavFpu6WY=
X-Google-Smtp-Source: AA6agR5lCIq4TnhQE/WSV/4EdHV5o9lltn36C6/k7l2ZzBwWgPtnBfvc9T0b1RV0nQb7kGPSqSHWzQ==
X-Received: by 2002:adf:fc08:0:b0:21e:d133:3500 with SMTP id
 i8-20020adffc08000000b0021ed1333500mr12378701wrr.353.1659972844442; 
 Mon, 08 Aug 2022 08:34:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfdccd000000b0021d65675583sm11992529wrm.52.2022.08.08.08.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 08:34:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 17:33:56 +0200
Message-Id: <20220808153356.1695677-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hM2Ue2eGruuI2lnQIqLc4TIxFI2qtXh8C6RRKGK0oJ0=;
 b=n/G26FR10gsRpnFTTcxNsnzEEAJ2Nk4qdSZuw7fpEpnMFowuKUhUUD+vY3XSFOiR47
 hJpBNaNe6IF7BoKc039t/W76nw45dc72rYe59HE0Z4KQ7RNi3ONK0/ctwNwv3locguh0
 J/TrfQK4rJMZMW5XvaDXc5Yz8dMSsGFV5SVA0srQ8vWrI0u6LCyONViG1utZAdmhN7cZ
 qybvwVXBUWUC/mUHZnQ6J98ilDeLWq8BWVL97PYd/5u2dYzbJ7evrhuZkxy1HVgb56BN
 g6gRXd8vKOt+ePZCHXhENi7pBonovlo6GR99p6dv83WABeO/TLard9C8olU0sOVOfp/o
 g5Xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n/G26FR1
Subject: [Buildroot] [PATCH 1/1] package/rsyslog: add hiredis optional
 dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index a6e32ecea1..84fd2d2e5e 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -73,6 +73,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_HIREDIS),y)
+RSYSLOG_DEPENDENCIES += hiredis
+RSYSLOG_CONF_OPTS += --enable-omhiredis
+else
+RSYSLOG_CONF_OPTS += --disable-omhiredis
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 RSYSLOG_DEPENDENCIES += libgcrypt
 RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
