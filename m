Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5540C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7999641915;
	Tue,  9 Jan 2024 07:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7999641915
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0oNQnHNYkD8; Tue,  9 Jan 2024 07:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF28641901;
	Tue,  9 Jan 2024 07:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF28641901
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 471AD1BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DE12416D0
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DE12416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CubLqA4mFE_j for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:33:51 +0000 (UTC)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C411A40446
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C411A40446
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3606f133b1fso7714365ab.0
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:33:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704785630; x=1705390430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RAG5Xle8w5A9S1XMgd1QMluw/ku2PaiDEuJx/oxlVUQ=;
 b=oXagEtfefKrb0ihVLinGW9JnRytaVaf6RMFZ5grfWayTjL81/g3VV90lc9BuebkvrA
 /zUC9truOxILmw9YbVhvAc1cq0x2sMQEY1IB37Qag3HZjAJBBxB1MgVKBRPOuvqnalB/
 N3HkTSXLjH8OfbjzxExI3o+eIoDTWNVjrj+MuvGk1wlSxGxGs6wcRR/UELyq2Civs8px
 TMMMnIiG5cykLl2E0z/K+XYQW8RKee/ZMv9rKpAclHKoflJhfPOkty+3ZZR875MkALyL
 WKO6fAahSDH0RH7KaZg3AkTp+pD4DA/vkR6KIAt6Z6EbBDVuMDlfzijkFZxYd/YHPQ9i
 5k9Q==
X-Gm-Message-State: AOJu0YwZrQJLKCxkLOFK4zmSwIRP2cJsaqp6NwfGh5F+McQayg+XmyDl
 uVKo4wcBHSTzt0japq4S3zXYt0D8qDAz0g==
X-Google-Smtp-Source: AGHT+IFhwT5DcK8pgOfpMBpBIp+39PKRAaKtqdOJaz5fCySWT2tlqzARSs0f1nQ8by/S6v748owg+g==
X-Received: by 2002:a05:6e02:174f:b0:35f:efcb:1836 with SMTP id
 y15-20020a056e02174f00b0035fefcb1836mr330454ill.24.1704785630396; 
 Mon, 08 Jan 2024 23:33:50 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 h12-20020a02cd2c000000b0046da402ed29sm490388jaq.109.2024.01.08.23.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:33:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:33:48 -0700
Message-Id: <20240109073348.4039538-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704785630; x=1705390430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RAG5Xle8w5A9S1XMgd1QMluw/ku2PaiDEuJx/oxlVUQ=;
 b=mwAr71xFd9jDUJzb2HRjTpQUWkCrPbHKt7xFE80z+o+xI8y/J+Llv1quaKpXmt/MR7
 uDeHtMMZGbP4GP0QI6rV3imgZ4F5TmxYqueGINjuhTtTX5/oFOz7KMGTtcXNmsyBY/00
 ArMTPL5PYhUwRCbiG8Gnd55fvkbTLYHS/94TNaD9C7CaBpQKZwp+xqMLn5GAk5Fiu0/4
 wcBgMt9ISsiNDKUkhSN5zs8DLVkVOAbUmgmk09XeZjXdRt8ZOm6zBKYH4iaq5XUvScBa
 LF+mKceuerxH/Fb9uC8g4S/LSYQHAGPVXC975eoBfZ4efp5s4wuH0xVGs+VVk6qi95eA
 lv/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mwAr71xF
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.108.0
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

Add new python-anyio runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/Config.in           | 1 -
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index 7d376d3dd7..d4a527c601 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_FASTAPI
 	bool "python-fastapi"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
-	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 3dc1578cb7..8c578a386f 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
-sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
+md5  6dd5b159f2d6a7c405b4cb5cb9afb564  fastapi-0.108.0.tar.gz
+sha256  5056e504ac6395bf68493d71fcfc5352fdbd5fda6f88c21f6420d80d81163296  fastapi-0.108.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index dc6d919926..dd435445cb 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.105.0
+PYTHON_FASTAPI_VERSION = 0.108.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cb/0d/ec01761249b228f288b693a7ad6b2e695af521ca0f32dd09aef58890d9a4
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
