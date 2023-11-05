Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2564C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74DF382154;
	Sun,  5 Nov 2023 02:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74DF382154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vJ9GAvSvHnp; Sun,  5 Nov 2023 02:48:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A990E8214B;
	Sun,  5 Nov 2023 02:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A990E8214B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 457A41BF267
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18595403EA
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18595403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5DwyPQ0qsgN for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:48:01 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A009C40105
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A009C40105
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-35942cb9ef4so14640425ab.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699152480; x=1699757280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGNAAlyObMhfTIe1TCpbKboDcNzxrF4QwiiD8W6Nsm8=;
 b=erhDhSjKtZHBD8+9KWAEYCgwQo1BYga013I7V71u8zINBrkZIu3UgPXJRKQza0obtc
 HYmvoev9YXlm4SGgRAjbO/uhyQ9iHA53C66E0kzqF03AyuBkQdTew4QF1Eh5SVnNwKKQ
 7Ytde6SrQl0SxDaRCwOi47Lw2ft+qFjj1qQ3Jxx4P/eaX0AJaP9ONZugauRNlDNIUnNQ
 GRnONgi1hqWVwspd/ZE3gd/WXKEmJ+Emv5U+SVmbzrAmVdX9x7LhDDz8Vr8++nUCGKBi
 IBkAEePC8aGIT4bUuom89H0+OrPdZ2mBNultG/FfzpFjPQBjBgTfYvdQk1NG0RNRlPvZ
 KiiQ==
X-Gm-Message-State: AOJu0YwSMrak49/fi35DB8hySuZJdArul4n6c1HEqCgEPgikr4NVmF9/
 J6SuAwDH/sxC+DhA2kprmQ7EL/qz8I0=
X-Google-Smtp-Source: AGHT+IHMni7gGUh7QjO281WvLHgg8Cn7f3fzMWbVLM7NK98I9M2cc48mGWBwzafV50LG+o/O0lTCyQ==
X-Received: by 2002:a92:ce4f:0:b0:359:7d0:256a with SMTP id
 a15-20020a92ce4f000000b0035907d0256amr19212000ilr.7.1699152480237; 
 Sat, 04 Nov 2023 19:48:00 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 r5-20020a92c5a5000000b00357ff86c542sm1618735ilt.4.2023.11.04.19.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:47:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:47:58 -0600
Message-Id: <20231105024758.2763409-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699152480; x=1699757280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TGNAAlyObMhfTIe1TCpbKboDcNzxrF4QwiiD8W6Nsm8=;
 b=WDCfwpXDhwLFD1Shwy/kMnMmnK70jmzXA2yYbTis66eCdKqYE5BCLOtcNbNK5eLQP5
 a41zqdb5pLNB7llaKvT87BtAC/+HRTPppjh7y8meK6zuOpy5rufTf0IBA8dDScTuOHC5
 9a4Fu4AdWDgyyD5bb7A1CFxQQDsMa2GRz83KzZdY/OhOBBubFPWnqdW0oED+Oa1HcS/7
 xB5NK3nZZvDDLWdmg2JG5vVwYvV0TvD2zkzURiIjrjoq5aO4KZIxM6h/Qxuqbn/TaKrZ
 2Zh5OlGqe49tGWZxCFmyI9TInvfAIbYqmnwC09kjaiat67Qli1Z6pJa0QbZKakR3YQAS
 bDhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WDCfwpXD
Subject: [Buildroot] [PATCH 1/1] package/python-channels-redis: bump to
 version 4.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace python-aioredis runtime dependency with python-redis.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-channels-redis/Config.in                  | 2 +-
 package/python-channels-redis/python-channels-redis.hash | 4 ++--
 package/python-channels-redis/python-channels-redis.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-channels-redis/Config.in b/package/python-channels-redis/Config.in
index d25f8ffe31..785b05cac0 100644
--- a/package/python-channels-redis/Config.in
+++ b/package/python-channels-redis/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
 	bool "python-channels-redis"
 	# python-channels -> python-daphne -> python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	select BR2_PACKAGE_PYTHON_AIOREDIS # runtime
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_CHANNELS # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
+	select BR2_PACKAGE_PYTHON_REDIS # runtime
 	help
 	  A Django Channels channel layer that uses Redis as its
 	  backing store, and supports both a single-server and
diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
index eaab5814a6..943712b3fd 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels-redis/json
-md5  82898cb3b50bb19e8484b80b4d940910  channels_redis-4.0.0.tar.gz
-sha256  122414f29f525f7b9e0c9d59cdcfc4dc1b0eecba16fbb6a1c23f1d9b58f49dcb  channels_redis-4.0.0.tar.gz
+md5  a184dded3478e618735a42174c334565  channels_redis-4.1.0.tar.gz
+sha256  6bd4f75f4ab4a7db17cee495593ace886d7e914c66f8214a1f247ff6659c073a  channels_redis-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index 727f403aaf..9186f07f17 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_REDIS_VERSION = 4.0.0
+PYTHON_CHANNELS_REDIS_VERSION = 4.1.0
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/8a/8d/bf96c62e3ca6c5ae59eb3482804afbe026c1c98b05b3ab65a0d46663644a
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/5b/3b/941efa8e337c3537475926fbf86e8cfe38a919e0f60bb9538b1cff364b8d
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
