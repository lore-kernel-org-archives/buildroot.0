Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1F4CEE338
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C043240147;
	Wed,  9 Oct 2024 17:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLYPT2qR1MPn; Wed,  9 Oct 2024 17:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61C73401B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C73401B6;
	Wed,  9 Oct 2024 17:46:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AE971BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5152C60665
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPD8MTwdoeUW for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5C3176064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C3176064B
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C3176064B
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:46:05 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-8353fd2cacbso1988739f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728495964; x=1729100764;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0CT+VmgfF+fd8csmx+lUfXu4hW7+036OaC/B5fyIia8=;
 b=Jr8Mb4Xv1kWOmMwC79wlWwotf5n5a4fsW7HcPQM3ztDLhwDk8DtCDLzHJLLbi4l2cW
 wU/TP/EHtZAZdfwlUtrMPnbm3JS4UDuzN/MyfnxFHIl48Z1NnEvQSRRc9a0jE/n7kv0u
 ESzfPC2zyxBUKFtl4qqREC14Pj4U5nZgZPw/ZwGjkDi36Ci6yxaZcMxxlP8PrdSCkKvU
 av0md/1vFPBQJ1LoIcrM5NrfK6CNXbsiVfwOVEBTB9JWHxkKQWmHbIwGwFKVH2ADixH0
 +TaN6gH+RHbVacW1F3/i4/iii6o2Ee5t9IC2zzRoRCF+ZZ6msUum0p8fZe1SkqUUB/5L
 h7Jg==
X-Gm-Message-State: AOJu0YwvsXU047NGKM5x2ERddjEQOGB8GRoCl6KIY6V5PFMVQ+l6vGPM
 lZpGPITBphchdKtejscQDck4GVQR3w/UV9SnjDl14Sw8QCViG9fJI+aETxg4
X-Google-Smtp-Source: AGHT+IEGEwVIUed4gIVKDPqbUFImK/ljWGBMdHl0vMy2kRRb5HggKCnUU3mPnjY5d7pfEtgHb4ASYg==
X-Received: by 2002:a05:6602:29ce:b0:82d:8a8:b97 with SMTP id
 ca18e2360f4ac-8353d4f1132mr432476239f.10.1728495963959; 
 Wed, 09 Oct 2024 10:46:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db88815e66sm1379568173.31.2024.10.09.10.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:46:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:46:02 -0600
Message-Id: <20241009174602.3852181-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728495964; x=1729100764; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0CT+VmgfF+fd8csmx+lUfXu4hW7+036OaC/B5fyIia8=;
 b=nbR4GiFZDMj6egqrqG5MLhqyu6rKMK5ia8Nq7yuy/JNgxpqrJN7G2OwstSNYdjbZUk
 EouBBJPQtKa52YS0cUYBpH90PV3ZORnmyViAQE/uCsEmIJvTESuoP58WbS7IwzX7P60q
 MXC7GgXggOEpRvMaBhbnUD4AtANVk6Knm0deJsFe3mhZ6kgMF32TGWBKVxiS5En67sP0
 8JaIUIsr1bzkpmcpSIw2h7OHcURBmwvlC1TPZUh/6N20C5JAvTPFQue5aQXF1GmJg873
 9uxcEjhYV4gwmLce3yjCU8WzkVEH3eWXoTdzjgkifgOnmBWNnQjdJj+n4NRyf1LhFp+o
 qXHg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nbR4GiFZ
Subject: [Buildroot] [PATCH 1/1] package/python-redis: bump to version 5.1.1
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
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
index 0f53479790..989cfd39f2 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  e5de12682a1bd96e36a58137db72ee37  redis-5.0.8.tar.gz
-sha256  0c5b10d387568dfe0698c6fad6615750c24170e548ca2deac10c649d463e9870  redis-5.0.8.tar.gz
+md5  54db97ec8f7445c107d61829095ed915  redis-5.1.1.tar.gz
+sha256  f6c997521fedbae53387307c5d0bf784d9acc28d9f1d058abeac566ec4dbed72  redis-5.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 6fbfe5feec..a8123f225a 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 5.0.8
+PYTHON_REDIS_VERSION = 5.1.1
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/48/10/defc227d65ea9c2ff5244645870859865cba34da7373477c8376629746ec
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/e0/58/dcf97c3c09d429c3bb830d6075322256da3dba42df25359bd1c82b442d20
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
