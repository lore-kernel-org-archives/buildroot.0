Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990C0C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2554D40133;
	Thu, 11 Jan 2024 06:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2554D40133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TxlWpyR_QSSN; Thu, 11 Jan 2024 06:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E54A43805;
	Thu, 11 Jan 2024 06:41:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E54A43805
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CFBE1BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0601483E69
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0601483E69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSWNODeTuTLa for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:41:44 +0000 (UTC)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FC9183E68
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FC9183E68
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3606f8417beso17472545ab.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:41:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704955303; x=1705560103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EL8INBcgYtOCy0GMbRYQVTqspqFw6G+byn72TSH54Fg=;
 b=uTGftVOGZKm+Bx+2G/greIhFOEOVX3WzVy5v216Cr8hGFBJIXhe76byPUuy01DeNua
 xE9OSJePX5mMLszmCPb1pLWNSeikEw0ebvggJwDUGNRwNuqgDj3YNQPbp8zj4LGZs4E3
 PjbyDVxqcEowGZteM7DIBC2O4TliwMI51lroKkUmitktUrGN1JUkokq5rOTS4upD6ph3
 dCxSGjNU2Hz4QvbIpsi43i68lEA4GQ6//YwHCBDTiZfqZpOGPzVGBtNtzebNTbGGL5sS
 BL2pK0Mn+YJc/h2gND4LaDhzZXc+uSqUGhFTkLvLhVXntYdpG/DwfZcaSoo2wDJ5LwEe
 22Ag==
X-Gm-Message-State: AOJu0YzYUS1CYRYvmxMQMetqBHjiGVYtdEpQI6BsT/fTPb2zunrV0L4J
 V50X/UdlWmop8TU+Qm65j7EW23QsT6fMBA==
X-Google-Smtp-Source: AGHT+IFNKvEQWms2141IY5HiGtCKpBhUMiepPWNx8QyqlvboFwVzG2EHDrjVV6FVKHL9spfMKCw1Ig==
X-Received: by 2002:a05:6e02:164a:b0:35f:f880:10ec with SMTP id
 v10-20020a056e02164a00b0035ff88010ecmr314298ilu.4.1704955302748; 
 Wed, 10 Jan 2024 22:41:42 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 a5-20020a92a305000000b0036062f40c51sm103230ili.71.2024.01.10.22.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:41:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:41:40 -0700
Message-Id: <20240111064140.3051598-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704955303; x=1705560103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EL8INBcgYtOCy0GMbRYQVTqspqFw6G+byn72TSH54Fg=;
 b=ddgxLBc/0eo4n6yH8eoVSp0yosftLG0/sQsgYV1deXUvUWC4L5nrYB6vuLAkmgIdZ3
 xCIjo5zV0P5ZGppJgVM1wrCHFAEUUUX/qDaoI5B6rtikSBdqVNQ8TLlgfHxp4503zcKM
 gE58pJh6qpxUJhkVH8HKSf7xxGdMoVTmn42F8IDtkQy0uTcFdGP/UsduuamEdCCbyv9P
 T4LSZRHnmNDGxVBn7Qo/WS1M1Vo5Mm/wiBRohggRf1udaT3FrcDh7US6/RFYsDydZPOo
 tcSwFKSb4ebd61Td7JGbnvX/UCT9Bfozat6RrCW7d9CGh7LEkJdJNxrBmYf66+w6DCYV
 apOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ddgxLBc/
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 69.0.3
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
 package/python-setuptools/python-setuptools.hash | 7 ++++---
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 6e1df42e3f..7f13ac3896 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,5 @@
-# From https://pypi.org/pypi/setuptools/json
-md5  d967ca2ba7f46db887daee2d5c9bd6a2  setuptools-68.2.2.tar.gz
-sha256  4ac1475276d2f1c48684874089fefcd83bd7162ddaafb81fac866ba0db282a87  setuptools-68.2.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/setuptools/json
+md5  b82de45aaa6b9bb911226660212ebb83  setuptools-69.0.3.tar.gz
+sha256  be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78  setuptools-69.0.3.tar.gz
+# Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index f26f427ccc..0aea3c6cfa 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 68.2.2
+PYTHON_SETUPTOOLS_VERSION = 69.0.3
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ef/cc/93f7213b2ab5ed383f98ce8020e632ef256b406b8569606c3f160ed8e1c9
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fc/c9/b146ca195403e0182a374e0ea4dbc69136bad3cd55bc293df496d625d0f7
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
