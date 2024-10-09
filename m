Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B129BCEE338
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FE834079F;
	Wed,  9 Oct 2024 17:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsNA_mGxbS2Z; Wed,  9 Oct 2024 17:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFBC4407A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFBC4407A0;
	Wed,  9 Oct 2024 17:43:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B77C61BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0F424079F
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJMnk1anZjzs for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 665FF407A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 665FF407A0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 665FF407A0
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:43:27 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-82aa6be8457so3349939f.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728495806; x=1729100606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bh7ICCK6t8F9MOuQXbS9gT2ZduigdXkfwjvy9qpkg3w=;
 b=tBQxVLv/ZHWvBRZF102Mk2Q98ulnW7mniTeWptYB6LyTsjxWGdTr5tZX5v2GzxkJA2
 5NrwLks6IVfzwQASvJRXXYjxtoE2VJu5xJWmoLgK+0o9XDQ34F4BJCoZhqw7qHNrB2A2
 iDnADlE2hG1897TiYSY0vrYKRf2b9j7ZuKm9LiP6DwNUAdw6qkAO9zRV7Pip8tyQzJjL
 eDOZoByN9sE+Keqz+JnQMgc1dTGVjV0+wxt/tg6x6JoxVLpUaJCfBfPWLapjh4+QbvBS
 cRCoqCBvAJ4QqOW95U+JRIkTb0JsqVJQFbc3Di0QflZ/DZ7rToDbV6+w5fH7XO+6KBWn
 RC0Q==
X-Gm-Message-State: AOJu0YxXG8pxDFf+rCKW/IQOCzw1sWrBFHTj5A0Che2kMHUtepyb1lBi
 VrFtYBk4L6QSPks6PEt1NjS+OkH81zS2KnJ1aqFwXwgh1tHIQxle9xtGsxCx
X-Google-Smtp-Source: AGHT+IFmw5y/UNa1zj7l9OTGgDQVHUefkBb5W6NUB8DrUgdhj22t+Wsp3ouamkdf+CtHqvVtguX//A==
X-Received: by 2002:a05:6602:16:b0:805:2048:a492 with SMTP id
 ca18e2360f4ac-835486c6fb2mr31809539f.6.1728495805994; 
 Wed, 09 Oct 2024 10:43:25 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db94cb82d9sm891713173.75.2024.10.09.10.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:43:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:43:23 -0600
Message-Id: <20241009174323.3850346-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728495806; x=1729100606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bh7ICCK6t8F9MOuQXbS9gT2ZduigdXkfwjvy9qpkg3w=;
 b=Q5w4/9JURiHwp9czoe4hFpUSnrJP2mwzhv6ZZYur0fJQ3rnRI9HUE63uX58+txC3Oc
 kKbjV+cLUo1lMRr7v/I6qvRqHYxR4/BL1B7pLoRKSqa4LWT8+tO8iT+Wj/41xHoEnrGT
 xixM9okoJrSVjZ5uymPUgASVR/HAEapT6at3QFw9V1QHBMSqNl9Y4eiQbGVNa+Xz0/pH
 c+N5WvCTMk5W5ctBsFaMAJ3bdEnnyDv2c4bmflv/nrpJaV4mQ5LRMACRqUsGHPNmr0VT
 X9y4jpNB00mSKoPQ0FxIGTudn0VZravSldps1Jiishdm9zQIBNw9RCCyukgqnX/Nr78M
 ajvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q5w4/9JU
Subject: [Buildroot] [PATCH 1/1] package/python-qrcode: bump to version 8.0
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to poetry build backend.

Drop no longer required python-pypng runtime dependency.

Drop no longer required python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-qrcode/Config.in          | 2 --
 package/python-qrcode/python-qrcode.hash | 4 ++--
 package/python-qrcode/python-qrcode.mk   | 7 ++++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-qrcode/Config.in b/package/python-qrcode/Config.in
index 6e63d83e41..9a17cc1f08 100644
--- a/package/python-qrcode/Config.in
+++ b/package/python-qrcode/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_PYTHON_QRCODE
 	bool "python-qrcode"
-	select BR2_PACKAGE_PYTHON_PYPNG # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Pure python QR Code generator
 
diff --git a/package/python-qrcode/python-qrcode.hash b/package/python-qrcode/python-qrcode.hash
index 48b2d7b2b0..ceeaf05f49 100644
--- a/package/python-qrcode/python-qrcode.hash
+++ b/package/python-qrcode/python-qrcode.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/qrcode/json
-md5  a4c47fe5ff966b105098998cfb2294de  qrcode-7.4.2.tar.gz
-sha256  9dd969454827e127dbd93696b20747239e6d540e082937c90f14ac95b30f5845  qrcode-7.4.2.tar.gz
+md5  29561c9082864010f884d2fc5b3e62de  qrcode-8.0.tar.gz
+sha256  025ce2b150f7fe4296d116ee9bad455a6643ab4f6e7dce541613a4758cbce347  qrcode-8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  40dfb903c94ee3f789500131311186548ecba5cefd3557623d7700e2522ab994  LICENSE
diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
index 97b181a1e1..770befc9f2 100644
--- a/package/python-qrcode/python-qrcode.mk
+++ b/package/python-qrcode/python-qrcode.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_QRCODE_VERSION = 7.4.2
+PYTHON_QRCODE_VERSION = 8.0
 PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
-PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/30/35/ad6d4c5a547fe9a5baf85a9edbafff93fc6394b014fab30595877305fa59
-PYTHON_QRCODE_SETUP_TYPE = setuptools
+PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/d7/db/6fc9631cac1327f609d2c8ae3680ecd987a2e97472437f2de7ead1235156
+PYTHON_QRCODE_SETUP_TYPE = pep517
 PYTHON_QRCODE_LICENSE = BSD-3-Clause
 PYTHON_QRCODE_LICENSE_FILES = LICENSE
+PYTHON_QRCODE_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
