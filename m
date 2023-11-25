Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8942C61D97
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 01:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0D842073;
	Sat, 25 Nov 2023 01:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D0D842073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aw6I0iEF5cFj; Sat, 25 Nov 2023 01:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50609420A6;
	Sat, 25 Nov 2023 01:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50609420A6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74CFD1BF29F
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DA1842073
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 01:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA1842073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reK-r5P8dYmV for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 01:01:21 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92FB4409B3
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 01:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FB4409B3
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1cf89e31773so16617365ad.0
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 17:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700874080; x=1701478880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RnNWbzbpzDbCaQQUfM/E9d5EO3BhLN50DzgRWyFZRd4=;
 b=W/7m3j2v5gwF4Yb4ogypy0ux54Gmk3zjFwsYBjHmoQV4QXzFR74/uzpc8Y6RjkqwqR
 pCXCN41nwBCUv5QKiMrF24OUDolkv8q0aShd+Hri7yTWhhsDGlbMVEx3IQvo9DjMSw3g
 TDsVU41x+H0cpGvFI65hVhHIqNy2QFSz7B9FjkFxDrGwARocMzNm3GnaIKZ2Cwk0C8R2
 cQQGUiv1kfFriXRCIQCKNEOjhljIliFcsGKDmkxYWWZ6ujZexEw9EgwGa1vgMWVx5B5N
 5LhVXa0S58wuNqGXTP7LPXx2G/Z3RyaNUZS/OFB0BNgYTtO9CNrkQ60e8ORVHn7kvJu0
 1VtQ==
X-Gm-Message-State: AOJu0YydTXjS9vARwI2iJeh6a2P4xxxhyDIbbRcxUA7jLawee+uhWN3f
 hBYrfsTK+5qXsPu3l6fswcQgZ7R+a1CeJ+UQZog=
X-Google-Smtp-Source: AGHT+IFWygEYif6kjmpGAvbysS/7hWZR9WmGm2956rbhFzbzSO+hwdLIt2w7KOVhbN1gnvNQmwPs3g==
X-Received: by 2002:a17:902:d2d1:b0:1cc:6fa6:ab62 with SMTP id
 n17-20020a170902d2d100b001cc6fa6ab62mr4973370plc.29.1700874080097; 
 Fri, 24 Nov 2023 17:01:20 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 jk2-20020a170903330200b001b8b1f6619asm3807749plb.75.2023.11.24.17.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 17:01:19 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 18:01:10 -0700
Message-ID: <20231125010113.1758786-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231125010113.1758786-1-adam.duskett@amarulasolutions.com>
References: <20231125010113.1758786-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700874080; x=1701478880;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RnNWbzbpzDbCaQQUfM/E9d5EO3BhLN50DzgRWyFZRd4=;
 b=Kfh/3KfaPKFAPV2QqbN79BUX7E8VZwiz56+CiiSTfotRMvpkTR80RsVvsIB4cKZQ39
 3BAV7tOZmjCF2gGHUTFz1jnhO7o5IV3WwGvX6pT7DGCMxuwm5SFFDEPfYaZYNlUJy9xd
 tkYx8Lwc666qhwezv0XpOthWbF+E7357Vn/RE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Kfh/3Kfa
Subject: [Buildroot] [PATCH/next v2 2/5] package/Config.in: move flutter-pi
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a graphic application not a graphic library

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index c971127759..f003f3dd91 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/flutter-gallery/Config.in"
+	source "package/flutter-pi/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
@@ -346,7 +347,6 @@ comment "Graphic libraries"
 	source "package/fbset/Config.in"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
-	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
