Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0D6C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 12:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A0054175D;
	Mon,  6 Nov 2023 12:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A0054175D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RR8p7GDIV5-Y; Mon,  6 Nov 2023 12:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F491416E5;
	Mon,  6 Nov 2023 12:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F491416E5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF7CC1BF3C1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 12:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A41C1416E5
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 12:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A41C1416E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVkrbhpSF63U for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 12:10:54 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B98E40620
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 12:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B98E40620
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4084b0223ccso32445645e9.2
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 04:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699272652; x=1699877452;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NDdDndrLBh3E3GdqQxYYDpnk3ata9pcDGNvOzg0D/Yg=;
 b=BrmBWxA7y+70Rmggjha6q9a4HmLPG4IZOWlqm0jcY1JOQKHzaYXjN+xU3VHcqjVY/H
 DXB/vNv39OnGoXJhuMI2l9LUcaTBfKN5LwIXZzWVIersrOX5RKWK74uwQKjJV/hbEt8n
 MEv2HalnCOTcxZaAAgjwnMnVUC9BinnVTJpIARgH0kgWePysX1I9dJ1BwYDkSHpDaSEM
 fZPtuI+ePRF56WPhRIxooY8qo3gj5vi5+WNAaN4s9C6ATjFuGpENw5I7IV6s+W7RDgbH
 2ccEt7/WHpAiowFfQ2j5Y0KFiGVqYuTXYCzKWhfZt8WrhWgp4fGnFdz5sjuBGdpMyB5B
 apvQ==
X-Gm-Message-State: AOJu0YzXYbhfFClQsBxX+aKmsgzgXAfuTCtnA3YSNjq27MXMbBWj915F
 50Uv2F9Hm9TaiaSDC1gBTTGk1jY0nIjuJg==
X-Google-Smtp-Source: AGHT+IEjCLiD1ybk3E9Tfv3/x11sVsLlG9g51UwmpkMxYUVcfPMocRpcqXcC0d2VZgp5ioWCEzCIhA==
X-Received: by 2002:a05:600c:470d:b0:404:f9c1:d5d7 with SMTP id
 v13-20020a05600c470d00b00404f9c1d5d7mr24013423wmo.25.1699272651863; 
 Mon, 06 Nov 2023 04:10:51 -0800 (PST)
Received: from localhost.localdomain ([89.207.171.79])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d680a000000b003143867d2ebsm9342665wru.63.2023.11.06.04.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 04:10:51 -0800 (PST)
From: Titouan Christophe <titouanchristophe@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 13:10:31 +0100
Message-ID: <20231106121031.57557-1-titouanchristophe@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699272652; x=1699877452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NDdDndrLBh3E3GdqQxYYDpnk3ata9pcDGNvOzg0D/Yg=;
 b=eE3QBPxDsj7AYzHDMFOKB4UAU6TgKC1lfr/+RXoOBSpeE5D12K6/SF3YqFYyZBvgqn
 1HziCbIXNOd0fQELOgNbNowe7LHeAwyePfhIhgKq6VygqGT8wprZ20q4Uhrh8hz4ZCps
 mUpNyPFwEsSQA909B9XJ3Xp7x9QDwJl/X1YE9ssdyM2FL7PwUhTbQeQjuuCU9BILV4iq
 TfjMgW0CuE7pPe4h4poNZr+b6txX69l5T6YxtXaD+GnxrmT/VK/R122JeXyX/vZqTlIk
 WrC+uJYXUxp/2AvDYrGo+pVL7ZtnIT1R04rEzx8t0ZErp1KeYvOV6pvi5SlyMKLiNWod
 hT/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eE3QBPxD
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to v7.2.3
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From the release notes:
(see https://github.com/redis/redis/blob/7.2.3/00-RELEASENOTES)

    Upgrade urgency: HIGH, Fixes critical bugs affecting most users.

    Bug fixes
    =========

    * Fix file descriptor leak preventing deleted files from freeing disk
      space on replicas (#12693)
    * Fix a possible crash after cluster node removal (#12702)

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index d1874d026a..365fbf4063 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ca999be08800edc6d265379c4c7aafad92f0ee400692e4e2d69829ab4b4c3d08  redis-7.2.2.tar.gz
+sha256  3e2b196d6eb4ddb9e743088bfc2915ccbb42d40f5a8a3edd8cb69c716ec34be7  redis-7.2.3.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a6b58148d2..77cfb1e0b1 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.2
+REDIS_VERSION = 7.2.3
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
