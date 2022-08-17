Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2619DC32772
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 20:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80BED4040B;
	Wed, 17 Aug 2022 20:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80BED4040B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2IveHu19MyE; Wed, 17 Aug 2022 20:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FC1940354;
	Wed, 17 Aug 2022 20:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FC1940354
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0541A1BF3AE
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 20:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1AFD83E00
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 20:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1AFD83E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSmYx5JmroWB for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 20:58:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 246488146F
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 246488146F
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 20:58:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h24so3451444wrb.8
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 13:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=q96QoRefe+NsRuKJ0Yc0IC+eGyMconcuMlbf6c8m0/s=;
 b=1UvvpyOWCS77xf6mQWtXW7dqbG39vEgNqGBN1ApZY4hbwU7UTjARQiD9gevZahka66
 RZYBtWBXWP7rh9SyNl+9q5lZHQsqCu0EYDeRCRC5/d30jQ8dT9PvghSJkmdtp8cThGc8
 dAphVlNkOmrvhtXAG1wq/XxTNay2ZOWYdKbuitHRMdCkSR5Uv28uEjz09qbNOqLPhs7N
 F2WARkGzRTjnBczFXuEVgcOaSuEBtUXrrhMhJxX3eMN0dJGV1nlTc0PfOq9yL+H5TmzL
 Esh0SQXK2c33us84eIIXfIgMFFrirPGAvr8bRCqxGoaFn4hfHZ17FW7gJyOuD59Mswe7
 DR7w==
X-Gm-Message-State: ACgBeo1bRcVvlOrB0mnx5Ge5uPLnwi/MsyKCQuZoAxIZ0wNUX3sEUbgJ
 Wlz5PZ2IowBR/8g9ua70OoGtxSrcbMRwrQ==
X-Google-Smtp-Source: AA6agR56FhfAyLnlez+7qZlgxtHk8chAJ3F9KqxAjEQ5teuKCXnPmpgLphhXbIyu20ZhLZemUONFaw==
X-Received: by 2002:a05:6000:1d8e:b0:225:142d:285d with SMTP id
 bk14-20020a0560001d8e00b00225142d285dmr6040783wrb.199.1660769906842; 
 Wed, 17 Aug 2022 13:58:26 -0700 (PDT)
Received: from menoah.home ([2a01:cb19:190:c500:b06c:cdd7:97f2:6c5])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a5d5643000000b0021f138e07acsm13717894wrw.35.2022.08.17.13.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:58:26 -0700 (PDT)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 22:58:23 +0200
Message-Id: <20220817205823.47256-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=q96QoRefe+NsRuKJ0Yc0IC+eGyMconcuMlbf6c8m0/s=;
 b=k4jq5P8TgWwgyOOXiZT3pV0F+oLpCdVwnSvZubLrP8mUM2oIRNb1nr8MXs44U1B9Kb
 PTB8BiOyDBSJkqH0PbiHcfTcV/3ArXJu6vcg2vL3Iwd8qYlcPXsKXsrxGH3xK4RBMazk
 fJ9xTCO7jaOaizoJQ4yptU9iLgVLazev0T1oN0bBiRG7gnm11JRc6BbLqEahs7lvlyt8
 wZBtQpqP+0sYgQOnlguiAmi/85qOH2lvVznnYAHBV7VtuJfbQEwyvo4EKvYRwcRrsUSl
 PAyP3DWmSqFSzgFwDHW23ZNiBskva3nP+uO4vYxjESfA2f3V3/eeMTz27EUZEXCweFVj
 cCBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k4jq5P8T
Subject: [Buildroot] [PATCH] package/stunnel: bump to version 5.65
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update COPYING hash; copyright year update:

-_Copyright (C) 1998-2021 Michal Trojnara_
+_Copyright (C) 1998-2022 Michal Trojnara_

See full changelog https://www.stunnel.org/NEWS.html

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 package/stunnel/stunnel.hash | 6 +++---
 package/stunnel/stunnel.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index b8cc62be13..19633b3c18 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,5 +1,5 @@
-# From https://www.stunnel.org/downloads/stunnel-5.60.tar.gz.sha256
-sha256  c45d765b1521861fea9b03b425b9dd7d48b3055128c0aec673bba5ef9b8f787d  stunnel-5.60.tar.gz
+# From https://www.stunnel.org/downloads/stunnel-5.65.tar.gz.sha256
+sha256  60c500063bd1feff2877f5726e38278c086f96c178f03f09d264a2012d6bf7fc  stunnel-5.65.tar.gz
 # Locally calculated
-sha256  28b55d0157efd5ceb63640faeebb50fda13b1f49aec0b9c1240b9a3ea9f0eb4c  COPYING.md
+sha256  f10bcd7ee7b722dce40c9c674761ddb37e7e29a76a6e413e961cd52e361c5d7a  COPYING.md
 sha256  62f171d4d8b6726df61f18a6bbc0a70f79c4bc2134d837d35c81fc6289a2d84d  COPYRIGHT.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index cc56eb39a8..95a1530eb8 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).60
+STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).65
 STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
