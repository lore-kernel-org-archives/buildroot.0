Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B131C282C6
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 19:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAAE401EF;
	Mon,  3 Mar 2025 19:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oipd8jZ1vAdi; Mon,  3 Mar 2025 19:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C35C640072
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C35C640072;
	Mon,  3 Mar 2025 19:38:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F2D6944
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F315D4010A
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMpateoFUuvQ for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 19:38:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com;
 envelope-from=pargue@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D129740072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D129740072
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D129740072
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 19:38:35 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-472049c72afso50850631cf.2
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 11:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741030714; x=1741635514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUR3U39FI13JWoSsCYKKcPTVSKw2beIInz6P+7/8bvA=;
 b=W6HF40enAxUQKtuLKVfT4S8XE+TLEPqNzqzf0Dh34laxMNDVmgRfjq9c5rVk0kNZPE
 ttSdNFloRzx5xNw14sqmGJ8zQxXS5I73Tb2eQgwqJGhGyuQBZO0D8R0Pr/eUazlml3zi
 oD4bIQtrmDNMGMatX5BCrn7oG3103COoi6FLqPIPFruoP3pWADgYSjPO43mtaafIJHj1
 UUxNrXxMKNZ7KQLpFSC4swj52i39hV/3OC4NnE1CLsuIrlW5BQqQ9Q8OtUKrCOwviM8v
 YOZxRJCki6tgWFYuCoBRpokZab3qhMnX3EFlf7zU0lNPlYdHQVNcvfHjLkJaebJnWkx0
 gZIQ==
X-Gm-Message-State: AOJu0YwPkFAI9P5ZCFKMH1coR0ZpoJKsovPv8LaQ/3GzUn3p2cNv5dRu
 RmUV8bY0G1cy1jmBXe0QgZ0xGTyRGjReArCkwySAqZo8XsTmzMCaQyg97LdG
X-Gm-Gg: ASbGncsmvk8gA5h+rOeBHkB5ucSOLvCRso6LOAESw6B0OS2GGorrPmYkYl0OcMULP7N
 FHaSNQbbLOQhXwB6MvLCQSjxG64bl1VjiA6eslxVSnJ4LhejRt7p/hBV270KtILG3sZFTNJBGDW
 YZ3OAQKaZoUBq50KeKPlldctvxhMVlMKCzvKOcCkQsdl5CrKjTgjqxzwKJfXsI8kJpUUp6jMxct
 tyOiBM0Ro9uFsCoh5zwaqzNPmE/1tokq34hzzaz3eUUPZPPOI2N/CHAce7+4b4BRF2bD/JtnVTc
 MS7JHvQBEweG1HU3DE86TXWlIH+2kBOSpvmEHtDnN3M=
X-Google-Smtp-Source: AGHT+IGFMCbQPFeRTWOdWc9OaL9mITnVa7aC3xHH95bO+usskQ+MPp7DAHXxhdpXLKfFfBEf6Fbmxg==
X-Received: by 2002:a05:622a:1654:b0:474:ef16:2afa with SMTP id
 d75a77b69052e-474ef162e38mr60032391cf.35.1741030714199; 
 Mon, 03 Mar 2025 11:38:34 -0800 (PST)
Received: from US38Q1RG3.. ([2601:249:4480:40b0:111e:4a69:d9c2:f00d])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-474de7bf0a3sm20572381cf.35.2025.03.03.11.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 11:38:33 -0800 (PST)
From: Paul Argue <pargue@gmail.com>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Paul Argue <pargue@gmail.com>
Date: Mon,  3 Mar 2025 14:38:12 -0500
Message-ID: <20250303193812.2501444-3-pargue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303193812.2501444-1-pargue@gmail.com>
References: <20250303193812.2501444-1-pargue@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741030714; x=1741635514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUR3U39FI13JWoSsCYKKcPTVSKw2beIInz6P+7/8bvA=;
 b=A2Da8p38DzQPaqkGvyBEpwfoNxIahWfxvpzpdrLCT1Em4RYkn6KMvJ0i1XAaMX31Y2
 Zo+42cLMYt7AlWTJ3hgj6+cmTyiVoC3BLNTETUS3taOud4AF8eyvuica+TIqv78ywZhU
 IyF5x5FpL61seN/9hS/ch/Dxdgk2FuFFQKQV5TMRN3GPl3BIpmuQxZ9RJYSCrVPqb87p
 Ftb7HUQ9FjF9xFQAhsxAcF5oculH9tWSCgAp1r6hthF7sNTGyuIknmwnQYazOl8mNgvo
 EgKVfWRLzSIxpfpUImKFiliXOM0+uZ7jN/xpaXNb+3iRBbMhrcZS8zr9YaQ4gAo8rhfm
 VzLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A2Da8p38
Subject: [Buildroot] [PATCH 2024.02.x 3/3] package/libxcrypt: bump version
 to 4.4.38
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

From: Akhilesh Nema <nemaakhilesh@gmail.com>

Release notes:
https://github.com/besser82/libxcrypt/releases/tag/v4.4.38
https://github.com/besser82/libxcrypt/releases/tag/v4.4.37

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Paul Argue <pargue@gmail.com>
---
 package/libxcrypt/libxcrypt.hash | 4 ++--
 package/libxcrypt/libxcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxcrypt/libxcrypt.hash b/package/libxcrypt/libxcrypt.hash
index 9bcf119077..88abb79ee0 100644
--- a/package/libxcrypt/libxcrypt.hash
+++ b/package/libxcrypt/libxcrypt.hash
@@ -1,5 +1,5 @@
-# From https://github.com/besser82/libxcrypt/releases/download/v4.4.36/libxcrypt-4.4.36.tar.xz.sha256sum
-sha256  e5e1f4caee0a01de2aee26e3138807d6d3ca2b8e67287966d1fefd65e1fd8943  libxcrypt-4.4.36.tar.xz
+# From https://github.com/besser82/libxcrypt/releases/download/v4.4.38/libxcrypt-4.4.38.tar.xz.sha256sum
+sha256  80304b9c306ea799327f01d9a7549bdb28317789182631f1b54f4511b4206dd6  libxcrypt-4.4.38.tar.xz
 
 # Locally calculated
 sha256  f9b48b0bc67a92b752780710aa774cf08b62ec2ebaa3f4aebd00069fba6effd2  LICENSING
diff --git a/package/libxcrypt/libxcrypt.mk b/package/libxcrypt/libxcrypt.mk
index 60901988ac..c2b2ed3e4a 100644
--- a/package/libxcrypt/libxcrypt.mk
+++ b/package/libxcrypt/libxcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCRYPT_VERSION = 4.4.36
+LIBXCRYPT_VERSION = 4.4.38
 LIBXCRYPT_SITE = https://github.com/besser82/libxcrypt/releases/download/v$(LIBXCRYPT_VERSION)
 LIBXCRYPT_SOURCE = libxcrypt-$(LIBXCRYPT_VERSION).tar.xz
 LIBXCRYPT_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
