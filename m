Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21934E67A95
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 08:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C662683BCC;
	Tue,  3 Mar 2026 08:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2WDcRjniCP-J; Tue,  3 Mar 2026 08:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41C8183BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772527063;
	bh=66NgbGykyObsCe/whbf47Z2baVOzpBg6Jn+1frbxpBA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=H7IWiRT065oc5NSuk7YyRvc3WVqbQuhy+bYmNa+gDX/nOvs00EsDTAcSdp4SCFCA+
	 tPbic9jSo8/OmTHhY/VBMM/LGPzlTzn8rVLR4WW4bVGEge/hjKN+B6pQhSiEYI+VXY
	 smpiNi8WZPrSRIWRDxpnvTsIAGjHov7267tSsZ62dQA1QOW1qCmbW0HQrBd6o7TB7D
	 BErJ21TrinCDggXxQpjhLUjzoy//3BbWpMwKWM1va29kIp1K9G42+gzL2dW0oZfbtM
	 t3L53Mh2CB+Ub6OvH+LMTtr92QqCXm+VKASTJhCOIm2n1DEDOIgBhQonn2y+SeN7Xa
	 hX9GbDu0jcBAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41C8183BD6;
	Tue,  3 Mar 2026 08:37:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E85D11EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA27F610CF
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xB4CKulcKWKH for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 08:37:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0718860823
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0718860823
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0718860823
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:37:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 63B171814B9; Tue,  3 Mar 2026 09:37:36 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 09:36:50 +0100
Message-ID: <20260303083702.2275652-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1772527057; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=gscHknl7ENInYVcheXI7dpBNRzZbSMC087NDQGkA2LU=;
 b=UhM1X/5wPJpqv6D905GkUh2MLrNvLhQI46rU1A4Tck157LznlajYMhibnDhRovqWQwFzXV
 MgoR/eoiP8OrrYwQYbhD3ThkbfxJ4FAub9/pPUcjN2T8a7XEUnvfI9olX7zSiI+nUQTW/S
 XMGcWKww47XWeDM3INq8SVFEHa4W+jw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=UhM1X/5w
Subject: [Buildroot] [PATCH] package/{python-}protobuf: bump to version 34.0
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
