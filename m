Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FBBCD98D6
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 07:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3500182849;
	Mon, 15 Jun 2026 07:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qr5PLN-tzHy8; Mon, 15 Jun 2026 07:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49D988275A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781509257;
	bh=rPd23iAZh1DYIR6+7z/mi41RVwVfS0RI2ZnSzUiNjfE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=YBwqwi9Hjv2WZ3YtBymvE8V8AE3UTbKLzMpPs3m2veI2aYmhdV+zj0xYVQLlHvBCT
	 hxf7XiNChyAlLYAnGHeb19ThfB0sZiMBHJYosx9h7FxeTSBz3z6ia6HDFQd16AHCSl
	 lGHzRb0RXgizma8AMs93SWYHxQDKNsdSbqoDPvZkpbwJOVaUKsy94+GNl/Fqs/zEc+
	 HXCh4qDFRWaisx9NBwwLJx5IzqEFfR9jKQpQLk/vrkJiCyY20ULOqPmfwgdemWlAir
	 tCHIJM2Sc6df5ZwIeMhjTGC/ehhC49ok6ME4KtLwAdxnSpsQISpgrtEX9qjj7RMmTX
	 zJneL1YGwrh0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49D988275A;
	Mon, 15 Jun 2026 07:40:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34E0A169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 07:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F00A4107D
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 07:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q95B6aoVpSWJ for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 07:40:55 +0000 (UTC)
X-Greylist: delayed 584 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 15 Jun 2026 07:40:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A22A841045
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22A841045
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A22A841045
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 07:40:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3AC241814BE; Mon, 15 Jun 2026 09:31:04 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 09:30:41 +0200
Message-ID: <20260615073047.862958-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1781508666; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Ah5iiNUZUOagKlllsHNOaUuv1ZveSPt5MLpE9n07RXg=;
 b=jtZ9m0k5ZU67Vi5VZFxDUAJHDRXc26Wds2cPHQA9r6BLfYHQH9Dk1fo3EGKh3YAylw5pZC
 ZnfGsylVE4yYHop8VSug426+7pttCRyn2bhCdqQcs8GwZulOKFWQCkzibsXVX3JBef4djS
 6VHOBDw6+zRIMqUbgixB4cX7XwXVu2g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=jtZ9m0k5
Subject: [Buildroot] [PATCH] package/{python-}protobuf: bump to version 35.1
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes:
https://github.com/protocolbuffers/protobuf/releases/tag/v35.0
https://github.com/protocolbuffers/protobuf/releases/tag/v35.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

--

This release contains a workaround for the issue in libabseil with gcc <= 12 [0].
Buildroot introduced a patch in 955fb2f7c41f49e8d7fc8c60b8557f6f7c1d84c4 fixing this
in libabseil-cpp.
So for protobuf this patch is not needed anymore. But it might make sense to keep it
for other consumers of libabseil-cpp.

[0] https://github.com/protocolbuffers/protobuf/commit/78dc67e4d598d4e2ec8929105eb2ddbb4bf50935

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index be6484fb92..aaf5d77095 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  e4e6ff10760cf747a2decd1867741f561b216bd60cc4038c87564713a6da1848  protobuf-34.1.tar.gz
+sha256  f0b6838e7522a8da96126d487068c959bc624926368f3024ac8fd03abd0a1ac4  protobuf-35.1.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 4f5911e794..d4d0e3e0d0 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 34.1
+PROTOBUF_VERSION = 35.1
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 346a2f3c54..714e2cf49b 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  7d860558dfbd2762140370c391285c35  protobuf-7.34.1.tar.gz
-sha256  9ce42245e704cc5027be797c1db1eb93184d44d1cdd71811fb2d9b25ad541280  protobuf-7.34.1.tar.gz
+md5  e9074f4f40672c900f878be049f86cb8  protobuf-7.35.1.tar.gz
+sha256  ce115a26fe0c39a2c29973d914d327e516a6455464489fe3cd1e51a1b354f81a  protobuf-7.35.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 3ba1b96514..17369d1462 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/6b/6b/a0e95cad1ad7cc3f2c6821fcab91671bd5b78bd42afb357bb4765f29bc41
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/da/01/9ef0afd7999eb9badb3a768b4aedd78c86d4c65cfaf1958ab276199e76b4
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
