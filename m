Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EEDC0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE49C606BF;
	Sat, 25 Jan 2025 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNNbJabMJO9C; Sat, 25 Jan 2025 21:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C561B60BE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C561B60BE4;
	Sat, 25 Jan 2025 21:17:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0976894A
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE41882223
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUKRhnk9NLnP for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 21:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 149DF8221F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 149DF8221F
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 149DF8221F
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 21:17:06 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-219f8263ae0so59283275ad.0
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 13:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737839826; x=1738444626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KXuci9GOtr/+9JsoJ5mDKeY/IiYnxvE5u/pXVLzRpo0=;
 b=hKHBLNIOFu/tdzTLuu/G8tSOAT6BepFvZ0nO3MkN3h0TVBaiKqkC61d+/ncu6HF/dZ
 So0kpq2vm9IGE7R26IRB5l5pm814OlBe3cJuUcvapEb8ubYCTKu8dKcXZHfiKiqHsokA
 CBpxs7leiFphgy2XYaHRlSkdsAnriQ1y2htWc2SVrMu35VmPIlTpq4KOpaYC329p4KHi
 8c7UjKXLjSBSKVB1ozkNQrd0oew6fbEB1aDbiQf+UbHqxgzrvChfY2n8ta7s1WEZXfUD
 K1eb3X+15dPWZ+5tHUZr3cCwkxVxroG0yzLxCS99GwJVjnjXmshb2U4cGKXVdeER+Q8v
 h3Kw==
X-Gm-Message-State: AOJu0YwDCMK3djKry+rhIpuR4/Ksk0TgTGGsOzrw7EEMT7Gs23rxG89Q
 gTVTFlKCnb+csUNUcdhVP8ftrxrGoazGlUeEtmJYrxqNssXwPyxfGzwnzA==
X-Gm-Gg: ASbGncv4TJICys5pnx0WqH3hyT3/S0WJ/xqd81EsJrwWGUnXE54QYEdos+5ztH15StN
 kkwW0wIGT+qmOn+aBc1sxiIGeibmvmvUh3pposNaaCQ1mGpcEO24g69w3V8BYZGfkyXlBm1sniW
 hty7TsZve8slVIZ0F8XTGO6Z37fiBmMuqsPfhBrphAAs+rsplN+UzT2Ti6NAVloxUy2EhcdTyed
 glp7NxZUv+jJOXUbc8JC2hqQxlo7j8zITRkxcYyDCB0RhJPIysnVmrVf6L4b7E7vhXo055eIZoj
 Ies9kGEY6pTrpxInuPJQLJvxnN3JPh4kB/UEleq5cW0=
X-Google-Smtp-Source: AGHT+IE54McQEZmmirMG4RYCg7eVWT4C2aOOtkeGcVFC//Gy+hPQ/tiQVZ6uvU+SfAHKo5XRKLpVPw==
X-Received: by 2002:a17:902:d50d:b0:21c:15b3:e39f with SMTP id
 d9443c01a7336-21c355c7d9amr468651405ad.39.1737839825455; 
 Sat, 25 Jan 2025 13:17:05 -0800 (PST)
Received: from blastoff3.cg.shawcable.net
 ([2604:3d09:c74:2000:188d:2e58:18fb:96c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da414151fsm36394975ad.121.2025.01.25.13.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 13:17:04 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Cc: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Date: Sat, 25 Jan 2025 14:16:57 -0700
Message-Id: <20250125211657.14994-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737839826; x=1738444626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KXuci9GOtr/+9JsoJ5mDKeY/IiYnxvE5u/pXVLzRpo0=;
 b=DAoACSQ3RvZPBl13foAMW3B7YYiXzIGvT987dq+c6iOgR4PbCqZjk4kQ4u8WLMS0CQ
 I1KuIvjvo3bonJeewNQ4QlnMEKGJPESvS6wrtMvJVOGCBt/aUB7Q/uxEiN5+mdmxC1ud
 GjKw4gEQso9oz3b37etcHmjIp5iSON/5zOzxFJrXDW3210WIR3oxi4wVLiyyE7Fo18ok
 94en9efvFEo6HRnh4c3w720+y2WwB9W9HjvYENBT7tC0GmHzLofYRfevpBSON5iezLJS
 C2iwO4z1nWX1GcVmYmwacp4J82OuZH9HU/E/GoV/eDEiE7zhlMIaGmGcwTshwXwJm10z
 plQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DAoACSQ3
Subject: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.24.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
 package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
index 7693aeba6b..452dc82dbe 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d48cbd1ce475b9e178206bf3b72d56b66d84d44f64ac05803328396234d67723  SDL2_ttf-2.22.0.tar.gz
-sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
+0b2bf1e7b6568adbdbc9bb924643f79d9dedafe061fa1ed687d1d9ac4e453bfd  SDL2_ttf-2.24.0.tar.gz
+7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  SDL2_ttf-2.24.0/LICENSE.txt
diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index f4f293cec1..3f53dd1e79 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_TTF_VERSION = 2.22.0
+SDL2_TTF_VERSION = 2.24.0
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
