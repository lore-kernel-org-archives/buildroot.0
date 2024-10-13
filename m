Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30174CF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 18:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A481440139;
	Sun, 13 Oct 2024 18:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yKFdFIQBBEz; Sun, 13 Oct 2024 18:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 479FE40154
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 479FE40154;
	Sun, 13 Oct 2024 18:13:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEEA1BF3DF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 18:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 697FE80FFF
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 18:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSOIXiCnzH5a for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 18:13:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 772F580FFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 772F580FFD
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 772F580FFD
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 18:13:20 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a39cabb9b8so10144515ab.1
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 11:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728843199; x=1729447999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xm1u/Pd96qLHrrUHmVGADjoUtWnjovOL7MSi1PBqx08=;
 b=LRy/KbuBEkoL/f9hRFhGdvWJwgNowMTzBJB8HLe4LCbXfHTfxAIJrklpyLAhXVnw2B
 NDzA/oy5SIXyFAegqXJzs3AXuiMaZXo2v8yMX2GDEEadNHRlvcmkT72VIL3szDZjmN0i
 O/41DfwNcC+xcjACdckFd1MxYm7GyWtPWv8zrxsMAYMBZPOKVKXRtCKajK6TGroSjZIX
 9L6x45ep1ocghOh9JyjvPIp/afzz6Dj6ABof1d64OuyGnjURde39U9QF2PYBhrdeQAIL
 e3hFbJ9TqarxhR9QL8zVBJbTEgeQ3c/2QTyoMt/src10yhbCbYrS5GtMyJ+PPlHVmGAw
 ewLQ==
X-Gm-Message-State: AOJu0YyNvu+6b81VsQVeDOsWllhibWF7+sL9LAog0YFotQYvO1kPULdp
 bL3hwpqYPrZtseS+XHvfQp27BurKkg0OjgG3NY7x5dkSMYR2WP9hTB7G7Q==
X-Google-Smtp-Source: AGHT+IFl9Epc/tlyg308RTXglyIIyL/11elZcjSlaEyjCf/6VsdxDKVFWEH7tUS6t6N/6X5g3oWVKA==
X-Received: by 2002:a05:6e02:168e:b0:3a3:9337:4cf4 with SMTP id
 e9e14a558f8ab-3a3b5f21b3cmr60138275ab.4.1728843199058; 
 Sun, 13 Oct 2024 11:13:19 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbd0b38241sm552468173.28.2024.10.13.11.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 11:13:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:13:16 -0600
Message-Id: <20241013181316.2787030-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728843199; x=1729447999; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xm1u/Pd96qLHrrUHmVGADjoUtWnjovOL7MSi1PBqx08=;
 b=dqIF7/HirxCXxS0b1vOzrVr1f+KKVK7N71B0+S3210bxADVLnnVwRADW67PthxUpHH
 2MaDrlaZ1iVgrU5tExK79pdZaArRjjsPDCYSSpvSXOqCGh0QVlMp4lk9yYYC0Z4xTMpV
 6wr8RRbERBIp/4dQJV4r8DhmdWNLgJ2X3UJVKwPL85nD7XmrxFmxutKp4E0xAw6IxIiA
 w6m093CkdOmJNWx//Utaieaszpb84uPHZNY6Lwp6MsvxqZT5Ee8r9ojp9IGotJkx7aQ5
 UjflwCsnye6sJ6RPUA4LfcauZJ223P9kIwOxdK4fFHybJm08sc2dLfU1wZznrzt9ob36
 Rzrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dqIF7/Hi
Subject: [Buildroot] [PATCH 1/1] package/python-poetry-core: bump to version
 1.9.1
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
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 2dc1198a76..eaed4dc728 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  eb8730e30aec5f644754b29587b47122  poetry_core-1.9.0.tar.gz
-sha256  fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2  poetry_core-1.9.0.tar.gz
+md5  64e2c60933b5647f274151ebb1c968f0  poetry_core-1.9.1.tar.gz
+sha256  7a2d49214bf58b4f17f99d6891d947a9836c9899a67a5069f52d7b67217f61b8  poetry_core-1.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index 5b9b8a15d5..107ad1bebb 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 1.9.0
+PYTHON_POETRY_CORE_VERSION = 1.9.1
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/f2/db/20a9f9cae3f3c213a8c406deb4395698459fd96962cea8f2ccb230b1943c
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/c7/5c/3609519b7d890ced542fe327ea26a7c8ea55ef298c323c46cca2a011c1cb
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
