Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26C2C83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 19:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F588150B;
	Sun, 20 Jul 2025 19:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9z4JMs7kOGXM; Sun, 20 Jul 2025 19:14:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BDEC83ACA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BDEC83ACA;
	Sun, 20 Jul 2025 19:14:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 693A71F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AA8D83ACA
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9e2l4Ioh8gJ for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 19:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8283B8150B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8283B8150B
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8283B8150B
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:14:05 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-86cdb330b48so313113539f.0
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 12:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753038844; x=1753643644;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pWCpRPOCygLBVXCU2of8VYToCDiHDgJvkbbtfHKiUNU=;
 b=qZlHhOBYR8w88ZCKS58axOpZuKth/qoNUK6BnaOO3NSO6Hj7h1xIyM3i2TGDuUBLIr
 ofe8cyhfHLy9fPZGh98Zs08NRo/TJEwHj/nE3RyLNcsVNpcWp58b4DAZwI8NJBx9tVPl
 kTuzPTgcbKg+1w+FcpeKRcZYth592+TKbNmc/swjw0TfOJya2LqtlSuvOffAp65SDWoh
 S93poi2qs8Nkz4+pAMjCNZ7vePbi7flF1ziom8sqq0jb3w+RpIvxW2QiOhx/1vKywqlt
 gQHKar2AzfULIlpYpaxDbk07LIkpui1U+P/x/Nh4ZcelqzAjhi9R/twL0SlcIhUP+2L0
 4VFg==
X-Gm-Message-State: AOJu0YwdjOrduS6tegtPQnOQ0VHDXY+gu9pSGytIeBWa7YxPR3EduJJG
 xMK3JmEjqPdn6mB7oVmUGkp1DUxyb2HYFGP0He66QZeqSk2hvJ72CZ1vSwPe5Xth
X-Gm-Gg: ASbGncvSpn/nBlo4DSNUowZViehOd12aJ3xO0cn/SmjK0e7KpxGSXVNJbCGFJg7eHEI
 ihaPppm61DK8U18+8MKSRnOhXU0CZQMvu8mTnGrwBQj2Zci9/2S2D8TmuhrrX/k4sLitnWY8MCo
 jUxfdoyMDmyfAwK7oXoGO8s/sDehVLiLZLAvS3ZdtvXna4JbmODdKWzW2PZl7qe9h64Lto7DpJX
 Rry2mVh17P9os54zolKiMrRIwyVP4TSQl6dxE+txqTkBnT/cTP24TxMN4Kyq6SMLZkGePUFbY/5
 gTFMJzYlKS4PlmCJXiNqQ7gh17ryHXMgPO8JuAvblbEJt5etd4QCrbaZ1Bqv4C9xy1k+d1loACB
 gMtIDX/MjtoAVQyuymwjT4bSiuozqIzQf0ruDr+URyKOojZPWk1MEtV5zjbpBB8T9BIyAxC0W5d
 QzvOZxHwo=
X-Google-Smtp-Source: AGHT+IEOjlQPSqFZZel+Kw4QdZFrWoCiaQgqOf55IwM0K070A1AEr2dy3vUAjaV7jhjbta6PD/NLcg==
X-Received: by 2002:a05:6e02:240f:b0:3e2:98eb:3c2f with SMTP id
 e9e14a558f8ab-3e298eb3e36mr86123695ab.11.1753038844068; 
 Sun, 20 Jul 2025 12:14:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50872b56796sm353542173.29.2025.07.20.12.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 12:14:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:14:01 -0600
Message-Id: <20250720191401.3214602-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753038844; x=1753643644; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pWCpRPOCygLBVXCU2of8VYToCDiHDgJvkbbtfHKiUNU=;
 b=AFbVMl63Nw23a4LPVHM6fOuUtgBsgO87B4wl6oq5btlItLXkcH+cp9RJ9JjsQFrcDr
 t/2reZe3HaWtQJK+55u73QMMoshpJ1O0WGMqc3g85inwFSgPAvNFd47cWvsaAmPAunvJ
 iCH+3N4L3qKrU9WGvIZPDKTSQwSOxojmcPQXB6CayEp2Q72F82aqwN6bTnOgQLh12NtW
 /b5Ibsw6K6EHwCSeaySh90Ludw2QMNwCU1m5YRqtlqsD9oj3VWo4qNxOWUhkcJ7my60o
 08sLIygq6tdu7hvEHcsxB9N1SH/Iwhc+XWSKNR6jZWywMak3JyMUyB6ptYBHGVDaaLvn
 5UEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AFbVMl63
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-cors: bump to
 verison 0.8.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-cors/python-aiohttp-cors.hash | 4 ++--
 package/python-aiohttp-cors/python-aiohttp-cors.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.hash b/package/python-aiohttp-cors/python-aiohttp-cors.hash
index 5bcd8bdb05..5428fc826e 100644
--- a/package/python-aiohttp-cors/python-aiohttp-cors.hash
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp_cors/json
-md5  c993585a46c40cc4292c5722c7dfbaf0  aiohttp_cors-0.8.0.tar.gz
-sha256  ec70f38432c938e39d240ff38a7d789a5aa0a18087882c12d6cc141eef1144f6  aiohttp_cors-0.8.0.tar.gz
+md5  bef1294f1ab08844eb35a56c7157026d  aiohttp_cors-0.8.1.tar.gz
+sha256  ccacf9cb84b64939ea15f859a146af1f662a6b1d68175754a07315e305fb1403  aiohttp_cors-0.8.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c20f93f9891ddab8de9a4db5415d39c1d7d782174fe218b4c38ad78a771706e2  LICENSE
diff --git a/package/python-aiohttp-cors/python-aiohttp-cors.mk b/package/python-aiohttp-cors/python-aiohttp-cors.mk
index 26fa43bfa2..5e5ae92645 100644
--- a/package/python-aiohttp-cors/python-aiohttp-cors.mk
+++ b/package/python-aiohttp-cors/python-aiohttp-cors.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_CORS_VERSION = 0.8.0
+PYTHON_AIOHTTP_CORS_VERSION = 0.8.1
 PYTHON_AIOHTTP_CORS_SOURCE = aiohttp_cors-$(PYTHON_AIOHTTP_CORS_VERSION).tar.gz
-PYTHON_AIOHTTP_CORS_SITE = https://files.pythonhosted.org/packages/1d/a8/3edbba1d565f7888c52e04ac6188e19b812a9fc39d81dea413f3abf81bfa
+PYTHON_AIOHTTP_CORS_SITE = https://files.pythonhosted.org/packages/6f/6d/d89e846a5444b3d5eb8985a6ddb0daef3774928e1bfbce8e84ec97b0ffa7
 PYTHON_AIOHTTP_CORS_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_CORS_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_CORS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
