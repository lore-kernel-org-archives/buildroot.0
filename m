Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78661CEE329
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 16:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B2C4011E;
	Wed,  9 Oct 2024 16:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSJJZYBgczb3; Wed,  9 Oct 2024 16:00:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8F034021F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8F034021F;
	Wed,  9 Oct 2024 16:00:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D27D21BF3F0
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1C394011E
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 16:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTeoYcoGwS1q for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 16:00:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93B814025A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93B814025A
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93B814025A
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 16:00:05 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82ce1cd202cso299315339f.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 09:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728489604; x=1729094404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8opSudJdLQEVeuDkbOWMEsf61mnaAkRDWrwcfuAa6fc=;
 b=O6sv15PfsiBkyndDOJDtPs53kcf2uwwDV3yP08Rw9SUhAZr1b9TF4GPAT9bf6o9BX8
 YDuhC6NQr2vHxvr6yTfgN1qybwkATU+kIngVyub6g1+V70G1BKGKUgdz2qTBJQBdV/kf
 Gp28IMJVx4fpJgwuqvkNG0K1OD4D2yIVpxUl2N+NL107EIsHdvu8r8KyRMqLqaeDhwRJ
 l1cFJebxkhqG5KaMh7s8CpTGS3CKOp/6WLSxNi+ee43R8oF8DHdSWZ3GgTkdmt8R9tnh
 JD0/4gRvWI59EWQ+6P5Jx4GRmK1HcsUCUzVgNUo0YzmMxukNaKVK7wxIgy6xEChMrP+b
 kXfA==
X-Gm-Message-State: AOJu0YxwkS1vd1eq+zNICAdUlPcOPrWbcyWsE08GeM+rpkzIKyOPq7cM
 KEFYdpqGG1Jiue9f9AQCUjTR8MtPA1cyyaSnoneW8dc67cqDTKLm9IrhktzD
X-Google-Smtp-Source: AGHT+IGLW/SYSZvvmgQa0xWN+6GYdQ6e6KxBYFQy8wj20LkwvcRgB/r+LpeBVzJKs0cnBIhOiUP2dQ==
X-Received: by 2002:a05:6602:2b07:b0:82c:f9f0:ff5d with SMTP id
 ca18e2360f4ac-8353d4f9ba2mr384696339f.12.1728489603897; 
 Wed, 09 Oct 2024 09:00:03 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6ec2fe01sm2089843173.143.2024.10.09.09.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 09:00:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 10:00:02 -0600
Message-Id: <20241009160002.3803549-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728489604; x=1729094404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8opSudJdLQEVeuDkbOWMEsf61mnaAkRDWrwcfuAa6fc=;
 b=daeOSW7YvmP77Ej6++spvh73iAaQDoS5ZS0CWy3JDyHZ5SVVcMc2p6+iAiBFC6q4sp
 0zk94doB3RYG9NMKALAADTP6QHCTk3V3QOjNCWZtABvsA1nYUpmP3nq/tBHH5FyBoKuc
 4aQ4IX41f4f3g5hQApOx8pO5/PZrVicgZsGs6/DGspyeB+xXTu3hQolajbSETyVSqoX0
 3clcZ98U0/5v7LL3YlTn0M/AqRLx1Pl02l8J0QhIJ1pTd6DMEhSyWprkZXe1Yrg8UiLf
 tCwGC4QkCFnfgncWziU2TLE6a5ydK2Br4HpP9cWjf8ncftYD9SGDsiykNA8ad5LYINYR
 6FGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=daeOSW7Y
Subject: [Buildroot] [PATCH 1/1] package/python-django: bump to version 5.1.2
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
 Oli Vogt <oli.vogt.pub01@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index d39bf4d081..2d0b0d46fd 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  8024c23d7efe9e7acb04496ae22739c7  Django-5.1.1.tar.gz
-sha256  021ffb7fdab3d2d388bc8c7c2434eb9c1f6f4d09e6119010bbb1694dda286bc2  Django-5.1.1.tar.gz
+md5  bdd601132b94080200e71137a20d0d6a  Django-5.1.2.tar.gz
+sha256  bd7376f90c99f96b643722eee676498706c9fd7dc759f55ebfaf2c08ebcdf4f0  Django-5.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index cfe23ab16b..8fc95c8417 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 5.1.1
+PYTHON_DJANGO_VERSION = 5.1.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/88/6f/8f57ed6dc88656edd4fcb35c50dd963f3cd79303bd711fb0160fc7fd6ab7
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/9c/e5/a06e20c963b280af4aa9432bc694fbdeb1c8df9e28c2ffd5fbb71c4b1bec
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
