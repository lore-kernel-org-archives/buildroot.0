Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA95D2505E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 09:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41876416E2;
	Mon, 12 Jan 2026 09:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_n0YPMQyGlu; Mon, 12 Jan 2026 09:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37206416E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768211098;
	bh=vegikAv+u6k2S8uKYZzuMo4Fz7fon1mCwHbQMS/apmA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=l9N2bBaTagQT8nB7xnIXDiJKjRXrSTC3FBW4OTrC5zMbOf2g9M4Zca3GRsuTEc9gS
	 OJte/alaA2Bxf2tcZwxtIal7La4+Z9i6+oxIvTaHqT65bhE0PsAXzgRZcv12n+p+H3
	 L0NMq2k2KcHbHfFgC20tD85RvUGg2PAifKMHrRGJZgcIU6oSZmMkQnX7Eu6nEIv74t
	 3hSendC9npu2uOlA3cJVNYcKuEVR8J5VolPKAdK+lzVRGdonRIDjMTde9UtceG+9Y7
	 R3cDpBByQDDX7xZja0e3ErQXmtQ/T3KzAYYFN1rvQAMUk1IN0t0Tn+X8bETiX105AU
	 hvDhR7dx2COsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37206416E3;
	Mon, 12 Jan 2026 09:44:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 570D31CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41436403A1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICamYo2IGRmH for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 09:44:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43E0E400CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43E0E400CC
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43E0E400CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:44:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A9BD1814B9; Mon, 12 Jan 2026 10:44:50 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 10:44:10 +0100
Message-ID: <20260112094427.251401-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1768211091; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Rpbfz7/B87TNHmFSTwEZf7qhkkQNTrJ87TBUk9PUIT8=;
 b=bfAYsPdrZsyiKDQ/X0cukM9HPfA1J/Nb6osJipF26ibr13ePOMcP7lbNw+4BNcbEJen4Ti
 0VH7dsgpVMPukj5rKje4OgSp/JFA6qymwnN3pY6NgsqoHkxP+wgC/bVnosxL9fwK2QtVzY
 z21AMZaGQGbIQBfUstYfeXosee1CqeQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=bfAYsPdr
Subject: [Buildroot] [PATCH] package/protobuf{,
 -python}: bump to version 33.3
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

Release Notes: https://github.com/protocolbuffers/protobuf/releases/tag/v33.3

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index db91cf296b..adbcf1d227 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  6b6599b54c88d75904b7471f5ca34a725fa0af92e134dd1a32d5b395aa4b4ca8  protobuf-33.2.tar.gz
+sha256  1c9996fa0466206d5e4b8120b3fceb332369b64248e0649089aad586569d3896  protobuf-33.3.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index e2158216c4..e77b1be08c 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 33.2
+PROTOBUF_VERSION = 33.3
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index fdfbc4b4f1..9f1950f20e 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  59060f8bb01846579e5c8d95917ad925  protobuf-6.33.2.tar.gz
-sha256  56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4  protobuf-6.33.2.tar.gz
+md5  64d69417f4fe879daabc70137006c0ac  protobuf-6.33.3.tar.gz
+sha256  c8794debeb402963fddff41a595e1f649bcd76616ba56c835645cab4539e810e  protobuf-6.33.3.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 8db9a2f621..df214550ba 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-6.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/34/44/e49ecff446afeec9d1a66d6bbf9adc21e3c7cea7803a920ca3773379d4f6
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/cc/5c/f912bdebdd4af4160da6a2c2b1b3aaa1b8c578d0243ba8f694f93c7095f0
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
