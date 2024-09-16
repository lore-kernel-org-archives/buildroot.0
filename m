Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D6EC3ABB9
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 00:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BCB0403A7;
	Mon, 16 Sep 2024 00:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKvXuyBxMJ4q; Mon, 16 Sep 2024 00:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52B21403AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52B21403AF;
	Mon, 16 Sep 2024 00:22:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A993F1BF94D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 988FD400A4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZ3ekDw-LiKP for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 00:22:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6430040004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6430040004
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6430040004
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 00:22:34 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82a151a65b8so233148639f.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 17:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726446153; x=1727050953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6mTyQ7kAtIqHyMjsIdiGLNHH14B4wYVWD432Lh/+1/g=;
 b=LoB+7V8ymqQtOn4Cipr93REnjqX5MTE1Hg/bLtgbhpQMeouVd4STFeZsHtaw6bEebm
 2Pw4f/Yzq8a2zNUS1vIurGx4qnN+He5+hbtweLy51zwXSNwjNmQ2Xpsjk8YHpNyXZg1n
 +LcCSjq1sLBemcDOpdshB3YFHN/ToPwp4O+qglU5tk+aCqtvRibd3iYP0MA6zTFNkCvg
 XeJcxGIgeUnIt40B9vRFzLMyjOwqVdtA3fyUKsKmAso8b7+UeSASffmOEOtknJ6SuWTp
 qNeg/TR4hokt5/StgNb3HC+8tWJG6vJR1JyR3akVwKs3nHx6OpaXUlxBkKtx5sgoWbKw
 nDPA==
X-Gm-Message-State: AOJu0YzjTH1Myydpk9Eaa3JYoRCy6vqTpOex6tQ3zJ2hsivwkMr+qtgE
 RBjls6jeuFUjbp4PRFfgYYgtFC/yWZEzxbNQMozkrJ3JFcNvTX5n6PsbRg==
X-Google-Smtp-Source: AGHT+IGNNe42NNW6hwjEsdpodOJTkJRpszFDzb1FHo+YjqZDWt4hyCH2sJbr1FsNaTOfOUu41HkaxA==
X-Received: by 2002:a05:6602:15d2:b0:82d:1ba1:da5b with SMTP id
 ca18e2360f4ac-82d1f971466mr1019985739f.13.1726446153022; 
 Sun, 15 Sep 2024 17:22:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492694fdsm125123439f.6.2024.09.15.17.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 17:22:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 18:22:31 -0600
Message-Id: <20240916002231.2147897-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726446153; x=1727050953; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6mTyQ7kAtIqHyMjsIdiGLNHH14B4wYVWD432Lh/+1/g=;
 b=NruA2TiN+XAt2SMqWPTYEuxAkogJtDi9OvCkzoIyfyDR590pM+9bvpmfPB7Wryohtu
 7LTnbmDPjTUlChUUe3QoXcH4PFVeDT4xdqmdA+qjL7hHFsK95zQbKF/s7taYYpHruyYE
 O71zmDSNejZJztHkqMbLctsSd6XQ27/06uPvuH4zqGTDS/mRAsBJ5QPqcLj0fqfiiYD9
 qn8qUmvH3ZNF+oYTNCCqN4/RBcx2LLRstjYtZgdonOZwA/cg+ilq/Uq3Pg5p7PBNWFOZ
 A6zTVKej+h1YakpJtDziglcDTa61Ggj5b4NBMBGYWhqnELalE2DbHwHcPt9vxBJ34TQU
 qFaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NruA2TiN
Subject: [Buildroot] [PATCH 1/1] package/python-multidict: bump to version
 6.1.0
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
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index d23a3de3eb..3230ac9b56 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  abcf9bf19365d06aa784de07da02115d  multidict-6.0.5.tar.gz
-sha256  f7e301075edaf50500f0b341543c41194d8df3ae5caf4702f2095f3ca73dd8da  multidict-6.0.5.tar.gz
+md5  2c8cf03b6e92e1b9c335de56b606c2fc  multidict-6.1.0.tar.gz
+sha256  22ae2ebf9b0c69d206c003e2f6a914ea33f0a932d4aa16f236afc049d9958f4a  multidict-6.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  93d11a968e2f0f36373c40811ff6d20e173f58c3cab5884cd6617bbfd795492a  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 3c9a21f1dc..6b952244bc 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 6.0.5
+PYTHON_MULTIDICT_VERSION = 6.1.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/f9/79/722ca999a3a09a63b35aac12ec27dfa8e5bb3a38b0f857f7a1a209a88836
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/d6/be/504b89a5e9ca731cd47487e91c469064f8ae5af93b7259758dcfc2b9c848
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
