Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943D8C47073
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2969D415DC;
	Tue,  9 Jan 2024 07:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2969D415DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7sEYI5L2b8RK; Tue,  9 Jan 2024 07:58:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 406B741498;
	Tue,  9 Jan 2024 07:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406B741498
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8705B1BF59C
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C56C60E5F
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C56C60E5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzSnO78ZRwCu for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:58:39 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7727F60593
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7727F60593
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7baa8097064so136448139f.3
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704787118; x=1705391918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rex4VmCdJgUKAr2RgllBSdc6/QkBk9qE+pLHq27cKGE=;
 b=Wnm8Bgg7BNYu+eA/9DKXPwoNuvD9pTexrQOcAd6mkRVRd2R0vlKTHqJs/ZuK1R3eE+
 J3qZqmNb8rMbI7GgmaFWAoAaY9TEFbLheEq/6TLfldqIjtcWDHc3k2x0RWRxjkQ9VYLS
 6sUD+jvhNy9vJRpLLOJLZAqetWa7NOGGU6vHrgv8NSP1xfXySGbKgLs6HA9hTtezN4Ui
 6Pe1v34G2uhClHRiM0b3bsQ86aTdb/cPjhYBqTKrDAVO4fCpo8z6p/KYrhaMoQOwW84E
 SRfnUdO6KK2bE1k91Re3JAuahLfanXXAeV0CxshUUsT7sXWEIhvDM0zgZ+BKjZr1vbze
 sYQA==
X-Gm-Message-State: AOJu0YwsLXBK828khKvhYJ00kGVmJQubLLGWZ+4+JGrtAJfJN4VLbDj+
 I1NKBUok8iDiKuTZ9Wldo0LYUxHmD4PHxg==
X-Google-Smtp-Source: AGHT+IGC/pk7LBcV4BE3lo2kbX0LCj3flK/0UMgsxdjh2zS0Mnq8nImqqd++dQJ6x7b3RJhEGvmY4Q==
X-Received: by 2002:a6b:c947:0:b0:7bb:f22f:f217 with SMTP id
 z68-20020a6bc947000000b007bbf22ff217mr5291077iof.27.1704787118152; 
 Mon, 08 Jan 2024 23:58:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 z21-20020a6b5c15000000b007bee7b83da8sm29910ioh.53.2024.01.08.23.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:58:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:58:36 -0700
Message-Id: <20240109075836.4057394-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704787118; x=1705391918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rex4VmCdJgUKAr2RgllBSdc6/QkBk9qE+pLHq27cKGE=;
 b=lOXajCcYKgp1NFlcLkeN4GK6e0nBdBk6J0OOv5ViMzI+epWd1WRlxnx2FzJFz+ips3
 eWJLmAbKJ4XuIjb1taE1FClvPgvPynWT2DNyYzpK7vhFtXws/S6TTD8C2NC7zsKAj3N0
 MK3CyPNLhz8sb5IPxUe3JTXKyHfhFSXlYfWENYi0u7w+bZdw/8fMvUfsKoCHrE/yJVMg
 J/8PeSBanPZ2B+xJrZndYxFpgQEDwzlpTIRppDgX6B9JMFdRzF3Z0OhJqrDTUH47w91B
 IBby5tIMKOjxv8AnGUrdJaDiiW9comjrmaBbMBlCXDjbTUmDRzD0nj2IVduqZttNeKnZ
 P/Xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lOXajCcY
Subject: [Buildroot] [PATCH 1/1] package/python-greenlet: bump to version
 3.0.3
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
index 2de253e1b5..61e7f05346 100644
--- a/package/python-greenlet/python-greenlet.hash
+++ b/package/python-greenlet/python-greenlet.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/greenlet/json
-md5  3905122960191e81410714f7db4835e4  greenlet-3.0.1.tar.gz
-sha256  816bd9488a94cba78d93e1abb58000e8266fa9cc2aa9ccdd6eb0696acb24005b  greenlet-3.0.1.tar.gz
+md5  170495b0af3b63ca40ca637dd6e5c6ef  greenlet-3.0.3.tar.gz
+sha256  43374442353259554ce33599da8b692d5aa96f8976d567d4badf263371fbe491  greenlet-3.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  769831d6e5dfaf2c20802faccff1fafb4c2025dd8f6253dfa47fcad59d4d0979  LICENSE
 sha256  e5ff3c23c110e494cd7d736c10fd96d462457bafeca310840db6527298c7d46b  LICENSE.PSF
diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
index 7ca1ac1674..1af104519b 100644
--- a/package/python-greenlet/python-greenlet.mk
+++ b/package/python-greenlet/python-greenlet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GREENLET_VERSION = 3.0.1
+PYTHON_GREENLET_VERSION = 3.0.3
 PYTHON_GREENLET_SOURCE = greenlet-$(PYTHON_GREENLET_VERSION).tar.gz
-PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/54/df/718c9b3e90edba70fa919bb3aaa5c3c8dabf3a8252ad1e93d33c348e5ca4
+PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/17/14/3bddb1298b9a6786539ac609ba4b7c9c0842e12aa73aaa4d8d73ec8f8185
 PYTHON_GREENLET_SETUP_TYPE = setuptools
 PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
 PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
