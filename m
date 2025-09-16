Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1340CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 15:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D9AB8219F;
	Tue, 16 Sep 2025 15:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPnT0GlNNV_X; Tue, 16 Sep 2025 15:14:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3699282166
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3699282166;
	Tue, 16 Sep 2025 15:14:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F726199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 15:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D19640E1A
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 15:13:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSl5nDY3iMOB for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 15:13:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BFC240E05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BFC240E05
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BFC240E05
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 15:13:56 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-62f1987d4b2so5995364a12.2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 08:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758035635; x=1758640435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7YPpSvNJaJLWDq4jFxjMYDScaXEbvUUvqA5+5VYvYi0=;
 b=bO17Dw8YAcWNRtkE6fnoh5wMMh6kfGkbBMFSFORE9EgizB+pesht93rxmDgTXC7LcT
 hmRE1G8rtdG8IQLvw7tBhS6ETfDcH4ZAxUksSjVocb9xuSKIiGlC4MoBLUty5LyZT4lv
 4fLVRQGlpxU0BqCSzrwovTKFbUvh0sBVNf30cRgtUyOCtFn7sE8oODuWZ5LXVa482qBn
 v76gYoBPTDrOzoj9SF6e4ieXhZE7+V3EtLCKBlyspXjgp9HRxaUaf7L60bemzRbHqeC6
 iHqv58FA1tQpOMyM+DTzzNhgdOO3yhwC6PcFogQ/v1xrtcK/KexIISTw1DkKvgFh5j63
 /MGA==
X-Gm-Message-State: AOJu0YxY3STggxlIDTq66mTDskS8b9OW3kvxGId0BJa5x47gk7vYzCrw
 DNoGBONhxV3bNP6SlfnWl8nA9OqeQZr/uZ49F88qtZm5BdPgPy+GrCmcBreOnh8CXe3GTxDMgRz
 Y3B2OwHj8cA==
X-Gm-Gg: ASbGncvYiUTwt9uEd0a5jZny+lvaqid9QsriAjUogsksM+l5FwtH7eCbYl5nDhMplac
 uhAtIODeaytZsrqnwZK0vzXxWJJSjdL1KbTYKAzvr5JcSGYxzP6hwXhyzfJurfVERHaIFHR4n//
 XiwfjOqbP7gLwPnMQF1oFa39fSYgVYSQPgjcb5+cmb4juor4+C/Rqi5wIrWutC/BUzWmR05Qpgc
 CIFKaJPI4GROp00YN3rFBkR+hksI0Ef5CrSZKGeFLUvoEzyucqb75VyGrEwEp+e6fgGgMwPSR8W
 jE7Qwot+A+n5zvwqwvgTtn4LcoOXEevke7lTrsBRCYKbF4j5PPOeB0gqf+gBEI5bxOK9tKf5V14
 qlFHm5o6MXvjRX3k+XvFlNhJIg2n0I6KviuaT
X-Google-Smtp-Source: AGHT+IEO2Idy0N/x1owFFB5qQOh/QHT3xGQaw2d6C0tLbkeJFeYZWJLyi7b5W1zJtYnTcK5e6fQ10g==
X-Received: by 2002:a17:906:498:b0:b0b:47af:1652 with SMTP id
 a640c23a62f3a-b0b47af1e74mr977459466b.39.1758035634985; 
 Tue, 16 Sep 2025 08:13:54 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32dd57csm1174673866b.52.2025.09.16.08.13.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 08:13:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 17:13:44 +0200
Message-ID: <20250916151344.164798-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758035635; x=1758640435; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=7YPpSvNJaJLWDq4jFxjMYDScaXEbvUUvqA5+5VYvYi0=;
 b=clckMsW9k74mmkMKDQSz2YaJTjvCWWUli24Y7zAbgfiu86R1UpAbDPSAmGj2XnWsDj
 Dg1lwodGnQrxrGeP2uhYRcOnWmSIfmiQdlvnTpL9d3dFaXUZV1GmtEWJC9j3lDloSWN+
 bw20irk751Tl0gng+Ww705xee+7KCjAi4Hm5OUO+2GeBUe8wNYkDW6XhVmG1wA/GGG5d
 d3Zqfr+6/Ov9dv/X3FeQ6yGjn/JgsRRbr/WQrcMs8hK7fJfkdKFoaiWCmvQysTZbfsH7
 1NlQ35fZjadQTBNVIGs+CoegsXPR0uYUGKB15YKAashRoenHSPAX6UrsHPpium8Jbc88
 MXXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=clckMsW9
Subject: [Buildroot] [PATCH] package/redis: bump to v8.2.1
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

From the release notes
(https://github.com/redis/redis/blob/8.2.1/00-RELEASENOTES)

=============================================================
8.2.1 (v8.2.1)    Committed  Mon 18 Aug 2025 12:00:00 IST
=============================================================

Update urgency: `MODERATE`: Program an upgrade of the server, but it's not urgent.

- #14240 `INFO KEYSIZES` - potential incorrect histogram updates on cluster mode with modules
- #14274 Disable Active Defrag during flushing replica
- #14276 `XADD` or `XTRIM` can crash the server after loading RDB
- #Q6601 Potential crash when running `FLUSHDB` (MOD-10681)

- Query Engine - LeanVec and LVQ proprietary Intel optimizations were removed from Redis Open Source
- #Q6621 Fix regression in `INFO` (MOD-10779)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 41d2797cd0..74fadfa8c0 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ff95b83b7cf2f7a33af3be1e52fdf2e791c259f8272465c3b09f9e6bc901b604  redis-8.2.0.tar.gz
+sha256  e2c1cb9dd4180a35b943b85dfc7dcdd42566cdbceca37d0d0b14c21731582d3e  redis-8.2.1.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 8b5005ccda..f2d7d43b7a 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.2.0
+REDIS_VERSION = 8.2.1
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
