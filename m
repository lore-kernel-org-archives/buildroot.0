Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8592C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 04:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2042081462;
	Thu, 11 Jan 2024 04:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2042081462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8nIp2RMf62u; Thu, 11 Jan 2024 04:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DE328144A;
	Thu, 11 Jan 2024 04:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DE328144A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 802DB1BF380
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5907341806
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5907341806
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPWKLq4fapvS for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 04:08:39 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71B2E41798
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 04:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B2E41798
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3606ef221dbso23689695ab.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704946118; x=1705550918;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIgxEddzEbcflXwUIiy8D6B7URXs9LJ+3xtUKbVMO6o=;
 b=h1CANs4HIJ8QTycPAsD5LRVsa3g6dveAmyw5DMxayTJTupJxdGF7Lwf8TsnHFaRqll
 syaYLSZCaRxbgUHPcqPM8Tnle384cU1VyRni9gzhtBS5pNTGmlgFa5Nct8C2eD4u3e0C
 k163A75RBT2aKXOZafWCp9IbtZiZvr4MWoMH8uw+84SySGKUzgkKly7goGcYA8c+QB0I
 RGIG3BxGOMH1b91XHAuN4KJhTrxhuqU/IrrdktZsPLDt3zs29XoU2wEgnelnTkQlHthx
 bA9Hu6G/GGwDrfRNC8Ijy+DOS/dINRJ49y7e79Obg1XTzayVaI+ruGeHeTbsBKeQG4+D
 1aPw==
X-Gm-Message-State: AOJu0YwgJCbgG8Jms2PaeDozzUf6pfWyNf2YGCgFWGAqwbWVCpGehovY
 nXGxGvBjq0exW6KfEPNwJxKQZus/wjp66w==
X-Google-Smtp-Source: AGHT+IGjAoehr55kmNEkK3TAHqKwADoxL7fYtMpqRUUxD7Nd5SEj8UvEarFaRZ5rMk75lHkgO3MPWw==
X-Received: by 2002:a05:6e02:f48:b0:35f:ec98:5af9 with SMTP id
 y8-20020a056e020f4800b0035fec985af9mr630250ilj.37.1704946117865; 
 Wed, 10 Jan 2024 20:08:37 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 q16-20020a056e02097000b0035aeaed5112sm38808ilt.84.2024.01.10.20.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 20:08:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:08:35 -0700
Message-Id: <20240111040835.2702608-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704946118; x=1705550918; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dIgxEddzEbcflXwUIiy8D6B7URXs9LJ+3xtUKbVMO6o=;
 b=DjA8Ci/pLit6AX2EgxldHWC2vBLVfZLT5B42akyfmckAeMKqCAV8u9bdLHeQTyy6Mo
 mw0ZJSpKHnwlUsrXejHWGE2Lj+wd30hZk6Om81IUvXHyCyHgzChVPSmN4BrwhPY/U1LB
 ZPWRT6z4U2jOPItGvb7U6hPFRP/jHZ0SMs/P3ZcO11gqTvjkxhb4y7ONEhtS6jBwE9Tr
 dzRM6Qs6rPlSdOs5Hoe8sk6DVAghyY1PIIczG6PxQ4iaCBsxa3+3+BGO3+ozOWVmALvD
 t49jx3MGokjiRyRavCz/pXtzn5BWlnRcURLppAOHubiM2URZdajQx2LPQnfGAcee9eal
 emMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DjA8Ci/p
Subject: [Buildroot] [PATCH 1/1] package/python-pythran: bump to version
 0.15.0
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index 2dfc445b2f..a46825c933 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  3090288af50566af75cb058d1878aaad  pythran-0.13.1.tar.gz
-sha256  8aad08162f010e5425a7b254dd68d83311b430bb29f9252dce2eff3ba39497dd  pythran-0.13.1.tar.gz
+md5  cc6fa05e583733182d06d2e41e03cc10  pythran-0.15.0.tar.gz
+sha256  f9bc61bcb96df2cd4b578abc5a62dfb3fbb0b0ef02c264513dfb615c5f87871c  pythran-0.15.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 25735ad95a..43853a514d 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.13.1
+PYTHON_PYTHRAN_VERSION = 0.15.0
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/8d/d8/b27e8dc3f3a03dcd317d40d9df0ae07ebbd85444585973ceba07716934d0
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/82/31/cc6fd7a2b91efc6cdb03e7c42df895b4a65a8f049b074579d45d1def746f
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
