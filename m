Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6B8C61DF7
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 05:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20AB761506;
	Sat, 25 Nov 2023 05:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20AB761506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rOZ2KsOMxjJv; Sat, 25 Nov 2023 05:40:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6835C614F3;
	Sat, 25 Nov 2023 05:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6835C614F3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED4831BF4E5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1F484016C
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1F484016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMHU2WYEgmk9 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 05:40:20 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9A5F40160
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 05:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9A5F40160
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7b35b9645e1so89753339f.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 21:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700890818; x=1701495618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i37edfeWsGmj3QqcijTut5wamXSaNS2MuTqu9waNmKs=;
 b=tWwOxonIdFIVQ/ojgpvvj9shbDXdLHpgTRFz1gpRC1nnrKkz5lS+Qqz/chPZO/rXZZ
 EF56xieqsYeGhij5f2Di5xXN6WbU3t1VioUW4k4EtogtyHk8xLvLSfMCrdGGPL8FiH0v
 A2QUTchF2TzPP01q6Bi1Di/NCGVH17t/E2+A9qWBO0u/3yN+LG10gBxSZHPcQOHkqlKu
 3gTxs0tTlyumZIjBtPom0P6hiwjIr5GsLI2ZDbmo4EZM3CKjN356pZGhcSMRM0nSa+3j
 dJ9ksaPqT3rBEfRuzXVlELXnXAp8ITG0aQcknF7GzM4T+4zYdvV4+U683V+aCfr+/Z2B
 wM+g==
X-Gm-Message-State: AOJu0YwhGN/WnE6LOm99bvuTmhLt/7W7ZafmOVPV+y9kgkKwbbFsvi3F
 U2fiDT+C9Qs59IIkKGE6wilnakKmKeE=
X-Google-Smtp-Source: AGHT+IHVQG+rgQy5X1XauovS8mMAAnMZ+2cMrpgwmple0ucfAvtDFmomLnin0yTHBGDt3Z6DHRozlg==
X-Received: by 2002:a92:cec7:0:b0:35c:6e90:ebfa with SMTP id
 z7-20020a92cec7000000b0035c6e90ebfamr3464350ilq.6.1700890818443; 
 Fri, 24 Nov 2023 21:40:18 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 ci10-20020a0566383d8a00b004665e8a0608sm1166543jab.137.2023.11.24.21.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 21:40:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 22:40:16 -0700
Message-Id: <20231125054016.311072-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700890818; x=1701495618; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i37edfeWsGmj3QqcijTut5wamXSaNS2MuTqu9waNmKs=;
 b=hY8i05lz/ODuofHnpzJejRBpX+L3j67MfIVk6v/RQ8A6XVS2wUGNcuvFloC7bnYBkl
 OpgLgSgAZLRNEQAJ1T/3epQARtrpyfupHLyVTedLmEQtN+EuM+/jlIXCUHKWE34caco2
 pqux2DWIYzf+5302hXvi5eTd0YVbc+eZ59iQTmLbc03jDGGT2xCisNv89QnhwljRAvl5
 6kL4omd+pziWN+5RntMd9F6HEIV9Trs4UDkEuhr3JOoh+fOMszqZKnoQkymjy1o6cBk+
 VmYfkN4zjRq3leKg+73xqxsWkNg+7V4kguatOu7W6eX7+zlE4mTs7rzZgdjOdnnMTTrf
 7F6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hY8i05lz
Subject: [Buildroot] [PATCH 1/1] package/python-portend: bump to version
 3.2.0
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

License hash changed due to notice removal:
https://github.com/jaraco/portend/commit/5957d58266e479f124b31f30e4322e798fdf386b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-portend/python-portend.hash | 6 +++---
 package/python-portend/python-portend.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-portend/python-portend.hash b/package/python-portend/python-portend.hash
index 6af3b77792..98e196bec8 100644
--- a/package/python-portend/python-portend.hash
+++ b/package/python-portend/python-portend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/portend/json
-md5  c37d676837505a6fc8dd33185c6d62a7  portend-3.1.0.tar.gz
-sha256  239e3116045ea823f6df87d6168107ad75ccc0590e37242af0cc1e98c5d224e4  portend-3.1.0.tar.gz
+md5  0c3a2e8073c384b826f87795766f1e0e  portend-3.2.0.tar.gz
+sha256  5250a352c19c959d767cac878b829d93e5dc7625a5143399a2a00dc6628ffb72  portend-3.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-portend/python-portend.mk b/package/python-portend/python-portend.mk
index 4322121e9b..5415198ffb 100644
--- a/package/python-portend/python-portend.mk
+++ b/package/python-portend/python-portend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PORTEND_VERSION = 3.1.0
+PYTHON_PORTEND_VERSION = 3.2.0
 PYTHON_PORTEND_SOURCE = portend-$(PYTHON_PORTEND_VERSION).tar.gz
-PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/6e/0a/42bcc9c97744958ce72d33f526e972379b9e90adede8a151f338818c41d4
+PYTHON_PORTEND_SITE = https://files.pythonhosted.org/packages/8f/fc/bcfc768996b438d6e4bde7a6c8cfd62089847b0f5381a0e0ec2d8ee6b202
 PYTHON_PORTEND_LICENSE = MIT
 PYTHON_PORTEND_LICENSE_FILES = LICENSE
 PYTHON_PORTEND_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
