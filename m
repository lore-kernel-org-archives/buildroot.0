Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418F6D3B7F3
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 20:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E028784541;
	Tue,  9 Dec 2025 20:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8rkDmj6DFyS; Tue,  9 Dec 2025 20:19:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4AD784546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765311552;
	bh=DoUbZHHSrnloEz+pygzEjCtTOE3CTWGbdbqaUmUhkY8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=YVnjXU6vdRtUQhBhvaWCat9a+ywGyU+LmVbOEiw0YyJAxdSmMMx0mTBWmum6tdoIq
	 fOVjXeiDeNEnqS4QDkUtFWVYk5TZ8uQN+9ya6cSTd/3Wr0PmItGnb9b/THsbXQhogv
	 idRgA5NiLpfcxAK2Y+BHW1ihHLiFfHnR0C5ghRuW98XxDS3nOigWY87d5x92UtzKEz
	 14RCy9k9mw4kPqVPWkcXnAd1Ajtk8YoO7NrwovXcnZzcCniU7WExKDX/e8ayVFlDBZ
	 CrUIH0o0JeDjCG8/XlCup55bw18pWoK/M1mmlD7Seuf5C9EHZ4lZf9jsPcdpj9QK6q
	 J1mEbanWZS9Xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4AD784546;
	Tue,  9 Dec 2025 20:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD48EE7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEAC960A3D
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cAZ0Zki9fcs for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 20:19:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A4A596075A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4A596075A
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4A596075A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 20:19:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C632A1814BB; Tue,  9 Dec 2025 21:19:04 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 21:18:44 +0100
Message-ID: <20251209201851.1023802-3-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209201851.1023802-1-buildroot@heine.tech>
References: <20251209201851.1023802-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1765311545; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=EToOedGdxE0P/+/FZlmsK9l8Ej+/gPhSYXDKAYdPZDM=;
 b=aYGqVPGz8o99oPHsiSF/YAvPwqhrdbYpD+RrogB7T6/cORdurJUo73ZUDV4CBvARYuhHbh
 J69qkS1uCkFezIlY/CPGrG/Iiy6qJuIoRAMzZHzwjEWXMQDnxstocJ0VoDzOkhLWIBErcz
 RVmsyJrj+M0sEtvwY2spO6WGchbiPBg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=aYGqVPGz
Subject: [Buildroot] [PATCH 3/4] package/{|python-}protobuf: bump to version
 33.2
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

- set BUILD_LIBUPB=ON as disabling it is currently broken (see [0])
- python-protobuf increased its major version to 6 due to breaking changes in v30

Changelogs:
v30.0: https://github.com/protocolbuffers/protobuf/releases/tag/v30.0
v31.0: https://github.com/protocolbuffers/protobuf/releases/tag/v31.0
v32.0: https://github.com/protocolbuffers/protobuf/releases/tag/v32.0
v33.0: https://github.com/protocolbuffers/protobuf/releases/tag/v33.0
v33.2: https://github.com/protocolbuffers/protobuf/releases/tag/v33.2

[0] https://github.com/protocolbuffers/protobuf/issues/20538

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 4 ++--
 package/python-protobuf/python-protobuf.hash | 4 ++--
 package/python-protobuf/python-protobuf.mk   | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 98159ad897..db91cf296b 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  008a11cc56f9b96679b4c285fd05f46d317d685be3ab524b2a310be0fbad987e  protobuf-29.3.tar.gz
+sha256  6b6599b54c88d75904b7471f5ca34a725fa0af92e134dd1a32d5b395aa4b4ca8  protobuf-33.2.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 4540443702..deaa31d121 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 29.3
+PROTOBUF_VERSION = 33.2
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
@@ -34,7 +34,7 @@ HOST_PROTOBUF_CONF_OPTS = \
 	-Dprotobuf_ALLOW_CCACHE=ON \
 	-Dprotobuf_BUILD_CONFORMANCE=OFF \
 	-Dprotobuf_BUILD_LIBPROTOC=ON \
-	-Dprotobuf_BUILD_LIBUPB=OFF \
+	-Dprotobuf_BUILD_LIBUPB=ON \
 	-Dprotobuf_BUILD_PROTOBUF_BINARIES=ON \
 	-Dprotobuf_BUILD_PROTOC_BINARIES=ON \
 	-Dprotobuf_BUILD_TESTS=OFF \
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 1e1833980c..fdfbc4b4f1 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/protobuf/json
-md5  26ee22a630b0dbfce4de03adc5600fbc  protobuf-5.29.3.tar.gz
-sha256  5da0f41edaf117bde316404bad1a486cb4ededf8e4a54891296f648e8e076620  protobuf-5.29.3.tar.gz
+md5  59060f8bb01846579e5c8d95917ad925  protobuf-6.33.2.tar.gz
+sha256  56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4  protobuf-6.33.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index 898a133d37..8db9a2f621 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
-PYTHON_PROTOBUF_SOURCE = protobuf-5.$(PYTHON_PROTOBUF_VERSION).tar.gz
-PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/f7/d1/e0a911544ca9993e0f17ce6d3cc0932752356c1b0a834397f28e63479344
+PYTHON_PROTOBUF_SOURCE = protobuf-6.$(PYTHON_PROTOBUF_VERSION).tar.gz
+PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/34/44/e49ecff446afeec9d1a66d6bbf9adc21e3c7cea7803a920ca3773379d4f6
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
