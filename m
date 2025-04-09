Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFFDC369A5
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AEFC413B5;
	Wed,  9 Apr 2025 20:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54i6LLqFw8Tn; Wed,  9 Apr 2025 20:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E4A3413A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4A3413A1;
	Wed,  9 Apr 2025 20:03:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D98E220
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E4E5403D7
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3umgvxNEVE-P for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C3E7405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C3E7405A3
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C3E7405A3
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so5647116f8f.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229027; x=1744833827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XJb8Q6f0+m2pKvKmGd8Ytog3ZQ/BEQ6Hb1NYSLdJJxQ=;
 b=lWnHrjpUo/I2WPlNCaym+edPM7B2tGHHHMhv4xFWE+ZeeFel6JomHFAOsu6tMGZrbk
 ySQWwul1hZCbTJmNfDOUGA4vhP7REb6SDaLiHzv0xDyoj4N8tzT7PddetxbKoZ9MShg6
 MVDEIuKUAHJprpRFV04y6V1FedzUZdetIYG+e9qXKte2qAIy7duSZ/xxT/FkDN9QiN7r
 TUu3/VWeuWYzJpiHqpq7ZZTgAtkZmQgNj1bHM6ntirsj/5c4IbCZxC2wndiPsf1sBpbr
 9/jdE76CLn84ow7EwSSxgEAbSTcxA8lqcFA8KtrCK4qWNCImYhxD3nyWWNeViW/84+ui
 m2Mg==
X-Gm-Message-State: AOJu0YyC+9IyqXgp452eohSPUCD+eOpEyvwBXYZAbYigVqpbcYLVYJsO
 PQKi/KjzEQ3WBTW4GdBXosXNMpJfczRV01IQmPhIkaQKocfM29z+kuiB1g==
X-Gm-Gg: ASbGncs9ayukDm318ClnULGljhbCUBOX+Y/zcVZy/P4yhkD1Mq1eoywLuWXImSS4hwq
 BjxaR7+ERC1NbNXaimAEJMgOul5a684DsCd+eP1pPxvhLo1XHL5QiMh6YTtNhEioCyy5VcI45eh
 1/UiTU6KjCAbGsq3nou9NRnHi+420cM8CIPYngwnE6IzIODkxoDkkhc8xex410VTRJWy7/o/+2e
 CplNb7e0VPvdT79jDxAOTpsKK+JIX9HjUcfXc+NgwasWUlsjxlPTnc8viUaS0dQbVbhhXP3ueLJ
 UHdAAAqfUc/fNSm/gWeDfEMdz/PLxFEafxhn3fEoD3W5vlFkzB4=
X-Google-Smtp-Source: AGHT+IHqRg/MS+ldBOYa5RIukrxduqH2VCoJ0DxLp0A2sLBMfbbXn/DmYP7uL/XmFYrKXDjM+7XufQ==
X-Received: by 2002:a5d:5f8d:0:b0:39c:1429:fa57 with SMTP id
 ffacd0b85a97d-39d8f270718mr84017f8f.3.1744229026568; 
 Wed, 09 Apr 2025 13:03:46 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:46 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:19 +0200
Message-ID: <e5e3726c8667b4f1dd72f72a7071389ddfe76df5.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229027; x=1744833827; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJb8Q6f0+m2pKvKmGd8Ytog3ZQ/BEQ6Hb1NYSLdJJxQ=;
 b=NVgL9jsVPq1cbq3agwkBHg4A/EzELGZ7JN+NjPYHDCvd7QrD64us5E0lz9ecqRZDzC
 Xh1LsXD9gEjoTV+Ev8ofgaNCxW8TcNXxwulpDOWXqF+coKGUeOP0SHq9oWfrwMEHY5LT
 zl1gAmG3o6DtaMYn+ujqAD5AN3BwveAT7X3jwtm0nzLOQKHIQp35S48iaKCD1FDvxnsj
 ch4/T8Dz73xjTlem1m5Qt9Xc/fLV4jT/ngZyr5nt5YVZ6o7xbsNiqPLvOvMnKOZR5QSV
 qtkziKOT54xHZlGD4PBhac0QgtWEHtE2mE3HreZy8lsETtIp0GY0vGiH2a8w2tJSsX9t
 wHUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NVgL9jsV
Subject: [Buildroot] [PATCH 04/29 v2] package/liberation: ensure at least
 one typeface is installed
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

It is curently possible to enable liberation, but disable all the
typefaces it would install, which does not make much sense.

Ensure that, when liberation is enabled, at least one typeface is
installed.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/liberation/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/liberation/Config.in b/package/liberation/Config.in
index 8d6b3e78d9..18ad7044a5 100644
--- a/package/liberation/Config.in
+++ b/package/liberation/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBERATION
 	bool "Liberation (Free fonts)"
+	select BR2_PACKAGE_LIBERATION_MONO if !BR2_PACKAGE_LIBERATION_HAS_FONT
 	help
 	  The Liberation Fonts are intended to be replacements for the
 	  three most commonly used fonts on Microsoft systems:
@@ -9,6 +10,9 @@ config BR2_PACKAGE_LIBERATION
 
 if BR2_PACKAGE_LIBERATION
 
+config BR2_PACKAGE_LIBERATION_HAS_FONT
+	bool
+
 config BR2_PACKAGE_LIBERATION_MONO
 	bool "mono fonts"
 	default y
@@ -16,9 +20,11 @@ config BR2_PACKAGE_LIBERATION_MONO
 config BR2_PACKAGE_LIBERATION_SANS
 	bool "sans fonts"
 	default y
+	select BR2_PACKAGE_LIBERATION_HAS_FONT
 
 config BR2_PACKAGE_LIBERATION_SERIF
 	bool "serif fonts"
 	default y
+	select BR2_PACKAGE_LIBERATION_HAS_FONT
 
 endif
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
