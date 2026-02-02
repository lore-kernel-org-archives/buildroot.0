Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88294E73146
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 08:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 524544092A;
	Mon,  2 Feb 2026 08:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7d9Blvjn16h; Mon,  2 Feb 2026 08:34:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76AFE4093B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770021244;
	bh=AHHA4NFvGB5KwOvoc6DgIOoCcezR/BOdr7HwI5gDpMQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=B+i+BhKRPSSjJqMYGVXW5fwiTr17q2s0brZKjgciXOP7J/b1gTx7Vcm40nEQLLfMT
	 cWr/M9ohKt1j7nu5h+LaS7Yc8/QKzdXOYjRNex88y3FIYTqy7CFxbR7z3ct1qOkUf9
	 negveHSFKrj7ceXQ2w9rXB37ePyL0f/HksqJCsos3SHomC6Rzc6ueKYwamIqzz0T0i
	 sM89SixqY+TgFhkatiJe9t0wpujtq7MBedtOIyHkRN6con6tBOQI2n544q8qaKv6Oa
	 uO4CmTrQLJETqehJiQFeLXYIlHTOL392e3wejrcdDjjmT1GzbbQOVuEHwQ6/dBZxAM
	 73fLdLBPwbcYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76AFE4093B;
	Mon,  2 Feb 2026 08:34:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A11F1E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66F0E4093B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pd3kU-C_bV0r for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 08:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A92D4092A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A92D4092A
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A92D4092A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 08:34:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C1E641814B9; Mon,  2 Feb 2026 09:33:56 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  2 Feb 2026 09:31:52 +0100
Message-ID: <20260202083207.1095362-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770021237; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=G0g8y2c22/RoG45LesqWP7WR/7JjLj9PYXB6VagMxOc=;
 b=ZwAc4Ad+Ry+BQXdhSux8Jx2Y7qK8GNyDJaUm5BxftKVjtJi3xLzjGNTXgWhgA+xKhOhlgk
 5kVmjjIqgHSc4yv21eh5BPi0+eWZxuHCBwEf+gEFnpRUIqDoh9YWPE5QV8DfjIySfBYt4E
 mrxyR0qGCNXHRvY7lAZBuq4rq0b51ZI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=ZwAc4Ad+
Subject: [Buildroot] [PATCH] package/{python-}protobuf: bump to version 33.5
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

contains mainly a fix for python-protobuf.

Full Changelogs:
- https://github.com/protocolbuffers/protobuf/releases/tag/v33.5
- https://github.com/protocolbuffers/protobuf/releases/tag/v33.4

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 3 ++-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index adbcf1d227..7211fa7c87 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  1c9996fa0466206d5e4b8120b3fceb332369b64248e0649089aad586569d3896  protobuf-33.3.tar.gz
+sha256  c6c7c27fadc19d40ab2eaa23ff35debfe01f6494a8345559b9bb285ce4144dd1  protobuf-33.5.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index e77b1be08c..b2046e057b 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 33.3
+PROTOBUF_VERSION = 33.5
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 9f1950f20e..1141edf396 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  64d69417f4fe879daabc70137006c0ac  protobuf-6.33.3.tar.gz
-sha256  c8794debeb402963fddff41a595e1f649bcd76616ba56c835645cab4539e810e  protobuf-6.33.3.tar.gz
+md5  5d9230257cd63f6f94ca3a7303b22413  protobuf-6.33.5.tar.gz
+sha256  6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c  protobuf-6.33.5.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index df214550ba..167b94a646 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,8 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-6.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/cc/5c/f912bdebdd4af4160da6a2c2b1b3aaa1b8c578d0243ba8f694f93c7095f0
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/ba/25/7c72c307aafc96fa87062aa6291d9f7c94836e43214d43722e86037aac02
+
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
