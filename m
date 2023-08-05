Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A798AEB64DD
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 08:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FEE9821E1;
	Sat,  5 Aug 2023 08:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FEE9821E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oW6Pwf78K2ic; Sat,  5 Aug 2023 08:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5888582D49;
	Sat,  5 Aug 2023 08:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5888582D49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60DEE1BF303
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 08:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2794380B14
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 08:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2794380B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWOVdoviPygz for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 08:07:59 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C001282E1A
 for <buildroot@busybox.net>; Sat,  5 Aug 2023 08:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C001282E1A
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3176a439606so2308701f8f.3
 for <buildroot@busybox.net>; Sat, 05 Aug 2023 01:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691222877; x=1691827677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0U7pqg/P2Nh8iifA9S1GgMs/cF2XcoQz1Dd3isO4dbc=;
 b=GUUpt7u/dBHUQfndceZ9kROg1IVJlByuIDqoZJVbFfm4Nb3D1d4efsreVU116l3grZ
 wO/kF+GY/DefkJ9LM53fqvEEIPlqK+R2yGDd8bGD6aQ3DE46Z+1kxuEkKEWE7/TJlF4c
 qU9xMlsQXrgfhKEr+T3syeRxYWxRmSFY0rDIVVp+tM1By5TYPfMG+hE9nH/SKwIcgOJ2
 wBVsbMyyi2lw8dQOTYykgHKbGSTctQ7v2QkPSx7ih8jTs/Z/R1OA4MdG4XT6c5+PZq3f
 MrcTpeLx2jtzsuUlbkcoE7UAycBkFbZ4RSOIraQWzcGpCs6FH4ILif7rj7uurnMRHafF
 Fu+g==
X-Gm-Message-State: AOJu0YzUIGdcMEmr5ez5+kaDyNuM3gkjcY8EfYH6JS3rBeDSFMW43dJR
 uD1r1jCjtkR4m0X/uv4NFdOcgcY1Rgs=
X-Google-Smtp-Source: AGHT+IGMdmDx/ezOMOUI2NcXQ6J3HDhqRZ1Yfn1Y05kZvpBrAHW7lMzSm38Yd7UYAW8Yjd/TvRiIGQ==
X-Received: by 2002:adf:e5d0:0:b0:317:39e3:7c68 with SMTP id
 a16-20020adfe5d0000000b0031739e37c68mr2687948wrn.18.1691222876463; 
 Sat, 05 Aug 2023 01:07:56 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05600004c500b003143aa0ca8asm4530874wri.13.2023.08.05.01.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Aug 2023 01:07:56 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  5 Aug 2023 10:07:52 +0200
Message-Id: <20230805080752.84001-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691222877; x=1691827677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0U7pqg/P2Nh8iifA9S1GgMs/cF2XcoQz1Dd3isO4dbc=;
 b=O8pqFS9j3oMm+tW2Ed6OSmiiaY3LUQuOhqAf+cq9J0Apcw9ZCPR1btDKPNeR2fnLcJ
 LHAIGpKFZRDC/PNV5PLfBsQjpI9pIup4pOQKFWjrCjdVS7r2ZfY4BY0a4pfy5Ru7vats
 64QdbXFJCLr527i2GdQVI/2WXokmXkYrBjhhLiIwq2jUHDf1UWX8Xih7GVi6fVnqVKdo
 j82sNi/tPtWCwM1SIuhAeMZueZqZ90MDfyIt/c+1aaWsl8GLYMRbGxnoQQacrtgPSNaC
 lHqs2Tvr+DY2d4sGermtqDl5yHkw0Cddameqcj6cxWzp71P5rT38CleJ2SRQRaY2+/Ox
 IG8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=O8pqFS9j
Subject: [Buildroot] [PATCH] package/lua-rotas: bump to version 0.3.0
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
index cb8d48c0e..6b33d94a8 100644
--- a/package/lua-rotas/lua-rotas.hash
+++ b/package/lua-rotas/lua-rotas.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  601d0fe9cb57e4c2fd22352c6e0f064888edc428e32f0cb7ddbdc9650f21d8d9  lua-rotas-0.2.2-1.src.rock
-sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.2.2/COPYRIGHT
+sha256  c1570d38552816c7b4a4881e491049a22214ddaa609f65d9edc8013b416cecf7  lua-rotas-0.3.0-1.src.rock
+sha256  1112307622ef36ed8ee3e8ddb15ed294e699a9db45f6251d89343534388ec3dd  lua-Rotas-0.3.0/COPYRIGHT
diff --git a/package/lua-rotas/lua-rotas.mk b/package/lua-rotas/lua-rotas.mk
index 5c9b2caac..79e1e4229 100644
--- a/package/lua-rotas/lua-rotas.mk
+++ b/package/lua-rotas/lua-rotas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_ROTAS_VERSION = 0.2.2-1
+LUA_ROTAS_VERSION = 0.3.0-1
 LUA_ROTAS_NAME_UPSTREAM = lua-Rotas
 LUA_ROTAS_LICENSE = MIT
 LUA_ROTAS_LICENSE_FILES = $(LUA_ROTAS_SUBDIR)/COPYRIGHT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
