Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27581D5E386
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B85860750;
	Sat,  9 Nov 2024 22:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxQAztHilxLy; Sat,  9 Nov 2024 22:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E3960736
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6E3960736;
	Sat,  9 Nov 2024 22:16:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44476D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E30081341
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dLNFxsOVkvj for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96CBE8133A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CBE8133A
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96CBE8133A
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:33 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83ac05206f6so123230339f.2
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190592; x=1731795392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HHurqRKQlcm0DjnVw4ea1s23ZqFthpUrHycNcXwSO4=;
 b=DoOfVtO5IundkqMLc9JCImROISPsQBPqHTLjln9Y7/nGgbL2iFH3HGiSHJDNRUpSge
 EzP7RioUateNAR20QCCJdKpM8uCq5yk90N7y5TZhKngtPPE2sDMKIBatT56zUv2EyqSu
 M3wIAPIe6HL2l5XeBx2WCUrDduIqoGSaT1R4LBuaOQMsPXOpsf9RuiWKl+GAHa9Rwi/7
 enrksW/IYwl21cWD7vWrt5/EohXK8cHHqy4JxsSm6hu7Ghh2j9gW9aD/r/CcSMfawS6h
 PlnLW1AnUQ1ubP1v2+2MbjGMdpj90SISNjfFTfahV7KpVd9DirJIB3wZxvZ/gTmvgBus
 KxYA==
X-Gm-Message-State: AOJu0YyKqgYwbbp74/QHQTidK4WVH4/+HYYpGMhQ8cgmryzwOtxqDv29
 z6ClUEYReAIBcQ50nOdn7Vslw3syFrxleKPbtoNiHLP3+cMIlxMB
X-Google-Smtp-Source: AGHT+IHzi1XmF02L6sWI/JQtZrPMMyrZKITqcd7WFcEPw257wo0livfGs0kpNpP/zqTQg4otK7LTjg==
X-Received: by 2002:a05:6e02:1789:b0:3a0:a070:b81 with SMTP id
 e9e14a558f8ab-3a6f1a59322mr73789025ab.23.1731190592360; 
 Sat, 09 Nov 2024 14:16:32 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9890ec4sm5426305ab.75.2024.11.09.14.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:31 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:21 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-7-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190592; x=1731795392; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5HHurqRKQlcm0DjnVw4ea1s23ZqFthpUrHycNcXwSO4=;
 b=ZKOJ5E+CTIuOCJsNNsL6F2GswK7tT4PFWd84VC0R38OpfaDs4hTmIyexl8Q8pjqcwb
 olNHokImA+cXo+TozjEVtTfPFql7JvvTGRmjFsf+TnmaFsvGdKDX74LPlmyhEW2Z4yHW
 qhRZAJuQo4PSdbhb5fK0VJVKwaMTUftvRejlJ8kksr6DYEBKW2wvfuprQiucxjTmBXXo
 F78ShW9E9LdfcOjqvoY2hLjFBdUJ7hRCndtb8Ko6G+KsMa6Bqv4Y5tNyxRwzUcYQ0hD0
 mM2qsZHqZPZZRcz0eR2Mvj3Sd55REOmc+T7/QF8OixoCDhC9Hw+yr2GC1epp29KVPy9k
 Vf+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZKOJ5E+C
Subject: [Buildroot] [PATCH 07/17] board/mender: use partition-type-uuid
 "root-x86-64"
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
 board/mender/x86_64/genimage-efi.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/mender/x86_64/genimage-efi.cfg b/board/mender/x86_64/genimage-efi.cfg
index 9c2723d8fb11958414670e60445bd2a86157269f..1bce8673b7a309d5bfc421044e5f671710270e52 100644
--- a/board/mender/x86_64/genimage-efi.cfg
+++ b/board/mender/x86_64/genimage-efi.cfg
@@ -27,12 +27,12 @@ image disk.img {
 	}
 
 	partition roota {
-		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
+		partition-type-uuid = root-x86-64
 		image = "rootfs.ext2"
 	}
 
 	partition rootb {
-		partition-type-uuid = 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709
+		partition-type-uuid = root-x86-64
 		image = "rootfs.ext2"
 	}
 

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
