Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B10C021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1807503B9;
	Wed, 19 Feb 2025 08:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xa3R0eg2szhF; Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48333503BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48333503BB;
	Wed, 19 Feb 2025 08:50:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76170127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 543ED400F6
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2C2ZuPmhSBfU for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 239A44015E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 239A44015E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 239A44015E
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso40411895e9.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955044; x=1740559844;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UHIyxHLUiG4DaP/KwKHHINSe9ayvkx9LU+VWGogoIvA=;
 b=dizNuALzz5dJI34g+Ahw1gC+UDNz273sLTfoc3EOujsx9As7mKjz8U0c2lCJje8u5e
 vvJxUmSH3cLaH1p0A58Gqx2NbS8fhtd9eeTa6pQv7qbPGy8cACeIYadLMD7EuRqSlKjo
 lOKiheW2tL2qJ57eTX0yFmQEy97r8M9w9x/aO0gZ0KbXPjcrfhN7pt178rAG7uA/3TNW
 hfsjF6nwuA4AE7h8IKxv6TmXYL17HDsKoInSzJdjAe8FzIZcAev5EkyNbubDVQ7d0mSc
 7/RjeStLMObY/M1DHoDRCGF9h1WdDNHStBSx83pQtuxrZE+DBMcElTLiitjnWFtevwzi
 cV+Q==
X-Gm-Message-State: AOJu0YzXwBqJFKSqtp6hIbpWnMF60pZT1iLpMLdBnDXyerj4adCXFz50
 pz1Ni/QIVzsWLKabmOFIfbm3AN2WJU2iui8HvK7Uxzm4WUtFi8dDMFVqig==
X-Gm-Gg: ASbGncunGfoe17QDH8QwtwVEaaPQAK5CaBKQ6ZIkU20HceDZSLLh9sovHtqJcw0HWle
 /tveVwUQv0STqyH4GSdo7OQMTGza5GUmj3KyfY9fte2zT8TD+wrLAltfYVBY9SemrljgJ4JTyUR
 xegNtzwxXSgMu8mj4S/fZ49YteajdyB3DIU3Jd2gx4SGjrybK5IXz3E+XnSShjdPVxk+iVj/35U
 J8nSh5LgkpXDq65d4uI4BKOFnTyT+oP9X8DgnoK+IOam1cn2CBqCulN1tzjyVdK8yZZkZN+jTzw
 C0+r1dIgQryxPh9UV528pOzgrQ==
X-Google-Smtp-Source: AGHT+IF3CEVtVfoV4gNQDiwRMNjJLDQkH0mUXomsXhNYR7+6ZpdkeVkHTUQecbWTVTCyxEfmKmjxJg==
X-Received: by 2002:a05:6000:b12:b0:38d:e420:3984 with SMTP id
 ffacd0b85a97d-38f3406caa4mr15998020f8f.39.1739955043762; 
 Wed, 19 Feb 2025 00:50:43 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:43 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:17 +0100
Message-ID: <5c2c67cacfb6a62f7a130851d92a1863c0943fe8.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955044; x=1740559844; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHIyxHLUiG4DaP/KwKHHINSe9ayvkx9LU+VWGogoIvA=;
 b=KNp7vN59qHXpq9sWIVh0nAFE5/Rp39pZ+NxBlwTTntKHkKBurjus6CAxz7Z81AawH9
 UInaS0v1RFns7tu18egXxC6MWzJiULvNyajODqQNjZMV1EMVDvuBEugC7lp1KcEx88pE
 ENwjgzBdUaVsPMF6BCPG49p9kBE5J/oQLkViuaSiLN/wehw+6zJ7X7WjOqpn/gpGpoHJ
 3E9Wh71AbeT6mf9ifVmFQfgwoT+UK6G82COfNqUa3xcr4kRhcjLpVsMZdkkC4/PZxn0i
 gW9fulp77Q8uT5M9eK2VwBWagQE1khn56M/GzhECVLY1xMPZLtEjtSbqN9E/AFtxMMAx
 GDbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KNp7vN59
Subject: [Buildroot] [PATCH 02/27] package/dejavu: update homepage
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

The currently referenced homepage is a cyber-squatter. Switch to the new
official homepage.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dejavu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
index 5d21e56088..ca549d30e4 100644
--- a/package/dejavu/Config.in
+++ b/package/dejavu/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_DEJAVU
 	  maintaining the original look and feel through the process
 	  of collaborative development, under a Free license.
 
-	  http://dejavu-fonts.org
+	  https://dejavu-fonts.github.io/
 
 if BR2_PACKAGE_DEJAVU
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
