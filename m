Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659E4CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03B4C402E4;
	Sun, 22 Sep 2024 06:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ta3_Niuc3Qel; Sun, 22 Sep 2024 06:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE3E40360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE3E40360;
	Sun, 22 Sep 2024 06:14:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22BCC1BF575
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33712606B8
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GA0zLiSt5xwO for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:14:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08BA76065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BA76065A
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08BA76065A
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:14:03 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3a0cad8a0a5so10794235ab.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726985643; x=1727590443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=utobdahvM5ElRJx7/2BzsuOubNn2nEy9c350xGP8Bwc=;
 b=kQWJy0GyypfCgiMlH9Qm4GDbY4hlNNdjsMlPGNDKYS5DRxVqGkYpWM+B+UrSWhN2YK
 zCLLCL4Asp0cN/gEPywmR99v+NvQWB46vnpvvdOaeExx/yrg6Rx3z2zzmaajwgiSis2A
 mjkwQOpQCGd6rtu+9U8KTOMcT/kXBJSWP40Nbs9p25kV0RaaOvUyhiwIruT2MyBvuXsU
 lOfkIHKXCHV0fpyUnNNFNnSv6QhTdwqcW+VpYFdWrSo8z5059t64BHe1VqXCtAW3eVZH
 0RDONJPCr+ooLnZEqJ9Y9p0S/Ptcr2LDS2WJOwsv8qwG8YO86oN/5rZ/ViPTedcqjBU+
 gH9g==
X-Gm-Message-State: AOJu0Yz1yWZ/s+vljcabEqroozuVu9v88IRDpjcWiaVpteZnO7I4Ye30
 jEFFr96AkImoDwZzNvNs9p341ULtDrXS1REV0PyV7zz743/jXp8D761y6Q==
X-Google-Smtp-Source: AGHT+IFs0YZNkP99DCHMw6YXvoJgxl79RCpcEFCH/AkvFs62kaUVDF14OfjjZx8apMYUnnuZjevcQA==
X-Received: by 2002:a05:6e02:16cc:b0:3a0:ae35:f2eb with SMTP id
 e9e14a558f8ab-3a0c8d25c83mr87759835ab.19.1726985642668; 
 Sat, 21 Sep 2024 23:14:02 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d62sm4442043173.93.2024.09.21.23.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:14:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:14:00 -0600
Message-Id: <20240922061400.960744-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726985643; x=1727590443; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=utobdahvM5ElRJx7/2BzsuOubNn2nEy9c350xGP8Bwc=;
 b=VRlpSZYhIrh7s6l1cH+/gkyjTGII6PBFg102laZLFAjoE+5tOhA4D/kif0eBHsBzuz
 8sEH9jZoB69Nqv9YM/J8erACNj+D/bK5l/A8FpqkJJkn13Z5M7TK3x9U0g76PB/vFuAW
 8QBtqHNBwzYcPhEHiAvMyvtYM2fCCngxykK4d6PdObzrxFVx9KUY4yHC+wnXAdb9njIC
 80fV0iG9iSzdJAjrK6Zu1aj1GhxP4U2ndS4bqAdTejzS/8v0x5L1r9cJ/8VzzZONLPzS
 ZsM1HrV/GCwaom6eK3gRvfzbBAETvzJy7U7UqZfhYC7bM5Q+Sqwq+xlZ1hYm03//Cxmd
 ktBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VRlpSZYh
Subject: [Buildroot] [PATCH 1/1] package/python-validators: bump to version
 0.34.0
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

License hash changed due to year update:
https://github.com/python-validators/validators/commit/1f5f499a3e1f1fdf1aff0a507c49f8a0e24bf816

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-validators/python-validators.hash | 6 +++---
 package/python-validators/python-validators.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 3682850cb3..e60f540f7d 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5  e7b36d935ebafe149629146cbfe5b0c8  validators-0.22.0.tar.gz
-sha256  77b2689b172eeeb600d9605ab86194641670cdb73b60afd577142a9397873370  validators-0.22.0.tar.gz
+md5  8cae932ff53da1607ed2ca354a93ba54  validators-0.34.0.tar.gz
+sha256  647fe407b45af9a74d245b943b18e6a816acf4926974278f6dd617778e1e781f  validators-0.34.0.tar.gz
 # Locally computed sha256 checksums
-sha256  7c1bdc4712afecb46d402ec79da0ea2877811711e76dbaf1e425ee0b0e331b1f  LICENSE
+sha256  9d10adf59f4505a733162ff7de6887645dcef1fb495b8070d8b207da0f6b3a16  LICENSE.txt
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 09ccbe6ab7..7db6d98546 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.22.0
+PYTHON_VALIDATORS_VERSION = 0.34.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/9b/21/40a249498eee5a244a017582c06c0af01851179e2617928063a3d628bc8f
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/64/07/91582d69320f6f6daaf2d8072608a4ad8884683d4840e7e4f3a9dbdcc639
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
-PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
+PYTHON_VALIDATORS_LICENSE_FILES = LICENSE.txt
 PYTHON_VALIDATORS_CPE_ID_VENDOR = validators_project
 PYTHON_VALIDATORS_CPE_ID_PRODUCT = validators
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
