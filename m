Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5425FEE498D
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 18:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D417381A3E;
	Fri, 18 Aug 2023 18:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D417381A3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uG6jk8e9sse; Fri, 18 Aug 2023 18:29:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C0981A8E;
	Fri, 18 Aug 2023 18:29:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C0981A8E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE8BF1BF355
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 18:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8DBD81A65
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 18:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8DBD81A65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQ6zO6gKgPBn for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 18:29:23 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C342581A3E
 for <buildroot@busybox.net>; Fri, 18 Aug 2023 18:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C342581A3E
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b9cd6a554cso17490421fa.3
 for <buildroot@busybox.net>; Fri, 18 Aug 2023 11:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692383361; x=1692988161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zTT+IvIHtYSWJGFa8WPjuNap5VyJb8T4p6a7SZqkCus=;
 b=g5UZJZ3n5JwEQGPuu7z2ENsUAXzUm0KYEd97vIdogt2waqRNbsidP48LzUnCt2gkyw
 m6rGw4ixGbxtIB6y/dsZfRbrkAyguO3wJNFHX/Hqi68YOPGsv3bdAsGT9AbcpYIgOwGY
 Qtwqj0adpJRDOfEyoMm0/nXtpCEFjwdegHB3WWuT7EsHw5hdzTqCyCQ0bIX5b2jcrnci
 jnJNShz2baWPcVlJiEkeyd4rn6Ah/eZIJZh28Uwp9xz5A/QbWeL9wZQGG/L7SyLe4aJm
 5cwyijLFsQpAJ6Vb2OAodWS5fCWBfb4+kz3IBN3Gl+JmwMrwrBOg03yztd9is6egBk/y
 22pQ==
X-Gm-Message-State: AOJu0Yz0NcAzJyZw8mZX1OEyERXcoKTPS49n73hoqh5U2KWpRD+7anP8
 PTiILK2ux5aRIw8K6MDiSuq69xEdy6o=
X-Google-Smtp-Source: AGHT+IHgLXm3ivTKgL7lCtSHyNc0O1F1Zdd/Apk9ejSB35Q9O7g+D2V5sViA+StJm7f3tsAoY/aXCw==
X-Received: by 2002:a2e:904d:0:b0:2b6:e2c2:d234 with SMTP id
 n13-20020a2e904d000000b002b6e2c2d234mr8345ljg.33.1692383360351; 
 Fri, 18 Aug 2023 11:29:20 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 r23-20020a170906351700b0098951bb4dc3sm1486867eja.184.2023.08.18.11.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 11:29:19 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 18 Aug 2023 20:29:15 +0200
Message-Id: <20230818182915.489874-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692383361; x=1692988161;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zTT+IvIHtYSWJGFa8WPjuNap5VyJb8T4p6a7SZqkCus=;
 b=hagNg95zA4g4x9SsRFV/woMXXxgpxZpTG42JomUKhLRlk2nKf7USVY4eFxE1EgELeV
 JRlNUgGOd9etuvv22QFW5zmR+imErheGcBI5FZs1QelFSqD68vmrJaYPbKTPsgmCbGIC
 a51Q76NN4X+LToctd9duZnU+vN1bOImNyeu+axnBXa3stHgm7ZO6MlJYmI9qDBjbShXC
 4mkx3/Ok0ZGAhROaKP2t4FdyKICglddaoETDV0X8yXt79oN6zogoftMx3s8QXSR1DDJa
 NBYnZ4UgHGBm8S756K1fWsLhnbjUz5dcjALACHtpa/isQZnVcqO3U9ViyRrg3kBBWiDF
 8Crw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hagNg95z
Subject: [Buildroot] [PATCH] package/lua-rotas: bump to version 0.3.1
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-rotas/lua-rotas.hash | 4 ++--
 package/lua-rotas/lua-rotas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-rotas/lua-rotas.hash b/package/lua-rotas/lua-rotas.hash
index 6b33d94a8..eccff4426 100644
--- a/package/lua-rotas/lua-rotas.hash
+++ b/package/lua-rotas/lua-rotas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  c1570d38552816c7b4a4881e491049a22214ddaa609f65d9edc8013b416cecf7  lua-rotas-0.3.0-1.src.rock
-sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.3.0/COPYRIGHT
+sha256  90ed9305b68f49f2293a3a547b7ec7c290be5bcc1afbae87e2e860eb3b04f18b  lua-rotas-0.3.1-1.src.rock
+sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.3.1/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
index 79e1e4229..1f99dbaf0 100644
--- a/package/lua-rotas/lua-rotas.mk
+++ b/package/lua-rotas/lua-rotas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ROTAS_VERSION = 0.3.0-1
+LUA_ROTAS_VERSION = 0.3.1-1
 LUA_ROTAS_NAME_UPSTREAM = lua-Rotas
 LUA_ROTAS_LICENSE = MIT
 LUA_ROTAS_LICENSE_FILES = $(LUA_ROTAS_SUBDIR)/COPYRIGHT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
