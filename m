Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA2FCF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 09:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623B14053B;
	Sun, 22 Sep 2024 09:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaOwZtsL8Ofn; Sun, 22 Sep 2024 09:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2268940586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2268940586;
	Sun, 22 Sep 2024 09:01:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6FA31BF57C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A531F40586
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 09:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kq2posGEeOqA for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 09:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CF504053B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CF504053B
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CF504053B
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 09:01:20 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a07bd770e2so18824135ab.0
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 02:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726995679; x=1727600479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RhdxMFU/mzZ/OyQYizptPOitfgG/bwdIUDUGi9/jPKY=;
 b=C49faCCucrR595Oa/15pVFrdWfH0u53S/zPAuNGlVwKBaUnnlBoCgtCbdlZ+Ek+28Y
 x3lHZK1cbLIFQcuYSfoIBzQPrywt8AW/fDpptzEuM5nia19gdOWulv/nZdLcwB6/tp2Y
 1UJ2N9JHhgd4rz0YMBamGGWknoLzk9oXpGwM7C6SWkAOpRhmvroqwjx8dH5kyaJxh83/
 FZE/zINOzgwVZkwtO9SoocyALixnSfhgP/GioAJlqLBwzTtSM2IlVd1aw57+lxEMRHUE
 R0yYis7u60ukhPpsEMSlkLLsrZGV2Cxqr3Mj9N+NIEV9RlSn9m8biOTOEEMI79GZzBVG
 5AjQ==
X-Gm-Message-State: AOJu0Yy+0TZBURVAm9b5L2+z4YxyAEaC78lcXXfoZBDhu28hyDWssVBl
 UVdBKopxV7XryQ7YG4Qmyo82tDQZiMmnV+F2LDUgINIsOf+GyV2kG85SUQ==
X-Google-Smtp-Source: AGHT+IG/5tmek7B92Ns3hoco9eF0pu8KbmDANrtAjSy/l7adZDtaYkpU81Vssafd8IyWCzbfpA4Ggw==
X-Received: by 2002:a05:6e02:1d97:b0:3a0:b5b0:96e9 with SMTP id
 e9e14a558f8ab-3a0c8cbac44mr76452355ab.13.1726995679037; 
 Sun, 22 Sep 2024 02:01:19 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed34febsm4548480173.134.2024.09.22.02.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 02:01:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 03:01:17 -0600
Message-Id: <20240922090117.1024184-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726995679; x=1727600479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RhdxMFU/mzZ/OyQYizptPOitfgG/bwdIUDUGi9/jPKY=;
 b=GGlPIqD8bxWRjo/HE5j5tIbkh+/SvohJ329dOgh6VyM7gAJCa1zipSDVwMk/+qAoin
 Svv1pTBRKwm1efIamMdIz9TEEa4bz10qr2MqZsI3awD2q45Iw1BjQtrAg/oiYJugRKZN
 kky+a1crvnqZGoDdr6ksp9CiViyKi4JVp5QNZRxcb8uKKzd6fa/8NNsGnYnBtVhzVKwp
 GL/E55u3bkbd8DWaJD8xFx6n9I7HZ0BRUeo0IR9Z8Za7RbKVKMoIfW/7cf3Slxzgo1Bq
 XgYjs7I+i+X2xTqOGH3+WDjHpQsBs5TddBLgjxJnRHpzOqOOnJ2rcUSapoixxAOO5r/W
 d8wg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GGlPIqD8
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 3.1.1
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
 package/python-greenlet/python-greenlet.hash | 4 ++--
 package/python-greenlet/python-greenlet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-greenlet/python-greenlet.hash b/package/python-greenlet/python-greenlet.hash
index 59be4fbff9..7ed4ff13a3 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  9ff064be5bce917f9a60b609ca65f54b  greenlet-3.1.0.tar.gz
-sha256  b395121e9bbe8d02a750886f108d540abe66075e61e22f7353d9acb0b81be0f0  greenlet-3.1.0.tar.gz
+md5  13a71396abdf249280fa25d258acf435  greenlet-3.1.1.tar.gz
+sha256  4ce3ac6cdb6adf7946475d7ef31777c26d94bccc377e070a7986bd2d5c515467  greenlet-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 6e041d5ffe..5575ddaff5 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 3.1.0
+PYTHON_GREENLET_VERSION = 3.1.1
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/65/1b/3d91623c3eff61c11799e7f3d6c01f6bfa9bd2d1f0181116fd0b9b108a40
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/2f/ff/df5fede753cc10f6a5be0931204ea30c35fa2f2ea7a35b25bdaf4fe40e46
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
