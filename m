Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74006CF9C5B
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 00:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15DE980B73;
	Sun, 22 Sep 2024 00:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8tTYvXIvsZN; Sun, 22 Sep 2024 00:21:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF2980B75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DF2980B75;
	Sun, 22 Sep 2024 00:21:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82D1C1BF86D
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71192406AB
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 00:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVI_dN6QguUv for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 00:21:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42EC34051A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42EC34051A
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42EC34051A
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 00:21:32 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82ceab75c27so198305739f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726964491; x=1727569291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JJ5IIPQhRjPMDrmoJyVATcO6DEtze65vlw8ynGIVoI8=;
 b=fAqNNrfNMLz2APSiqUZvz13ABtjjrDIGjiaj6hFf3Lq/ElIqDncKi+Lm3x+E1s5amr
 eI1r+LocuZo+fvUmZJ2Idxy29GQecUFBeRgSe8DvorBLyeYU8HS1Y13T5fX1uaj1ocKJ
 pbufSwvisLM56EO6r9YNVwib4VJNkD7ru/TeWErXnVOFvPu4rUTRUXQQlQzBMV7fXwDP
 avVzRhQWj4eMGFc/+//3THu9Qtrfobdh47u7qff89aGTgGHDIS41WBT7DDAi4oj3X8er
 zielnkTR9dvyuoPcUuqhv2J9utP+EehZeYHoPQtGnjVmpe/c3F6r7prrvBGe0e7eGmv0
 IGcA==
X-Gm-Message-State: AOJu0YxxSZjkcRa/wJEHp7HxkAtLZDfe5adqQ7ow//f6fuJNebtwTLpJ
 phO0eGYfTEOZkPi3lojpnn432ALXGX0reWp7Tk4wCXRerc3wLfUJEYGlhQ==
X-Google-Smtp-Source: AGHT+IEOrKhhZXeelCjy1vD8aT97rXvv0dvw9tqcKM1NI00oXRmc/ICx1gsXzdN5zfzIqiWujKhVPg==
X-Received: by 2002:a05:6e02:1a85:b0:3a0:90c7:f0f with SMTP id
 e9e14a558f8ab-3a0c8cfcc16mr67640285ab.15.1726964490814; 
 Sat, 21 Sep 2024 17:21:30 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8fdb2sm50796825ab.78.2024.09.21.17.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 17:21:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 18:21:18 -0600
Message-Id: <20240922002118.716385-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726964491; x=1727569291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JJ5IIPQhRjPMDrmoJyVATcO6DEtze65vlw8ynGIVoI8=;
 b=OiEqfdrJFq7dWbHLjpDBViw3XvPH/loTTsEqeAW7rlGec0vb+QwHxA5NpDmUxXjHHu
 6S4le9Ov2Ew1x2E1pz7jpH4wip91O/IVRqJRr5DEKKgXOBzj9W14vomMWABNey0eidYl
 l7UHR+JCi7VtWcOxy1mhps3AGm7x6H4D+1nRI5NGF+WO2zLumGAc2VCQwZGTBNEg4HHK
 Euy8CtRpEbcxxOAuOcCNKZoEuqLWbB0vBT4hnXnSunp3KNU6IwjuRjo0/RwjbWJjsfNx
 ddr9Qtyqu/Fq2A1SWmygAxyT1LV4LpWWsBp5NauM86FsYfCNATWmJQSeJyiw66WD6YCX
 wPOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OiEqfdrJ
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.10.1
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
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index 61d2c8a150..2926a5d326 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  e3be6366d0d71304ca859edca3c89606  setuptools-rust-1.9.0.tar.gz
-sha256  704df0948f2e4cc60c2596ad6e840ea679f4f43e58ed4ad0c1857807240eab96  setuptools-rust-1.9.0.tar.gz
+md5  d92da96159f470af8a15da8ddef1975e  setuptools_rust-1.10.1.tar.gz
+sha256  d79035fc54cdf9342e9edf4b009491ecab06c3a652b37c3c137c7ba85547d3e6  setuptools_rust-1.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 14930501d0..3520d76052 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.9.0
-PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/9d/f1/2cb8887cad0726a5e429cc9c58e30767f58d22c34d55b075d2f845d4a2a5
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.10.1
+PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools_rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/b8/86/4f34594f21f529623b8650fe729548e3a2ad6c9ad81583391f03f74dd11a
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
