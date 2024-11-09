Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7053D5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B31C760736;
	Sat,  9 Nov 2024 22:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtm7M2HKv2ub; Sat,  9 Nov 2024 22:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CD75607C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CD75607C7;
	Sat,  9 Nov 2024 22:17:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E7903C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC4F1401FB
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WucpmRaHTt76 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07137401CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07137401CE
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07137401CE
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:45 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83e190085d7so19026039f.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190605; x=1731795405;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hegqCs9myaiPTAFo6Zqq/FW2TdW4UciUfrUn1sAK/sg=;
 b=g2H3qAV54vWH6mO8k3tkSS+buRh5TBz/rdc8+tDb/S3ikRgZm/9HtHkeuWgLB94nYo
 cMGf3E5kJNzW6VnKN+ynGUzBuRRLWNLRjE/MFa6G6edUqv6CAsOws91XRbVVOoJTym+v
 ZIMdyVCcqXm4uLBaCl3pGasFEJv2INyXpWGpIgxRUZ9leWvkjo8uRlNgW4rnQ7benKcf
 p/z2dIXNGzUI4dViLvUgSLudaMZ1nn2e57e0PN79kAKBEVWPRJMCNnjH0CnrHPHt7Zyy
 tn6phHMlYAkXw3Mihe0tGyxBlAc8/rE6bW5IMhCluxzrqn1Mc5MuaCWaotlf4Gha4aYB
 zTUQ==
X-Gm-Message-State: AOJu0Yygl+Jpeg2H1GsYgTZLt6LFfB4p/aNqg3QINRSmITB8EDp9Q0Py
 KQdUS7a07A/iDYjctzRThozoWc/sw1nKgvJ8p0FB1oiV/7xy3p5R+jNn8SoQ0FU=
X-Google-Smtp-Source: AGHT+IHFjvsraGr/fUBUeHUME5omeD1FAW2vcYSEa01qhhWUpPnN6KPRq12FjxLV1K7UGoYySpQoDQ==
X-Received: by 2002:a05:6602:1408:b0:835:4d27:edf6 with SMTP id
 ca18e2360f4ac-83e032b8401mr921677339f.7.1731190604935; 
 Sat, 09 Nov 2024 14:16:44 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787d706fsm535327173.84.2024.11.09.14.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:44 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:30 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-16-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190605; x=1731795405; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hegqCs9myaiPTAFo6Zqq/FW2TdW4UciUfrUn1sAK/sg=;
 b=Z4vw8BUkxCk6wDhxdeotHj0LxVcBI1de+F5/ThjtJpVDK34KbFN2xjdGkmenV6XC+c
 NZSiQdXvMPN0E9L7ybHpiDkJcefaLBZkCiB5Gj/l6THaubq5s+4T2T51xzR3VmwzItv1
 mz6Z4MJ+f7ZQg4aiUNRKmND0/w/U6P38sJhKWrmx0GlBnxCqGLaKTkcKSOmxE1qDjd9d
 46l5rZ90xb9YS6oAdoxt4LDuhYxm5zsk17A3n4D9tbb/GcOi5QALaiRnMANRwlf27XL9
 vZ2UlNuZeqqvsXCJ145pbV///pW3LfQOQ+7th4mVajgLjWruXRIE15PffI8G7OR8YJN1
 piow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z4vw8BUk
Subject: [Buildroot] [PATCH 16/17] board/visionfive2: use
 partition-type-uuid "xbootldr"
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
 board/visionfive2/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/visionfive2/genimage.cfg b/board/visionfive2/genimage.cfg
index 73d027c2e843246eaa8a4323e874c8892c0c2b88..9757a8cd5154d313754d6dc366dc971eab4e31fe 100644
--- a/board/visionfive2/genimage.cfg
+++ b/board/visionfive2/genimage.cfg
@@ -11,7 +11,7 @@ image sdcard.img {
 	}
 
 	partition uboot {
-		partition-type-uuid = BC13C2FF-59E6-4262-A352-B275FD6F7172
+		partition-type-uuid = xbootldr
 		image = "u-boot.itb"
 	}
 

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
