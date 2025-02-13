Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1043C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 08:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56EE58113A;
	Thu, 13 Feb 2025 08:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QxCloYd4fl7; Thu, 13 Feb 2025 08:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EBE181150
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EBE181150;
	Thu, 13 Feb 2025 08:20:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19100C2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F18EE611B9
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSzaqWEkOJMN for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 08:20:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CAE661178
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CAE661178
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CAE661178
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 08:20:02 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-21f61b01630so28021935ad.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 00:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739434801; x=1740039601;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/H3ygfraDq+TmNFKEvViOM3eIf/tYDFjCjCjWSgveQw=;
 b=M1P0KSirfPaKAUKO+Lu2pPlvEVadekm6V+6JsEsJSP3WihVgHbqp7fWV5eYWRrUsei
 8x0DWDkGEulDbCTUiPZOV4oUTa/qjCnhOtV/ybApWgqTF9UhNgxQ7JpabwExnA3bolp5
 hkGOyKOftpa4Tk0F8wcljCxhVyxfVoMC0RRNfTjbUB1rlSRETEv5TK+Pznk2WvktOygm
 s0uz7kRA/OjrqX4Y+7JyniRkzJa9+smjCdzKcDpru9zHyVVoDAdVIU8jN/Q9mB+kl9bi
 yLeJZG9CT5S4w7sDTyzpf8Um0MZ9D/wYSms1eEcZc90eKO4cYHV1FgEpSt7v3xDVC8GA
 Ddsw==
X-Gm-Message-State: AOJu0YyHPTjCFvBErLDemGgQABjc2rq3aSzdXvVj3ZrAOz6IDZn29ol7
 VmJ7Kt2lLFXb6ZkwdHN6/C8RZwSbdefZlm62l3QcojXIYSUYA6zEDnIb+Q==
X-Gm-Gg: ASbGncu5Q9/bgkeL9vPzrc6FpKjSB59Kxa9G77tmvtGNzOD7rPmSJjMaz/3TdgPCmSL
 7rzsNwluBfBAHnlN6IG/NvFcgoSKmBs2pa940YsfBmtyxihsK0/f6aMuRS8yN4oINynhTMyfFUN
 LawCMXiTgcCmf+PrpQVqaVmkeUUljt3egzrzEaZj01wUFiBhEnzn4XwIiKzUSJgTNW7c8jy8wVt
 uPgX68VCIJm4EqA48gkJpqJj99fBuW5DjU7qYBGKWKIAeWvDan0tA0ye+JCr0E4Fde+zCy9kG48
 9yrFmKRU2jNuoBL8isKUOZZT6WIv64VzwtQhP8+0tNcx/yx0m0usXRo=
X-Google-Smtp-Source: AGHT+IHhU6WSm7hzVH8AwX3QQsiakmPQlxM7DHWrbqYm47xgyXZiXbmBCBsoK41um47qwrh5g7J/Aw==
X-Received: by 2002:a05:6a21:6da7:b0:1ee:47e7:7e00 with SMTP id
 adf61e73a8af0-1ee6c6ad940mr3322101637.13.1739434800614; 
 Thu, 13 Feb 2025 00:20:00 -0800 (PST)
Received: from blastoff3.cg.shawcable.net
 ([2604:3d09:c74:2000:7c9c:d673:9b41:c416])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adb581306b7sm673327a12.17.2025.02.13.00.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 00:20:00 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Cc: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Date: Thu, 13 Feb 2025 01:19:55 -0700
Message-Id: <20250213081956.24293-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739434801; x=1740039601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/H3ygfraDq+TmNFKEvViOM3eIf/tYDFjCjCjWSgveQw=;
 b=YaSTFPVynJ/73JQUoNQAA/NfD679PbRWCp3Ya6F0bLTZ9xH3dzzxz5J9wCgvJR2+AB
 5OFHcvsOIBfpqqkurKq0AYqOEtob7hxeKRLstKb632HUgOG/c89UFDcUhwCcOQ0pz44R
 pUbpdoZXPfJAGz/yGJrOR/deLe9aDSuSeyJvzslXOakRxLhz1QnbVQbkTIf75iuRGz6q
 +mQdrH+bQGj54pKZSmndWy+Wo4ucuAdkCEVOQDr1S8cUDBHeqXi4UMDktTzqt1WehyUV
 By7ybFotl54reLjcaRhHF56nrF33EhQ4doKD4c0B0a+49IFdBKMk01dP1Rjs2SuoL6NP
 dAiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YaSTFPVy
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
index 7693aeba6b..4bdf004bad 100644
--- a/package/sdl2_ttf/sdl2_ttf.hash
+++ b/package/sdl2_ttf/sdl2_ttf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d48cbd1ce475b9e178206bf3b72d56b66d84d44f64ac05803328396234d67723  SDL2_ttf-2.22.0.tar.gz
-sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
+sha256  0b2bf1e7b6568adbdbc9bb924643f79d9dedafe061fa1ed687d1d9ac4e453bfd  SDL2_ttf-2.24.0.tar.gz
+sha256  7826eca0a0f7e591f38dd844e207a200aac81a59b20d8a30c3af8c6282af13e6  LICENSE.txt
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
