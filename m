Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862FBE77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 19:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 151E640892;
	Thu,  9 Jan 2025 19:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxLzbZw2g8fR; Thu,  9 Jan 2025 19:24:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAF8340893
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAF8340893;
	Thu,  9 Jan 2025 19:23:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2242A940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA9F54088F
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBgQrG5TNuTL for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 19:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C01FE4088E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C01FE4088E
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C01FE4088E
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 19:23:56 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-844e9b83aaaso90960839f.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 11:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736450635; x=1737055435;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZGQO/arlJkMWfdpgOLXGsExqrfHWHnio+fuoTJhQ/34=;
 b=PgFuFx6Dy0wwhe6xrMKPTPldTq1NhUALXRrQnxLhxjgKfZba8i+bYJxhxdG82DbF5h
 FFAU6zHOTRKZkJ0TY1quAZ0kQX3rId/cyGo0v/2Tvum4zESkuncznLOZSdd6wmFu4UGM
 Pxa6KoA64f2MZTHATSN2zNz9piyT0py2G7vSBv7l7mwyvrZXJ+o4TYNckEe+4DFbJJXH
 05h/lOiZKdaYzblAw3iOAs1bMsIHs6J88ehfE81f7ZMJuUHlydL3G4PIKrk9isrLV8Ja
 m6z/lP3bWYcLrCN+/m23BfYAiftDOVegZCj/lWXj6n9u6P1hxbK5yEAYBtPssy4+5h55
 vVzw==
X-Gm-Message-State: AOJu0YwO2GbL/U2YwumdsKPEaFM8XZg9boumQSSkxA5mVm32pkPcJv0+
 bLIAjlABop5/lk35lZw1KTj1Q883iSrxiMKNPaUtRomXDaIkE4JcebCu/UKG7VY=
X-Gm-Gg: ASbGncse4dSD3qEMI7e33/L7B7MQ/omon6wcwyVPR1fgJ4YHMiGokKBrfAGx9MBTYyS
 6ybhDpvQ9gCgub0BhDvtq5R/7e5JKRB5UD5BdR/66Ny1FlWchIgPapfF0QfkCzIT8jXyjscvb3G
 JYrTPTCsaWWZezki7tr8Zmprq/hy0hSFdpIDBd01Ow8u5xnVQY/6o1E9p7Hm03Gu9KV+BKwwvWM
 GliyK0JyjOLrYnNSRAqg9nJPIDKfJC5K6z/FZe2FLXSNW9veae6Kxtv7cwvThrtsRV9ogMp2z66
 lKXur6Ckn4rArf9Re3WreQFC86JOvs4=
X-Google-Smtp-Source: AGHT+IGu3jyi6mFSKuMeQk3cZ6ITLsXSH6vP0PWehpgwVXlhPvTE9N5lKfjbEhbB8ou287U7UOTG4Q==
X-Received: by 2002:a05:6602:3a0d:b0:84c:dab3:4194 with SMTP id
 ca18e2360f4ac-84ce003c935mr694231939f.1.1736450635532; 
 Thu, 09 Jan 2025 11:23:55 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7463dfsm464153173.140.2025.01.09.11.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 11:23:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 12:23:54 -0700
Message-Id: <20250109192354.2361883-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736450635; x=1737055435; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZGQO/arlJkMWfdpgOLXGsExqrfHWHnio+fuoTJhQ/34=;
 b=ORN605p/LqgFU6wTrwfpADEuQr2XgPVhCjJhao50lAJMgLq6tLm5KR8WoPbWQ5Nnz1
 IV3t8Sv+W7Tz0fwIvLe54x7taIRlqK5hBnAr74UPHSF+9sWeZYctl4JjRDfFT2IY7Ju+
 33g+qoULFNhrlXjZMfnZy+xPTo1p2IEm3+ldUL6bISqUzU66L0D6hVS8gqW0EAtzSkyS
 Mu1yFwLVW94hgYhrPZYR4Ojj1QTc0QRRMB6YeBzQEtpuGT8MVUaTgCk0/VH5mHV56zIT
 uU4Ctp8u8sWY+2l7q65CZYo2ZrEk7GljZibUJK15zN+U8sJSuTkrS/2pGybUqlQuouJp
 YmSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ORN605p/
Subject: [Buildroot] [PATCH 1/1] package/python-asyncclick: bump to version
 8.1.8
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

Migrate from setuptools to flit build backend.

License file renamed without content changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asyncclick/python-asyncclick.hash | 6 +++---
 package/python-asyncclick/python-asyncclick.mk   | 9 ++++-----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-asyncclick/python-asyncclick.hash b/package/python-asyncclick/python-asyncclick.hash
index 59f00893e5..d121097130 100644
--- a/package/python-asyncclick/python-asyncclick.hash
+++ b/package/python-asyncclick/python-asyncclick.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncclick/json
-md5  542e83089a55129ca2fe7ccdbc65ba77  asyncclick-8.1.7.2.tar.gz
-sha256  219ea0f29ccdc1bb4ff43bcab7ce0769ac6d48a04f997b43ec6bee99a222daa0  asyncclick-8.1.7.2.tar.gz
+md5  e9bab017b26d1310d42b4043742812ce  asyncclick-8.1.8.tar.gz
+sha256  0f0eb0f280e04919d67cf71b9fcdfb4db2d9ff7203669c40284485c149578e4c  asyncclick-8.1.8.tar.gz
 # Locally computed sha256 checksums
-sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.rst
+sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-asyncclick/python-asyncclick.mk b/package/python-asyncclick/python-asyncclick.mk
index 946325e496..9168d65b58 100644
--- a/package/python-asyncclick/python-asyncclick.mk
+++ b/package/python-asyncclick/python-asyncclick.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-PYTHON_ASYNCCLICK_VERSION = 8.1.7.2
+PYTHON_ASYNCCLICK_VERSION = 8.1.8
 PYTHON_ASYNCCLICK_SOURCE = asyncclick-$(PYTHON_ASYNCCLICK_VERSION).tar.gz
-PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/5e/bf/59d836c3433d7aa07f76c2b95c4eb763195ea8a5d7f9ad3311ed30c2af61
-PYTHON_ASYNCCLICK_SETUP_TYPE = setuptools
+PYTHON_ASYNCCLICK_SITE = https://files.pythonhosted.org/packages/cb/b5/e1e5fdf1c1bb7e6e614987c120a98d9324bf8edfaa5f5cd16a6235c9d91b
+PYTHON_ASYNCCLICK_SETUP_TYPE = flit
 PYTHON_ASYNCCLICK_LICENSE = BSD-3-Clause
-PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.rst
-PYTHON_ASYNCCLICK_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_ASYNCCLICK_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
