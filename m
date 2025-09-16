Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E9ACAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 01:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76024808A7;
	Tue, 16 Sep 2025 01:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FObIcnbrpuNM; Tue, 16 Sep 2025 01:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A220A808A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A220A808A8;
	Tue, 16 Sep 2025 01:59:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7482A199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A9D040320
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xr9aMe7B8TYp for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 01:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71E8640595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71E8640595
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71E8640595
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:59:47 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-423394b393eso16343115ab.1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757987986; x=1758592786;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SthKdJ0D6YN67yY40WhmfPV8KTh2d4Wo5DYNuyTccqQ=;
 b=nLMdmtC1PUj8pDJB4vkLGCbMv0w8Q5IcWamyOSwd9V3ZHNHK76dxPQ7EWL5wdzPSrZ
 7LfLKgP0445S0lfMQ135dn6YS1p+Tzs2vp9T9bq2G5AtxY/T/6kHm4x3EnrghR3IX5qU
 7VTf/hz3eS75b3mipfv+HWJbpCTYibJXomDoTjYxjMTJK80jEPJ1Vxb/DjUecPqn3Fds
 0EYUhWWMotqTyxibEov+TefBTllVGwfFUkcm7qgPH55fGxaegS8r+vS46/4yDjcXTH4e
 Afysl+5mJd+piMTHlvahDivksQhz+DsXT/bKbqKVMgVNKzSHbXmoKL0fnUZtdg+xkAZh
 oO6A==
X-Gm-Message-State: AOJu0Yz7+3ppRc6vmDbmuhEpPEc3jMOLvLV+SlBITicBbRPQ1wTNhwsk
 B6rvBTkZ0niMPNEdbWBZO++Vc1xijaGNLCT9yRZkLKQf6ri8F/DFaTlGOXPZjQ==
X-Gm-Gg: ASbGncvd8n35aP0eouLef1YLiY1+vMFa2mRZIJGmJhAc4sfyJrGN8YXogfC71tuA6Rg
 GZ/zvtt1mjSdx2pPfJdjxCJop13mjW135lXBi6lB8qI7xhrEGBZDhAHe+SEvHgR9GsamBO66itZ
 2ovHizPtVZYOTauTy27yliB6bxoKSSvbbBxoHE+RmUrFkOyPmarnMjs+UT2wckdPpH07IRGtL5s
 WqrPc3co6/StgA+uPCLTeOMeIarTdn0wD6iePMi/9Hexkjcgu0lTG3YUqkvR4nh/+Ejzom83qB4
 vqveDuMLcaTvPNlTIPuArmNNcJbJO+KuSL8qsVShv1B7nxq/j8j1bd4ntW0tATQ6owOez1PAssM
 0N0v0XhzfkP6vv1HaA+OuU6ldI4gCYkRKZdBeoz/tKc+KhQOFBDWFTtXIvHW9XS8JPz8FwGJIDx
 5A
X-Google-Smtp-Source: AGHT+IG3JF0MTLxpc2SgZS19IVsPtFRwX/bk7JQNH0aNlVraMMwiirTp6n/dhrOyptKnsT00BZovkQ==
X-Received: by 2002:a92:c242:0:b0:424:36a:7b00 with SMTP id
 e9e14a558f8ab-424114f2623mr3859425ab.13.1757987986102; 
 Mon, 15 Sep 2025 18:59:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5120b81f781sm3715903173.33.2025.09.15.18.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 18:59:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 19:59:44 -0600
Message-ID: <20250916015944.2627563-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757987986; x=1758592786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SthKdJ0D6YN67yY40WhmfPV8KTh2d4Wo5DYNuyTccqQ=;
 b=HdWHFQ+3UO2/+CWNMoA0vaGV9a1Kas+MseA53f/2k405n9arkfaZ6Nn+RmXEEwXS6i
 2pf3DePgSHTPGA0ndQFIk6zfxLYTCI9XVggoiomjpZe9/dosR6peU3j+iWQvwvUq+6ri
 jHffYV/a+sgKCjq+/vpJoPl0sak+FfZeVAu8DGun46p5dNHvgANtyxuZGHyWuTwaS3bC
 5GoLU/k8c9q/wyMKhfhsKItmSBuI5QBAG296C7hoW+0GYnoHK99kLChgcMXX87cW7iqY
 wGJFoO8eZNCu8PEx/FkgwEvKLuJTBcE+135qARAJ5i2z7SCPCR/vg4cqA1Km94peB++p
 mCPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HdWHFQ+3
Subject: [Buildroot] [PATCH 1/1] package/python-mypy-extensions: bump to
 version 1.1.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mypy-extensions/python-mypy-extensions.hash | 4 ++--
 package/python-mypy-extensions/python-mypy-extensions.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mypy-extensions/python-mypy-extensions.hash b/package/python-mypy-extensions/python-mypy-extensions.hash
index 5e3763bd63..6db4ca35b0 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.hash
+++ b/package/python-mypy-extensions/python-mypy-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mypy_extensions/json
-md5  5b77a3cafc7e9749a0157533c0915b5d  mypy_extensions-1.0.0.tar.gz
-sha256  75dbf8955dc00442a438fc4d0666508a9a97b6bd41aa2f0ffe9d2f2725af0782  mypy_extensions-1.0.0.tar.gz
+md5  f59bfd7f9dca73f36c8feed12f9e8eba  mypy_extensions-1.1.0.tar.gz
+sha256  52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a211403730b916558  mypy_extensions-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a50450da1d53cd777b80ced77c58ff96abe0ccd879706bd142c3ec20e245f0b4  LICENSE
diff --git a/package/python-mypy-extensions/python-mypy-extensions.mk b/package/python-mypy-extensions/python-mypy-extensions.mk
index 99b30b2c07..cf0f7c681c 100644
--- a/package/python-mypy-extensions/python-mypy-extensions.mk
+++ b/package/python-mypy-extensions/python-mypy-extensions.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_MYPY_EXTENSIONS_VERSION = 1.0.0
+PYTHON_MYPY_EXTENSIONS_VERSION = 1.1.0
 PYTHON_MYPY_EXTENSIONS_SOURCE = mypy_extensions-$(PYTHON_MYPY_EXTENSIONS_VERSION).tar.gz
-PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/98/a4/1ab47638b92648243faf97a5aeb6ea83059cc3624972ab6b8d2316078d3f
-PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = setuptools
+PYTHON_MYPY_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/a2/6e/371856a3fb9d31ca8dac321cda606860fa4548858c0cc45d9d1d4ca2628b
+PYTHON_MYPY_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_MYPY_EXTENSIONS_LICENSE = MIT
 PYTHON_MYPY_EXTENSIONS_LICENSE_FILES = LICENSE
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
