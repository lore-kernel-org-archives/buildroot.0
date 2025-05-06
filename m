Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEA8C3ABAC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 14:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D6480DDC;
	Tue,  6 May 2025 14:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BP9X3_nIagB5; Tue,  6 May 2025 14:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8611E80D4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8611E80D4D;
	Tue,  6 May 2025 14:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0552D5
 for <buildroot@buildroot.org>; Tue,  6 May 2025 14:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8314E60D93
 for <buildroot@buildroot.org>; Tue,  6 May 2025 14:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXgdCSIoAlaE for <buildroot@buildroot.org>;
 Tue,  6 May 2025 14:22:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17F9B60D77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17F9B60D77
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17F9B60D77
 for <buildroot@buildroot.org>; Tue,  6 May 2025 14:22:02 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ace333d5f7bso1080558066b.3
 for <buildroot@buildroot.org>; Tue, 06 May 2025 07:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746541320; x=1747146120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KmZZY8zJTKK94iiIprIeQD0lXRebMyCPIHODY+b+YF0=;
 b=Ac23Ue6YqEqL0UFMv+Q/nttJ/VjMBF3luGJqVCLv80So6hfpztp2Kmi+JQ7JUifaZI
 oeTob8GTtifTrEXdAO3HKptANy4Wco2RxLYPVwCjF7waSHKBV1bUw5Ncc5zvPR5MtO6p
 S7uPaMsgzybud3ZVSFdyjEyo5MsoNaoIHCkYFZIJPUxKxyD5A3dL0uelQtn4gfgAhVfn
 7o+RLCnad1HeqqBQ8CmDjksMvw+VtABfYVHNfTPfiaJ5aL+n7ujlGx6BowzgmomgWOhK
 shSylSaRVedh0Kadf8KCnyF9FsovAjxk/qBgnFGJC/z0/vVwyS8wC+zoVi5LCzximhw8
 UUYA==
X-Gm-Message-State: AOJu0YzRHkLTj7u8b3sEBWEACpY3yXNsbWStN+sAXUJ4xMDIdu0pnTyl
 2Wp9QLNpK2bYrVylcn8AQtKt15VFscDKfCKKsiHL4WEHoB0sabNJFSNcYLyOm+bPDRnBaE/oSG+
 N1XU=
X-Gm-Gg: ASbGnctaLo5J9nj6+AWoUPJAU8/xIlhg2Q1Wd7PB/kqMqcMlA5Hif4s1IPoA/AH+y42
 6H74YJAqp4yVjKNEimfg5LAnGKLmEUd7W1D/DsQszthAAUEVaiwcseZGv/tvByRNz+dBJR9OOnh
 hJu3FdV6X8YwkSHF5G2EbFt/fqNlhjT3KN1Sm0k3ZidbnwTlF9cB1l8rDOSd8Gfiw1PxRJ841y4
 Tb3dOMIgF0C/INhspaMt029F7ufz/gA0lsEBV7P3F4m77rjutyCWcniwYy4uLYe4XUdsdsj4b+L
 QJ2g/Wf0nmzBVr/i4DxT4j2RpW4qfY+NFUE50YRHw7ELwQZma5g7Dg==
X-Google-Smtp-Source: AGHT+IE75XfI+tzRyMCOG6021Qf3VGMMWEGxxP9w5EkHLmJ92KJvSSC8Qmp3svTpqfUVbkqkaEka9g==
X-Received: by 2002:a17:907:60cf:b0:ace:6882:510d with SMTP id
 a640c23a62f3a-ad1a49670b5mr920366566b.24.1746541320280; 
 Tue, 06 May 2025 07:22:00 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891e980bsm703937166b.76.2025.05.06.07.21.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 07:21:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  6 May 2025 16:21:41 +0200
Message-ID: <20250506142141.889473-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746541320; x=1747146120; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=KmZZY8zJTKK94iiIprIeQD0lXRebMyCPIHODY+b+YF0=;
 b=P9r3gGEDOm1fOXaPOpBA+W9oC6iT+pQrh6NK7SbrBJ9sD0ur8zVIHFhWLEJOpR8dDu
 LN2vIXcIEqVBIa1QXolgxE2fXOr8Lgy486nUVL7PO/XnqKpQbD9R8/oQhVtFolJTuWgX
 DIRbtKJCpIzx/h4I3gWkmBWxhW/qg8puUwKtaZzvb37yft3npjTAQHgt44MSkj8mShpQ
 JIMfw7m7zu6YoVNZrDZ0AGszjkEKM0ZIP3+98pM2Strm0vw9fGGgEjq/SvAoXmBnLHYc
 gOio9fpsftvapXXkWiTk56cF+du29PokMuXZdrBSR0KbrL3urruO0vkjLabobYdg4fdb
 p6tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=P9r3gGED
Subject: [Buildroot] [PATCH] package/redis: bump to v8.0.0
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
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

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
