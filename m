Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D5AD5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EBCF6078B;
	Sat,  9 Nov 2024 22:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yY50tkLX1v3l; Sat,  9 Nov 2024 22:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F28F6078E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F28F6078E;
	Sat,  9 Nov 2024 22:16:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7E34D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA2D16072B
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P3cMoSGRNTCo for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 014EA6072C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 014EA6072C
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 014EA6072C
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:41 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a3f8543f5eso12625645ab.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190601; x=1731795401;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nGj9u6iwiT0dyhtK+Y1TH0qb9Idcr4FZlqXYHSgtlR8=;
 b=stWWdBrSzh9B9TCnzFOwc8fZJ64N3ILiI69J0iCUQBTk7fFEGSSuD6pQ23tllHIt3W
 n5siXczr1W/cY1WSf9F+v4KwvZ0p7NZqXyew7dTQxlUrZd1wppbL7wJFcnfem1oMu+Ev
 bLSzi13T73TcvyA/zGnhCV9QBZgxQWUDGMwftQRCjhkHJK+jwm1+/UlcTUIJZXwQ15a0
 p8pw7bM3DlsITXgd1IOZmvv/ipwkebox7eRBZqm6djAqnV0sRcH3gl0epgFPkhnYhyv4
 4V2WUofjq+KnRXVvJOTUJRCqNMhstyYcd+AFs+qvZ5S6Wtl8WX5TSi8rATQ7Qjf+8KGo
 C5Tw==
X-Gm-Message-State: AOJu0YwqPOb1l+GA4k9h5MHTz4S5O0ghG7XZQtmyTCSaQn3EnrDj0klE
 GBKLXwfXWYH+kQhuvwt9okcFLHSHURwUl2RWdfaxzUsZLKpFtISt
X-Google-Smtp-Source: AGHT+IFjuJ6lQQF5eF1Pv3ulXEISo1a/eTnSgBcIYA+L2yooYp4dGi5GHa7o7dWKi8PiaDnU5uVYFg==
X-Received: by 2002:a05:6e02:18cc:b0:3a6:be9a:2144 with SMTP id
 e9e14a558f8ab-3a6f254c63dmr72856625ab.11.1731190600898; 
 Sat, 09 Nov 2024 14:16:40 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9821199sm5307865ab.14.2024.11.09.14.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:40 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:27 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-13-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190601; x=1731795401; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nGj9u6iwiT0dyhtK+Y1TH0qb9Idcr4FZlqXYHSgtlR8=;
 b=QBFtig4cV5srt/gRi39mPE34zuHv2VeamHaDcaHIMuZcfOymmCW+hrnAS8YDvQas/N
 SSJA+OLOop+8WpZp41aLqNpmghmA2lq4IOtcJ2WP3hPXz1oc31ms6ODNHKHdFnxnfFYI
 6eiVIOkML+XBNcOD0uQykF9Asu9dhHAztIgXKdG4LI41yOwIQFy91WzZTrivw08xsYsL
 sNQ8CfDWh3W+qTAAOHZ3jIx+UZNx89yFqcBXi3NJROVzL6d+LsgLzMQyhTGfgm0xuylq
 +dfRJVdeFrgXXlHkEVEMix8a3eGjbGEZllinwuO/56gu42emP/Xu55w+BZY1Ys8BJAYx
 iGkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QBFtig4c
Subject: [Buildroot] [PATCH 13/17] board/pine64: use partition-type-uuid
 "root-arm64"
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
 board/pine64/rockpro64/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pine64/rockpro64/genimage.cfg b/board/pine64/rockpro64/genimage.cfg
index 94fa2f7c0601d1cfd4989fcdec87f6b742ff396a..dbbc7e581e78039e2fe61797f060755643ba426e 100644
--- a/board/pine64/rockpro64/genimage.cfg
+++ b/board/pine64/rockpro64/genimage.cfg
@@ -33,7 +33,7 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = root-arm64
 		image = "rootfs.ext4"
 	}
 }

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
