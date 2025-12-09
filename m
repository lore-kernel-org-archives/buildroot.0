Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73038D3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33F0B40737;
	Tue,  9 Dec 2025 19:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6Kqc-y3xvfV; Tue,  9 Dec 2025 19:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B2544024E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309414;
	bh=/dgco2TKsm2eBiYA5uvni6wPFG9AIE3GNnkR7n8eCtQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=stCudCQZ1mxLIt0dFGfpDhpMx54FENmecmpRynrf5ihHQyJrLSg3C076rf09SwGhA
	 5Zt8pVOc2aridm9n/cVwzmDgbSs9yJ3Wv/yV02KxzeRfov26/Fid8fuz4B6H3AhH00
	 dD7lXPm40ilc5XE5sLMsHaaU8XGRfR0x9d7/80F8Oh7BO/dLl7tHBMkjJfnpummA8q
	 i4f79iWcHBloMbL7Edy0MHzRRgNZ6r2X5NdeDQQKar3BiXWNzZ+/8ocLF38WRqonps
	 y+auWgtdB5ceAoUXYb1YsBYra50BG5qh5jlhm25UeavZwGcPicdtj25DCv5pkfLBEr
	 qviIbmURBBHHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2544024E;
	Tue,  9 Dec 2025 19:43:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BE222C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5256C40967
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOK7fwjmSyjo for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:43:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DD2B40377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DD2B40377
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DD2B40377
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A3E5A4C2CB2;
 Tue,  9 Dec 2025 20:40:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-1TIB;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:39 +0100
Message-ID: <20251209193951.1000100-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309216;
 bh=pjBqwdLpJAHPEqPywG22F0yYAZIJh96aUjU2WRJ0HjM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CyNZgp9GptbEenkIbtg6V0mwyS93zdTq+a7FnYErkWC6MXhlLPhY1bdmRLwmH4qlM
 K5HtiyLE3imdfclG84nt1Q6B5MYMlmDY4JViwpwZofNbmLglvlPi0Uh3w/ABy7/pgo
 zqUSAjApSC21Cwx1SvJ981CYM6Meh5yYS/N3sHXpvX6j6Wu134bWrcASYUFQwehF6c
 oYKExdVeFWx1FL8nlJa3j1UHoM5EfLIIAdRgb44Kf31qlgVxLtMZzpBPtd/HOyQCbX
 1SvQdHV3zWviY4cTlpNxR/eNJiZn1tzVuFzfAgnxfj8tQy+6jDj6tHg1vkD90Aolom
 +uHSMux2fcPEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CyNZgp9G
Subject: [Buildroot] [PATCH/next 19/31] package/python-beniget: bump version
 to 0.5.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/serge-sans-paille/beniget/commits/0.5.0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-beniget/python-beniget.hash | 6 +++---
 package/python-beniget/python-beniget.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-beniget/python-beniget.hash b/package/python-beniget/python-beniget.hash
index 20f5d4ca6c..0da4ed7c1b 100644
--- a/package/python-beniget/python-beniget.hash
+++ b/package/python-beniget/python-beniget.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beniget/json
-md5  f49610696dd4682006f63e6cf4b7ddc8  beniget-0.4.2.post1.tar.gz
-sha256  a0258537e65e7e14ec33a86802f865a667f949bb6c73646d55e42f7c45a052ae  beniget-0.4.2.post1.tar.gz
+md5  5bebc60d33a1b7daa4b3b27d3d1e50ed  beniget-0.5.0.tar.gz
+sha256  e7af11fa8ec7de3d3eb3d98b1e722d15d44017d8b35d8aa11d54f6719b312f22  beniget-0.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  64ad3e304e9d2d8731c26ac3e652335a6016e38be2f71fe30350be51c6d500b0  LICENSE
+sha256  e0b021e890014fff3f0eca73233f1317ca940ba56f085a644665771361ce4b9f  LICENSE
diff --git a/package/python-beniget/python-beniget.mk b/package/python-beniget/python-beniget.mk
index 53c5d70b5a..33d7c03401 100644
--- a/package/python-beniget/python-beniget.mk
+++ b/package/python-beniget/python-beniget.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BENIGET_VERSION = 0.4.2.post1
+PYTHON_BENIGET_VERSION = 0.5.0
 PYTHON_BENIGET_SOURCE = beniget-$(PYTHON_BENIGET_VERSION).tar.gz
-PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/2e/27/5bb01af8f2860d431b98d0721b96ff2cea979106cae3f2d093ec74f6400c
+PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/31/a9/cf7c2317da1f5034fdebe84555e14a474b3297ef2d03ad148ff02fef2e3a
 PYTHON_BENIGET_SETUP_TYPE = setuptools
 PYTHON_BENIGET_LICENSE = BSD-3-Clause
 PYTHON_BENIGET_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
