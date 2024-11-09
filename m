Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FF0D5E386
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011C56078E;
	Sat,  9 Nov 2024 22:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8_LZnbt7Qab; Sat,  9 Nov 2024 22:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F09C5607B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09C5607B1;
	Sat,  9 Nov 2024 22:17:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F101D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C59E9606D6
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hCcX1jkG4Fld for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D772860746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D772860746
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D772860746
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:44 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a6e960fa2dso12601365ab.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190603; x=1731795403;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K3xGppi5C+KQ14e8nWisu31Kj0rQox+FN/quM3Gnl3I=;
 b=ilzIr9pZuUQO1nGZ/m4pGqbT6+9fD5KehJ1uydxq56BSYk89XyikDZAeJdCUTALFPN
 4YDO3zIUeLwH6tsDdtbXEtzSM3jUU+IAfphl0kHQx8of1lt+28ackGta7DEGA2HD+b80
 J+gWSX7P5kqzzBysS/E8agYKGovwjSTx2fwrfwGPocUZ5pR4VtHSd0tih3vwqbFXMVo2
 NgxIdc0QezG5c/kTlIHkTZuvuj2/8DO6U4Bt43cllh0ho0IiWRVgtEr3Lm4SIipGWRZ2
 EgvCKEzSztah40DwluLHJP0+d2SRw9dscw6rQpBWOMB2AU/Bm361z6APJ5ANSpTgzdZp
 RWCg==
X-Gm-Message-State: AOJu0YwNttiBw1TmaaZ+FjAv38YT3u1NQQgBGiobER72f0KtWokD+wEc
 K7/3e1F1fDZvfoH+dy6Wp+AXysVly+Tgy4LCimIb1T7kmigiN8XP
X-Google-Smtp-Source: AGHT+IGLPBxYXxn1CQg+bjcMiQqxZI2xUUK/ns/KhEl9plumIIGmkIIPE+EqMXp3KFuny2Nkft1smg==
X-Received: by 2002:a05:6e02:174b:b0:3a6:aea7:b188 with SMTP id
 e9e14a558f8ab-3a6f1a64398mr81577915ab.16.1731190603512; 
 Sat, 09 Nov 2024 14:16:43 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de787d6e43sm534379173.91.2024.11.09.14.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:43 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:29 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-15-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190603; x=1731795403; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K3xGppi5C+KQ14e8nWisu31Kj0rQox+FN/quM3Gnl3I=;
 b=bGTbFUimaQSj/eiLQS+409CR3URN7rmvb9861q/VDJLaxsN2ClzzGj3/lSpxcTE5xE
 zIEuZaMSIvzCueGUupn0JDlNGNH1B8bBKPqzdLUW5ET0EAlLigAPwYVEED5hOzjFUOOH
 6KZcRpHSu6mnhIOkBws94WHdFLq/paZF/5SnZBiNz2WlYgCDzJcEWdGAp4Pa2zZ09MOO
 K2oKudigfD99BqLSIhpJc1QDfnzIX50EqxFy4AgU6RRN+c8wKgwOPCmTZd9VdiUte0Aa
 2fMSGkSt0+LHlTa2bJxZbtR+J+V7WdLlA9qnXcqHF7S+UctL0hPvLliSRmUTi355h6vk
 LjDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bGTbFUim
Subject: [Buildroot] [PATCH 15/17] board/qemu/aarch64-sbsa: use
 partition-type-uuid "root-arm64"
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
 board/qemu/aarch64-sbsa/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index e7ac7f2ee1a5c4bd941c52493fec9cea070728a2..d5daa5fbacf7e662a64aafa16ddb4fc10d2d4067 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -25,7 +25,7 @@ image disk.img {
 	}
 
 	partition root {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = root-arm64
 		image = "rootfs.ext2"
 	}
 }

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
