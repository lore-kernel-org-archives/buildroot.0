Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DB8C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 11:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209A54074B;
	Fri, 24 Jan 2025 11:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwiRwaSGa8VJ; Fri, 24 Jan 2025 11:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAA324081E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAA324081E;
	Fri, 24 Jan 2025 11:34:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9B2594A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C75EB81761
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:34:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PoyFVRKgudcK for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 11:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D13E4817B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D13E4817B5
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D13E4817B5
 for <buildroot@busybox.net>; Fri, 24 Jan 2025 11:34:38 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so1117921f8f.1
 for <buildroot@busybox.net>; Fri, 24 Jan 2025 03:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737718476; x=1738323276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XaJPTlArJo/z8XzajP7/B2GqhUJJp9JOnnHbgMJ3sVU=;
 b=GseDO/3KKgr07At3kus8uGSWahaMs6ud1KkpQPYOsClpsLriTuAnlYsyPcAYBVzGY6
 5MOjk6xmniIk9slt0KpPZWmjZf4gZyj0BcUie2LzcnBKjLwO1XyIjmdNPwg5MKl7Hm+0
 O8+C1vnXgGY4x5clNO6qdn48mSxV5hHqwIbruYwVxinprw/aa7zdKYDWPDbGPcqQWwXS
 C4ztiMmWzojdgwbFhb4mDGbJb7wFRpT1zOoksQTKTbiuMjjyh37Buk+3ZEyCxD+LZDa7
 wAVKy3DQ8mRcocb7/w9gB926NHju6oboccq30ynzZtFBZmPvSKoYEJ8fRA9/ZDUdQA90
 8lJg==
X-Gm-Message-State: AOJu0YzqDcj2mzOlFI4YYGdQtKmemWSnwNxJn5bhC7ve7E05pBDNawv3
 eIoEZBW1pviuJtxz1nR0JZ54S3VHdfdiJJf+cAIRCy83en8fmkkh3w1lP/Tl+AbbIqLclgZRV9l
 Mng==
X-Gm-Gg: ASbGncuXJRpB+QS1JRxvoYYC/7WzLqaflYJ/bu+34piM8nTagxrlbgLRjnPwMC4qXK9
 eaZs6jbGUJOCoButfkqgI+nFr6mW/LTatHKwWkRR6mhKSSgFhJs3RfI58jERAYAef9zxYN65mk+
 ebzqCquaPwvJ1lWl/EkB0uAhXEy68SBK3jJZNasnjdLn98tYIt6QDR42M8bi3Fl1s1Vv+7G3iGr
 HlKEJCKhJbvVyVHGVua6f3/qfz8PHSKilyTMNIhtuKkSGr2KYnXGaCVFvSBYMjiAmhHYEE8+fK3
 bKyS1wuumvK6ax3YcF2k0bazbTHNnSiqUGPgF7I=
X-Google-Smtp-Source: AGHT+IEKoA2r1uRr5gi2rImDiL+0+jznOoVqRc9aswydvXSp7EJvVOgBdyvaMKzH83gPyJQn2zU5Kw==
X-Received: by 2002:adf:e005:0:b0:38a:41f8:8abf with SMTP id
 ffacd0b85a97d-38bf566d296mr20267563f8f.31.1737718476189; 
 Fri, 24 Jan 2025 03:34:36 -0800 (PST)
Received: from vm-2404.. (75.184.66.37.rev.sfr.net. [37.66.184.75])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d5easm2382668f8f.25.2025.01.24.03.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:34:35 -0800 (PST)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 24 Jan 2025 12:34:26 +0100
Message-ID: <20250124113428.2808219-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1737718476; x=1738323276; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XaJPTlArJo/z8XzajP7/B2GqhUJJp9JOnnHbgMJ3sVU=;
 b=G/SmNpYHxc62kcJxjRln5c7nkK3+5TO5O6Jkz1Mn0SQGgIj/Mmax78KonhW/sKswRg
 WP0p1wEYncmdAHyd+Pac9pQkf0BweLrGnnS5s/fwVBJsTlVlkzEExhAUioyxXJYhYxk/
 60R0TTGg4GH29soN+zmsOV4ZE4sG8PCsI467F12ckTEvzBHr1+LV0iVhrT7P7Dbp9j6T
 rU2xvgv8hDvSelBY3aTyBZmFbnTv9oATflJX1Bc2WUfzoJzXroHXtpkLj4rjaDv1E6dG
 a7NtIa6H9VjtKO78/zop3ySPX0J+Kt+oBYMGneuyqpd1IDglhxcUfj1GvavLk6y0jHtp
 Dv9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=G/SmNpYH
Subject: [Buildroot] [PATCH 1/2] package/lua-periphery: bump to version 2.4.2
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

diff LICENCE:
    - Copyright (c) 2014 vsergeev / Ivan (Vanya) A. Sergeev
    + Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-periphery/lua-periphery.hash | 4 ++--
 package/lua-periphery/lua-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
index d1331a489..666165616 100644
--- a/package/lua-periphery/lua-periphery.hash
+++ b/package/lua-periphery/lua-periphery.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  ff8a4d08f02356586fadfe47f01859ba28539cc42013836f79a032bf4ccc78b3  lua-periphery-1.1.1-1.src.rock
-sha256  7c60847b46f718e9651d1eca2f56bf6be09608cf08d130446a521eb8288c98e1  lua-periphery/LICENSE
+sha256  63694d795a630afcdb4812cb0af489ab088501ad7fe1dc9ee1337b53ff849721  lua-periphery-2.4.2-1.src.rock
+sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  lua-periphery/LICENSE
diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index af5abe70d..b9933a900 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_PERIPHERY_VERSION = 1.1.1-1
+LUA_PERIPHERY_VERSION = 2.4.2-1
 LUA_PERIPHERY_SUBDIR = lua-periphery
 LUA_PERIPHERY_LICENSE = MIT
 LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
