Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A46C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 11:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C00F741C16;
	Mon,  2 Jun 2025 11:43:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7T6MyMV18Ns; Mon,  2 Jun 2025 11:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04C5340964
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C5340964;
	Mon,  2 Jun 2025 11:43:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 549FF222
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B38560824
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TABJSQoC5m-Z for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 11:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBBAB6062D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBAB6062D
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBBAB6062D
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 11:43:45 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso42538355e9.0
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 04:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748864623; x=1749469423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7tR9YskXtXYhkLtHhQHJb4u+rz5HI5BSrS8XPV21z5A=;
 b=fsGF+x/HsbBePj9090ZDLNSMxXY65+K6ApBRamHv/bnQLBws4ru36+IBi7dLAy1FP0
 +58PTb29XEfOUAs3W5EJr93RLbqE/yvGMevBwe/f4zfzT9KA8FAgAYQizhV6Hp3AHRxq
 m43NjueyEnWcKaFym/4KrUV5H3fy8yrrmH1k2Rr7V8bbyiJjLktXKq9ZobO22miHMGdP
 9XO8DxUceYdKlWPKTMk8MqKWXijI7PBlmDpR3mrNIBPace1Y3ijbjUnbGQ4cmqx8udpf
 YfDsW56/StlJsXZSZyupcvoKeDdQOPhQxqbzwdTw0c/XcAHLd+3xDHLh+FksoVqmmLnf
 FD9Q==
X-Gm-Message-State: AOJu0YwzSttv/TDae9Df/noq75huaSfQa1tlqg6p8D7e4K2b9mLqzlm4
 YUtcfpAkPnlztiMDNsGCoACZRKQuP00K06QkV60zAM0wXzkprjd0QiYsedc4+Sef32b2MraLWur
 eyBf0
X-Gm-Gg: ASbGncv+9O6TajOjPHETLpXSPGcA5/kbGexJ6RXt/KDz+L7Ydi3s3g4/n6+IthbGzPP
 LAQCK5pBTJkKm4JQ5hR5oJlT/OvAPiATfzlsBVEVobbcSOYWbpUQ17sRRud2RN6OEH+5f6PbsUL
 InycYilQDg3+lzcrscijQwfO491mfixx6WkoaTm/L+eXkvZ66399HdMQxa/dWK1+xnBFgA5VfG4
 QhbLIiGoksBllS0W9r4rXgWd87KHhqBBhUOAzrjJsnJc6hfvXqZU+XFvbcCBt+uBzC7Czy/wPon
 C+QcdyUqgwZm2RdSqlOPTCA/iOCOETI1EwCImiOJnB4BgQSKeNwz8CNW+BgEBscfdrWb7YiIhTO
 iSwd95akUZheTMEbyfqy6cHzY3edgKHmlkbPN58ytwBUpdICxnzAj9vc=
X-Google-Smtp-Source: AGHT+IGD/Yo7VkupC0OXzu1/bUH1lYkJUKEs9Ue8TcJJfw4odOdAjd4W4pHyNLzPEqXeRdQwoDKO0g==
X-Received: by 2002:a05:6000:2888:b0:3a4:ec23:dba5 with SMTP id
 ffacd0b85a97d-3a4fe160cfamr6094601f8f.5.1748864622827; 
 Mon, 02 Jun 2025 04:43:42 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe6ca08sm15071963f8f.33.2025.06.02.04.43.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 04:43:42 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 Jun 2025 13:43:32 +0200
Message-ID: <20250602114332.498688-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1748864623; x=1749469423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=7tR9YskXtXYhkLtHhQHJb4u+rz5HI5BSrS8XPV21z5A=;
 b=bLc12plT0h9mxFV60DIkP7ZvxpVfic/sZAKNMUQkt+l+ySMZKYLbGMQE5N7/DCRPC1
 2AiKPYuYtIP+K8/w/faCthYYflfsV2A7S4FK37hFQlletEDfERapYoUO9NGwUTaNArFh
 kNbZ6US9j/QSGvZWGHj7q308NALS+/K9ZgPQl+trpS+y4WBQ+pceMnVJoH1RbqAvaZPL
 zMEI/M+/UVDXWlN/WdFy3hyT2CPyO3D6FZn9g6dze5QeJzGO1Sl7IOjW1+kkzlzjFm+a
 ZPxgLnL9xc6opbSHG3CCaD0tFEWyRqaCVcsVj9IgNk97CxC5Jlb1AJID2KXrwC2ZVt7U
 es8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bLc12plT
Subject: [Buildroot] [PATCH] package/redis: security bump to v8.0.2
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

Among other things, this fixes the following CVE:

- CVE-2025-27151: redis-check-aof may lead to stack overflow and potential RCE
                  see https://www.cve.org/CVERecord?id=CVE-2025-27151

The license hash changed, because Redis 8.0.0 mistakenly included the text
of the GPLv3 instead of the AGPLv3, which has been fixed in 8.0.1

See the full changelog here:
https://github.com/redis/redis/blob/8.0.2/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 13845bd7a2..4dfe1543d4 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  cf395665ba5fcecc4ef7aed1d8ab19c268619d98595827565c82344160171262  redis-8.0.0.tar.gz
+sha256  e9296b67b54c91befbcca046d67071c780a1f7c9f9e1ae5ed94773c3bb9b542f  redis-8.0.2.tar.gz
 
 # Locally calculated
-sha256  a797fcaa899397001f7fb0097583db96bcc74e9b0606c95435d8a293d84cdb76  LICENSE.txt
+sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7ef4401123..a4b6b4d652 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.0.0
+REDIS_VERSION = 8.0.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
