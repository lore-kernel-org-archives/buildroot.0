Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C88ACF6480
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 21:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739348065D;
	Wed, 19 Nov 2025 21:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id froSizlJAwuM; Wed, 19 Nov 2025 21:34:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A2BA80680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A2BA80680;
	Wed, 19 Nov 2025 21:34:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CEBD2A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E66FC412B5
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMBE6i2Rm-Pq for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 21:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 421AB411A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 421AB411A5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 421AB411A5
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 21:34:26 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-477632b0621so1406445e9.2
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 13:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763588064; x=1764192864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4pfFkWhZK/Yd1YmH9MTnqNvuhk9GQ7wfXto0WdmUddw=;
 b=IJiIptIWK3wCYHrKUkBRrLODCoer/AtdHQ+FzOvDBth+ISg35Bq6DGgT32FUE5kBP8
 eOt1CmEbkg4/ezQqXGEeU2yv+GLdCDOyLFkdLTSrp6jqYTjcIz8TxMH1/MXCH/dZcDMy
 5tVs1LYNTMZQZnq02pGdHv5L1oQH/TGEJwN+MirsILfKJ1yinkS1S8yV7Qc8vj0ESufK
 wawT6WrSMaA61XTSD5VNnDQnwmN4Qu2OX3B4PObnfPj9GNpEO/8HT29Y9jlDixcayi3Q
 Y7fj1Ysq2ydEC7U3FNlNZIRBONQwp8HdO3usFmxJZH89jy+1OkTrD5PeW2jdVFTbSKFA
 H2PQ==
X-Gm-Message-State: AOJu0Yx9hUf3JSUr7IBbP6WZzKL2nRvyIKcDntO3hr05Tn48DJf3ZMTV
 eZ6PUVZRnprVLyxntCr5N+lEZKdA8waFGbFLlfaUdayT5fmYlcgJH7pJRsVPXioqoPQpD4J1gYz
 VYbOzUzg=
X-Gm-Gg: ASbGncuVfm30YYqSEyDqOq/x5kpgNlCv0RqFETpxtGTcM7G3syP9OPhc02AvJTLUs/2
 1aO6iTouRQ8N43z+it+mnC8Jf05sYeuzkv5OB6cvWdyykRB6BzDTiLkTTQ2QgvM8bV3t7VjVb1U
 60oF4Bv6lAsLaPZyQRNViQK8Ivj0tmdKmNoZxu924eH+9Ga4sDIJntuII+Am1zgJW23sNI5lYcW
 83s9eT03/QyuvFEI/Kdt493YMFFHr3hip2vPm0/zXPWDwHQmnMrh6yBJCkjMpijJ/5BN5EX3oTi
 YZRaSD1bxdkc2dmjVdA/GTCYv9l5AG9+mo/g5KsI/67HPfvIa6IJam4MBesETVlPyAHtpJzmYw5
 4UGhc5rnAPFSRYikeM2/wN48xQculkMt2WeaAAWZssOew8IVvbUHB1ez41Lrow/t5G4RuWh6l6G
 kyaS5mY7UTKnL1bh8jjxOidbNRb+7HfvW2KC6EUE8gJYQrhNQh7PGbr0x9xg==
X-Google-Smtp-Source: AGHT+IELnAz65OeZad6ExgcuMvGRm1A/EIG+XsFKkpVW6nzGFDrr1Yc+OEvKuh6Z7PLdwTEiQtvX9w==
X-Received: by 2002:a05:600c:1d1d:b0:477:9d54:58d7 with SMTP id
 5b1f17b1804b1-477b8a9c3f8mr5907635e9.29.1763588064114; 
 Wed, 19 Nov 2025 13:34:24 -0800 (PST)
Received: from arch (77.109.92.201.static.edpnet.net. [77.109.92.201])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b106a9b0sm71362905e9.11.2025.11.19.13.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 13:34:23 -0800 (PST)
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Thomas Perale <thomas.perale@mind.be>
Date: Wed, 19 Nov 2025 22:34:19 +0100
Message-ID: <20251119213420.7480-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119213420.7480-1-thomas.perale@mind.be>
References: <20251119213420.7480-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1763588064; x=1764192864; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pfFkWhZK/Yd1YmH9MTnqNvuhk9GQ7wfXto0WdmUddw=;
 b=dM3IsIbbDhO2x5YEfmCuR5ZOVEew+MFulAVdceGPIaBI5e/uD//DEIzSEwho6GI0tK
 Aa9M0m0cIizPJrUrWOppRXnL7TfOfj6/VIFVnlUzLxXhE/qewpBAkc9ZNtB5ep+MbSwY
 Sv2QdHo4HRHVRW8md/pPkOs+7Pw1kgEllQfh4zrBGWtQGTMmSshCoDXQRL8bPjDX+6S0
 LazEsBgOQX1Pa/ExEocE0/rvGgmqgg8rZcdXO1rnRmZxH5qdocQ203un9pb2OOS7gk5t
 8t3j5P8wktVzu+aj5aHJaSyJMS/94V/1/OYTMXSWnJ7dkdtGALnAr1j6uUaynmOjLAld
 D4Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dM3IsIbb
Subject: [Buildroot] [PATCH v2 3/4] DEVELOPERS: add Thomas Perale to
 cve-check & cve.py
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 47fe1f467e..360e65a94a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3200,6 +3200,8 @@ F:	package/xorcurses/
 N:	Thomas Perale <thomas.perale@mind.be>
 F:	package/go/
 F:	utils/generate-cyclonedx
+F:	support/scripts/cve-check
+F:	support/scripts/cve.py
 
 N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
