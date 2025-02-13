Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC6BC021A7
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 04:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F1CF4247B;
	Thu, 13 Feb 2025 04:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agqJpy79gkb7; Thu, 13 Feb 2025 04:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73005423D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73005423D8;
	Thu, 13 Feb 2025 04:38:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9BA41A2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8440841E6B
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WmQvYjYMwGaE for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 04:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A39541688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A39541688
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A39541688
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:38:11 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2fa44590eebso1047885a91.3
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 20:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739421489; x=1740026289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1iFvu9i6VoqwG0mG21xZdM861GgzzviHOYlZS4JuBAk=;
 b=sNM9DxdTv+VUo2zz7FgUGsnNnMmZtDFJwoN6PQxbJeFY+ioJktg4PRvQ65PWtsfkmk
 TG5W70Vs9AFACQxWzk5KKula5t3DZZS10v/EekJ9JE7wIHi1W7bx7dpALbI0Wk2F55+B
 eFubcUP5dwoE4ftCpAZMxGcuPQKTK0MpAzhcvhZHIAAvxJOKl7n5XqPLZW3y+mbcIfJb
 k5W+geB5CFtPfW8bZ4B7hmR3zRgyvgVb86VDqLhKwzWf1SyZ9lcPgPeia9kfS6duuug0
 3Os0TybUhXaNYQ/BxZgrHdbMuPAeKJX7CnZZR4X/4X0ABwlVlsJDmt94F86RX0fWohKO
 9hgg==
X-Gm-Message-State: AOJu0YwY+a2o773jij/dYKL+H9rAT7EZft7IsBWjZJs+/z/LI8OPIZqu
 Y+v7sBi+BKZgroEmocRV0s8kN9JUmD9NC5NTKFYMoOpEOf6rRMWQDnbO/w==
X-Gm-Gg: ASbGnct5hQSOmYXOybDF1J0mN/X53ndH7HGcWfjL++ve310NOh56HtPYvFcu4CW7Hgg
 3oUJII+9+t+AhBNaYbpRzIMf11tmg0UeQiu3Xmaz+FYSfO2JtXIJ7YyhZx3QQShDdlyLfwuyeTK
 s7so0pPWex+6Gs+bk+4Um32MQU7cUcUVS6Huk7INxC+zcKDdELC5AO4wH6j61DtGiZ08/CZG/GU
 8dVAAdPhGvQd2EKDem7/dXxQUpLwQDcTsScPPg0JSr3ycehr2PE9KWx+3KvkuslM6YkyaZL2tYh
 6kCUjiX+KJ64AhQi3VBY2gsSViOL6UNaUhNOzJfujqWk3s9AitRJpoY=
X-Google-Smtp-Source: AGHT+IE7JjA9Bhdl1hVlgXi8Wn7UmDbRXKCXm35na24BP4qo/vOYcJ/pHu00I3EnfYmDQ88S1MF8aQ==
X-Received: by 2002:a05:6a00:1404:b0:730:74f8:25c8 with SMTP id
 d2e1a72fcca58-7323c144064mr2876778b3a.11.1739421488933; 
 Wed, 12 Feb 2025 20:38:08 -0800 (PST)
Received: from blastoff3.cg.shawcable.net
 ([2604:3d09:c74:2000:7c9c:d673:9b41:c416])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7324254a1aasm316300b3a.10.2025.02.12.20.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 20:38:08 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Cc: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Date: Wed, 12 Feb 2025 21:38:01 -0700
Message-Id: <20250213043802.16357-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739421489; x=1740026289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1iFvu9i6VoqwG0mG21xZdM861GgzzviHOYlZS4JuBAk=;
 b=krULKHZNrrDHBBUBEMx7MuP1Dr4BGZt9gRwbqgxOPYyYL9LXCdYQNMC9rLprZimsYy
 555WZMVIjtZK8y3eZCh6Q94ZDfkRjmcnm32zHnqz3gXHJxj8+5XUowdgHxuK6Z8cBzU3
 v/KtmYS2QQqqA1pUHJ9dj+b9NRnQLiJmnAOfuTz+/nBcIGowwFRyHFupSTiwhKN1s3be
 chBY9FW3t3xM9PtTCx1HPgPqMCqY17Zcr9P+tNBhosCpVW2OY8wSdO7/W9QSJYkbqu9T
 z3KTGnQBi9mflIwWLGzyvm9lZyj+PPmfapa+PoQvvRz8DqMAuV9Mut9vAT0YK6v2m6lq
 RRbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=krULKHZN
Subject: [Buildroot] [PATCH 1/2] package/sdl2_ttf: bump version to 2.24.0
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
index 7693aeba6b..9e6a92164f 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d48cbd1ce475b9e178206bf3b72d56b66d84d44f64ac05803328396234d67723  SDL2_ttf-2.22.0.tar.gz
-sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
+sha256  0b2bf1e7b6568adbdbc9bb924643f79d9dedafe061fa1ed687d1d9ac4e453bfd  SDL2_ttf-2.24.0.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  SDL2_ttf-2.24.0/LICENSE.txt
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
