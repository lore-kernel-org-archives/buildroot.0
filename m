Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB393CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 04:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9703B605E3;
	Sun, 22 Sep 2024 04:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUlPgEIl5VA6; Sun, 22 Sep 2024 04:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96E6D605FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96E6D605FD;
	Sun, 22 Sep 2024 04:02:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1BBB1BF292
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 04:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0B2F605FD
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 04:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIG23O0IOwsc for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 04:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3BD3605E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3BD3605E3
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3BD3605E3
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 04:02:19 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82d07f32eeaso170172239f.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726977738; x=1727582538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j5kt4/OX9nGaGqEIe3JsHDWWVLR4ajRK3S0DeE6MtRQ=;
 b=nN5H2uuH11/9ulzlYMxEGWlGVlzPovfFn1QmNZMcZfJ+9hrukOK/BaRdn/If6zrH9b
 pRPtN4QFNFEnpDQQngWLpyr4HaNz69tn6h1/vGERlz2sJp65MDrFVYKUe9m1bDF3tHSY
 NMKXSa7gp+ztrJFvXzXjWLM/lvgW8JAPHGNj16nPPku5n2oi5uh4HZvyCMDCVF4LAlBc
 FC7c35J9q2XeOhTUwZ6ogZNwXMJ1Ku8bKFcdMj+DySHDEGBwhZk/KA4KgTb2zayR799o
 S2mLUAQPfN+DK+bmSm4OWb49LjIvOl84xVUHbmnxMrJefvGLjKuZUQNWviISHXi6bCE1
 g0hA==
X-Gm-Message-State: AOJu0YzkL/XvRKhZnyo9vV3aV+BxdPSx2LFjpsGEzVaxeFPqyYGo3aD0
 4lAABefuotqkwRGSDM4eU10OphJfTzMEJ5/FjkcXOARUJVxhyLdfUkmm6A==
X-Google-Smtp-Source: AGHT+IHlxFoZx7Fj5TpHVqy9G7f0a8Px0yBUBbUpZibS6VkUODk3CeUI92pwRxrybC9ksPnxigcXeA==
X-Received: by 2002:a05:6e02:1a69:b0:39d:25d8:43a9 with SMTP id
 e9e14a558f8ab-3a0c8b93ef0mr79902355ab.0.1726977738523; 
 Sat, 21 Sep 2024 21:02:18 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfe7d9sm52093395ab.12.2024.09.21.21.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 21:02:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:02:16 -0600
Message-Id: <20240922040216.916935-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726977738; x=1727582538; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j5kt4/OX9nGaGqEIe3JsHDWWVLR4ajRK3S0DeE6MtRQ=;
 b=Jl7a5vmz6NuC7XZN6JBPY04szxltgduMr5TvsIBNGRulpykVWheA/sSIDmFV7Fy3ub
 Mnn4986Vq4Xh+RtZiO4pMKA85oWj6iBc4B3V1EYhO6rRPDUMPieBs6m5rRm+xtZO7KWK
 UYJLMsYXIycXoiMAZmt+VPOr06UATl0WVuXJazd1MIOKedRM2l+7AdaEZQymLieiGQHw
 Ml8VjpFZG4NqpACHM0r5QSy2x9b7RhPQ224MgrSgFpfQo3ccYI+S7L3wemzPrXxtXB2Y
 6bxa+khvANGUT4AX85P9eB/sdEV4X0/4Od6zxgZn/0XRfz13OsjunwkG9D6r3/yjqHda
 UdeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Jl7a5vmz
Subject: [Buildroot] [PATCH 1/1] package/python-tpm2-pytss: bump to version
 2.3.0
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
 Romain Naour <romain.naour@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-packaging runtime dependency.

Add new python-pyyaml runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tpm2-pytss/Config.in              | 2 ++
 package/python-tpm2-pytss/python-tpm2-pytss.hash | 4 ++--
 package/python-tpm2-pytss/python-tpm2-pytss.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-tpm2-pytss/Config.in b/package/python-tpm2-pytss/Config.in
index dec9a311d4..e66df9f0b0 100644
--- a/package/python-tpm2-pytss/Config.in
+++ b/package/python-tpm2-pytss/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_PYTHON_TPM2_PYTSS
 	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
 	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
 	select BR2_PACKAGE_TPM2_TSS
 	help
 	  TPM 2.0 TSS Bindings for Python.
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.hash b/package/python-tpm2-pytss/python-tpm2-pytss.hash
index 10a9f112b7..0e73f6d460 100644
--- a/package/python-tpm2-pytss/python-tpm2-pytss.hash
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tpm2-pytss/json
-md5  069a02c99d3203fada940c3dd43b699c  tpm2-pytss-2.2.1.tar.gz
-sha256  b8f15473422f377f59c7217dcd1479165cce62dfa33934ec976a278baf2e9efe  tpm2-pytss-2.2.1.tar.gz
+md5  241696dfce31c539ae418a5d3587b945  tpm2-pytss-2.3.0.tar.gz
+sha256  20071129379656f5f3c3bc16d364612672b147d81191fb4eb9f9ff9fbee48410  tpm2-pytss-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/python-tpm2-pytss/python-tpm2-pytss.mk b/package/python-tpm2-pytss/python-tpm2-pytss.mk
index 80491aac46..9a192fc7ca 100644
--- a/package/python-tpm2-pytss/python-tpm2-pytss.mk
+++ b/package/python-tpm2-pytss/python-tpm2-pytss.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TPM2_PYTSS_VERSION = 2.2.1
+PYTHON_TPM2_PYTSS_VERSION = 2.3.0
 PYTHON_TPM2_PYTSS_SOURCE = tpm2-pytss-$(PYTHON_TPM2_PYTSS_VERSION).tar.gz
-PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/13/e5/8d4a9ac91579c741ec9fb63befcf6577107f22f3508c364fd53e277d7237
+PYTHON_TPM2_PYTSS_SITE = https://files.pythonhosted.org/packages/07/1f/0f2521440e330342ef757a6605b61e1dbf5fe47fd97397c6e5f02791d520
 PYTHON_TPM2_PYTSS_SETUP_TYPE = setuptools
 PYTHON_TPM2_PYTSS_LICENSE = BSD-2-Clause
 PYTHON_TPM2_PYTSS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
