Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C63D5E386
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D2C60782;
	Sat,  9 Nov 2024 22:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T83Ft4JyLIcY; Sat,  9 Nov 2024 22:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C15F160785
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C15F160785;
	Sat,  9 Nov 2024 22:16:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47A51DAD
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DE75401C4
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_dr9OTApuA6 for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A1E0401CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1E0401CD
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A1E0401CD
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:40 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a6bcbd23c9so12737585ab.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190599; x=1731795399;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GRvCHFudHxlJxQ0SicQ4XLCqZ1vv4lyijeE1yKsl8Y8=;
 b=gZr8O3yLsqYVrghZv9G3aC8UusqHpzCLGYBMbMeK2iknllmpjeNGT/hi2jmVV6TR9e
 x6oZ0BLlmCQxwPIf9orWHEs513pk0L91rottdCkZobPYOS1PmLw3GXahO6N/z9+yi6ag
 8QRSLC6YIqwFexPe43sJqnaUYXJfO3WqagEQaSUCnX89zDtnvHflgyI3sPDPRiGdB3z1
 cqgXWSQ2p92f+jVLTFJN2tNwt51leUL5mzokeBJv+7RLkrp+krZsvm2+HHdwAQDA5bWt
 +Yx4IwTMDL87apOzxYyzbnBYJx6SYQL5FKk3pJEPr3Z8s3KY1PzWYO/ZIe7EubFPPVg+
 kUoA==
X-Gm-Message-State: AOJu0Yxvm3TsaAaxHWU2t8JFI+fAkTnsHtLDlrFvwXjDxgHsrMRn9eJY
 SIMEAgnuWyU2YE4IzSeWwtRJKPllbO+NaMz2EvyruEY7wMxbWnfrQJxXy/Ip+RA=
X-Google-Smtp-Source: AGHT+IGzwuEmXkVjykvrZKWb1PJtLVEV9fH1Y5KWE+Alrcwz9jHOXjUMHOI0ZoWKfK9ORRTfWDKnhA==
X-Received: by 2002:a92:d8c8:0:b0:3a4:e99a:cffc with SMTP id
 e9e14a558f8ab-3a6f1a481a8mr70982045ab.20.1731190599437; 
 Sat, 09 Nov 2024 14:16:39 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f987e088sm5478005ab.61.2024.11.09.14.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:38 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:26 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-12-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190599; x=1731795399; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GRvCHFudHxlJxQ0SicQ4XLCqZ1vv4lyijeE1yKsl8Y8=;
 b=m4zngSH8oYRibfh/OsL1cWjqQ7Ygs87YoLofk62uqU1BOY1wpVe3E6pMFHDiSH2Anl
 HdzPY+0ZQPS0A5yk7zCaDCNXPjmjRerik9YLrPsU1Cgg1eU0IqZj2xOWWDC2PsZRqt7f
 nQBGkv9Bm2YIzq5nS96B3yvKRZZxbQg/iw75SahJYZIaQWrSniSZw+KnhmC6+BG1R1vq
 GAVha+IfIVHLpwfjbkSgODRAeSNUhAvqdw7Wh4lI9CUT1Hf6hdKUHbNPsjX8LpWhwgP3
 iGaUutCIoJmzPVPOiZjXHdFbbyS65xu67UjWJc/2QE/8REXDOnkeG/W86c2ZLi4e1wYM
 oxlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=m4zngSH8
Subject: [Buildroot] [PATCH 12/17] board/arm: use partition-type-uuid
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
 board/arm/fvp-ebbr/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/arm/fvp-ebbr/genimage.cfg b/board/arm/fvp-ebbr/genimage.cfg
index 1ca8332b9cd005625a0dc60a3383b6284485a9f2..0d468953c131df43f87417473ea7be0f386df7bf 100644
--- a/board/arm/fvp-ebbr/genimage.cfg
+++ b/board/arm/fvp-ebbr/genimage.cfg
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
