Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8000C4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 07:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803C641E41;
	Thu, 14 Dec 2023 07:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 803C641E41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q0TJGLWCgimo; Thu, 14 Dec 2023 07:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9204041E3E;
	Thu, 14 Dec 2023 07:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9204041E3E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 124661BF335
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D755B40017
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 07:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D755B40017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tu4SkH7NADGV for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 07:02:05 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8766140540
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 07:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8766140540
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7b771176f80so135706139f.2
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 23:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702537324; x=1703142124;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y8IVgWIz9/ptGUjVkvSl9khXiU+Swdo594ci6Qmkcts=;
 b=pwM41vno3MW1zYE1zQa9J2UEB/6FrnKO6OwzU9XJ7wjQHb80XKe0/ndzawxBbhLWu0
 jeNVQD4fNf7hirdT/Sb7fp7dH9ZbalwY4EXA8HF7QJ6A3JVyJDBu6MJrGAx7u8KKCuX1
 vGm7NLtEKre6sUldK+9ECvhM3M6J/FgS8VAwUpKCCCsaMllNWl9WOetDkqbAR7rMmxMd
 zxkBDXhYm+6oz7GsmWsTAZXxjgav+SjKXKGkaLayAdvFCii3UfU8P63NlljkG1QX5cJL
 NjGHZP4rltUFthOhOgaktn0CyZg1R/Ed1E/hldFmGNBs+DLAL8xIiISwd8F3qpvPSX7p
 wuMQ==
X-Gm-Message-State: AOJu0YzitWmcScY8UZ4UQHpzInUwrt8BxgXo/2SIC5oBT36TAFjduf3c
 306Ixusf/eFSBZkQgP27mc9H/tepQjXqXA==
X-Google-Smtp-Source: AGHT+IFkr0xL9X/StsSxy9tlPixRO4h6EzNj2Nl+bp+vhqtoZ5HyYREVZgrsGwZq7Wn9+zTqU0nErg==
X-Received: by 2002:a05:6e02:198a:b0:35d:70f7:2f8f with SMTP id
 g10-20020a056e02198a00b0035d70f72f8fmr15275631ilf.13.1702537324125; 
 Wed, 13 Dec 2023 23:02:04 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 ck13-20020a056e02370d00b0035d73896198sm4094695ilb.8.2023.12.13.23.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 23:02:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 00:01:35 -0700
Message-Id: <20231214070135.2198313-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702537324; x=1703142124; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8IVgWIz9/ptGUjVkvSl9khXiU+Swdo594ci6Qmkcts=;
 b=e0wfNDX6puftJ2KRBAwkTF9v1vCJZxVV0rPCjFEFZzVKVF5GiizT6aKrZwTBpUj3fh
 8YRH5dWBt/6tfuIswaxgjgw6/0XBubSBmI4tBZaKsLrePymFRmnhPKyxd9Ra7hSm9BOA
 1/f+WhYkJUhvHvZjwm+YHTRDKb8g5YcWj2QBDjc9frYULTyEoxSmt64+3i7e9uxRX06D
 9n9s2QBkqGEPkDEPqIDHFXHGHhYU+nchCSuavQAgffc0w7bg+gnC2k4rGvjJyPwk5qgb
 bWGMFjiaj1yA1blpRv0IPLPhSJNVMozSNDH1edYrhYzIo4mEqQnzMvfiuFpMBTDwIAsY
 QRUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e0wfNDX6
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2023.11.17
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

License hash changed due to inaccurate date cleanup:
https://github.com/certifi/python-certifi/commit/2103453dd43dbfb859f257b193d9087b3997959a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-certifi/python-certifi.hash | 6 +++---
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index fe0748adb8..48e25119e5 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  10a72845d3fc2c38d212b4b7b1872c76  certifi-2023.7.22.tar.gz
-sha256  539cc1d13202e33ca466e88b2807e29f4c13049d6d87031a3c110744495cb082  certifi-2023.7.22.tar.gz
+md5  5a41f94d681748e76675f3cb4a7d517e  certifi-2023.11.17.tar.gz
+sha256  9b469f3a900bf28dc19b8cfbf8019bf47f7fdd1a65a1d4ffb98fc14166beb4d1  certifi-2023.11.17.tar.gz
 # Locally computed sha256 checksums
-sha256  a02f6c638f9fb84d06f7764c3ab085d8af7eda5b93c166da54312479077c6fb0  LICENSE
+sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 9b5f853682..90aabaa1ac 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2023.7.22
+PYTHON_CERTIFI_VERSION = 2023.11.17
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/98/98/c2ff18671db109c9f10ed27f5ef610ae05b73bd876664139cf95bd1429aa
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/d4/91/c89518dd4fe1f3a4e3f6ab7ff23cb00ef2e8c9adf99dacc618ad5e068e28
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
