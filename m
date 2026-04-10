Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA73AF36BB8
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 06:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97F6480B55;
	Fri, 10 Apr 2026 06:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UipleQS40rs; Fri, 10 Apr 2026 06:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 742478081D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775802000;
	bh=cXDxjMXUI6A7KbSiC/uEjf+2flyY6mEjiT5XTpbhXU0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QU6x7Y82D/cl/Zu0SjXipCd4YZ1+pv817NFB0OgtroovosEKUHSlKxw/5wxhtnjU1
	 /fXpOwesGnJMUMEn+yqvK3H0jPyZrOi3YnWSH/0vMgWWdCQT+vFkhXqEx38mJl98hN
	 lIFE70EHJentKfEfufPFF8K888GbJSgmHXfYw1zAFpJmuLIaXaGmyabMQFqUHOIPZH
	 fEGVZpzVKb46XtepLV+enhRRAmoU0k8b2BYtZAV0EmE3TAEafO2jg0bR9qG3bKKZm9
	 O86GA8Q5no632a/9ma0WZ0xEH1qgAEHe7E1uQnCTGyg0K3SVFv4EgiEffmzPexV6vr
	 4qiMXF4cYAmjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 742478081D;
	Fri, 10 Apr 2026 06:20:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D68ED194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7D01807F7
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdl23jlqnxVB for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 06:19:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0339F807DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0339F807DE
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0339F807DE
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 06:19:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43cf5ad500fso1342933f8f.0
 for <buildroot@buildroot.org>; Thu, 09 Apr 2026 23:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775801995; x=1776406795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cE0o+r42ouJdt66E+V904HMZdANpijifjEjlfJj47Og=;
 b=QJsKmf7dZ6tXlQdnfeJqIeOudLvJaz3RWTsSB6J/RAg3t5T+IhWJKXRILJvhDG8ss0
 9UurbANVfCxpFQm75+hsfa1Cp1CIaeyx/4/MLgB0MYOc99FYv5jrhUEALz0l66WoWXIO
 30yijJ7X6uXMK3OXxgHqCgeILgQj9YkZAtgwmEYdnX78st4rYDUdo+BzFmuEBs1YU9rk
 mM/DgayW6XzZk9OI+lKsGA8tEWU3bJpd1SxABOcIEabp6LsFIywZKh9xRrbPgZEIGg5I
 XK6zaxxlns0qzlFLhU8ug5wXEETPM4Q+psqiB+1zSRlrtnrA61jxqDrBx6N2YniRueqI
 Qrfg==
X-Gm-Message-State: AOJu0YynnBSF9N48euoVWdOVd7ZCwNiWxEAeoYQp7Y8dSz5vEhxwPRvd
 BjGlyYyXzsk4+3nATkPWZwj2yOYSxBlXYcxDh5+JcQTlddY2mhGPnPw1wxdAtUmdGhiGtv0Cig7
 OqyfI
X-Gm-Gg: AeBDievIMBygrVMy93u/QNkL1vSMlSOtZesnhmoWNejiSKbmPe1xEu0WT6hPMhGFxFp
 ExiSyTDGv6BiWyp9LnG96fzW6KOvgNYXngMBW2gmTACN+RKcgMAbNCoig3JhqXRJELec950Ul8C
 e3bEEJHBxo9Tl2yG1Q3re6TtLlAT1NW953BRZTjQQJ43xODJjg0qifnr1zfTnZKRzmfhWf8A64e
 DX3JsnJUxzrB2fVbW4/DfTeW6pNttdE8JynVfIahrDuI3c6tReJDlYfOrs0cjvTR8tHhcgrbWhU
 bJWXUYblZ+wDWhJZhwvTjCKKfUcPfQrtfe8cUL4gL+BhKZ/TKX9hZD1ZuCInHco46DewTCfz+m8
 oggrZRSh0z80NDQHfpQIG1hxgaHIpqh/ZvWsmE0Wk9p4jChT6Kfi5Nj4lDJnK8tF/9+28xXX8bb
 pLY6xF/1TCXbK+M69IAsvTK7OgUfO4NSiBkNpK9QyBXsuBxzb0/40RmJ7JCvlf
X-Received: by 2002:a05:6000:184f:b0:43d:61:652a with SMTP id
 ffacd0b85a97d-43d642cd3f8mr2339810f8f.40.1775801994687; 
 Thu, 09 Apr 2026 23:19:54 -0700 (PDT)
Received: from dragon (ptr-94-109-198-162.dyn.orange.be. [94.109.198.162])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e5c98fsm5182837f8f.35.2026.04.09.23.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 23:19:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
Date: Fri, 10 Apr 2026 08:19:24 +0200
Message-ID: <20260410061924.1759312-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410061924.1759312-1-titouan.christophe@mind.be>
References: <20260410061924.1759312-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775801995; x=1776406795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cE0o+r42ouJdt66E+V904HMZdANpijifjEjlfJj47Og=;
 b=c8JgYHOWTfsEHAidW5LcSAAEGl+RHl1g7DcSe1iqluirUL9ZTHwO3DjIfxuTfulp7a
 FhyFWzxsYGxUPx9d/uWMgagMJkzJKcaxpJL57kLsOGNBWI/q0x2/OlUqpNu7tvtf66jH
 DjpAPuSuR3kIsPKYYv7FhBcwyv5KS2f8Eyp2TL7VJT5Zvt4ajZMtRIzt4BiFAWUDeYHa
 2D79U24WyIBREC3b3GTfqZzjOc7vk+wdzxWDU/k7myBG0Rljvbu4ixd7EcBUWUp5PnsM
 5LdIjxSGdQoAtwbzXdcFkrIUzSxbE7RmviFbALyrdaW+YShq+xUMHHxXmWxxUYONPUQv
 Qr2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c8JgYHOW
Subject: [Buildroot] [PATCH 2/2] package/redis: bump to v8.6.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index e690dd1eaa..5e67e1a28c 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  0e7c150919e10c630d6e806fa7e65ce12aa90ddd0805e459b7da64ee65892805  redis-8.4.2.tar.gz
+sha256  cea46526594fe05f05b9ff733179eb1263deccf4269059cf081fdef222634c88  redis-8.6.2.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index fb166b6f49..6ce9933029 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.4.2
+REDIS_VERSION = 8.6.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
