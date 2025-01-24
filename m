Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A88C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637F0408C4;
	Fri, 24 Jan 2025 19:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v3Stu5x8zhHJ; Fri, 24 Jan 2025 19:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0A542969
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D0A542969;
	Fri, 24 Jan 2025 19:05:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE423944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A5BC42994
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2zNqbH_sb9u for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7669742969
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7669742969
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7669742969
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:05:01 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a8165cfae8so6773745ab.0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:05:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737745500; x=1738350300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ad1e9V/2UzjYz0QevgdRW9rbMeZWQrAg4KtzeDZgKE=;
 b=vkxqeTe1dPRO3LJ3MU3wtGz2/rXdg+iTLuAQdH3szvFA6gII1tLAj7bD9cBubP5vt4
 O9EG5xRML0bnQZT6ZB60Tokk29TidoP7G69ptOIg5ZEGnkyCcDs+pS5fwxdOSmp2OcDd
 lesIVa2lKQ+UVRlyw7wgZow/j8a0fHSkxhkekvOL5ruhlGDeyvLWl6siNLmvP2li1jX3
 hAH78TfCRTcE3N7cgTriii5plutsT60LLD2Y9AbwOrZsI+ndyl/Yxe/Fw7P1/iZbeAam
 c6PDLIxgjF73YEH+Z+7CPBelBOYBOccyb4+ivY6+md8MYl/R2ixoAW12ggat0vRjfQ0A
 jY+Q==
X-Gm-Message-State: AOJu0YxBKPYKpKIDMBayUPu4CDdN5IjFbEARQ6dXYCwoQ5senB504QNv
 gVQ7olz69ayMGyZsHACFggeKwHpqMwu7QqMNeH1eUqkaV1pulohyHmTlrv6a
X-Gm-Gg: ASbGncsEvCxqof8JhsdkNGmU2B9UC9mopakHs8oetfFxjnsXeXL0ZrShXmCpYOXWXvm
 tK6lS6SUCDOzsAx5CYQe28CskgSJi5YUkLv3pGOcoLinjcAo/frgLqzZpiNdLF0gfvFIEKI8a8j
 h+nRwsjA1bg3f54hZoqul8a7pP3KlU3Wcuz4hz78QDHl4me4fS6Cas4JyB6T/vxuLbMwdobHmi+
 YsOmjKx8RjAe8O1K/nuWEg3rCwkIeCEgtBrj7v+jG9+f+0wJdCchxoAA6YXTBElewzjrK6aSoXP
 GtdL0lhfD9DxWWYjrRu1G/CHE3+1v8/7RCaORyX+G0fgf55mIpa6BrQ=
X-Google-Smtp-Source: AGHT+IEIZKZkXPDHIgm4kHPjUwNEolV5C0pyR0Kp1hqFzxT3ZuTbZtryihlBCW5XZNcaWT/4GSOsEg==
X-Received: by 2002:a05:6e02:248d:b0:3ce:5a7c:6b5d with SMTP id
 e9e14a558f8ab-3cf743aba4amr287739625ab.2.1737745500101; 
 Fri, 24 Jan 2025 11:05:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db86375sm788759173.128.2025.01.24.11.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:04:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:04:57 -0700
Message-Id: <20250124190457.3803080-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737745500; x=1738350300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ad1e9V/2UzjYz0QevgdRW9rbMeZWQrAg4KtzeDZgKE=;
 b=IYgE1scwzDc5rShjAf5PRuR3dZzwCUoPFba7ZGPGHZZqra04BK/kI2/QQ4WKWMrh3J
 071hSAv62IiN+B5Fru8aF5CeJ4n8yGiWPbafRcLta2cf5L3uBARkfIwaB3w56wZ9RnVH
 nokIR9EYT07byV9dJnLTUUNzmnqYwpxL3xwiinvuDfEVcxUWlNclsxKRyO3sNskbZgXh
 9OQIaF6vd/r0U0ahZYv42/VveEGTol1Ye7TW0EbBClHlIeK5c4ImPlVwBAjWrUzO9zsR
 r6G/cmwPAh9rujulMIFnlfgtyXm9Eq1t45v0PeSerPWkfcaAgN9HOzBeaJ4iX9UwxHV8
 zVRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IYgE1scw
Subject: [Buildroot] [PATCH 1/1] package/python-google-auth: bump to version
 2.38.0
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
 package/python-google-auth/python-google-auth.hash | 4 ++--
 package/python-google-auth/python-google-auth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
index d71c3e36f3..fce6a5a8a7 100644
--- a/package/python-google-auth/python-google-auth.hash
+++ b/package/python-google-auth/python-google-auth.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-auth/json
-md5  db93ac3219d6a9b7ecc34f46637349e9  google_auth-2.37.0.tar.gz
-sha256  0054623abf1f9c83492c63d3f47e77f0a544caa3d40b2d98e099a611c2dd5d00  google_auth-2.37.0.tar.gz
+md5  6f04dcdfb0efe90e956fea82408b7fee  google_auth-2.38.0.tar.gz
+sha256  8285113607d3b80a3f1543b75962447ba8a09fe85783432a784fdeef6ac094c4  google_auth-2.38.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
index 5925820995..1a6ad01378 100644
--- a/package/python-google-auth/python-google-auth.mk
+++ b/package/python-google-auth/python-google-auth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_AUTH_VERSION = 2.37.0
+PYTHON_GOOGLE_AUTH_VERSION = 2.38.0
 PYTHON_GOOGLE_AUTH_SOURCE = google_auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
-PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/46/af/b25763b9d35dfc2c6f9c3ec34d8d3f1ba760af3a7b7e8d5c5f0579522c45
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/c6/eb/d504ba1daf190af6b204a9d4714d457462b486043744901a6eeea711f913
 PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
 PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
