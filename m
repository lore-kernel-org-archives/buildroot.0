Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB77C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 06:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C24BD40639;
	Sun, 15 Sep 2024 06:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmzKugnJLKbC; Sun, 15 Sep 2024 06:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BE7A4062C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BE7A4062C;
	Sun, 15 Sep 2024 06:04:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D86341BF841
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7F0D8408B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmrQ4XXzB_5S for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 06:04:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D771583D2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D771583D2D
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D771583D2D
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:04:46 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82a238e0a9cso78948739f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726380285; x=1726985085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hsQhLVMYp6U/1TN/xPH4d0fQLzc0PJTlejciCHgGpZw=;
 b=qyXIFuwZ/O/EOzOT1Ql0a6NMHotbvACCKb5HNZgsbGlbptsUgmiwNYD3cFIvxdYQ54
 e7J4s3s1kbQx2/bIxOaLQLg+fTw/2+6tlphJX80NS9KnlbRCIwLAg8yK3zNDpr78o0gI
 5FZyLnMaUfqHPZKmJ4dDgve75XyhlHC6tyJRVYysas/taToHEV3hE9WEyE34gnFHYLa3
 1AF+n2zuaQ05Lnm8IBRW1iBo7RAaEuFoxVRzMAgRVblo3+s6CMtY/HLCjhF/ItMcU1dH
 gnnOw5f2uKA4PsYjywG1V2uThziSs0uWyp9hypCzF9u5IR2oK5rq7VYvhHMdEOMgY4L8
 g7Cw==
X-Gm-Message-State: AOJu0Yyel0dazY4eG/OB4rmXFnvEXzqjByTV7G7RBkCPQdGPQHunq5mE
 nbMVx7o3grsbnJRVwSANKOVgEqQwegs3tGAvI524a+6UsiJpurgBBVL7ZQ==
X-Google-Smtp-Source: AGHT+IF6SMBz7Rg0TcVHkstIRg2CnyVY/AJpk27SaNlsocT5pBEysfsdYmwCBHa5triOo39+eDTloA==
X-Received: by 2002:a05:6e02:1fe8:b0:3a0:9f85:d74f with SMTP id
 e9e14a558f8ab-3a09f85ddfamr5510205ab.16.1726380285473; 
 Sat, 14 Sep 2024 23:04:45 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed36017sm771857173.128.2024.09.14.23.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 23:04:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 00:04:43 -0600
Message-Id: <20240915060443.1431765-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726380285; x=1726985085; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hsQhLVMYp6U/1TN/xPH4d0fQLzc0PJTlejciCHgGpZw=;
 b=iro97Jz24RMZPM8rwRxFbdqK5nr6f13G7y32VvZv344rGwDNLjboli4JJW3h6IwWO1
 qrYS9ExNV4tO/FjLQYWxEhjPEjZ3g1kDMmPbshw78obB4zpxY3TRl2dRkF0m1JsFJWgO
 T66mO152JFci5jXxxGfD4YIAlvPqoINFLJ3iylbv2kljTRscsDv13geXtjO2fLcXYj/x
 JTblLWz+ifabAptSrXIpjbkFIn0pW52v5zwrezcblvWN7rdGx16/aFcpgxpb+Y49MvFd
 SYRXYwbwZbPnaz2m0pmES+QafbwGwzFCrKABp/3txIo+Wd+86h82gR1+j3WBRx5dFgfM
 K/oA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iro97Jz2
Subject: [Buildroot] [PATCH 1/1] package/python-fire: bump to version 0.6.0
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
 package/python-fire/python-fire.hash | 4 ++--
 package/python-fire/python-fire.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
index ce44bef96e..f58b5d633f 100644
--- a/package/python-fire/python-fire.hash
+++ b/package/python-fire/python-fire.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fire/json
-md5  8b24d579bd2a1b344b4f9670fa49ebc8  fire-0.5.0.tar.gz
-sha256  a6b0d49e98c8963910021f92bba66f65ab440da2982b78eb1bbf95a0a34aacc6  fire-0.5.0.tar.gz
+md5  4b63d0465633a5683b656342980e153e  fire-0.6.0.tar.gz
+sha256  54ec5b996ecdd3c0309c800324a0703d6da512241bc73b553db959d98de0aa66  fire-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index 7a6c31e8a4..8ca0fa84ed 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FIRE_VERSION = 0.5.0
+PYTHON_FIRE_VERSION = 0.6.0
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/94/ed/3b9a10605163f48517931083aee8364d4d6d3bb1aa9b75eb0a4a5e9fbfc1
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/1b/1b/84c63f592ecdfbb3d77d22a8d93c9b92791e4fa35677ad71a7d6449100f8
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
