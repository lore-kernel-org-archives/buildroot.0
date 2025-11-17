Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FFFCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 17:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F9A14065B;
	Mon, 17 Nov 2025 17:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsd-oDk-2_Tn; Mon, 17 Nov 2025 17:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B7AE4062C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B7AE4062C;
	Mon, 17 Nov 2025 17:17:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C9361A9
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39DEB406A2
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZTmljQjsnoS for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 17:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3974D4068D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3974D4068D
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3974D4068D
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 17:17:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42b3669ca3dso2418683f8f.0
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 09:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763399833; x=1764004633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FV6GS65KmPHwvWWKRcLBdGQgLYQKo00WrZ4oBW4qyG0=;
 b=Z3tUc0zbNHdTrFmOz5FUoCz2FdtdJaJxuL6l53HZbZTKRkENQvvPwN88CSc/aP1NAj
 I9Wkj/yueEgJHpApP6pmj/DnkyAlU//kEmp43nNB+vZ4d7muBNznxZqASuBmoVA9mpHu
 s7t5Eadx7rBSGyIP5RP6Y2Dgbh/TnB0BuLtvsHjvPrtv0E9eQxRv+tel6TvkIkH2hnna
 0Mt/R+yxajI93HvGANBxQv0s6v+1ThCYU/SIJTwsXqPb4HVIZkuJ/BDogizaBK2aFJL8
 X6yylHb1FvoKSO3Yh74tj7A9euqZ4Pddls9fQCwT1vShnnsQYAJDQm0caZ+asGU1pE3M
 Kyug==
X-Gm-Message-State: AOJu0YyChGpTZiVEC7xts13v9cY7P7eNhyYnf+qSncV76my43HQSd2pr
 12l2PRS7vluXB7ioYqj/K7CaQoBaQbPaq8b6mJe3A1XIN1+ZGcZnc36g+R4DN2Af4naajO8qCtY
 ExE9T
X-Gm-Gg: ASbGncts66Mky6gg4nR0r38pdi7frRawcyr2vR/9BEm6XHOGGw7YbvRiQcUoaDbucbu
 7Ve7qH6Eyg2pbR0lMFES0710Z5EcrzulxLOs4dGlFJYRXqjQfzupy2hOgsjt8qGO039VbQncSEM
 TBBz6V4fDLPCReb6frXaErTvpEWKDl4NesR9did4pYtJk/Rv1hjRTdCBuV0buiT2uJIUSBJHGCm
 YuKWsvcl4/YU9UcEGDkSp+K1E0qJ9jU0EfDOJTgmZQPnG9/1a8jc0kUqZMUoWSYhrFMQ0/2LbJQ
 93uD3Q4t9Tb3dI8rhbJOGP37Nn7PnDxy114+UR/UfYSnWTyRtatLAJB+0GH9tOHf8nfBCidPH96
 aAn6qH14gb5LJNDqOqqnTAx4g9czLX8lU2oHIDZGVtEM6u2zIxmKCdqNh/YAB6u5kdH/cdGmkeH
 /DMjzTHItjk7WyOBQ3cPqgeCW6PpFGCg1xKlQ=
X-Google-Smtp-Source: AGHT+IEPeUbb71N/XyoU70eTMHnxtcXV9As0GQTnB2/5GcbAZR3BHXsDuHuzjWA8S/heJ5f6MNFGCQ==
X-Received: by 2002:a05:6000:651:b0:429:66bf:1475 with SMTP id
 ffacd0b85a97d-42b5935df1dmr12440979f8f.3.1763399832956; 
 Mon, 17 Nov 2025 09:17:12 -0800 (PST)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b5ce849ddsm20760971f8f.14.2025.11.17.09.17.12
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 09:17:12 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 18:16:54 +0100
Message-ID: <20251117171656.260404-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1763399833; x=1764004633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FV6GS65KmPHwvWWKRcLBdGQgLYQKo00WrZ4oBW4qyG0=;
 b=HdQk/ZKVFDBsmCOqrpCEKBprZfarfu8GfRUFKiK0qSkzL55dekuejwT0eYfP33zoey
 +/ZVKU4DuStyirGwrn9QstUyHvepa4cbeX1FSp55x1Rzc6kQFhHqsAa788XsEz6J+g7/
 jhm+jbDazIR4NzmqIb77OfVsbsGfDkJXAze8NFhherzqr2uO/6fDsDAPFJlV4Cv7vaEQ
 VOCH76tGgSoaxIAhtVpnwuKSi9XB2JW8pLPiym0kvftduTK5SUhH8EJV6NdJmDqRo73S
 uNB1PNpAqy0wATO9BTXVcJg4bBuxAYO1YOBa5S7MX/RS33L4UDgLlDHObb+rZJLe8iRo
 Sn0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HdQk/ZKV
Subject: [Buildroot] [PATCH for 2025.02.x] package/redis: bump to v7.2.12
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

See the release notes: https://github.com/redis/redis/releases/tag/7.2.12

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index aa3253335e..7677642ed1 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e6390323d  redis-7.2.11.tar.gz
+sha256  97c60478a7c777ac914ca9d87a7e88ba265926456107e758c62d8f971d0196bc  redis-7.2.12.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index cd9736663b..e6175b69b5 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.11
+REDIS_VERSION = 7.2.12
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
