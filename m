Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D93E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC87610B6;
	Sat, 11 Jan 2025 16:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdzeE3CPigkO; Sat, 11 Jan 2025 16:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 534D9606D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 534D9606D0;
	Sat, 11 Jan 2025 16:32:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FBC6942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 134A283065
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRm1AlLEiu9C for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14248830AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14248830AB
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14248830AB
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:32:19 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844de072603so247780439f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:32:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736613139; x=1737217939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PtIfJy9+pNLIqHaBBX7EtWN5oDl2AhZKmUorUiomwlE=;
 b=E9JX1HKw0AXSfxZvag+b7lCWiQ2X9goVJzcAdSP2E1/pyjmGtWg6aaqu0jwOAKTIct
 gcDJnwVfKlvf9A4TlrUYodnPWD5cvVStX1XL3WeRp1xaHT3LJz/ek0ebnbZWt0SiKODi
 cu39fx3wE66UyB1S2cPN4HZd3ZT4oyS0qpUTghu3+BWdWqMCC5NYN1wa8ulrlAxtD8wF
 7JRDkaiX/76K1RN0B75BXooCW8ULUBRlZi8mJ+Fb1yeM6NTomkbhjHao5pjSs5oMhPn3
 4RtUyS22zV0H8ihY7YdVbwk+8j7YN2q3ZXX+Ez4FhasXZkK9TehBE5Q/QqE9hWuyWpGS
 +a1A==
X-Gm-Message-State: AOJu0YyN7ja5DQiV+M5X+m70v6YLClrWM7s8l3T8S8hNi0X6/r1baW9M
 +6yzAcXsMC9r1iT8ItyYR0+QectaPuUD7TQydoDt8ERJaAIO6KlzXbl3MXFOSXY=
X-Gm-Gg: ASbGncsSJ1jSoPG7bGVGrPlMvaP67L0bEB8MSWs54LgmpwJ0fEdm1TVUUDFfqH2vbS6
 GNH5eIsXbTrihfNS2YFQEXRzLViN7XBOD0Ts3ZmtjZSKRvjDfVEbQndShQ6//Yd+dDLvWIG7cjW
 7xSzLAtvkHa2EIxWkjtk3fjFE/QzvImpxRM2Nd5AOQLqT80X0Rt3Ahz6mTyj04cptzyvyn3HPcl
 nzLGJzAlalF+25oEXAIb6mEtsYDG0TwhfKiezAn07bFq4u4lLyCiN/4QqGqeiDzpqeVLzZ+ix8I
 QbSVa5sXr6SZEzgEaGv/RyvueXfQ2oU=
X-Google-Smtp-Source: AGHT+IGkfc+XWhd4YYWIkWWP4w8JF52R8g2j2p6O+zEOyakkVOQOG4vERsN94kuzfZ9xacg7GC3JwQ==
X-Received: by 2002:a05:6602:6a8e:b0:835:4402:e2eb with SMTP id
 ca18e2360f4ac-84ce00a0948mr1425941239f.7.1736613138848; 
 Sat, 11 Jan 2025 08:32:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d61fc811esm162224639f.42.2025.01.11.08.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:32:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:32:16 -0700
Message-Id: <20250111163216.2885162-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736613139; x=1737217939; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PtIfJy9+pNLIqHaBBX7EtWN5oDl2AhZKmUorUiomwlE=;
 b=bKddnMXifpjDpE8639NdPLtqLCXPDdipCBqMP0etaQf09M+QvjEiczvRkGHiPzRUC/
 T+ub7ISrGLYcgBGdgtGNrLmiV6dB3w5XYZyePPBtCuYlg28S+kSDKoqrKIZnbLBileBy
 oR0ihi6JxmcNVC8ZAopSgnZzNjvNIxe4lswSAIb92FOt7u0n/V08Hv1m3NT/P6v4ugZJ
 KvMtLWxBOymeHA7zy6cmGwAFmeF7vxRrQXFouGwxezNug/oXlcwJnhPsOQyyOFQh6Xxh
 afIZtWlSfJdsba5e33chNoDCp0LB26ozpjHkZh3245LVXzj2VsMszhq5l9I8Q2X5JJ5y
 bd3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bKddnMXi
Subject: [Buildroot] [PATCH 1/1] package/python-redis: bump to version 5.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 57d8557156..b6bee68ca2 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  a3210ca8428bd0ac9691789c08b14478  redis-5.2.0.tar.gz
-sha256  0b1087665a771b1ff2e003aa5bdd354f15a70c9e25d5a7dbf9c722c16528a7b0  redis-5.2.0.tar.gz
+md5  6e57c67eab7537b789c7a0f4a3068510  redis-5.2.1.tar.gz
+sha256  16f2e22dff21d5125e8481515e386711a34cbec50f0e44413dd7d9c060a54e0f  redis-5.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 2c1734151d..d02d4bd44b 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 5.2.0
+PYTHON_REDIS_VERSION = 5.2.1
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/53/17/2f4a87ffa4cd93714cf52edfa3ea94589e9de65f71e9f99cbcfa84347a53
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/47/da/d283a37303a995cd36f8b92db85135153dc4f7a8e4441aa827721b442cfb
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
