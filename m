Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7CACF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 19:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A89640102;
	Sun, 13 Oct 2024 19:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSAjfYKzsPEX; Sun, 13 Oct 2024 19:41:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1C9540185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1C9540185;
	Sun, 13 Oct 2024 19:41:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADFCF1BF3BE
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CDD14010F
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 19:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opw5yCR3lnwg for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 19:41:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49C8C400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49C8C400FF
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49C8C400FF
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 19:41:28 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-8354599fd8aso143654339f.1
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 12:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728848487; x=1729453287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pniM5ClnyLP6TOU0v4vTsXb1t7w/e7EyIwhVSiz3USk=;
 b=GFi4rLkBruIqof87S2tspF7MqHAU9+Y77p3+KaWJ3m09spxlKO6M+CT6+eW5HWMx82
 YU2+K7mRrVEnNbnec0YFd6wVCNr8dxk5TDRGliPkaE1IkwSVDadsUgBx1SMk5dg+RDso
 6a42rxreBX9RjFf/isC4Qd5YnLLdiRQZxi95TXbdYZX+i+5IN3IklPVKSWItH6WzGKE/
 Qob7BGV0MYVEeuzBD3BfKrqt1rVlKFmt20UPO0oe04JUKeHzSM5vMOfzdoJz9xHdvX6s
 WWq419mqx/Q3YgXjDcivw2taZ3z6ziRQuIj5uq83b1sVvALoPaor4f6N3hwSsnisPs4/
 /IXA==
X-Gm-Message-State: AOJu0Yx/O4QnCmVRyihb8w7nGTRUVc1LziX/QFfwT/5c1mUSzQ7NZmcf
 EQ5TPsA3Hvc55MBaILn3fFBvdCthOqCi8klFHnQwM9hu6MpklsRMJUAVJA==
X-Google-Smtp-Source: AGHT+IFBP9oZYjD1SVwDCV8C8m/U855XfCGY1g9lGnE1rcF5MVekNyo3IIcupIfwz7nADIVDNzdeHg==
X-Received: by 2002:a05:6602:6d10:b0:835:45f9:c2ee with SMTP id
 ca18e2360f4ac-837929fbc37mr764072039f.4.1728848487399; 
 Sun, 13 Oct 2024 12:41:27 -0700 (PDT)
Received: from james-x399.localdomain (71-33-159-223.hlrn.qwest.net.
 [71.33.159.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8354b8df7aesm172469439f.8.2024.10.13.12.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 12:41:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 13:41:25 -0600
Message-Id: <20241013194125.2810087-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728848487; x=1729453287; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pniM5ClnyLP6TOU0v4vTsXb1t7w/e7EyIwhVSiz3USk=;
 b=LgK5w1AfWIVLuN4uli5ozvhPsXPjH9EyMhbZwDd2+3Dk7+0dEi3tqVnnaG4omzYmpF
 mh7zIFU9TEe5YsBbiOS2d6P5EzqRN3AJ5EQgkiyo0VRyTxPFaaAfrKEwAns8kKflpaSg
 FgM5ZcdJuvBFAol6S7ShhBREL8d4W8PvavSQFy2oPk0T569FS8gYpeW1KwkzA8+GoVd8
 1QCiUbarqjPrpkKBmc3hENVeB14zcXvlpqAJjdJENhl9CZjfp06RnBlMb0Xs11qalsTd
 xbgB7jSe1p1jFZ9CyxTKEiPvULah6XnfEOmOf3jUOO/Qq4q/A02S4bXShnaU1se6MDl7
 VywQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LgK5w1Af
Subject: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to 0.31.1
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
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <buildroot@bubu1.eu>

Changelog:

* https://github.com/encode/uvicorn/releases/tag/0.31.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index be6e2e325c..2be7edd1dd 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  a5b7951b8d9e335fbee8002e9081c108  uvicorn-0.31.0.tar.gz
-sha256  13bc21373d103859f68fe739608e2eb054a816dea79189bc3ca08ea89a275906  uvicorn-0.31.0.tar.gz
+md5  db3a0ebc67364f41561c284e5f4b3461  uvicorn-0.31.1.tar.gz
+sha256  f5167919867b161b7bcaf32646c6a94cdbd4c3aa2eb5c17d36bb9aa5cfd8c493  uvicorn-0.31.1.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 3917e3a4e7..23eb79623b 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.31.0
+PYTHON_UVICORN_VERSION = 0.31.1
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/0a/96/ee52d900f8e41cc35eaebfda76f3619c2e45b741f3ee957d6fe32be1b2aa
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/76/87/a886eda9ed495a3a4506d5a125cd07c54524280718c4969bde88f075fe98
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
