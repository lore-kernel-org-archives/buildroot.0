Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAEEE6F08E
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1935606F2;
	Fri,  1 Nov 2024 21:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m3sEJgbkxt5z; Fri,  1 Nov 2024 21:59:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D07D860704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D07D860704;
	Fri,  1 Nov 2024 21:59:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 19BCD979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0818460704
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKqqVhvm1a4H for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:59:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11988606EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11988606EB
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11988606EB
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:59:19 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-83ab21c269eso94611639f.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 14:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730498359; x=1731103159;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RVh7nhp+Md0VlPJOk/8kz0jzJxSNE09YkQ4P4EaeE+0=;
 b=ZzJ/kplrJ7OgD6SDPtD1WP7xQl2Sk8tfhUOurLEd8+UfuC8jyx+Q3qsrFT8AeV5vs7
 S6IzOwSj5uCLAGslrbtBxWg+bcSA5vv9Qy4bhPES0ltgiuW9hQSsXX9linWEfkuFFZ3A
 O4gVPrU1UU4gujY8Ys61JMmpvApHwy4H8oHLC7lSWqNK1L+OJNLC6WMeTwb2BBKi075R
 31Qo2HzVtb8yB5bgCasklcMwrTeqChyP+IvQSyHW4t0kHvh1lu6Q+DLJlCLLBI2+6vtz
 ptWwmAdm8vQx20BKHA3YczW6nH+a0BB+uzlez5G2KmE9hTv+/PBRH+4uLbP5Q13xUfus
 vUaw==
X-Gm-Message-State: AOJu0Yzf5/vbq9S7ZkUc7sUJI95tv/KjQpGvoKIK+628xMFl/KE7hu7t
 P73eaIaEH6SyQ+TwFM3gzE/l+FhcuvtpyB1dXht3ySAdbhVGgz4o9bKkfQ==
X-Google-Smtp-Source: AGHT+IHY5l0BqUyvb8jae2sLlePZPumJfSfNhIPKrst2PYdmm8DdJsftVzw1oIBSCeAzCO230a05xQ==
X-Received: by 2002:a05:6e02:1c41:b0:3a5:d2a:10e0 with SMTP id
 e9e14a558f8ab-3a6b0229ecbmr51573865ab.5.1730498358627; 
 Fri, 01 Nov 2024 14:59:18 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6bddcdcd8sm982085ab.37.2024.11.01.14.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 14:59:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 15:59:16 -0600
Message-Id: <20241101215916.1297355-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730498359; x=1731103159; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RVh7nhp+Md0VlPJOk/8kz0jzJxSNE09YkQ4P4EaeE+0=;
 b=foGEVAvEMhGZ5p9HCidAemRtVFQvh6V79MZt4qqy0kCsYCEwR34JQy2Iu3Iy2ldowC
 6VdGy8Me9lcxn3s5ooLGtYriIjEKKAB6HdYs85PT6q/xO9y5xirhp2IT2XK3bVesfNzN
 C3TZYRzJfwkX5NkiD8jEvIYHraA+puS8z8aSr54vtYXosr2wYbmOGMYqXtB18q+tsW+M
 FId2Wqfz7tEsLnLEBFTS4PvSuJTI8kM5ibiXquFK6OV2xiFYTfN4shvouKzOZq2mjb1C
 7o9nEkF6Nwtmx4FisoCD8cSFbGURO5wRrZdapSLFsCHd7VmWAoHMP0N0OeNovY1c0KqL
 8+mg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=foGEVAvE
Subject: [Buildroot] [PATCH 1/1] package/python-tqdm: bump to version 4.66.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tqdm/python-tqdm.hash | 4 ++--
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index ee59af438f..25f0677c22 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tqdm/json
-md5  32e8dc7da1490d96d944f61a1d0ecd4a  tqdm-4.66.5.tar.gz
-sha256  e1020aef2e5096702d8a025ac7d16b1577279c9d63f8375b63083e9a5f0fcbad  tqdm-4.66.5.tar.gz
+md5  642c75fe82c8b8eb5b608156c154664b  tqdm-4.66.6.tar.gz
+sha256  4bdd694238bef1485ce839d67967ab50af8f9272aab687c0d7702a01da0be090  tqdm-4.66.6.tar.gz
 # Locally computed sha256 checksums
 sha256  dc33252e829015e3b150086fb9b3a40f6ad6fb32c2f4610ce812fa677d35986a  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index c91aaf2875..5898d3aa13 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.66.5
+PYTHON_TQDM_VERSION = 4.66.6
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/58/83/6ba9844a41128c62e810fddddd72473201f3eacde02046066142a2d96cc5
+PYTHON_TQDM_SITE =  https://files.pythonhosted.org/packages/e9/34/bef135b27fe1864993a5284ad001157ee9b5538e859ac90f5b0e8cc8c9ec
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
