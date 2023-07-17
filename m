Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC6BC001B0
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 17:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E70060E41;
	Mon, 17 Jul 2023 17:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E70060E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X6Co333LpHSb; Mon, 17 Jul 2023 17:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D84D60B16;
	Mon, 17 Jul 2023 17:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D84D60B16
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DAE71BF337
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB0778186E
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 17:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB0778186E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CgZj2Ionn-6C for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 17:55:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EF418183D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0EF418183D
 for <buildroot@busybox.net>; Mon, 17 Jul 2023 17:55:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf107so43504595e9.2
 for <buildroot@busybox.net>; Mon, 17 Jul 2023 10:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689616557; x=1692208557;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kdgR0+8p0zHeIT8wfZTIloLsDDBcG0BKsJ2EPZb8OxI=;
 b=Tf9LG0HT8F7d3Leo+3a2l9k3HLtSoL4WVK4t3ykL/iIud7A+zPxsjWbJmcouYbK+1h
 QuSbrezKQBoY7B+iNRvEBPhpNOp0+RzzvlS21GCtWs9UZNTWNXgppDv55jiIbdYu186d
 j+BMnmImfyF6i5KyiSZmsE7UINM3UpjrbFxsoNCfUcZXBe7AsQWTTiSiiF4bAF0v+B3n
 dMuY0+sePqFj9JW3Da5B5WEChIbwKW0AN4E1h9BX5PO5RqN0Nj1QsqfXaEwXIha9d5up
 wpG/L0/414nYp0Bu3DOTnMpgWVRa/KZ67VHLrdbrWFP0tA36q7snllQz6HLrK8XV+Eur
 f3iQ==
X-Gm-Message-State: ABy/qLYTIye2SzpOF9DTPPIndpz88DItCyrmYX7sfGFY26WUYrO2/1Mq
 4nJpr4IH6fsBNwoe29twKU5WxCdi2pk=
X-Google-Smtp-Source: APBJJlEyj48hUnvntEYQiPju6RCPYHada8FcufxEGRLoG0nXesPNUc9h2LLduwjfzvYBOyV9XlpTpQ==
X-Received: by 2002:a1c:7318:0:b0:3fb:d1db:5454 with SMTP id
 d24-20020a1c7318000000b003fbd1db5454mr57351wmb.35.1689616556561; 
 Mon, 17 Jul 2023 10:55:56 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 h14-20020a1ccc0e000000b003fbb618f7adsm329789wmb.15.2023.07.17.10.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 10:55:56 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 17 Jul 2023 19:55:45 +0200
Message-Id: <20230717175547.781816-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689616557; x=1692208557;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kdgR0+8p0zHeIT8wfZTIloLsDDBcG0BKsJ2EPZb8OxI=;
 b=ofRRk55WdijzpQ+1hcINxZyaWm3+iH3vQLeHIWUTMQaGQ0JRPJm6gBH6+jbxteaapR
 D1Qav4KL2pbfipCY2AtNOZDBt9W9DvPKKLAvb6K6oczcKB410vK92eNb93+2mj6xKaZn
 qXskb8+R0unl/FUgnDi0ujq0U7d6lCwzFCh+JdE1xq4qXeg+cJtlS3d7bXEbQPwkWsV8
 J/2WCCyFfyh13iamerDW69iMpkn36OhNfBaaZXL1dkQN4O5xkZR8kCtgjqlY7Y4j6t1D
 urcjXZjP3Pzl6F35k9bobLRW0VHegzQ0y2nwyTcahNVMu1x7H2zb1cS9saqaeWiOv3WF
 TGSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ofRRk55W
Subject: [Buildroot] [PATCH 1/3] package/lua-rotas: bump to version 0.2.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff COPYRIGHT:
-Copyright (C) 2018-2021 Francois Perrad.
+Copyright (C) 2018-2023 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-rotas/lua-rotas.hash | 4 ++--
 package/lua-rotas/lua-rotas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-rotas/lua-rotas.hash b/package/lua-rotas/lua-rotas.hash
index 037844e9f..cb8d48c0e 100644
--- a/package/lua-rotas/lua-rotas.hash
+++ b/package/lua-rotas/lua-rotas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  a947026be3552cbf676a0cef36a618111712257d306cbd9d340ed8895a4cbd2b  lua-rotas-0.2.1-1.src.rock
-sha256  ac8bb87b7b5e803ae27510b9c6fd284f1b00e741258bc59fc78d3bc107d96fbb  lua-Rotas-0.2.1/COPYRIGHT
+sha256  601d0fe9cb57e4c2fd22352c6e0f064888edc428e32f0cb7ddbdc9650f21d8d9  lua-rotas-0.2.2-1.src.rock
+sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.2.2/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
index 84d6c9a58..5c9b2caac 100644
--- a/package/lua-rotas/lua-rotas.mk
+++ b/package/lua-rotas/lua-rotas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ROTAS_VERSION = 0.2.1-1
+LUA_ROTAS_VERSION = 0.2.2-1
 LUA_ROTAS_NAME_UPSTREAM = lua-Rotas
 LUA_ROTAS_LICENSE = MIT
 LUA_ROTAS_LICENSE_FILES = $(LUA_ROTAS_SUBDIR)/COPYRIGHT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
