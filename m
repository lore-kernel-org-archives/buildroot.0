Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EADECAC590
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 23:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2025C60618;
	Tue, 17 Sep 2024 23:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guRpVXtqh3QV; Tue, 17 Sep 2024 23:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 141096115E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 141096115E;
	Tue, 17 Sep 2024 23:49:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FE611BF2FF
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E4EF4041C
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90RibYSDYbwo for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 23:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED9CA41057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED9CA41057
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED9CA41057
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 23:49:08 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-829f7911eecso351068839f.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 16:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726616947; x=1727221747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MAO9rAZfRwUqZLWZmCWB7K+KKzTRGn8tYJjn8PwXUfs=;
 b=jzLakbi+Q8ljiL4XZqSjsPzPe46ncHotSAO6Lnk0812mm0kQeynnDA5xvMGYHEEIg6
 5w/jmV0FhHkN3jBUxvhJh+I94QbUC1+x6ODOCBzlS0C1X+nnOsf3sR5Uyp2lHG8U223d
 A9WT3QjXSiAkP2BBFxmCyyWv2+UJB3lknK3/MbSM4P0KHKkwS+Sbkg0XRo9exT+MwJYn
 TjgogGhTkARu6aOAY/urtxJi2zB1LP6BeAfoSOn7h5/2UQN5vESvvNEygUpDuUr6jHbf
 GOdi7tKgi0xnl5B4WPegeFehPqtZ2HXyMtwGxxeDJVUEb7kprv0Subd/5x/08c8lU+BN
 Wvmg==
X-Gm-Message-State: AOJu0YzJ5sRI6ywDZxq2nTllmA62tBmrU5ZIWXqpbas5yNhpdaJHmpvH
 ooi+KDBGEn1HtsU0v46D7Md1tKlKrnXm0BmiQ+EDfERjvdvtKMG2fegDBOHR
X-Google-Smtp-Source: AGHT+IHzrKoFchAinvkU0KTYOjfucwnlioWJ1CG349lTW2j6j2/WUB6degTWWX3kf/x8rzIc4BuqXQ==
X-Received: by 2002:a05:6602:3420:b0:82c:f30d:fc9b with SMTP id
 ca18e2360f4ac-82d1f982f5dmr1641064239f.13.1726616946994; 
 Tue, 17 Sep 2024 16:49:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d49354ad4sm229772139f.53.2024.09.17.16.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 16:49:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 17:49:05 -0600
Message-Id: <20240917234905.407631-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726616947; x=1727221747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MAO9rAZfRwUqZLWZmCWB7K+KKzTRGn8tYJjn8PwXUfs=;
 b=j6bsYMcjkTJWfuFJgIIow/RdFRU9maFd2oT2EvNHicOGoamE2jOKB6iM2esmQj0drO
 UmjkRcPDYmHnjYUi6pYxrkLno/+BXeGqGb4/rP5CRQ5BiYcZt6mLQkJ++PmYItxsez64
 NzfT7e/05OCRThTkvzZCJNKshs9CQsSJqfU9O96YZkFfOKbbbvOD0x7BpHbb0SrPOhF9
 6OEh25nP8DnbLKEiJyvpsi1xLQcc8N1keMSrobRearxm+DLVBKPQMo2AqHjkzMtwZGiJ
 nVanvkahY3mUuRyjZxyS8njZdhaDMDfLsq5XXxqlUGYPLjd4adet+0V996txh2qS3otz
 GkRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j6bsYMcj
Subject: [Buildroot] [PATCH 1/1] package/python-pyroute2: bump to version
 0.7.12
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
 package/python-pyroute2/python-pyroute2.hash | 6 +++---
 package/python-pyroute2/python-pyroute2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
index 87693d028b..e346ca4f66 100644
--- a/package/python-pyroute2/python-pyroute2.hash
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/pyroute2/json
-md5  0566531c56ec453cc9ca0aff2c3f2f31  pyroute2-0.7.10.tar.gz
-sha256  cc2f90aad1517cb0b301041f678cc8d3c3427c26e53f15c78c93c67928d89a02  pyroute2-0.7.10.tar.gz
-# Locally computed sha256
+md5  04e3b1a6550840c2eaa75da16b83f62b  pyroute2-0.7.12.tar.gz
+sha256  54d226fc3ff2732f49bac9b26853c50c9d05be05a4d9daf09c7cf6d77301eff3  pyroute2-0.7.12.tar.gz
+# Locally computed sha256 checksums
 sha256  4739b32a2478e9c204bf010bad5d565d188e59ff905e3c8f71fe3398098b7093  LICENSE.Apache-2.0
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0-or-later
 sha256  cbd229e4525bd162dd51f53b2e972d0383f0d0bd5277a10387a57ab9bff97c9f  README.license.rst
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index 023b8e7c44..a4029c7321 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYROUTE2_VERSION = 0.7.10
+PYTHON_PYROUTE2_VERSION = 0.7.12
 PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
-PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/18/44/930e15e4fd5d0c7c54dfd303f644a057d88f411a97581d6edc5cb9e16f9e
+PYTHON_PYROUTE2_SITE = https://files.pythonhosted.org/packages/39/16/323b947c34530436658331e2cf393b72ebcbd923a75154a7efb28feefd5d
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPL-2.0+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache-2.0 LICENSE.GPL-2.0-or-later README.license.rst
 PYTHON_PYROUTE2_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
