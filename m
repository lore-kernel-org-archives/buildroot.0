Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAB1EB1049
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 10:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70497840A8;
	Tue, 10 Mar 2026 10:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pt3z43DTBE10; Tue, 10 Mar 2026 10:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F25984054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773139506;
	bh=SyKvKT8CHmfIuk3i8CfOr7jZfliM4gs54l0BBib3IMI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=S1l05z7v3AgNDWimlBapnmR2k16hWm+su7ye/Frc5LGNOMo5huiFMNmteAe7DjOD9
	 JT85eEe7ipBFO2b8ie6nWwMmXtty9BasJ/bP2mJ19wfOzHHLfAvua5yIx30mlugrUH
	 7URqvIFJrDenb0H6vX+hv+TXEpNvVL3Gf/ttVOKk5uKBV+QsfQxX6VzqiIVElp5Tw3
	 oIze+isVARK+vAG8ReETfjzRC2LHuftOwQJ4SUvHKfUxWTCRvaAGDgdj1isvtgDiiq
	 0mGGUFoPgBdau7uARHiHsCh9zvGylBlMgh2FxNzSzU3JOTWsbDTtVnmVYUgwxw9OeF
	 qrw8cXt4/zwxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F25984054;
	Tue, 10 Mar 2026 10:45:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C31335C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D9BC84089
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1_s3dh6asCY for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 10:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A6EA8404F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A6EA8404F
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A6EA8404F
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 10:45:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1672A1814B9; Tue, 10 Mar 2026 11:44:58 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 11:43:41 +0100
Message-ID: <20260310104354.2488409-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1773139498; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=aZrt6/id5Gc4+h+uO1Ww90Qyh6cEqxN+UQFAaVtGMW0=;
 b=abe2woCQeX49CYMjSeiwzBM08h0iAySZ3LwutQ63Dn6REdo3GoYHAMnErWFhRN4FI1gzQi
 8EQYJWp7An0ewPBD5to1hA77iJf5xYrNcwh1npatH2I8EsDLSyeo2ra+VygWV6egJhu7hS
 jKCD9qwyg2Ukk6J8ktH56ryXbSlkqh4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=abe2woCQ
Subject: [Buildroot] [PATCH v2 1/2] package/{python-}protobuf: bump to
 version 34.0
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

- contains breaking changes, hence python major version is bumped to 7.

Changelog:
https://github.com/protocolbuffers/protobuf/releases/tag/v34.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---
V2: 
 - no changes in this commit
 - series now contains fix for protobuf-c for protobuf v34.0

---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 7211fa7c87..fe1084b640 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  c6c7c27fadc19d40ab2eaa23ff35debfe01f6494a8345559b9bb285ce4144dd1  protobuf-33.5.tar.gz
+sha256  e540aae70d3b4f758846588768c9e39090fab880bc3233a1f42a8ab8d3781efd  protobuf-34.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index b2046e057b..1d110fdbf0 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 33.5
+PROTOBUF_VERSION = 34.0
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 1141edf396..1d84f02292 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  5d9230257cd63f6f94ca3a7303b22413  protobuf-6.33.5.tar.gz
-sha256  6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c  protobuf-6.33.5.tar.gz
+md5  f8ad7dac46884ad2ac3929eecfcafb0a  protobuf-7.34.0.tar.gz
+sha256  3871a3df67c710aaf7bb8d214cc997342e63ceebd940c8c7fc65c9b3d697591a  protobuf-7.34.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 167b94a646..84a6c3a8a6 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
-PYTHON_PROTOBUF_SOURCE = protobuf-6.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/ba/25/7c72c307aafc96fa87062aa6291d9f7c94836e43214d43722e86037aac02
+PYTHON_PROTOBUF_SOURCE = protobuf-7.$(PYTHON_PROTOBUF_VERSION).tar.gz
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/f2/00/04a2ab36b70a52d0356852979e08b44edde0435f2115dc66e25f2100f3ab
 
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
