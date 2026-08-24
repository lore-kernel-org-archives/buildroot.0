Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817A2C5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 10:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2675A6060A;
	Mon, 24 Aug 2026 10:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92YXJaGkUTwX; Mon, 24 Aug 2026 10:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787566569;
	bh=89ANDoYTf8J4xHlnaQdpgbweg+Ad/WHjDgwSpxVCDAI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Jjpu2cBr7tctSL8OkMMxlwB55gxazG4JdNvEA6PeV9Pt7NDGXe6o57cMJ9vG+MBCK
	 v9yssGf/HW+BfUuzhOH0fntaNcpO1aJLWrhVEgr2qnRb/Q33rEku6xkxyTh3DISj/V
	 ZEMAlGQII8cF86dqsILqkPT0bexFVwAO9HiJ7+C4T5v5sR4ldpu9hscAtak8viFeaC
	 g5DBSJgIcIlADDjzeQvnnRQWimbITlt8kwrAGk7j0/SZJjBkQvEw0/OX3jNskpc16Y
	 zj1SzzhNd+iv24fmVD5VYAkDrNlvOH7k9Tlx3buchFpJ2CEktLxwqWImI7VSHMeBlv
	 +D1LZw4eG0s6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475FA60617;
	Mon, 24 Aug 2026 10:16:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 210173DA
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0705880C09
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLTq8ACzqFEw for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 10:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF00480BEC
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 10:16:05 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c214e625259so467515066b.2
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 03:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787566563; x=1788171363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0vnDz6KQwJVSMGe19rLvYvwXYRUTdurJlheHEf3e+14=;
 b=Yap1iQdHj1CePHQ8i3Eg2+b+fcV+N8YJ6q0To6PhF++1w/0u8oYFuq/6OvzJ714g1O
 kFGGqkhUucqwFwcCvJKlg7iwhb3RA4q9u4RA/lc341lAqFz43fwSpYpv5hJU+6cC8m6e
 rV/LDPiZnLsUsQhIpi3wheuZx5u2AoFNDiRuB5xfNiu0N2Het6iaWtMOba6MrGUlM4mG
 r9jDmUJe8CiM6j4D2y3lGASSSprT55ybYlnXux5vvfuUqO6nl3sAOKwlmg3v+UrxGx/n
 +gxW64LCZ6ySDbdt+MKGoG3tfphWe2wNvXtFHIwthwHx5FNxGEDgZ/j7lnX2XNfDdGYm
 /SBw==
X-Gm-Message-State: AFuF++mNzRAG+urv0nhBbEy2wGtPPxdyuiIyZ5Twb70a9yivLQbJqh69
 JIu7EbIfEE7uNPPIM4XZa334sTOzFuPBqJqImtnNeP3De/2ZaZLBEgbV9YygtvnX2mXM09DQWe2
 PeNk0
X-Gm-Gg: AR+sD10wH5N99E4I9Z+q7ogZTvCB4wK4NJs/7BYV/sBw83PaQ17WmxkLL3ZV0C6dvKQ
 oxc/RhsN+/NWqpaJoCGqGUE9R7Up7bjpEon9FMnZO74g7Pu69Kz2Lx2XAXaGryOdqNQMjI9ezPz
 Ttgjh0/JMiBGBqYaQIshCymId7kKVEpQ+8Mx/tNjNlEPm2E3XPxAejhmluYuP2Z3XtZpc/PcX7D
 bICFRel5/jSC2l/32K8TqlcykCldWAmw0jJxyztjj8LRYpmciMOGIoSqnJ7EZXsggWPFUJSnBfP
 awt9prj++jmqpFtWq8vX+BFFmCIHp9lQLv69CIt5iImtzvxdUK7MHdPmoDuj8U6U7eqGs+6MoN6
 xcEQAUwgNo/3CsTh0EPxGmbbJv9oOnBAuJ6+fYEsWPou54xWHnA4+Al66Orl/pK9wcSu/gm3hRU
 2bf8ZtlMpwN5pa0ixa38x1kpxW4I2xE+zdHbODBcyDfvyH4oXjL4dEaiRgyyjO4M0rihRKiaUR2
 4z48yYdi6pHskw5znjRs3W+fD1o+UK/ArHe1RyjgGr7kJzlB84uaw==
X-Received: by 2002:a17:907:e901:b0:c16:769b:9838 with SMTP id
 a640c23a62f3a-c246a2eba8amr2811448466b.5.1787566563170; 
 Mon, 24 Aug 2026 03:16:03 -0700 (PDT)
Received: from dragon.home (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24962bd8fasm1853753866b.28.2026.08.24.03.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 03:16:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
Date: Mon, 24 Aug 2026 12:16:00 +0200
Message-ID: <20260824101600.3179888-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/redis: security bump to v8.10.1
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
https://github.com/redis/redis/blob/8.10.1/00-RELEASENOTES

Notably, this fixes CVE-2026-62356: miscalculated buffer size in
`CMSketch` RDB loading may lead to heap OOB write, as well as other
security fixes without CVE number

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index db03ded5e4..c3239337d6 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  f1baa4b28befd417aa6577ebeedde9e9fc7814cfcc299b2a6d2fd99ef7420a6c  redis-8.10.0.tar.gz
+sha256  60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663  redis-8.10.1.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 13cc7b687a..30142bc0e5 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.10.0
+REDIS_VERSION = 8.10.1
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
