Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25F8C021A8
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 04:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 587054247F;
	Thu, 13 Feb 2025 04:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIEestaMgd3F; Thu, 13 Feb 2025 04:38:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 472E5424D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 472E5424D4;
	Thu, 13 Feb 2025 04:38:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F11411A2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB8F340167
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1IQgE3xyjE6 for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 04:38:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 03C55400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03C55400AB
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03C55400AB
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 04:38:16 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21f48ebaadfso7562055ad.2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 20:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739421496; x=1740026296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWYLCYwQ1naEN53xmjSCZt8H/PJnUnsZ2Yvbbwkm3r0=;
 b=ckx8dTZ63XLd7KxR6Rs5mEKTPkEKjQeYagZCo1L6gGU6zzENcAKS2HxeARRzc43Pyj
 XW+MTn1sEKsmVZZQCQEzi6v+E90NuTI3QenKQpoXdFCSYByyzXumxLjAMH8FkyJhTH0D
 itCosE12ZL3gtwLuA8UVWbO/CONs0unhBAJTyKjplVypSetQg/UCR6wXj533xF6sN8+o
 E939MlUDGAHlmpAbqVcmyvIQR5nNN0YQiGGKBlhNHMa714THEg9JdEkMF+VwDcBRCK00
 gieVNGHtaTsAyOja//FKe/grEOv0L4fyTM7BhHYGjLQjblur3fjsQo3tkgMFa5zJqK64
 b/dQ==
X-Gm-Message-State: AOJu0YzSyppJVDJwXe/Agsr90BPfzHma5nPV3JD9s1K2LFfmvbeVCWEK
 qpjbJtEswcO3XP7hlXDKAiHWUU3alQ92lANcVgPIA0mih/BwDtLDlba5Rg==
X-Gm-Gg: ASbGncv42G3rOyBN+Rf63dLURVAaGNlLNsTa1EoMu31OuuNSLnzkIdTvDPNs+tC4UqF
 MBYZ1M5A01i5UbqO83NJcpHleLeoTwSL5eKda9dh90x5J+XH+vtTEzYuSdC3QAa5fql6lp1MP32
 Ay+YIKN0cLWKvxjdyI9wlQb4mOEim+2xFNM0q2CczVU8wF3wbuB4phQZwHW2ktEmcbw/el7r1FR
 Uawr8wXFruRNYNBfR/BKsBCl2cO+kTY8mOrlIn436GcTsJVLOwo4fHstxMJ/bjja8T2DcNsMthV
 JsIKVMfRtxbBu62uSmxcyd5jZgF1C/o3VBqB/7MTm79Gu3et4oSe1hc=
X-Google-Smtp-Source: AGHT+IGNSBN3BX0jLxWLHXYbhBf5kzLmFkGN1rJuDfVTWwTLr5AE+9DC03XhdSEMcgmrmYpfEafacQ==
X-Received: by 2002:a05:6300:7114:b0:1ee:5dee:d22e with SMTP id
 adf61e73a8af0-1ee5deef393mr6753824637.0.1739421495843; 
 Wed, 12 Feb 2025 20:38:15 -0800 (PST)
Received: from blastoff3.cg.shawcable.net
 ([2604:3d09:c74:2000:7c9c:d673:9b41:c416])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7324254a1aasm316300b3a.10.2025.02.12.20.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 20:38:15 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Cc: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Date: Wed, 12 Feb 2025 21:38:02 -0700
Message-Id: <20250213043802.16357-2-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250213043802.16357-1-peter.macleod.thompson@gmail.com>
References: <20250213043802.16357-1-peter.macleod.thompson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739421496; x=1740026296; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KWYLCYwQ1naEN53xmjSCZt8H/PJnUnsZ2Yvbbwkm3r0=;
 b=W/aVjG4ia1yOEmPF6vEHl6x+aFntwknXO4uB6+ewrGx5VXmll2WIPsDKTQvGVkriZe
 ov58pIGUcVlgJBL/1h0j4GH6NW1+/6SiwBNE1WsnPNyMJZTqJnUke348F2vT1vN1xirl
 qMHL+hYODhvs+A3nTaVCFg5AmBG9jVbRGuGYWAFlyKYedN1HCP0eOAh3pJkze6yp3bBg
 VGZ7hbA2nbyuTffbbUsU+zUOU6oh0SO4nABIE47sYSjvsLARGjSDdn1fLc/UivS8JSgE
 FeiQrCJG74brffu2zRW0R0M633M0Y7fAKIQmJFr9CHE9Qm4R9+sBcQKVhAoyUcEA3KRH
 e81A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W/aVjG4i
Subject: [Buildroot] [PATCH 2/2] package/sdl2_image: bump version to 2.8.4
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
 package/sdl2_image/sdl2_image.hash | 4 ++--
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 53a887c6f9..339082d61e 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc  SDL2_image-2.8.2.tar.gz
-sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  LICENSE.txt
+sha256  f7c06a8783952cfe960adccdd3d8472b63ab31475b4390d10cfdcc1aea61238f  SDL2_image-2.8.4.tar.gz
+sha256  a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  SDL2_image-2.8.4/LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 40b9e3c915..e058cd9f74 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.8.2
+SDL2_IMAGE_VERSION = 2.8.4
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
