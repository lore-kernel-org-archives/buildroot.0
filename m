Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2887C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CE1260B74;
	Wed,  2 Nov 2022 19:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CE1260B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wfCmPNznyJFS; Wed,  2 Nov 2022 19:09:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2795606AA;
	Wed,  2 Nov 2022 19:08:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2795606AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FC211BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFDAC60ACA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFDAC60ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KOUosuoRrOwb for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:08:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 939FA6068B
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 939FA6068B
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:08:56 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id 11so15877746iou.0
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oiUqb02L7C4rkTcqCUCQJw/Te7mIe2V8nkGvI8T+Dgs=;
 b=6GpkdG0/YuEspBxKq/PcNDZnZc7O3zA55FIu40m+m4EmJMoY/pDf9H5bHmB251WtC6
 3sBc4LqS4Ge26GbM3E2R+LpHsW7AdxoF1KcR14sYy1+Hja/w8931JmxYiPZfaT1UQ0SA
 PQW7LZrSikZ4q6mWqzh71PJfAuPvLLBTs0Mjr3ZD/bphv87JCzYJvqlg0eWjjx0WtP0i
 LDNSAfjmxQb+wQDJI7nx3gGQoa+tepYR7QNLz3aIzvH90ulpDtIg+manNd9mLcR0e+Sc
 uVRfivnv+zi+GxLIYBggFxFfYVX9LbVIKZgWZYiDL/z3P4MTf+E4n78E/blj4dCwpduI
 4xhA==
X-Gm-Message-State: ACrzQf1B0WCt4k62/o8xii4PbCvVq0pemqye/xb1YrXNrmauO3/Upkum
 7RZ9tQj41Vn17dAzNuNZero62GQHTK+Shw==
X-Google-Smtp-Source: AMsMyM5A6qWfRaecUiEX+btKyl/aoRSaSHbPPRcGHC3xNo7vSKQ+eWCoyTlIeMTxmiouBuqt+peczQ==
X-Received: by 2002:a02:cf8f:0:b0:373:9526:ff08 with SMTP id
 w15-20020a02cf8f000000b003739526ff08mr17889965jar.298.1667416135468; 
 Wed, 02 Nov 2022 12:08:55 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x12-20020a026f0c000000b00374da9c6e37sm5209735jab.123.2022.11.02.12.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:08:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:08:53 -0600
Message-Id: <20221102190853.3023422-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oiUqb02L7C4rkTcqCUCQJw/Te7mIe2V8nkGvI8T+Dgs=;
 b=JoAyE8mWfpW+m+qPY0bck54fBC5btE+5MScq43CWfbRKRlRZGg6TsJyAj/Ar2skEEX
 rq97hY7oB56X+TLPO8OiLV7rVX908zJdUWrgvllYqYUNOtXOeqkPX+JvMWkQi0bdyq2D
 sOa+PzxV/dKJGw7ww2jMLsvmZY5YnKdyJrgyB+vWeKMDmkB1+jmoV7ShmHYO7ZLK7OF/
 q9BC7o4x8DrE0sWYgaJkxRTnMFopfJvFgahO+TRt4RQvXamwu1GDuc8eDW9QCE70tjLO
 LtwuzOFwut/lqL6l/86mb2GzsgXrXkJ1jNYrauceLym1+WGaTVBvVedxuuMciOHA33nF
 QXPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JoAyE8mW
Subject: [Buildroot] [PATCH 1/1] package/python-channels-redis: bump to
 version 4.0.0
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
 package/python-channels-redis/python-channels-redis.hash | 4 ++--
 package/python-channels-redis/python-channels-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
index 5c98953fa1..eaab5814a6 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels-redis/json
-md5  9ec9ffd467e181906f257d6c0dbabf45  channels_redis-2.4.1.tar.gz
-sha256  ddfa0c067085fdce24fb80d9c0b848638cbdbf0e1167f14eb2e99d635ad216e6  channels_redis-2.4.1.tar.gz
+md5  82898cb3b50bb19e8484b80b4d940910  channels_redis-4.0.0.tar.gz
+sha256  122414f29f525f7b9e0c9d59cdcfc4dc1b0eecba16fbb6a1c23f1d9b58f49dcb  channels_redis-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index c2c6f59c3c..727f403aaf 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_REDIS_VERSION = 2.4.1
+PYTHON_CHANNELS_REDIS_VERSION = 4.0.0
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/87/a9/8d11c32ae6bf3a2cc893185f7d1e03b80bda680131a08473c07ed1fe591d
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/8a/8d/bf96c62e3ca6c5ae59eb3482804afbe026c1c98b05b3ab65a0d46663644a
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
