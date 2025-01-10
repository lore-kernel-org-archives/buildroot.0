Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AE0E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FDBE410F7;
	Fri, 10 Jan 2025 19:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4ai8gQcdgh1; Fri, 10 Jan 2025 19:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DFAD4109B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DFAD4109B;
	Fri, 10 Jan 2025 19:54:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 318D976C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D3FF8379C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ER4AOSbynn23 for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5CD883131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5CD883131
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5CD883131
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so26329405e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538855; x=1737143655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qiDH6pqSJ+Nqt1g9NAK9gAUV5iQPLFT/nbErPhwlCMs=;
 b=N7b1FW3SQH440mjz4DfMh3Gj5J3JamGk1noC76psZbKwjZLXUC8zgwhvfcz6vVRqkn
 FpZ0h58k8WXFhrVqg9G+YdNW7AroF0CLCW/wlY0q/8DIsNr/wk7WiLhpQGNh5tmkI/pc
 w69StDR8uk/I0h0Su6Cuoy7+xgJbCz5S155A+9Jm7xXoHQl7b7+vIDuWetukanNYGb4w
 ieiIBm8soNQd9k38TwTWzXgIXAHUs8CGeyBUKeD49/nBXi2cj5O/E0n7DRE8rfQlbytN
 Au0lMq8xnX7990ya1iIkUIV03DbwOgTzMCzVT5bFbJTQbrwuN2y8gqY6izF3Gm8bwUvL
 v4UQ==
X-Gm-Message-State: AOJu0YxFdd4HQfgnu4UFXBQIHhS9nvo2kX9FhADr8JA/NEX7xdWBskUV
 +e6xXCFvNO+QNRLOTrZ032I828qe1yX7afPB2MEM/f+7rphPRbRxG6jsnrN7UrhrBK1MQea9UXj
 s
X-Gm-Gg: ASbGncumKpMMwN1uSO2mD7rccosDeoy2V2nBIS5qpSQZM3TiJGzceZIm+PJfSXcCdiK
 fu7e7p8ETAmSQnyEyeaDBB6ixaSOELK/aHIyy9VsLxhTGVYt1VjXvuZODslqu3SYfDcjavjjWLF
 jXBkxs34s/XjnRCG3C4lehcoGJKne81jkQSxGeMY437XREbnDK/E9dL+cf2cz8H+iQiF1YNwD9s
 MSIQje4/c7KDztaVS6joq7TU8LzzKJFo+1SP5DZgp1/e0fIF3LkJ1hYIcGrk8My3i0VqHoimSKA
 TNudvWInaYafnzJBc4slo42rVXMrvGet/Uuq/KOHhfGePniZMeKn9Q==
X-Google-Smtp-Source: AGHT+IEDUYN2MIqSyazoj/Y+o4FMaE3RiOsoDAwSvka3YDt+xoL84JEpw2Yzb/c6gGlR1BHh/9r3Lw==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id
 5b1f17b1804b1-436e25548e3mr3486525e9.0.1736538854684; 
 Fri, 10 Jan 2025 11:54:14 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:14 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 10 Jan 2025 20:53:56 +0100
Message-ID: <20250110195359.3358022-9-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538855; x=1737143655; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qiDH6pqSJ+Nqt1g9NAK9gAUV5iQPLFT/nbErPhwlCMs=;
 b=WuI5lQyLds4Awo5yo1NWt2iPbz0whKIGScFCDKCwypDfoVAIsbFvbCRu4d89g8GUE2
 fpuFSFUqDBBKqerL+xA+A5c+/c0DUArRXgRYSjRrKvC9txEXs+KmwuCIMyFT8cFxHxh9
 GFQPslmnsxu7yUKm/OOBPXrGd0qG86ATXpEaU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=WuI5lQyL
Subject: [Buildroot] [PATCH v2 09/12] toolchain: remove
 BR2_TOOLCHAIN_HAS_GCC_BUG_93847 (nios2 only)
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/asterisk/asterisk.mk | 4 ----
 package/git/git.mk           | 2 +-
 toolchain/Config.in          | 7 -------
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index e27aa2f760..7b99d30fd9 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -290,10 +290,6 @@ ASTERISK_MAKE_OPTS += OPTIMIZE=""
 
 ASTERISK_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),y)
-ASTERISK_CFLAGS += -O0
-endif
-
 ASTERISK_CONF_OPTS += CFLAGS="$(ASTERISK_CFLAGS)"
 
 # We want to install sample configuration files, too.
diff --git a/package/git/git.mk b/package/git/git.mk
index f56807a00f..bc17c9a993 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -66,7 +66,7 @@ endif
 
 GIT_CFLAGS = $(TARGET_CFLAGS)
 
-ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93847),)
+ifneq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),)
 GIT_CFLAGS += -O0
 endif
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 87160af3d7..23123138e5 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -180,13 +180,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_90620
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
 		|| BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=93847
-# ICE: compiler error: Segmentation fault on Nios II. This bug
-# no longer exists in gcc 9.x.
-config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
-	bool
-	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
-
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
 # Error: branch offset out of range on Nios II. This bug
 # no longer exists in gcc 8.x but reappeared on gcc 9.x and still exists
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
