Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E7BD5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D718D81346;
	Sat,  9 Nov 2024 22:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hi_oF4buigHQ; Sat,  9 Nov 2024 22:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0877481446
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0877481446;
	Sat,  9 Nov 2024 22:17:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64234DAD
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41A6240156
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-xelgZxl-UV for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A26E40159
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A26E40159
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A26E40159
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:47 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a6c3230858so11460445ab.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190606; x=1731795406;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T6dplh9ESoeIGejoNp5VJxtm0YXlsMwFhVn4/mz3SLE=;
 b=I9ADVKo62TZ1o2V0dXrXc9KgFSt6JTI3xfbMCR5GZLC0hs6CzZJ6nEPInrrTW+4svi
 itGYTUmgH13fMc/kJJrolwxB6uWIkXjle2p91NvLeUWxkuWmcTYOoA6jkE4MWiWLFOME
 2Y8w+Qq4+vl+6J82bTLyYUWR/P0urwo6S3AogRrF2uLIJrzvdKnNGNJAAPkkLfCQzhlv
 VsNpH7IJxL8tGRMTTSYlRXS6MVURJYaS1nxfiBZ8Z2Nd6EKTVJbOw0bwiYBbNQ3JAfLc
 Z+5zUS40S6iwWJ59xhmFWkh5IxDnZ74tpLuLAtyNm/zTW6UVIyoL4HryTZ3rspOn0tS1
 zfaw==
X-Gm-Message-State: AOJu0Ywk8AMVM+XVx4wV7lpQw8u7UapzxbYk9P72vrK3oMUG2Hyoyo4f
 w6sFyKvKC2PUZrNdQ/EnuoGUZqnuH/P56WQllB/TtLsIfA4rW1gS
X-Google-Smtp-Source: AGHT+IGffWv92TwymBGdTJhOCw8L/6wq4ExsvypPsE29YEmvA++ZshUfn38WFnlfQ0j1Kg3gUnxPig==
X-Received: by 2002:a05:6e02:b4b:b0:3a6:aa64:dc9 with SMTP id
 e9e14a558f8ab-3a6f19ca40emr79742645ab.13.1731190606373; 
 Sat, 09 Nov 2024 14:16:46 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787d6e28sm532159173.80.2024.11.09.14.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:45 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:31 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-17-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190606; x=1731795406; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6dplh9ESoeIGejoNp5VJxtm0YXlsMwFhVn4/mz3SLE=;
 b=fuu702ikOn5XfnUdnXFP2vV0FFdKB7D5sFG6khlkGoxihox4NcAPsoNyKxMrZ6aJAE
 QUHX/IYTTp86F7Q7MVbSCYpqHB+ekRPXeo/rnwpN2W6EIWOdf3aCOLJ7RGjMFTTbm3yI
 dq0tTEFC/tFepC054bDUm/oBZB/XvHZ5tVkxZzE/dkZScxFDkSTXYkB360XCFHPRQZKX
 bkx6Ju2iiTjXKZh7xgXPG/yiz8ZQz5xWTb74j/dtlQzmlx6VKqXXIpqivepfNRY98ng8
 IZ9ZGSesl0f1nzgpJHfIq0zBEZ55YDZq4YwLGj1Tz7UeU83E4s5NJnz7k/WlYx/IKuvj
 r4eQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fuu702ik
Subject: [Buildroot] [PATCH 17/17] support/testing/tests/boot/test_grub: use
 partition-type-uuid "U"
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

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
index 9717076ca871eb3efb4fea7ca94297d022839de3..83e49084dd920d4cf90b3735450402c3b47fdfa1 100644
--- a/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
+++ b/support/testing/tests/boot/test_grub/genimage-aarch64-efi.cfg
@@ -19,7 +19,7 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
