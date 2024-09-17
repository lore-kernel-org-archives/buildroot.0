Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172AECAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BADCB6072F;
	Tue, 17 Sep 2024 18:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QsWipBTs0h5; Tue, 17 Sep 2024 18:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C094760762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C094760762;
	Tue, 17 Sep 2024 18:04:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 637421BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D0AB40139
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:04:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPGIw17b9nwT for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AA8C40133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AA8C40133
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AA8C40133
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:04:51 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a07bd770e2so32358625ab.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 11:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726596290; x=1727201090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=04AnMbDJfAppAo7kBVKk4Wm/7grlbLsotuXQNHi0wdo=;
 b=xQ3wFtepuUyqjAKBUmS1zsWX3tVPTOUeX6rq2BStuGi4KRO2eQeIax4aBoMSM/FSGC
 LgilWGNQnDj3PU6WnXdIC6DuvD+KO59sKZmAhrCUysVm00gFAZ/wD/Hb/tBUS1afLJxl
 zd+QgFu/kZRJc0FL2fsTes1JH98hnDxM/+MPNFI5AIl3H8/JyjjzerwD6XLqCFA49atR
 1s6azwjECsvo3vzcf6T9NVX/2O6PGNnqhhnr9vxj8nGIw3bP0JzUTiNbSYxuFTgWd6/4
 ac3rzJKQ/Mk9y4RI7SrcZcfC2Mp1j/8c6DbTB9AwAZ7rkIEMldaDRgQGhm34QuAGgu/B
 /QLA==
X-Gm-Message-State: AOJu0YxNsCjN+4WC3UCXWimp5d3BX2dgoHLw4OCx2gWd/oNzv9k3xV1R
 KWp+bCnJotlr3P2Uf5kJXyc+DqGc6v1S5YH2/onpIGV3jJd90bsiidGKSg==
X-Google-Smtp-Source: AGHT+IFeTh94v02gvZs+Ce2IdrF7XsUCRIIDNvc8uSICPH7++KGUuBq9ZiHX9uw+SPcYlQMbvime4g==
X-Received: by 2002:a05:6e02:16cf:b0:3a0:abd0:12b with SMTP id
 e9e14a558f8ab-3a0abd1022emr56856275ab.8.1726596289658; 
 Tue, 17 Sep 2024 11:04:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e1b763sm22967995ab.44.2024.09.17.11.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 11:04:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 12:04:47 -0600
Message-Id: <20240917180447.3850219-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726596290; x=1727201090; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=04AnMbDJfAppAo7kBVKk4Wm/7grlbLsotuXQNHi0wdo=;
 b=jM+LNngRa7LMZd4tZORWi67B1jP1M5lLc/jBK0otwGnS+bB1nMb80OJPi+6YNkR3Mn
 lFSpdttn3n52E8ALx2hXEpSnsNVLcx90q2yxT1tadQoDZqDYmDVNcMb5uOh8TqzPjlQn
 lQjuri6y+mvbXeaX0pftuyu0RW7lc8IDKpE7VY9gmyC7iAY/Oynq3YwbETPXXcNfVxwP
 TucHveNFLpxLWkolDjW2S3rEopeBLl9FQ4GJf38keD237DtGikx3g4QhuWl7je93jr7v
 6p+GxUZ38jbNAnck8K+Mss6Ik84/awLG/DBrv0XiMwyJDCgiSJSbhkpWvSAmUFraTAqa
 jRQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jM+LNngR
Subject: [Buildroot] [PATCH 1/1] package/python-opcua-asyncio: bump to
 version 1.1.5
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 4 ++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index f5856019a5..0bf137ef95 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncua/json
-md5  37000bc60b98b4822511ced1c2b4c020  asyncua-1.0.5.tar.gz
-sha256  2757163f2a2ff1d8b923297d4af9b8161d25bed95867c1f67078faaf7f2d3f92  asyncua-1.0.5.tar.gz
+md5  8c41793e873928027dad4da9035aaf8a  asyncua-1.1.5.tar.gz
+sha256  d5edac9234fd7f1ed6a923fad1bd709bd0fd3f8a0d41637d645666620375173f  asyncua-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 226b9bbc21..e7da7482fb 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.5
+PYTHON_OPCUA_ASYNCIO_VERSION = 1.1.5
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/bf/c6/3c17b8b5335faffc2f08c728008c5ae7cc46d24f674bc1038a69d1849ef6
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/49/be/be6dad2b7db58fc9e92260fa9fdda8604841f2863d60ec2c49dccb1f9661
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
