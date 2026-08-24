Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1EDC5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 10:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB64E60629;
	Mon, 24 Aug 2026 10:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhFjE68isHHm; Mon, 24 Aug 2026 10:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787566632;
	bh=bXhUprNA+BodPXLxdVKiEG0Qodxx3SXQ3P+mtKMgREI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=KmbJcfI19CkZIJc6SE6VtydoUWXuLXXfJNeDSypj1D5SrQFj7abHCgfFXqOE8n26w
	 N0dwVQDX3llis4aVXM52W72/jydV2b1R/GFkLozccZyXpTMAXmdWUc1o+rdWyGiVOZ
	 rxoONDC+FFywtiYQTf7P5j/tlLvRKDAcgpjKOLEiyASW6ZX8lstJ5rDtWIArUUmqYk
	 PQFzkmmzAnGwCOI8OmY6WuU8EhXH0SeAj2kahFrN1I/rzSRE5KvgrGyr02jnJN2Inj
	 B8uBeNlscS0PbC7Mv4bCGYJhEDccNkzx5q3h3qmJmybQbxeGdS5/iOf8gpEEdBd1Rq
	 n//b2lxWH5kUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEF1F60617;
	Mon, 24 Aug 2026 10:17:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B09A336
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 113E240604
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2DRGGDzfFz1 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 10:17:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4EAF4054C
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:17:08 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c2020421077so551924866b.3
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 03:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787566626; x=1788171426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YRXeayS1Ait6GPaNFxnzZ8epxmyBrv9ETMa8MoCVrH8=;
 b=KM+165uDxypJthBMa3ZRXAnpbcvbSZxad0FcX2sPciGiJ1W5kI/70bXovQzLj37/u8
 sLSLKzBSVH8OY62i/14jLtzig/z4AeE3iu/sYAMpuu7OKkggd6JDcHRq+VayFtssAS0+
 GTJscohYaQZ28ZggpTeWrLdLguOp5IMhx1ndodgF96jLQhVw90BncKRnOrDq/hLXNTQr
 fsj7g+ydmyqT2WIDAy+taFdlv1B57148FST08RES3AlMJRhAQhBYht6c1RbnaBDME+ly
 f86U8Sy0nGKFTDvqs+a1LLUu4nADrFuztB6qfNp5ODLJoOwP/RD1Nggf1VMkGRjgSNIN
 ijUw==
X-Gm-Message-State: AFuF++nzP8d7XKCrwn3Uk0AuUWV4Q1+3eup0VyJgBM4T2lKoZrfpcq0z
 jSp+hHtDVE0RxiThSZxeeYXN8DKSMXRLKNusrRuOWaifuCCvO050V8xMb9q2ceU8ULNo4ClymUw
 iN5e0
X-Gm-Gg: AR+sD10vlfXMNytFc8kNhQZRr5wPgbD3xzOLcNsjm1lEhA1qPtGXoY3Lb2qzbmSiMGT
 /Yr5XOSgJ0Cq7zkH7TMdMEHp19MssJDg1RVs7yaQSrcxMVSqQeKTZxQR9GrbVdszUxkIhPTk/Fw
 VAPuR3atdhwq38fbAp9/77oa6TedyV9Lefsn+tzAT7xWR0cooFVoOlARedaOEWsiZHFowGzzYAq
 7kxBdzYf7nA8+pGGIlu5z/fuZ9Kj3JDV8FsaOd62UJ3so2IMeKoxvOt0p0LF3Kpj/rFe1tn7Csy
 +2SPqlY5nxG7TVITk9v2oRzD/vBBQx9Ny+AxZaKUkTOBGlXln570NkV4RmyD3CZHxKRD46tbGef
 ghq89ysgQNZ3zgOkSydu16c9iFS2zaZ1Bj9NDb5Gzy47itVnIMoCEuBYdcGDEBwYqpf3ehwYpSw
 y+/fx48wIETd0TwgT+vTBLRW3MomuxmAuDiBv6bkw/aiBGkpzHOxE9P9KpRASAk4QrFWkuaVYLn
 Dk7Yt3NaBewahcQHo+6MJujwLGpRq10ZWkrOhY+aA==
X-Received: by 2002:a17:907:c0b:b0:c24:42b1:3092 with SMTP id
 a640c23a62f3a-c2491e83af8mr2030274066b.15.1787566626263; 
 Mon, 24 Aug 2026 03:17:06 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b696sm1328232766b.7.2026.08.24.03.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 03:17:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
Date: Mon, 24 Aug 2026 12:17:02 +0200
Message-ID: <20260824101702.3180630-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump to
 v7.2.16
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

See the release notes:
https://github.com/redis/redis/blob/7.2.16/00-RELEASENOTES

This fixes a few security issues (without CVE number)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index cbd4255df9..1d58f98462 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  7bf7975331511fdb788e85dae63964b128fccee1df026a10db57444babc9c9c4  redis-7.2.15.tar.gz
+sha256  960a8ec15e34ff40e57ff16837b26b33bd81f2da6d24497bb63de532a323a18e  redis-7.2.16.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 02c25327ed..31b4aad2b2 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.15
+REDIS_VERSION = 7.2.16
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
