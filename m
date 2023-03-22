Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CD2C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 01:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE3BD41496;
	Wed, 22 Mar 2023 01:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE3BD41496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_0tynmanZxh; Wed, 22 Mar 2023 01:57:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFF5A41477;
	Wed, 22 Mar 2023 01:57:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF5A41477
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 549981BF337
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C74441477
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 01:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C74441477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzhfkXZh943q for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 01:57:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DDBE408EB
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DDBE408EB
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 01:57:06 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id i19so9155837ila.10
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 18:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679450225;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ka+Y1HvnsUrGiA5k37AKNaDKM0EggkA2rHKGcQZXKT0=;
 b=IcBmUjuVBzRFL44+GYZUJKr4t08PtqvE//ZTq9vUg7pWoHMiHPUU5irkPazlefcUgR
 VutJ78ghbDKCtS+BM8lJBsVdwIdFlT5rhTQPtDK+Bt+HsGcvCB0IkfZtYdy5xXM3BqnC
 jtfDXtmssr64RfJGbHWIJJgz5hJQdJPOVFaOMISDOU3XGahYP388CQ2SwA5R/aUh+3er
 l/wjqwEiMEySUFMjXC3lwdVWPYnQ9V9OHdNZlOgfW8md9PUqwi+lOzVTQ0B5TpRvGK8F
 CGhOTif9FvTkpcS1HTW3zRu7FZSrhZFhd1XEO3BC4qGoLIUA83IOhLQv32EJ8THwcHuA
 iAqg==
X-Gm-Message-State: AO0yUKXnPZLT3SMMzuHFTBn3Wbi5eZ+d/a+Xj9hZ6iPLIzBDnN46O8IB
 mBqM5FuBKeXo32R1l0EglCcx+hRZEzl8rA==
X-Google-Smtp-Source: AK7set/5UXcpUJ4OFfJdcDE9HlIPJ+/1eK+OArODZJkq4OXU2A4kFqJwgODp5GqNAzNXIT+HYF4VlA==
X-Received: by 2002:a92:ce06:0:b0:323:338:cc3c with SMTP id
 b6-20020a92ce06000000b003230338cc3cmr3335530ilo.6.1679450225109; 
 Tue, 21 Mar 2023 18:57:05 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 l12-20020a056638144c00b00406ae1bd4a9sm1213017jad.178.2023.03.21.18.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 18:57:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 19:57:03 -0600
Message-Id: <20230322015703.107728-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679450225;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ka+Y1HvnsUrGiA5k37AKNaDKM0EggkA2rHKGcQZXKT0=;
 b=ZfL38oYllTIpTvpdTvJRganyS1Eb1YZAIxnrFAw9iJnfoUsCYt9u3JVevmJixCo/Bc
 tN5D2MrSsx1gxi5N+qOOGamgDWE6aEcpJhVMnehKRHHPdcgw5xnTdw1YbpsEflTE04Ny
 Q5jdR9SLqGf69zDBuZ9RPFj82UFiwwZ2FOUQ5YvFvjE3RMmKbYNObrWfV3SaPW1iQhVI
 OVFoZYAiiXymyXEqWq3HIb31BaYCT77lHPmNwrhkUQUA/LuEt1IHRc3taTowpPy8QgUp
 2Dw5lpzUwD/onJy3Ae576EP/0uTismQK53vwAyCbb4IQraB0Q5EVwLuGgNHYYjO9uYr8
 FJ8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZfL38oYl
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.29.96
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 0e9d0572d7..57d07a6711 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  3946a693e09b65a0f6615a1a30f606d7  botocore-1.29.45.tar.gz
-sha256  62ae03e591ff25555854aa338da35190ffe18c0b1be2ebf5cfb277164233691f  botocore-1.29.45.tar.gz
+md5  c608709a5cf3e67442f4254a34d1faab  botocore-1.29.96.tar.gz
+sha256  b9781108810e33f8406942c3e3aab748650c59d5cddb7c9d323f4e2682e7b0b6  botocore-1.29.96.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index ceb3fbe6ea..6d0747c0df 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.29.45
+PYTHON_BOTOCORE_VERSION = 1.29.96
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/9d/4f/1c24126941d1f8c1f2ecf459f88959d59566af34a55a81d926368fd2e6e5
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/2d/b5/4a986aeb4e3d182f7ef116705962d3c98c0263beaf87c49836b7dfb91837
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
