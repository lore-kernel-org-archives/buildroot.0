Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3B4C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 14:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C995811BA;
	Sun, 26 Jan 2025 14:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdCTmraC5sXH; Sun, 26 Jan 2025 14:21:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E7CB811C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E7CB811C0;
	Sun, 26 Jan 2025 14:21:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61C2994A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58D664076E
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cmmn9czOLoKP for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 14:20:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 311614076A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 311614076A
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 311614076A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:20:59 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-852050432a8so95085939f.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 06:20:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737901257; x=1738506057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0KyaEO31yoOQZDFI53ju2GriMmPLdL5bPtr+PBaOMg8=;
 b=wGbmiy+8hzZP/9aXmVN0sBgiWSDvxELi5Lj4W1VmkZetdG5IIlVXotQk1qqoWrNOoM
 f7I1yEGmIXi4DrMwNV1DDKkHZR+JWrv9/mR6S+t/0QFIYMbj23AyYtvQnh4fuxU6rBRc
 6d+YwNegOlqVyLqmQ/X/nyVPKywyifj5dfEfRw7I9pI+XImo72FTHQ+WAiT4id5mcCWJ
 Wsoq4zBZA0az4YyuhaB2A0Wr8LBZUrZBHIsmWtZ/XGGI25YbGGkdSbmxQslfsPp2YGYy
 ejNHoqnho/h4J0zn0SA188m4WIibCu5KIB7k4JhfXAAGaKkXsLA90O2gTu6HOl0hE5iz
 lbAQ==
X-Gm-Message-State: AOJu0YzR8GSPn7xbGVn1Jd4E25wbwrQZh6qdgkny42B/tV3hheSai+je
 sWSttl/aRdSG3EFC26zvjLATLU4h1pZrFz8boA6BNn5p/gu5dfPh6YwKuz2n
X-Gm-Gg: ASbGnct24h72mk1kwfh9aHlIW3VMLK+4802ak4QY7+Zah4fFaGK+DgpHhHULo8+SOny
 pw1cMTe4TyTnNeQIQ7gG/ObvJLBvooS8Ttl3LfgjqMM2MYstltm3yTieb6OUm8unugjsYlsX9oj
 h2wYawGJbU6LgU05HQBmTNjxQvjotO1/VC3eBvR0yMegveatlLvJwSaevfWNkkuOslCKS3LbbzW
 K1G6k2TrJaP+u5LGxD1s3Lm6iZlYHoBkGEWpO5c4N+xHwwmbPISNh4LwAdmmouUvHD5+s40EBKS
 7sJP/dUg3LNOKxlc13ZuAuX0cTjYqrx2ycivz4VeRszSK7TIVZv14Ew=
X-Google-Smtp-Source: AGHT+IF+8OWfALDehqX0R1JqBwpeubkRbiKB3Q22LVwO01LSwCYA9DM84ydYtIU5VEESEtoUJs11kw==
X-Received: by 2002:a05:6602:116:b0:844:2ef3:a95a with SMTP id
 ca18e2360f4ac-8521e399609mr828615239f.7.1737901257594; 
 Sun, 26 Jan 2025 06:20:57 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da4b774sm2031120173.73.2025.01.26.06.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 06:20:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 07:20:54 -0700
Message-Id: <20250126142054.241262-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737901257; x=1738506057; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0KyaEO31yoOQZDFI53ju2GriMmPLdL5bPtr+PBaOMg8=;
 b=Me49e9MMQ8uXVlgEHXM5RGyRyqz6TYQS0risW9pnfnJBj9Eq2/HrYhSsykrCzUWQsF
 TbHo7mys+wIhWZ8IvYpoMOPzlGRMY1BavmTLNVUhINr2eEvGVobegWJIxOIj88yGrn8h
 p0h0a2VHVolreTYWTasUjNVdxy+D/MGgV1pEm9UBmGuAY8hyBLJbzZq2YobBnLzEg3Yu
 4Ur+L+/fr+FZpD/Yg+QfYEePDxM6rYQY2U32rztJKxGjdlyyJ5WqxfFu3NJYbA15hggI
 Fu7OToRhDxzLq0MBhz0jdTCxpqpHUh8xZcGKM728M54tGamHeq+ti/A/R22gSLigbTl4
 fS4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Me49e9MM
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.55.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 8d674490a8..d30b100d51 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  594a6c4d008aa227f0bc38ddcd121722  fonttools-4.55.5.tar.gz
-sha256  87afe2a1e81a55131bbae66f3f1718b1faee3218b1261abce036d7d189094c36  fonttools-4.55.5.tar.gz
+md5  00d1463e65eaff5bcb73e36272ff05a3  fonttools-4.55.6.tar.gz
+sha256  1beb4647a0df5ceaea48015656525eb8081af226fe96554089fd3b274d239ef0  fonttools-4.55.6.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index ca8ba46d76..7a1c9fedf2 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.55.5
+PYTHON_FONTTOOLS_VERSION = 4.55.6
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/8b/d0/6a515b1587f2fe3540429120b20c674687e6f5fdd7dbd114f0fca224294b
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/49/2e/0b11e907b90665253dbad425479e874e38a9e81ced397a4e3312b9116935
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
