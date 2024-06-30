Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9FFC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 13:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C37406A1;
	Sun, 30 Jun 2024 13:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqnydNJguRAp; Sun, 30 Jun 2024 13:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3F7F406A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3F7F406A5;
	Sun, 30 Jun 2024 13:51:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 55A301BF3A1
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DAD481992
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 13:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFZPfYi6LvOQ for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 13:51:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0B098198A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0B098198A
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0B098198A
 for <buildroot@busybox.net>; Sun, 30 Jun 2024 13:51:02 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so1166697f8f.1
 for <buildroot@busybox.net>; Sun, 30 Jun 2024 06:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719755460; x=1720360260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rl+mYBnLPKR81Wmje9v3sgfvQBOkSzElrCehtcCZLxI=;
 b=Wssb5y4SkcCHV2ln6oXKdxbPaVqcNjPLbM3GxlBti3F2OlpYFiL7meI7Rba277wRGu
 NVia033U04y5NdWZxoRAPUho2retCCaTzJJNcaxoHKiAeH0TkWj6lZsQJrG6NAcbYLpV
 ya6IOICTZEpo9at4unBveAjKwWPN1WKxujmUvVG15Rar4VuAJBRtmghI9IgxHCCh1phA
 0CAVmZJ/roAAE0OtKlyaA409qdSAADj93PoRaUFAL0aP8pFi534e/qFd/wohs3W60ta0
 Yv+vy8ss3tkQS5dp3A1zB5b149CiwZtIzZf2zWyTpht7wVWFi7W6oY2s8J98yTnNt9zg
 VHjg==
X-Gm-Message-State: AOJu0YyI5+zafK6FiwnuAag0SDsPN/WxN5w2ZKSHSNftfxWM3VmlzeI5
 zh2aYYNthErkvwXKMExiNaLusJg8U9AhOnbNGyLZo4P0DI3km0ZG3WUEDQhPWEez+XSyXDAO87g
 =
X-Google-Smtp-Source: AGHT+IGqlqSxi7V1Jey1ZkQjpnL31B+vDRu4x+TfNxH4E58glBLt5uyH67kjiUFwTvxWJHi9+RE5zQ==
X-Received: by 2002:a05:6000:1f8e:b0:366:e09c:56be with SMTP id
 ffacd0b85a97d-36760a63050mr6756003f8f.6.1719755460460; 
 Sun, 30 Jun 2024 06:51:00 -0700 (PDT)
Received: from vm-2404.. ([37.166.9.170]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b065316sm111183665e9.26.2024.06.30.06.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jun 2024 06:51:00 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 30 Jun 2024 15:51:18 +0200
Message-ID: <20240630135118.2222395-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1719755460; x=1720360260; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rl+mYBnLPKR81Wmje9v3sgfvQBOkSzElrCehtcCZLxI=;
 b=Cn/BgPwyfsKHfmlAAbZmExq8cvskjB3uxB7d/BQd/vCboXHGJlflLF9gnATJNtgwq/
 YVAZkEX8P9YWpgS0vY3p3qseMxX6veUV+9fI7PW9bAGVSXk3+zszI3BdCVSCYS5Y9u9t
 cIH5aJavZAhV+zTOlxonzwkX36nbAIWWPtkwt29Pt3i8RH/G5CbArW5jYOPLmLz/wBYK
 XPTZK9zHGsEeA61Lu+qimnNpl/F0L7pcfhmtiGgQVlM0LvVWq0QLVV3s4X3yXoYU3ZB3
 kTeFzrhe3PmA5NYJwOk3zg0++6vMxxO3o+sxM3diqTg1mSTsCwkcegTIenVmR1nYtE1z
 oIlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=Cn/BgPwy
Subject: [Buildroot] [PATCH] package/lua-dkjson: bump to 2.8
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
 package/lua-dkjson/Config.in       | 2 +-
 package/lua-dkjson/lua-dkjson.hash | 4 ++--
 package/lua-dkjson/lua-dkjson.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-dkjson/Config.in b/package/lua-dkjson/Config.in
index 9c5dff192..e550fdfb8 100644
--- a/package/lua-dkjson/Config.in
+++ b/package/lua-dkjson/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUA_DKJSON
 	  dkjson is written in Lua without any dependencies, but
 	  when LPeg is available dkjson can use it to speed up decoding.
 
-	  http://dkolf.de/src/dkjson-lua.fsl/
+	  http://dkolf.de/dkjson-lua/
diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
index 2f210e497..710879da0 100644
--- a/package/lua-dkjson/lua-dkjson.hash
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -1,5 +1,5 @@
 # computed by luarocks/buildroot
-sha256  f6101a0e77ca857ec20799f6b998a600b04c8dd09b27c445ea09f29695bfffb0  dkjson-2.7-1.src.rock
+sha256  3d8de09cd43a60a005ac769ee1cedc515952c892d63cba9ac925ed02afc98091  dkjson-2.8-1.src.rock
 
 # locally computed
-sha256  9d46e06db7feb8fd68f73bd024c8a2c04807629e16f396880860d151b60a3ed1  dkjson-2.7/readme.txt
+sha256  9c60064047b0f41092ee714d205b4b915f1da147fdf9afc4b3ee7bcf028a2238  dkjson-2.8/readme.txt
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
index 2b110f8f1..a148fea86 100644
--- a/package/lua-dkjson/lua-dkjson.mk
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DKJSON_VERSION = 2.7-1
+LUA_DKJSON_VERSION = 2.8-1
 LUA_DKJSON_NAME_UPSTREAM = dkjson
 LUA_DKJSON_LICENSE = MIT
 LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
