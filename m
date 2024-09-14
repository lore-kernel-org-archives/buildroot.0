Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC13FC6176
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B19B9600BB;
	Sat, 14 Sep 2024 22:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYkY060LW0n9; Sat, 14 Sep 2024 22:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B918C605D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B918C605D5;
	Sat, 14 Sep 2024 22:56:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E31371BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D142B4018E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuHiwcKJpklg for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:56:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9AB3A40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AB3A40130
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AB3A40130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:56:47 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82cdada0f21so72808539f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726354606; x=1726959406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LTuXlfSfyJDuEh/btcNjrLISR7h2RjU8RlBpZX8qDi4=;
 b=FXgDtYWd0IHrj37TVzME0CrBao1m+G5OwTHeNCYUxfqk75itnCYWhIa4ziiSh+I0j2
 FT6f3qXVAnWMeVa+iVYQMrGHoickKdJbt6aq413xIrVwcUIAZOd9MfvkKiX6+9IXUagj
 3Mjh/d7bDk4QEEUCs3TlVvKhMPBThhN6NxEXj1DT/U7ZhSRHTjo1Ai5GTla78j6AEkT/
 UMlDFGc8gx4Q9xAwof/5M5ibLXsr9RL9EcbP/tSIOYooK7jOwGfGaSUVJrGP4ObxIvrF
 FGLms2ywyPyy7do++3w8lA9fD/q/qECiBYPa0JX/YFsRONfT29F55kPCFrLPoYOdGP9V
 OA1w==
X-Gm-Message-State: AOJu0YxOCYVy3sYTGsdYx4QnzySw1LSbPRtZuaFoBkEHxn70s3AZvo3n
 EX+Jc8X1XjlylZuTZ/JmLwobzU5FlhxMKfROjE6WQgv8Z/pBL4djeSO0jQ==
X-Google-Smtp-Source: AGHT+IHsG9zwU1PJPwc/lU4gvI4f1ttT/jYQsQS0LJi3NEhuBhPeoGRE3awha5AwkUm9OlrA+9T+6w==
X-Received: by 2002:a05:6e02:168c:b0:3a0:9cd5:92f7 with SMTP id
 e9e14a558f8ab-3a09cd594d9mr7242825ab.17.1726354606415; 
 Sat, 14 Sep 2024 15:56:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8f3dcsm6769675ab.75.2024.09.14.15.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:56:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:56:44 -0600
Message-Id: <20240914225644.1371836-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726354606; x=1726959406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LTuXlfSfyJDuEh/btcNjrLISR7h2RjU8RlBpZX8qDi4=;
 b=eh6WfKY5eFEDhqr6fpHKx9NjvHRwvDvzECdTIi2vWjDGKhM/XorUkQgBQsH2o8PS8L
 snJO8iAdd+p/vo2icjrtmtsSaBU7A/73IQSXiwcn5T499/cPWom82KitefeVWaJrtb5a
 XSco/+eFsiQfkdJ85pedq63aAaeoeVE216wYZrVmxFDQlhEbQzLpZLSfRyiVCK4rBPcJ
 P5ENSTr0kUhCm7s6c5F73uTy6Gvhj5K/x+jpPNwnYWe3lbaHWNnllrOoEkvIkc9Lg7jI
 0OzY1GDcBGTFxPSV9tWh5OOOClmaAC9zix2M17aZYeM46cYAPqRUvdqp+54SllDU9E8p
 iZ3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eh6WfKY5
Subject: [Buildroot] [PATCH 1/1] package/python-channels-redis: bump to
 version 4.2.0
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
index 943712b3fd..6b62d0d6a2 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels-redis/json
-md5  a184dded3478e618735a42174c334565  channels_redis-4.1.0.tar.gz
-sha256  6bd4f75f4ab4a7db17cee495593ace886d7e914c66f8214a1f247ff6659c073a  channels_redis-4.1.0.tar.gz
+md5  e43a397dd3049f382a9c8b91d0f62c79  channels_redis-4.2.0.tar.gz
+sha256  01c26c4d5d3a203f104bba9e5585c0305a70df390d21792386586068162027fd  channels_redis-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index 9186f07f17..7ca065ce0e 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_REDIS_VERSION = 4.1.0
+PYTHON_CHANNELS_REDIS_VERSION = 4.2.0
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/5b/3b/941efa8e337c3537475926fbf86e8cfe38a919e0f60bb9538b1cff364b8d
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/fd/c8/d8e4d369a4cbce5dc86e84a559993001d471327f1ef57c13ffc82bdc9efa
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
