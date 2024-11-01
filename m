Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A89FE6F07D
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 18:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39B47820C3;
	Fri,  1 Nov 2024 18:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWW4vfF0awW9; Fri,  1 Nov 2024 18:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C7C483FA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C7C483FA8;
	Fri,  1 Nov 2024 18:23:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B1DFCAF2
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADAF38405E
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gao4FblH_2QD for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 18:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00233820C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00233820C3
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00233820C3
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:23:42 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83aff992087so99537939f.3
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 11:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730485422; x=1731090222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WRwVT1BP+yRhZkL0TDH5A0Ef7PkM7HAaY6QnnwFZtJs=;
 b=rK6TByz1++id1tVIkG96yYA+uAN30TOaX91oasv1TScv3AJtq3rogE/eGxMhETLMvd
 lUwCv9YEChmh7A6HY4cior64qI+cAPA7tyCE7Qlqnr8pkBKqVVG4ifqSIJFaLwOAI5h9
 TbikR/8n0vdC0qkTtdR1hslT6KaMkIYKcrLRzl+FzRmTgE7p+JyJVodWvwz3AWIcVON5
 vRgPPxNgYYyAuBdhVeDjDHDhCvzDiLQ32xjX5OFg1Ald3O2w3hOmTIWvdHdaPwcdY1l/
 2odNvucfAJjih59FPYuogr8/2nYhhD43w0UK33ybLJIyPtKqqldwUPzYa3qUx5+EF3Aa
 LJ9g==
X-Gm-Message-State: AOJu0YwD3Yn4/wMnrThjTiHh4rag4iSJT5cMp48jCZMyTtp92ErTlbcC
 Kmws7q2e7ZqLZzcrQNZxdc82oeK+42Y/E2cwGaMvL/dngALkTxYWeFyMXA==
X-Google-Smtp-Source: AGHT+IHh19ZDzaPKHmJB2sboifTezqc5EAnZjik1naRK2ZcdvCak9XwcsRrsr4RYc4AqPTUopin81Q==
X-Received: by 2002:a05:6602:6b0a:b0:83a:c858:dc3a with SMTP id
 ca18e2360f4ac-83b1c5d5191mr2378756539f.14.1730485420242; 
 Fri, 01 Nov 2024 11:23:40 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04aca858sm834613173.165.2024.11.01.11.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 11:23:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 12:23:38 -0600
Message-Id: <20241101182338.1045721-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730485422; x=1731090222; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WRwVT1BP+yRhZkL0TDH5A0Ef7PkM7HAaY6QnnwFZtJs=;
 b=ei9uysCsHJCQYmi+KQYtneMeMCJDlX5iLy0u8vO56Mx4ejIQiesI4Jr7nwgJ2aYsIt
 qcLoKjo6cl9v/J8KSYlKDeYk56yPQLiDy27mRVbsL9VwV/HdTrT2BAWPYbGkDDA4sNcI
 xNsaWmDFNT0lmBxMXDVCGe/q4Rqx2Fp2gC5/NbQnDkUgModw02/56liqQzAhtrwlKWnC
 7Yd17b+er2PjvE5LDJwB0t0uFX8BDyYm3ixuGGDClo4sl9kIfhz8xVGuQxhWquPK8BVL
 uNtYzJKRbalxcavyF464TNZ+/gh/X0b8/vCdRvcvgzEZvHd5mQP68XQSfXRPWbSPDvIK
 H8Vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ei9uysCs
Subject: [Buildroot] [PATCH 1/1] package/python-mwscrape2slob: bump to
 version 69eb1c90d2cce75cb91601763bcf8fad8ff8366d
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mwscrape2slob/python-mwscrape2slob.hash | 2 +-
 package/python-mwscrape2slob/python-mwscrape2slob.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-mwscrape2slob/python-mwscrape2slob.hash b/package/python-mwscrape2slob/python-mwscrape2slob.hash
index 51b625856c..e72adb288b 100644
--- a/package/python-mwscrape2slob/python-mwscrape2slob.hash
+++ b/package/python-mwscrape2slob/python-mwscrape2slob.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  f1c1c79526fb3e0dac1c2c43e57a38b8641672e7008c5530d4b75e864eff232a  python-mwscrape2slob-e01d3e92f0a372ebd0f57390e437a28f9d3c0438.tar.gz
+sha256  41f6749ea9d411dfac2abc9b81b1b58bc3cc533518797ccdc922e23affc2df07  python-mwscrape2slob-69eb1c90d2cce75cb91601763bcf8fad8ff8366d.tar.gz
diff --git a/package/python-mwscrape2slob/python-mwscrape2slob.mk b/package/python-mwscrape2slob/python-mwscrape2slob.mk
index a99005ba7c..58ae63e315 100644
--- a/package/python-mwscrape2slob/python-mwscrape2slob.mk
+++ b/package/python-mwscrape2slob/python-mwscrape2slob.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_MWSCRAPE2SLOB_VERSION = e01d3e92f0a372ebd0f57390e437a28f9d3c0438
+PYTHON_MWSCRAPE2SLOB_VERSION = 69eb1c90d2cce75cb91601763bcf8fad8ff8366d
 PYTHON_MWSCRAPE2SLOB_SITE = $(call github,itkach,mwscrape2slob,$(PYTHON_MWSCRAPE2SLOB_VERSION))
 PYTHON_MWSCRAPE2SLOB_LICENSE = GPL-3.0, Apache-2.0 (MathJax), GPL (MediaWiki monobook style sheet)
 PYTHON_MWSCRAPE2SLOB_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
