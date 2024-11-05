Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42B2D33A22
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B35360835;
	Tue,  5 Nov 2024 18:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tk1MAP-S6BUY; Tue,  5 Nov 2024 18:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C4236084B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C4236084B;
	Tue,  5 Nov 2024 18:45:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DB88B8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BCF780D4F
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R7Cqc3mxYnK6 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:45:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DBEC80C80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DBEC80C80
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DBEC80C80
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:45:40 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83abe4524ccso218309539f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730832339; x=1731437139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xmkGWa3H2upZ8O4E3WQz85B49gXvktKKdEXGQqxz2Lc=;
 b=cav/MHOJnzw0zLsrrySP8SpjJXTQ4mco+lIIG2sy1onswvxrNM9OLV0sKAMFUzuCR/
 zrtqN66+xaZe7A+wWmt8NwFTQOvbVAF76oHnD5cBudmAfOlSJa8if0bf2GA76yJzXlkr
 sWnIpQCewBq/7+Uc1ZZ5emDUqXcPj2ftKPQkKUNunuRXyjIWRFON9A9Bx7mAjut3ZchH
 pyOmN9Z+zzzhfwmwpAtCkhpJzlkKPbhPgRU0LmWDJT4CZF4o3jMuUs+Uq2qInGyUUYaB
 w5NKGnq4+ChZnMTIgAsIPnoG/AtGXjSRbKLCKlollxZpk1HDtV+jrlk+br63i+9XpCfK
 +P8A==
X-Gm-Message-State: AOJu0YzsmGGBZx86naPvb5gopjoaq2qpcBXwgwugytsW/EjezsZ1b5km
 9dfDpQGLW4zDIWxS6DP6IUQ0EkXGzV1kPcpUY9MJCxlz7i93r/ImLmM1bw==
X-Google-Smtp-Source: AGHT+IHKRyvIo1dSTxW7tNUIjTZjjzA9Gs8u6BlEQUE/0YAI2005r3bKPt9OzPTQsh+Jv4UoNRFrXw==
X-Received: by 2002:a05:6602:641c:b0:837:7f8e:dfe2 with SMTP id
 ca18e2360f4ac-83b64f38eeamr2112284439f.2.1730832339393; 
 Tue, 05 Nov 2024 10:45:39 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de04977764sm2531198173.90.2024.11.05.10.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:45:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:45:37 -0700
Message-Id: <20241105184537.1531867-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730832339; x=1731437139; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xmkGWa3H2upZ8O4E3WQz85B49gXvktKKdEXGQqxz2Lc=;
 b=RT9ybEYUo15eNTbCAydwqPj8WdaJhrn5jFw4oGg7bimkm/OeI38v4pMygwzyRWn7Ft
 qrEgd45aAOCxfXPyKgfg4HfYfbe5NsGjngNkaSvoGypIYvQ1nQ7ARJ8nimcTfiimqCNP
 3qXb90Dgu4gCe/7APRabCg0P/UvomBvC7sYfHKFRVYNqKZtvmBquKaUguEb8NrGlhR7i
 A+7FKUB0PIuUFFWxZjEeoGasBsqdCd6erQfANHNK72qBaMX4Uw8rJG7/SeSbrWhiZ07R
 wJUUqBTIDKVVEhUG+vTLhcZ00M16GYvwz5Cxe4n25XCxoclnQ0csR8tO4YgvBTouzLzS
 RczQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RT9ybEYU
Subject: [Buildroot] [PATCH 1/1] package/python-async-timeout: bump to
 version 5.0.0
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

Drop no longer required python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-async-timeout/Config.in                 | 1 -
 package/python-async-timeout/python-async-timeout.hash | 4 ++--
 package/python-async-timeout/python-async-timeout.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-async-timeout/Config.in b/package/python-async-timeout/Config.in
index d19f15b3c6..04dfc81052 100644
--- a/package/python-async-timeout/Config.in
+++ b/package/python-async-timeout/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT
 	bool "python-async-timeout"
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  asyncio-compatible timeout context manager.
 
diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index d46489396f..68cdbc3ca8 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-timeout/json
-md5  9bf7b764a7310cb063c1c261c21342e4  async-timeout-4.0.3.tar.gz
-sha256  4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c427522f  async-timeout-4.0.3.tar.gz
+md5  1507a6758b30c673d01ac9db6beec95e  async_timeout-5.0.0.tar.gz
+sha256  49675ec889daacfe65ff66d2dde7dd1447a6f4b2f23721022e4ba121f8772a85  async_timeout-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index 9760b8ae25..eda75c4277 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.3
-PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/87/d6/21b30a550dafea84b1b8eee21b5e23fa16d010ae006011221f33dcd8d7f8
+PYTHON_ASYNC_TIMEOUT_VERSION = 5.0.0
+PYTHON_ASYNC_TIMEOUT_SOURCE = async_timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/61/1f/44d9efc904bbe4d9967433522b691a9c4f1e81c2c64fbe44bad63d5de646
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
