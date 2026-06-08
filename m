Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDDFCD8C92
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 10:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A53AE84BC0;
	Mon,  8 Jun 2026 10:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxlG_FFWhVRo; Mon,  8 Jun 2026 10:22:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5E7784BCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780914160;
	bh=QIhzEeofzvpZKKrAnP4CV6nXmL9pl++hfb/GPtoowUA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=GKXG1NcaFEkBNwuOynESh7h4cf//sUHhp6I04/rvj1Xj0E8OSF40EUi2QH0RpnO1A
	 /cuwZdnZ5tcBJGNe9M4T1UdLK/hXQdqB1sG/lk9mzlWXf6EKfrnaEfC73UkGjK9/Ai
	 Feumm2EdyynRcV6WCf7RfsnU+DTXxm5WO5QtCeuvf8M1qkzmpKBX0W4xIJEkqhiy/D
	 VsihquSwUg1m7lGGNtgYOQYqwvOkl7m1x46fTznQpYA8UB3dY8gLDyHbBLRe3fDVpi
	 OlwuFDiaMH7Q9CQ9t/yeAP17dzama+UpxzTir9BJGXzhhWucMxwi46MrAtZVo5EFa/
	 6zbpR9dqs1NPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5E7784BCF;
	Mon,  8 Jun 2026 10:22:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5CEA187
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A719942829
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZEYxXUcW5LA for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 10:22:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B40642823
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B40642823
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B40642823
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 10:22:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56B4A1814BE; Mon,  8 Jun 2026 12:22:34 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  8 Jun 2026 12:22:18 +0200
Message-ID: <20260608102220.428066-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1780914155; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=wW4XtcjOFQChJm/bu0+SA8CZ1b03kX5MfjKl5hYjMTc=;
 b=IfcNS8DWRYXni4tgLpH8mrYbHQhJVfMt/De81NjmMwgm54WB+9qoPYWJpIixKLwiUrbAng
 xTks9m48hUVrkxkeBV7rOhW35HdkU8+Rg59nNQACCDJIVPYHeysRRjy0aLhiBw9ycnP10n
 VaWdS5fhkt5nhOKivKf++mrj/8N7yhw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=IfcNS8DW
Subject: [Buildroot] [PATCH] package/{python-}protobuf: bump to version 35.0
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
index be6484fb92..f36e5bf88c 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  e4e6ff10760cf747a2decd1867741f561b216bd60cc4038c87564713a6da1848  protobuf-34.1.tar.gz
+sha256  8f907baca4b34a3b4854103ba5811e418fb6e2ff11fe0d8df9e8280b11d79926  protobuf-35.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 4f5911e794..d43de04062 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 34.1
+PROTOBUF_VERSION = 35.0
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 346a2f3c54..c93db568f9 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  7d860558dfbd2762140370c391285c35  protobuf-7.34.1.tar.gz
-sha256  9ce42245e704cc5027be797c1db1eb93184d44d1cdd71811fb2d9b25ad541280  protobuf-7.34.1.tar.gz
+md5  09e2eeb13aa73f2ee69356066c848b77  protobuf-7.35.0.tar.gz
+sha256  a2efd84605f41e559f1881b0912b44099d0a2ac9bf46b3474823f10fb393b0e6  protobuf-7.35.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 3ba1b96514..0236d21139 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
 PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/6b/6b/a0e95cad1ad7cc3f2c6821fcab91671bd5b78bd42afb357bb4765f29bc41
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/60/fd/5b1491d9e4b586d621c54f4c36b888714164b6875f8d6afa3f9072906a51
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
