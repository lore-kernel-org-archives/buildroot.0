Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BECBE6F084
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 19:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5532860605;
	Fri,  1 Nov 2024 19:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nOzKpKafLZo4; Fri,  1 Nov 2024 19:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 415946067E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 415946067E;
	Fri,  1 Nov 2024 19:30:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 09F5427E1
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBFFF60680
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89zQJxu3helS for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 19:30:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 002986067E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 002986067E
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 002986067E
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 19:30:26 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a3b4663e40so7803965ab.2
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 12:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730489426; x=1731094226;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uamMwXQS4Mh0M0Z+gkcgdIc1i1QxSQKigM/mwR6vQ00=;
 b=S+4npYeqz78CLjxh+rg+U0ugogDp7AXPBIWKN09+lNcQ5zbIeocJP5DniBe4VT0nax
 ICZi7HlYYKNL+qJFyuN7CsvGK2PvvBjm1kAgBP396ILb748fxwrOUOOLOt/UAr6Je3VV
 JvBlTxH6sfLybIlSe8vHVnBc4lpPcGj00mW0veg6U4r6aF+bm4RNZ8sI1qQ8/mwo9qFC
 qcGBG/0ztyVZjO8/EvVk/Y/AVjNIAhOzDTCUppMxCJQTksPbAJbxoY01tOlmIAsJzJjL
 +wEBLU3u47pfmniM2nlNAufprjz6SBkeFc0EArSUZDIPs05y7ZLgonWTUrh7TVlZq2G3
 hvxA==
X-Gm-Message-State: AOJu0YwpKanc5GbUI/kUjPRuf86twkKLPkJwcwEjjTgBmVLXiG70StT7
 gTcquPL116zVfUF6txVKKtkj8famAKT326+L78/ebzwMpmeg1wDvB+FpHg==
X-Google-Smtp-Source: AGHT+IH9BSejAUqwNbJN9sXeMR+5ONXKesgz+2dbA0vZcVeHi5YPluXDTyVazwJkpX+eMNm+Qnovlw==
X-Received: by 2002:a92:d912:0:b0:3a2:f7b1:2f70 with SMTP id
 e9e14a558f8ab-3a6b035826fmr38367805ab.21.1730489425830; 
 Fri, 01 Nov 2024 12:30:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de0488830esm868512173.16.2024.11.01.12.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 12:30:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 13:30:23 -0600
Message-Id: <20241101193023.1068413-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730489426; x=1731094226; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uamMwXQS4Mh0M0Z+gkcgdIc1i1QxSQKigM/mwR6vQ00=;
 b=eeqpGK1DErhLuxmOr8Vvpf/vJNRm+uvZA/Wi/4FIKr1bbP6EU6FeDG+/OUHdjP3gW5
 Zm8fZFwC91DR+rdGtVGPn0WZ0z4+9JqzLIJN2txFd9CKItyfwM2+dk7hCzoQqaNpp4jd
 86DtULwAO7d0GUeHP76azI6jsu2hJWLZL1kFsw4Ns2jKn0w7tWNgyYPFRfmkpUkEOFj/
 sHKzdDEInrxvc6sTv9yXGpw/ZiZVwr5WTZgMLerv0RhsMI+V/a2RW3fK08pZqB4Oj6g/
 1GDjg25XrHzgz0dxOxmlJ/wJB6Qs7lsGswwFDP9/hwIBVWvbuqStNOPr/XXVevjmeGqp
 s4og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eeqpGK1D
Subject: [Buildroot] [PATCH 1/1] package/python-pysmi: bump to version 1.5.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysmi/python-pysmi.hash | 4 ++--
 package/python-pysmi/python-pysmi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index 39a76fc740..1736572710 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  84ff7ba2166c022b194c271f43b14c56  pysmi-1.5.5.tar.gz
-sha256  ad96dc983370e2b29a37dcc3af4ca6948127522b629bece23320ca0698c1b605  pysmi-1.5.5.tar.gz
+md5  4fc3708430d818df6d6cf3543b01d5d6  pysmi-1.5.6.tar.gz
+sha256  5b25825a5b4a566c42615c7b80547834dd32be394bf0c0504f56676843f96749  pysmi-1.5.6.tar.gz
 # Locally computed sha256 checksums
 sha256  bc211b99a3eb46f3b1f64f8152dffc869d3bc4bffed82545732ef9e34628513b  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 753105928c..a2793647d8 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 1.5.5
+PYTHON_PYSMI_VERSION = 1.5.6
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/dc/fb/8461c21d0893c72492100b35fce128b057c4e615e79b0ce4496412ffec0c
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/a3/a1/b43edf8fd80c550782c9f0daa499c7d3013d31ff924405a7f96c9cdaa5d2
 PYTHON_PYSMI_SETUP_TYPE = pep517
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
