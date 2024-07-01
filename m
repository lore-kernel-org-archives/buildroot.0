Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F9CC3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 20:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1181F60ADD;
	Mon,  1 Jul 2024 20:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2745GMnrZ_e; Mon,  1 Jul 2024 20:02:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 278B860ADE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 278B860ADE;
	Mon,  1 Jul 2024 20:02:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 699B01BF346
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 555518146A
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ciEvxF1fxLX for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 20:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BCFC8145B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BCFC8145B
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BCFC8145B
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 20:02:12 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-37636c38d6aso15707885ab.3
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 13:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719864131; x=1720468931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AwjQH1XFzzW9IUjnsUvmV08pJdL7UPM2VrfxXTnwCVM=;
 b=opFCqY4JHR+3BrSv+izMMdcIAwaAZMk6sNjyRhpVtbii6R+I28gFF2vnXkNB+e6wEg
 sXNWl8/gwJIv/86E+0oPhKTzVadAduZCHYgudQbMGUI9y3FOlgR4qODmgCGvRL0Gaa/4
 dIFhCwPnsFjALXvBQnS3Mz/Mq5WjR13ifKRPTiVUc6QuIITl27bn2Z/TyPK1/DHpSZJz
 /TAcLE145j2fJLxwk4K2vMppOAIBQh7x2/Z4R/Rp3Y2XOdbM3NCo7Ls31LqFrYmkdzgR
 7SDI4xlzFRuuq+tuPhPAkY4gO85EqloycNRD6yf+Md3sxT9NPqwXUS5PSGTRgs+Qa1HC
 HWXg==
X-Gm-Message-State: AOJu0YwtcQV1LLZ+mmCDkC3TYM+M9fgXpov9kLsQYKwEWBGhdGwZD4sL
 n0j43LrnzQ4OW2yUYc/iRsQ4+mEzd7Au9GkgMuROPlt1wq53Ivwseh4vTA==
X-Google-Smtp-Source: AGHT+IE7JfpjzttIw8cwgj3Iv5m5yQrzrmwX8H5I0LS5f+yWGPTXGj4UelQ2odDl7DrN+JHYQFJ0kQ==
X-Received: by 2002:a05:6e02:1b08:b0:374:a1e8:2086 with SMTP id
 e9e14a558f8ab-37cd169af71mr92756285ab.19.1719864130679; 
 Mon, 01 Jul 2024 13:02:10 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-37b3ae62690sm18672025ab.34.2024.07.01.13.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 13:02:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 14:02:08 -0600
Message-Id: <20240701200208.1797634-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719864131; x=1720468931; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AwjQH1XFzzW9IUjnsUvmV08pJdL7UPM2VrfxXTnwCVM=;
 b=ZjOcxMHmgN6lK71DO8PZfl0weuqMSeDC5o2V2Bi7kfXlOPdJXEtxNl3XNcW2bfAtE2
 fmo/XM32YIH47Hdr67OOIbMw0i5cL3bYEOs3P4RgBQFMVRV/Dec8vKM5LeZood3m5h5w
 ujZ1+l4KgwUcDmJURZw0uK/eG5ym/j3BUMxogeT0V3/mGox4Kl1KY7+TUsYLSumMmW0R
 JZh2YAnVQIglHLD6etvZH6qFdyX4N4iJfncW9I/23cHzUPieCq4vhi2xmmZibzsfJGyM
 RAKi18OtYxjA2poWlnDxqCHrrFDeArtLzmX0j0piemuzXtWY2Jd/O04sekY0nhlYtUSH
 PiNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZjOcxMHm
Subject: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to version
 0.30.1
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
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index f002304c3d..318fc65e21 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  88b8d2090026fff2bca6f9f561a07ecb  uvicorn-0.29.0.tar.gz
-sha256  6a69214c0b6a087462412670b3ef21224fa48cae0e452b5883e8e8bdfdd11dd0  uvicorn-0.29.0.tar.gz
+md5  a000939f41470e55bad5cec475489b4c  uvicorn-0.30.1.tar.gz
+sha256  d46cd8e0fd80240baffbcd9ec1012a712938754afcf81bce56c024c1656aece8  uvicorn-0.30.1.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 04ec4b20d2..092c640abd 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.29.0
+PYTHON_UVICORN_VERSION = 0.30.1
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/49/8d/5005d39cd79c9ae87baf7d7aafdcdfe0b13aa69d9a1e3b7f1c984a2ac6d2
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/37/16/9f5ccaa1a76e5bfbaa0c67640e2db8a5214ca08d92a1b427fa1677b3da88
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
