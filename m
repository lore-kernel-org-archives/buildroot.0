Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E7BC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 01:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15A2040C16;
	Wed, 22 Mar 2023 01:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15A2040C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDJNVJ8Y18FY; Wed, 22 Mar 2023 01:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31DF540A53;
	Wed, 22 Mar 2023 01:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31DF540A53
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 052CC1BF337
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAEB6820E0
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAEB6820E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HX-L7qu3jMdZ for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 01:12:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9471582097
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9471582097
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 01:12:26 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id h5so9106367ile.13
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 18:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679447545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0wqpO8/4h9FSidrB3nXjTKIZV9OaQ6OypUWKRSIDVE4=;
 b=A03Kcf5fuHsZuT5U+N4g61p/r5ELa+So6MWD+kbHmd7ghW/KqfzvQ89Ec4rHWYRiI0
 uFyACRyIJH/9rWIFr9aBPPwQvhE9gg9/F25wB3icyiwSoKnsCVNqqf0MQdbhBL4xVN65
 nLs8RAOSMsHzudpqyz1CZiDP6iDvaiuIwnAizw/NGMAuGk5XgZrpqFRNg59MV2hLijtN
 BKlPBj8zUAGqS1OZeefRvNtRSvunLT/yQqSyzdIU7vWKmBOkZetICNecrLx9+hAkcsNp
 RYJY9RYs8kD3NzXJ1Q3Bo5S3cqHTzRAIns6MD/NoMLvz5pky9Nme28cvtVV7Mx23NGsr
 5m5Q==
X-Gm-Message-State: AO0yUKUX1kRw4hlmksKBiviFZuqTz4Bt29j5WUczl/9jRHtpYlbq0/Si
 yh+o6mraRBHyc1VDiEdckUXGxCP13acEvA==
X-Google-Smtp-Source: AK7set8AMYZTnw85nQ8+cAcDXxXCnQ7kHpqrfbD9nFUoLsgJ3PIzK4M6dInQo3qqPMGilSYofE20fA==
X-Received: by 2002:a05:6e02:1d0b:b0:324:82f0:1958 with SMTP id
 i11-20020a056e021d0b00b0032482f01958mr526528ila.5.1679447545207; 
 Tue, 21 Mar 2023 18:12:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 q1-20020a02b041000000b004061d6abcd2sm4583296jah.146.2023.03.21.18.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 18:12:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 19:12:17 -0600
Message-Id: <20230322011217.4189542-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679447545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0wqpO8/4h9FSidrB3nXjTKIZV9OaQ6OypUWKRSIDVE4=;
 b=bN5OChQKSkMvXsqsxnl2o9t1HmMXnVNkBRZOflu7p/3nU4wIQ+h6SpESOGtJM6oiMo
 H6xX2ppZQ0f+fpI6TOCeNQpm5wgJwd2lnKz+I5p/BVyoLPohu5vXkubObki5q3WZt6A/
 qXgYdfi6El3v2iz/kIfYASOCuUTnQdYt4NOFo6RRCC7ZHpJTjh+0mP0hZnFyG0LTIJxF
 qYlT5cEG4P5Jz8zZCyjAGRizBXT1AiywGVluA7/ta7TRWnJWz8zJTsrzg4zojQwtU2ZW
 d7NZ2DNvSDyhW4wy6iiVwv7g1yJ0eNkuXcJSE+y/CHXxDwiOrduDseS9ziTwDdR8cDI4
 ISdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bN5OChQK
Subject: [Buildroot] [PATCH 1/1] package/python-async-lru: bump to version
 2.0.2
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-async-lru/python-async-lru.hash | 4 ++--
 package/python-async-lru/python-async-lru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index 231af32baa..c6f11aff1d 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-lru/json
-md5  4dfcb328f2e9a8fdc9cf78dfdb6d3eef  async-lru-1.0.3.tar.gz
-sha256  c2cb9b2915eb14e6cf3e717154b40f715bf90e596d73623677affd0d1fbcd32a  async-lru-1.0.3.tar.gz
+md5  825ff7d35d1cd76f1b1ae44f38bf69f5  async-lru-2.0.2.tar.gz
+sha256  3b87ec4f2460c52cc7916a0138cc606b584c75d1ef7d661853c95d1d3acb869a  async-lru-2.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index 872540b713..d707249e29 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 1.0.3
+PYTHON_ASYNC_LRU_VERSION = 2.0.2
 PYTHON_ASYNC_LRU_SOURCE = async-lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/fe/67/4cb179c14ffa8b4a35fbe02255744bee4cbbaf61b35612c96ba4a618e4d5
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/92/16/be197573adca3d584dbd64d508488e95e36324ea036d751564d2f88d74bf
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
