Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D47C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37A44404AB;
	Sat, 10 Dec 2022 21:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37A44404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2yiowfAnGyM; Sat, 10 Dec 2022 21:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E375404A0;
	Sat, 10 Dec 2022 21:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E375404A0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E036C1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C933460B12
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C933460B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVx_xZNMBTy2 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:10:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4CED60AD1
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4CED60AD1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:09:59 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id x11so1598059ilo.13
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xLB5RximxkQQykQ2khNvCh2owxTwRukrQaomtvnX2qA=;
 b=CVLDQ3al/S++ImoGxCW54JSp+d9nPeouUAtv/w3aRKw6u3eG53CFDtK9FZXkG3V4k3
 X9ZC949iF+s0slBPVvE0nGX0b9/7I083/6D9GIJCP+7Jr/5SXVa+F1Ir4SO4vp0fKNC9
 uWCpcPJ9agjjlDC9dISuUYUpE+W3Pb3pBZzHwvoZvgu3bGFY8zACoCPg+2Lr5ztd4Q9D
 aEPhlRLjL/i7J0IRoJniYCui4YxQdAaYpkEhkAwz4Jhxk40cdtFFQgbNxUc2eZkQ9w3K
 mz7p6641IyED3LliEtnW6nuCtL2poPIl7eNFTKAPH7pFN3eHFbLgLKQ85p1XBvCSXXtU
 7JxQ==
X-Gm-Message-State: ANoB5plp1/7tZI0gIHN0LqKqqvKA1Dyl5gkluRRNlodlQBgdgb8IeXcM
 JV81X0vkCPcfVMZ/tUMDcNQQjUWnSglDRPAH
X-Google-Smtp-Source: AA0mqf4XvXGuGhxnB6/xqXv3gGhCy1OYLOmKrcx0P6ompr3IwIPYHMMuYlXKKYEsPTqtDUaUX9vqEw==
X-Received: by 2002:a92:6707:0:b0:303:7b0e:fdb7 with SMTP id
 b7-20020a926707000000b003037b0efdb7mr5832118ilc.0.1670706598806; 
 Sat, 10 Dec 2022 13:09:58 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05663810c600b00388660ca27dsm1689007jad.4.2022.12.10.13.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:09:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 14:09:57 -0700
Message-Id: <20221210210957.3664251-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xLB5RximxkQQykQ2khNvCh2owxTwRukrQaomtvnX2qA=;
 b=NpNLHkNkqH1hjsNhgNkXpCbBFs1wgrit3Hw/4/BLtwsb6Lpq6VRxc0yd/OdmScPhxF
 gFhWZLp/Gy5ZjCwCLw9vE9gyf1k6FTggi5KtN8qhqIUIKNcg4ScCkrpSe11Cx9tSrhSA
 u5ewnCWo9/0LWts4j1vC5zxjmZqai5SWkhqw7PNw/1oggAjKOQGPgu7yHLhGb+CV7WTI
 0xYaPtvnVipdg8U5Zc1l5Ev9e3iswGvfVOT0Jks+5Rm3pmJcpeWrQTavbT0w9YwGL3Bt
 XYA66QomFIJQTlc0h6pvZtB7MlVjGmCKkwFb85GCylBXSfnKPg+GzWZcLTq2BMXGfv8x
 lVJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NpNLHkNk
Subject: [Buildroot] [PATCH 1/1] package/python-websocket-client: bump to
 version 1.4.2
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
 package/python-websocket-client/python-websocket-client.hash | 4 ++--
 package/python-websocket-client/python-websocket-client.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websocket-client/python-websocket-client.hash b/package/python-websocket-client/python-websocket-client.hash
index 08a6c260ca..5da778027b 100644
--- a/package/python-websocket-client/python-websocket-client.hash
+++ b/package/python-websocket-client/python-websocket-client.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websocket-client/json
-md5  1e8b6daae0cad86f8cd9210b24bdf95b  websocket-client-1.4.1.tar.gz
-sha256  f9611eb65c8241a67fb373bef040b3cf8ad377a9f6546a12b620b6511e8ea9ef  websocket-client-1.4.1.tar.gz
+md5  26d1d8db59c9417570d8ec73ace1687b  websocket-client-1.4.2.tar.gz
+sha256  d6e8f90ca8e2dd4e8027c4561adeb9456b54044312dba655e7cae652ceb9ae59  websocket-client-1.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  638eb70dcc4af2e6d8388de0636ced399f7c24716e11b8573a6b06f879e80691  LICENSE
diff --git a/package/python-websocket-client/python-websocket-client.mk b/package/python-websocket-client/python-websocket-client.mk
index 7e21187e22..79cde7e590 100644
--- a/package/python-websocket-client/python-websocket-client.mk
+++ b/package/python-websocket-client/python-websocket-client.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKET_CLIENT_VERSION = 1.4.1
+PYTHON_WEBSOCKET_CLIENT_VERSION = 1.4.2
 PYTHON_WEBSOCKET_CLIENT_SOURCE = websocket-client-$(PYTHON_WEBSOCKET_CLIENT_VERSION).tar.gz
-PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/99/11/01fe7ebcb7545a1990c53c11f31230afe1388b0b34256e3fd20e49482245
+PYTHON_WEBSOCKET_CLIENT_SITE = https://files.pythonhosted.org/packages/75/af/1d13b93e7a21aca7f8ab8645fcfcfad21fc39716dc9dce5dc2a97f73ff78
 PYTHON_WEBSOCKET_CLIENT_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKET_CLIENT_LICENSE = Apache-2.0
 PYTHON_WEBSOCKET_CLIENT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
