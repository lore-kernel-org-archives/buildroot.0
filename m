Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E5C02198
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 02:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76E8881E8D;
	Mon, 17 Feb 2025 02:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XH5Vq4ICE1VG; Mon, 17 Feb 2025 02:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D47881FAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D47881FAF;
	Mon, 17 Feb 2025 02:39:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C9D0DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65CF081FAF
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hw3fouUsNHwh for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 02:39:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58B8681E74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58B8681E74
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 58B8681E74
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 02:39:08 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6f88509dad2so33585207b3.3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 18:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739759946; x=1740364746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9m6+ebZAuFN/6wEVKzYkfONPY5aIkZOPmIdhL49lmd8=;
 b=LcYT854Wj9mcTUXhOLU1TZlwLYgGx9wzhR9XjgFBCV22vTYrOQMKDoXPgZ09Jc6WO1
 jGAzjAa/GGIeNtYCQ937z7fPja4FiisQ6EI2/i6M6qE2c/15SrzNnfwYO6dhV36s42xM
 FhNFwwzxBdzy00lsSFLlVvOkqRwcqSsQ645k4/C3BhiVQ4WmKnghMig8p8r/WgdDn3GT
 6zijkPAIlhG+ng/ypF3XofQ+bnJddjAh61D0/47z1ZiS09nLFfJZL6heMxMfP9mDffvI
 eZPRr0WsYOaE1oUi1x/LvmUg+0+keH4UoMKWFJcuSInZq7A0v4a98xa9VuytdZnHkx/T
 AJkw==
X-Gm-Message-State: AOJu0Yx9kQUIrN+P4aGlTcz+WGzcKp95S6kOr7H87FRcS2HsyxUjjby0
 lo39wKduly56wK6H2AmFQIt/DhXNZfJGBRkWgCzucFvUUQkqLyuR5PzMlA==
X-Gm-Gg: ASbGncvKYMLvPjvbMs0BLdlMtXrWvVKF5pk1sIZ5Yw7kfeMHz2JjIxR2bBg7gXwgcC2
 3+utk5mAD7AK7zRHagtD6PceWoScwkRP8+Jz/hRrayoFE2yg8FOXAnFNyJId8DHVxfkPP6QaY7H
 0e2CJT6Idd3zKx4jpYBkt756EBWMOTrR1RwCQCj4H0HMhN1jBaz1fsFntvgzrnpu0bCr97m7+4R
 mYsKNlQVLMlJ1HIJLHkEgI9jVw6LdGIBvZP6ZD88mQ6Oxb29QF5qnjEFBL7hR0J9EZbtb4gWRAO
 3jD3QluABw9o
X-Google-Smtp-Source: AGHT+IHVY0Q0fBuTlOtYB6gQ+eacEYO/QnI8cdNZjbwZy3zVa4Or9ko6rfH9vCoitugjqtodfN5K8Q==
X-Received: by 2002:a05:690c:6f8b:b0:6f9:a33a:4bf9 with SMTP id
 00721157ae682-6fb582758f1mr63593067b3.8.1739759946131; 
 Sun, 16 Feb 2025 18:39:06 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6fb47ab7a1asm13769297b3.72.2025.02.16.18.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 18:39:04 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 17 Feb 2025 10:38:32 +0800
Message-ID: <20250217023835.349770-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217023835.349770-1-fancp2007@gmail.com>
References: <20250217023835.349770-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739759946; x=1740364746; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9m6+ebZAuFN/6wEVKzYkfONPY5aIkZOPmIdhL49lmd8=;
 b=hBbOYxY9vH2RBozHjo7hGMkNbtM79bUBV23Rn3eCIhE9cl1CZ6Ag9hKfzr01SaowxA
 kBlq+XirDBfJvuV0QAI5LaNZAZ7AS/jrY5koVhUghuI73Jms+6STcbCTWpM0k9ovAdJy
 fHhJ9/kIPOEA2Fkj6UtkZud+s0TpXs95uRupWelGlXVp7wIa8jdXeFbpvOX5YpJERwoN
 LKtcH3xCHDw/5xNZHj5odAsbSgglLAA/K/b8/Q8x294NOc0FcxLD4C9kaZwLxmJwa0US
 MvADJp0wVOsVrBAmwsbrznoB6H5z+2QaMMScWmknmQ58HS01B+M5UJDoPCEY3PLWOmqR
 DObw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hBbOYxY9
Subject: [Buildroot] [PATCH 2/2] package/sqlite: fix build issue if C++ is
 not enabled since bump to 3.49.0
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

Buildroot commit [1] bumped sqlite to 3.49.0, and commit [2] fixed the
package infra. But if the toolchain does not have C++ support enabled,
the following error will occur.
  Error: failed to find: no

The reason was CXX has been set to 'no' in the package/Makefile.in file.
ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
TARGET_CONFIGURE_OPTS += CXX=no
endif

Then the autosetup script will look for a required path ('no' above),
and will exit with an error if not found.

To solve it, we can set CXX to 'false' instead of 'no', so that the
autosetup script will skip checking for a C++ compiler.

Fixes:
  https://autobuild.buildroot.org/?reason=sqlite-3.49.0

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/db85638cea3414ca0293cbbb2352e5b0b63a2579
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/a93680be30bc35f7d2465ef576035fb937ea1d64

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/sqlite/sqlite.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 255ddc937b..8016ff1c4c 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -65,7 +65,9 @@ endif
 SQLITE_CONF_ENV = CFLAGS="$(SQLITE_CFLAGS)" LDFLAGS="$(SQLITE_LDFLAGS)"
 
 define SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
+		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
+		$(SQLITE_CONF_ENV) ./configure \
 		--prefix=/usr \
 		--host="$(GNU_TARGET_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
@@ -87,7 +89,8 @@ define SQLITE_INSTALL_TARGET_CMDS
 endef
 
 define HOST_SQLITE_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_CONFIGURE_OPTS) $(SQLITE_CONF_ENV) ./configure \
+	(cd $(@D); $(HOST_CONFIGURE_OPTS) \
+		$(SQLITE_CONF_ENV) ./configure \
 		--prefix=/usr \
 		--host="$(GNU_HOST_NAME)" \
 		--build="$(GNU_HOST_NAME)" \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
