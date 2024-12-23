Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810C4E7718D
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 16:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2211A40761;
	Mon, 23 Dec 2024 16:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HM9Q4BDC4hq; Mon, 23 Dec 2024 16:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9DB240766
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9DB240766;
	Mon, 23 Dec 2024 16:10:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 482B9D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2456140274
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJLkFSEVxhFK for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 16:09:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0057040120
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0057040120
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0057040120
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 16:09:58 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a8165cfae8so14222425ab.0
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 08:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734970197; x=1735574997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i6hn/cZixQ6fGpXS3D3buaatS5h+cj3OCIxlffkJsKc=;
 b=IB4IZDUeOdEfzWqYKJae4/vfEMzZuFzFg1E8w0Q77ve8FGYoKTJ/f0PQGwXd/HKt54
 ZFVPx0fUhSQ1q5OkAPxHzwGdDZfTxFAsFQBodzDpxNZ8PmPbVuKcOX1d212MbGz0aUwR
 f3rCvczaBVUyt0DU4BGFDsXSS1SN69cDJIMSOvpvg6DUyK+y3dwZNtI//YtTiEK1QB3g
 0p7nv6Y4UwM/ht4kzuu9e2XARffL0t1EDEoQLoNN9L3jeZ9fudM1Dutg2j+ZIOwA16au
 bwsDTJGFiYvIMz2jdsi/JNWKj7yf73y5AmmQ3/stDnEBtidwjw9Ha9mL8bk2S9e0OOtX
 wr1A==
X-Gm-Message-State: AOJu0YyBIJzCA2Acc49T+r6Uitvc+74r443FlneZU/qhTyLtr6kSyEBb
 eBuDon9E8+MRhrTpU6+DdPxTPecI0jvawIJm6fp/tMrsq0J6EhHKyQE5HpdYUUc=
X-Gm-Gg: ASbGncs/88P+XPz1Res1hVQZvodFuczRhpb05YTwzfW4MHHxrbS6zupleY0fkbLZ99m
 faxoQcyvS3TrQTFiuf6uRXt6z1HQoOO2tQJ97qDPeVLKa7wrQ2S4eD49RyDdMyCm1/U2NTWGNme
 SYG/IRafcAgburkuJ3GRI5k0AliwwH35vV6dOHSzpu0r0bLxnuIE7synXW0vsOwGF7F0kaTPd+G
 fdWJu4fcc8r5KHy7nvrzWcczmu5FGDTZfb6JP7m49LX+ofbTgJB4XG541LtqzpXoYsbH8Rln7+0
 slzUajRuRWyCFQ4Wy5jCO0w/p9hpgM9gjg==
X-Google-Smtp-Source: AGHT+IGBfOTEOCXjwwpkM9hwSjoL621yHjTZ1pXpunP0nvko4vOsHBmDVpqUFkMr/dhVSA6JQTI5ww==
X-Received: by 2002:a05:6e02:3d07:b0:3a7:99a5:a207 with SMTP id
 e9e14a558f8ab-3c2d17bececmr116159215ab.5.1734970197673; 
 Mon, 23 Dec 2024 08:09:57 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0e47d6ef2sm24552545ab.78.2024.12.23.08.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 08:09:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 09:09:55 -0700
Message-Id: <20241223160955.1856359-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734970197; x=1735574997; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i6hn/cZixQ6fGpXS3D3buaatS5h+cj3OCIxlffkJsKc=;
 b=YX5bjpOj9/wcMKMZZ9UwvuaIsE4mDt/xiArEWkHEg6FTGwuZeSfERtax2adPL3+18/
 VOPchxMDo9v/sRPCkczfpotzJNUTbBh+NrnUNTRcxlUP9BQWvARhbbZ9DwVr/VaqusAc
 LVpn/pz1VLatJdgO6fkQHPrDAR0C7jJsTB6xxn2WEnMaOsuy2BqSB1Vvu9AeY4wLC9rI
 CGZa4BMkBz9SUL5uUFarsfYvUbX6M9qqW3oI+SzLu4MvM5erJhKGvoi4lZTe5HiseLvC
 1nylioqa1Fnpru6KxEzTyeaCFuS83WjBwsjIbArf7ellke3HZe2FjT4+Uzj9+qxJRZb3
 joOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YX5bjpOj
Subject: [Buildroot] [PATCH 1/1] package/python-channels-redis: bump to
 version 4.2.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-channels-redis/python-channels-redis.hash | 4 ++--
 package/python-channels-redis/python-channels-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
index 6b62d0d6a2..3fc82ebb5c 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels-redis/json
-md5  e43a397dd3049f382a9c8b91d0f62c79  channels_redis-4.2.0.tar.gz
-sha256  01c26c4d5d3a203f104bba9e5585c0305a70df390d21792386586068162027fd  channels_redis-4.2.0.tar.gz
+md5  a6d2eafea6e44440bb30f0a62de5d089  channels_redis-4.2.1.tar.gz
+sha256  8375e81493e684792efe6e6eca60ef3d7782ef76c6664057d2e5c31e80d636dd  channels_redis-4.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index 7ca065ce0e..f91e96c849 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_REDIS_VERSION = 4.2.0
+PYTHON_CHANNELS_REDIS_VERSION = 4.2.1
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/fd/c8/d8e4d369a4cbce5dc86e84a559993001d471327f1ef57c13ffc82bdc9efa
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/c7/6d/c379c9feea4522cbdb4eba9b3d23a6270ba8cbd94e847b21834d898109d6
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
