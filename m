Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFDBD5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBC281363;
	Sat,  9 Nov 2024 22:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOwqxjyBfWn0; Sat,  9 Nov 2024 22:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 852FB81346
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 852FB81346;
	Sat,  9 Nov 2024 22:16:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2DFAC2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF91D40177
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKAoJ4oKR-Zl for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98454401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98454401F6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98454401F6
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:30 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a6bba54722so13438195ab.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190589; x=1731795389;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iF4fY0/D8eu6DoC1365+/gonqQyrS5EAXr2kACSSHTo=;
 b=HiuaQQHnuWKKGMXLyWcIaCAsDfc1fanEzBzHDeoKheaYmCc6B8gAibWYPkajJht+uW
 69I0v6xM9eQE/26g7aA1N4nuVhnzhrgACWT0eO1DQdkg9UkADp5CZ43jkyJpgu68F9IL
 KeWA/HQRCN8wP2EiOw9Yq7HVNazeN11fHNo0f/QPg+bbWpfsY+6/HZcii8W55+jtAOnd
 OBRnnyqy+BrVUx6BcZ/XIgJat9NvzpOmN7768RvqwmNZWRD7GKduK/isqZfZHefkDs4w
 tJoOqpJ96hpNLvS1CI4QdThStlBSqt64KdxOjRvGLf36Iv+M+RuXdJ/4Vn7+meUDsmnN
 HcGw==
X-Gm-Message-State: AOJu0Yy13OUN251WvxbRj29S4GB64Jo8DFD0BPFwo+yhOAdBcOK2j6gJ
 rpPHg3goOxG4Q3K6PkvilbOhJkz44urTu+NgkdWV8btFQosoGOGb
X-Google-Smtp-Source: AGHT+IERPnWuLy2P9XKu1nE2bvw0ffSw5WGeQrN9hEsnQbZ3H39cbIhjTDP9/mA2ZhAtpFgR8u81+w==
X-Received: by 2002:a05:6e02:214f:b0:3a6:aade:e328 with SMTP id
 e9e14a558f8ab-3a6f19a03d1mr86633875ab.4.1731190589542; 
 Sat, 09 Nov 2024 14:16:29 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9842d67sm5443745ab.35.2024.11.09.14.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:29 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:19 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-5-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190589; x=1731795389; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iF4fY0/D8eu6DoC1365+/gonqQyrS5EAXr2kACSSHTo=;
 b=cjUrI82Iu1B5tINKeGPgjiOSVrBQdxq2eUThqxOMqH2OxQWyBd5t1YX7VAMHp4rHFv
 YDh1RmwOBy2wsQQ43exFi8CW2Pa5tPEk34MxrtNnxttPrDvG9M5LxpyxC2L1rCHYGDcO
 LO2Nlnq2QV1zhxqh0M/H3wPE4wr8yqMyRiQa9/G3Jm2rxE+XA9yrbHIqbuFmuiMbMoLa
 lPmLagxjV6TbqCzzQJVq2QpI8IkBRW5sU7iSiy4fWhPzr4rgj43prfOdW1ZQGQVLJBGm
 LhGc1mE4s6Q2Vt71D80r7o1Z8muIvbuZ5aoZeBpiE9vSiyI4Pt+s3RSIlF8Vwe3/2LAX
 4sEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cjUrI82I
Subject: [Buildroot] [PATCH 05/17] board/pc: use partition-type-uuid
 "root-x86"
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
 board/pc/genimage-efi.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index c231e1b9b2626c5a788c85511b1f1e9d12759d33..7d3d69bd067c2c39f5188d82d2e1fd11088657e1 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -25,7 +25,7 @@ image disk.img {
 	}
 
 	partition root {
-		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
+		partition-type-uuid = root-x86
 		partition-uuid = UUID_TMP
 		image = "rootfs.ext2"
 	}

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
