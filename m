Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A749E6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B360402EA;
	Fri,  6 Sep 2024 19:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDYMDDSXTauD; Fri,  6 Sep 2024 19:15:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8360401D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8360401D5;
	Fri,  6 Sep 2024 19:15:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0B7B1BF46A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 922948412C
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FI0Mh1F9t1Qj for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:15:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9FEF384135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FEF384135
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FEF384135
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:15:08 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82a22127e97so109834439f.0
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 12:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725650107; x=1726254907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OPWWMtmHnsitmz4XQujVfY+GmDy/L+Abuw2vrS/uEYM=;
 b=KlQU5af5sCqU+wagn233N7LsOBSpW1OQSIE3DM3tF3Zt5MOYr1pBlQkLm85d/pNBRF
 hyMDTIxb+SgA/NYoQ3XkqUk1BeBwyO6Mn+8TFJ7p6Ww/uo/6DqmKZ3Xq/xbafMSr9pHL
 ag6cZ9IRbKoHOzevk37HoPQSiIknwMwXNfBW4CmuunUuXv4ArBq1xN7oJHYjA1W/fMcj
 khWqlCTG8J/uguhcdpDuTt/uS8G2SgZvmNH9+tAtfpQ96no3D7NSnKIRlGK7Fz1+mzBI
 ebexdzxEsKYiILgm/SDiYD4RxK8CRXGotETAPwLCxwvgOYHwtB2YGId2ZVGOMkK9N/ir
 NocA==
X-Gm-Message-State: AOJu0YxwoXmafv8rssngTL1UFPGpqzzXcN8FyTCDD5TcBCPqNpUn4R2l
 hxIbq7FwL/9AlwRiXR/YBE1WkUChoyu2onAJ15ln4wUKa0MDL3h0vY5exw==
X-Google-Smtp-Source: AGHT+IEkPZ1nW65Lv2XzmCdedTB0pzMLO/7MIaleiwbMOXcW7cf74WtosKM9YNfVltI71oFZ9Z8eJg==
X-Received: by 2002:a05:6602:14cd:b0:82a:3d74:6c4c with SMTP id
 ca18e2360f4ac-82a9622bd41mr370245639f.15.1725650107042; 
 Fri, 06 Sep 2024 12:15:07 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82a1a412f07sm478560139f.15.2024.09.06.12.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 12:15:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 13:14:57 -0600
Message-Id: <20240906191457.1761911-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725650107; x=1726254907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OPWWMtmHnsitmz4XQujVfY+GmDy/L+Abuw2vrS/uEYM=;
 b=JfNK7cf5JFq9e/pBUEwqnWktbj7elOQv487Cy+lYFRlPTFwqCgtuYsCtFsoTxoCJNp
 SqaIVanwaLnEm1bPvGnnFzWMC8mu5nAiJXVUAVjggN/ejQpIPLjqkT3zJ3qZJCm1HqlM
 DqtOb62pNz4uINv0F8G3vjUdORfNM7qOR84RdDzmthQzr6TeM6Sg2KfgJT8yIPi8vH6m
 Kq/oTlLK40A2fM2EbDSO3X6Ja/PPcBe/h1uuxPid62NvQ9iCq1L8Adxh5DIdDSuNyJXX
 xHaTOcvFGm4J9VUwXM9MRICv1JaXgl4bJ5Ppg3joqYnYR4uWJwPnuLNElycMKjxuNGPd
 9ZYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JfNK7cf5
Subject: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to version
 0.30.6
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
index e662adda1e..57839debd2 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  c43ec29f83c3706b99c48a7eeb0208ac  uvicorn-0.30.5.tar.gz
-sha256  ac6fdbd4425c5fd17a9fe39daf4d4d075da6fdc80f653e5894cdc2fd98752bee  uvicorn-0.30.5.tar.gz
+md5  d75153180f8c19a1bf8299818d3acdb2  uvicorn-0.30.6.tar.gz
+sha256  4b15decdda1e72be08209e860a1e10e92439ad5b97cf44cc945fcbee66fc5788  uvicorn-0.30.6.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 276aa89804..e9676d3765 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.30.5
+PYTHON_UVICORN_VERSION = 0.30.6
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/c3/ad/02b1b412e43605aa6aac8d0392c383ff3f6ae8267b7864e48e3b5f3f601e
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/5a/01/5e637e7aa9dd031be5376b9fb749ec20b86f5a5b6a49b87fabd374d5fa9f
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
