Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E30BC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 09:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCA4182225;
	Wed,  7 May 2025 09:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_wMyPQZX6S4; Wed,  7 May 2025 09:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 575258221F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 575258221F;
	Wed,  7 May 2025 09:34:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 639FACD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 09:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48D1B8221D
 for <buildroot@buildroot.org>; Wed,  7 May 2025 09:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImfsTEtmr8bu for <buildroot@buildroot.org>;
 Wed,  7 May 2025 09:34:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 099CC8220F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 099CC8220F
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 099CC8220F
 for <buildroot@buildroot.org>; Wed,  7 May 2025 09:34:55 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac339f53df9so1305660066b.1
 for <buildroot@buildroot.org>; Wed, 07 May 2025 02:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746610493; x=1747215293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u88rIqC7oZxhhpuVeJz+6oPyPztoeD5KqSC7Pis5GLo=;
 b=mq9KFkvTmodbGmq4mwrmmDC+V7xlvIP7pi+6UWPlkX38xqF1dVA2kyZ1nzdH907cj8
 ISAo025Pu+LdDaNSqgK3+SfUgudHCQkYru0MOl2Y7o2wHbJJi17A3W3pVVnLYkdyJLK+
 HQkNqLoiykBcwbbTofUo1C9FXISviRPs+CXrxTP0ImzGXQFSYp9DJf7UztPC/7rVKPVG
 t3tWlzKhCvdXjRibU6iBsLcyTx5a85iWP2jex6Hy1Bbpa0/6oyYX/QJEME6LTpQ3Zse/
 rwAtDASH7zqW+M2rajiaVh4ilPlQibpaZ6g8VVBk8dAPSZjtHLMw13v6GGi8Pv764hAn
 4jxg==
X-Gm-Message-State: AOJu0YwHs9UE6ZT0cC9RKAX3uSKt4OCTWqPxK9yXPMzlBNXm0o5ztMI7
 PWzYncGNzzwyFF5jW0PgN4u8z8KX2rDGSNt7u9mnEeTvo7Dgq1GF7MMwcGYI6c2AWcU4V2gLUJ1
 gOYA=
X-Gm-Gg: ASbGncu7uplrPLl0g8rKGIp/cEjov8xU1SBqqsCtp0FOIVZmmxf40MduuGKoMjdt/CS
 6IMfwRt9t2PeT8fl6EoCXOBnEj0y4EigV8T7uwV8TqzWeDnVImSmk4lMOZ0EE/5wO6T6ASKOXj/
 q17URVn0YVcXh5CteGG8jajGip8/XuB5bq2BX4gOKA9wVNJcb3Z3xlgX+mpj5XWvIU21qV4tlfZ
 8ne1snFovYQxDGKRJlhx69DCvlfKtnW2a//xtgmrrlAW7kor5KXnz1tFW5E/Ar8bRLuqhkhin7Y
 cJ9DE8M2ZJxNPB5YI7j3qNpsRPbkL7oUfFT31x6CQs72sTKzrP0U8g==
X-Google-Smtp-Source: AGHT+IH0eXJrVl/4jbmmQVh1VK2UnASNi/fpTwRhe4OKKz9ASqC5AXjEriHaZQRa4iPhx0+HVKpHdw==
X-Received: by 2002:a17:907:6d0b:b0:ace:6e8b:516c with SMTP id
 a640c23a62f3a-ad1e8bc8be4mr273537466b.20.1746610492787; 
 Wed, 07 May 2025 02:34:52 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cf1sm883689566b.68.2025.05.07.02.34.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:34:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  7 May 2025 11:34:36 +0200
Message-ID: <20250507093436.1018988-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746610493; x=1747215293; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=u88rIqC7oZxhhpuVeJz+6oPyPztoeD5KqSC7Pis5GLo=;
 b=E/EJK4l42EPG8kCodUKxaEKC7d/Ywl5+lIO+2Y7bfSDmtG7ZvthfJfHaf8Y+jC+I6K
 LvVCX+UAc2VCczsmmQkldGxbYLFmrNIWK/sLN5d/c3GUBZLkBzAGL9CBU1CEP9eunH8v
 09GbRgrKpwi/euVa3Kldivjxbv8i5DXmk7DZVK21eyEJZQL1YpMnc5ujwFn2xnf/4Qly
 5dUs6pBGcESHzjmqSv/SWtKnCfIzUSC2oTNsmObjT/D9M5kUFw3QT3vbe74xDDzmuDdI
 XyCYzb2lsXYu85CoIXBNazrQY9szdD0jKm0WmPTr8Of6b6gqOv37MlLwM5DqL7XjvKcL
 kisA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=E/EJK4l4
Subject: [Buildroot] [PATCH v2] package/redis: bump to v8.0.0
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

Since 8.0.0, Redis now uses the fastfloat library as a bundled
dependency, and this library is written in C++ (even though the
rest of Redis is in plain C).

Therefore, we now require a toolchain with C++ support.

From https://github.com/redis/redis/blob/8.0.0/00-RELEASENOTES:

=======================================================
8.0 GA (v8.0.0)    Released Fri 2 May 2025 12:00:00 IST
=======================================================

This is the General Availability release of Redis Open Source 8.0.

Redis 8.0 deprecates previous Redis and Redis Stack versions.

Stand alone RediSearch, RedisJSON, RedisTimeSeries, and RedisBloom are no longer needed as they are now part of Redis.

- Name change: Redis Community Edition is now Redis Open Source
- License change: licensed under your choice of
  - (a) the Redis Source Available License 2.0 (RSALv2); or
  - (b) the Server Side Public License v1 (SSPLv1); or
  - (c) the GNU Affero General Public License (AGPLv3)
- Redis Query engine and 8 new data structures are now an integral part of Redis 8
  - (1) Redis Query Engine, which now supports both horizontal and vertical scaling for search, query and vector workloads
  - (2) JSON - a queryable JSON document
  - (3) Time series
  - (4-8) Five probabilistic data structures: Bloom filter, Cuckoo filter, Count-min sketch, Top-k, and t-digest
  - (9) Vector set [beta] - a data structure designed for Vector Similarity Search, inspired by Sorted set
  - These nine components are included in all binary distributions

  - See instructions in the README.md file on how to build from source with all these components
  - New configuration file: redis-full.conf - loads Redis with all these components,
    and contains new configuration parameters for Redis Query engine and the new data structures
  - New ACL categories: @search, @json, @timeseries, @bloom, @cuckoo, @cms, @topk, @tdigest
  - Commands are also included in the existing ACL categories (@read, @write, etc.)

- More than 30 performance and resource utilization improvements
- A new I/O threading implementation which enables throughput increase on multi-core environments
  (set with `io-threads` configuration parameter)
- An improved replication mechanism which is more performant and robust
- New hash commands - `HGETDEL`, `HGETEX`, `HSETEX`

For more details, see the release notes of 8.0-M01, 8.0-M02, 8.0-M03,8.0-M04, and 8.0-RC1

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1 -> v2:
- Fix build on toolchains without C++ support
---
 package/redis/Config.in  | 5 +++--
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 8 +++++---
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/redis/Config.in b/package/redis/Config.in
index a2239b4a54..ed11ce8c2e 100644
--- a/package/redis/Config.in
+++ b/package/redis/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_REDIS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Atomic keyword
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
+	depends on BR2_INSTALL_LIBSTDCPP # fastfloat bundled dep is in C++
 	help
 	  Redis is an open source (BSD licensed), in-memory data
 	  structure store, used as a database, cache and message
@@ -15,8 +16,8 @@ config BR2_PACKAGE_REDIS
 
 	  http://www.redis.io
 
-comment "redis needs a toolchain w/ gcc>=4.9, dynamic library, nptl"
+comment "redis needs a toolchain w/ gcc>=4.9, dynamic library, nptl, C++"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index e01fc6a601..13845bd7a2 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  72c081e3b8cfae7144273d26d76736f08319000af46c01515cad5d29765cead5  redis-7.2.7.tar.gz
+sha256  cf395665ba5fcecc4ef7aed1d8ab19c268619d98595827565c82344160171262  redis-8.0.0.tar.gz
 
 # Locally calculated
-sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
+sha256  a797fcaa899397001f7fb0097583db96bcc74e9b0606c95435d8a293d84cdb76  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7eb30abc4c..7ef4401123 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.7
+REDIS_VERSION = 8.0.0
 REDIS_SITE = http://download.redis.io/releases
-REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
-REDIS_LICENSE_FILES = COPYING
+REDIS_LICENSE = \
+	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
+	MIT and BSD family licenses (Bundled components)
+REDIS_LICENSE_FILES = LICENSE.txt
 REDIS_CPE_ID_VENDOR = redislabs
 REDIS_SELINUX_MODULES = redis
 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
