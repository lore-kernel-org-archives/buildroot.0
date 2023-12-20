Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6350C46CD3
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 02:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4004441BD4;
	Wed, 20 Dec 2023 02:08:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4004441BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6KnTzigaFPOX; Wed, 20 Dec 2023 02:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E195241BB1;
	Wed, 20 Dec 2023 02:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E195241BB1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02A611BF3B9
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 02:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6FF2403C7
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 02:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6FF2403C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lk2PCb3vk8an for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 02:08:25 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0B6A403AA
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 02:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0B6A403AA
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-35f519f3ea9so23537115ab.3
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 18:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703038104; x=1703642904;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xwfub1jCmwD8bMOLhfk0HC1NpVHS7QfdbnjWLvisQWg=;
 b=cXZ+GP1TxBACL63MF1B1A8XhnRrS7bejXtn3yUbOO+Z85EOCVJYZp8HOgLkE1g+Thg
 K7MnZsdi/2n7h+xyQKv97IqG3MH5E6reHO9I0EfrvHPTwuowxA70okzkpXdBkFmKqV0g
 jpxVn0d6KpBgf9g1p9nAxGF4liXkcNhjTHwsRv4/mxGrlkSyMk13ivyJBqgXlFz0zM3U
 AKH/zLL1EIn5H7b4fa+tJ7LCEU8dkVXzNj9rk1L1y1mSQQxpY8YaB1VklC90aLvnxx8R
 +UUpXoHe+XKwGZPfypV4/vCMef22BVDB0v6GCe6TbUYVyagHPZAHa+3/MiKv4cM3kBQ+
 zlxQ==
X-Gm-Message-State: AOJu0YzZHLpzFC5MpCHQiLcNyP117WnqjK/mfR0HeyMrH5SGRI3OdbBQ
 in3pp+czU20GQkuVNQRr4vU0nZRtAM8=
X-Google-Smtp-Source: AGHT+IH1FQnWxJRn2Rzt0dGKPAwtXOJAJeJjAAr0LerpL46CA2qZZupSljCCUEdhl8PAX1aduZJ7Aw==
X-Received: by 2002:a05:6e02:1c24:b0:35d:a4a9:7bb4 with SMTP id
 m4-20020a056e021c2400b0035da4a97bb4mr18351199ilh.6.1703038104386; 
 Tue, 19 Dec 2023 18:08:24 -0800 (PST)
Received: from blastoff3.cg.shawcable.net
 ([2604:3d09:c74:2000:cc05:d215:c02b:b886])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a632fc5000000b005c66a7d70fdsm19643781pgv.61.2023.12.19.18.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 18:08:23 -0800 (PST)
From: Peter Thompson <peter.macleod.thompson@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 19:08:18 -0700
Message-Id: <20231220020818.23843-1-peter.macleod.thompson@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703038104; x=1703642904; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xwfub1jCmwD8bMOLhfk0HC1NpVHS7QfdbnjWLvisQWg=;
 b=abraeaMpRH8OhMbv7l/RsBJ5dKJ+6WYimbna+alqmVWSuh4HhXs+w2PO/s9BabR/rz
 r/2xcJbhGmzxh1+1N9CCeKvP9Tjc2ioWMVoz/1SAI9MUA100uomP/TGj2aDuj6WrNGls
 gQ331YabKAKVOPU9hQyLf2ye80AzTGOemAimnufM54UUbhF56/TM7jqz1TEDYNSTwCnc
 Pk0DY7Rr+ifQzsjEddf1ODct0Zws+po7vmqPJ+WBzEFr0ZAQe63fYRldbkj6XyRRANg8
 igv3Fh/G0AkzWsjMNs1LF0polb21v6Ey5uqz/i5SVVkDgXereAZwbpTsDNK8HroWVLr6
 BF/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=abraeaMp
Subject: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to 2.8.1
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
Cc: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>

Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
---
 package/sdl2_image/sdl2_image.hash | 2 +-
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 55b2661fc0..0236f1ed08 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  931c9be5bf1d7c8fae9b7dc157828b7eee874e23c7f24b44ba7eff6b4836312c  SDL2_image-2.6.3.tar.gz
+sha256  e4cab9a58c347a490c46723c17553b4e12233cd821d3b993a8475a50497f5a3e  SDL2_image-2.6.3.tar.gz
 sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index aaf379788c..ca9d983892 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.6.3
+SDL2_IMAGE_VERSION = 2.8.1
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
