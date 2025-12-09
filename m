Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CA1D3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6177184396;
	Tue,  9 Dec 2025 19:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BvqlF6iBoFL; Tue,  9 Dec 2025 19:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81D70843A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309244;
	bh=QJg89NeZws8lsPc4bv5JSEVfvcpJFB0xM6AH37rZErM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DnNBs3ccuN0BvjjdjI1A8FLdWRL3hqDz/Pm5qLMm8dRcmn/Rd/rGoodca55Azkfqo
	 WC1ZJtGx55Wa/+/9kR5f1OMTWmj7jwV8z+QnOmQ73OIG9BLedaOgCuWXxJKuxGUnv4
	 x8BdUo4+qbiMgLujeb69gPmdhmzKaoB5O+UxD6Q4kAqijyHo4IOugoZwFHyrkuTQP1
	 YDNXoBkSrFBQHW4EUbSJ8okFrkbEddnDxeRmAuhZzLLpPek3OnvlRjiTrNDY/8jCzX
	 /IPmHgHBExBoD3HqPhldbuGvg2+ysvQs0ivFzve9jUTyu84yyRvSlk+drKtdJz3tcS
	 IzEfO6wSElAlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D70843A0;
	Tue,  9 Dec 2025 19:40:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 694CA2C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F8AC6136A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwbZDkkHQLrJ for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 46B4E612BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46B4E612BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46B4E612BC
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F94BA4C2B9C;
 Tue,  9 Dec 2025 20:40:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-24rJ;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:27 +0100
Message-ID: <20251209193951.1000100-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309213;
 bh=/B6EKe4dVpvqdWIvD834cHNM8vTpZm/8oYrASWPcf8c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=q1G0Qcq/e3OnwyRwoMgPjcluykiEYkuS2mjuQ8vfSRiQRcJ/e4+m4KUMg8nocXLcv
 MwOhot4jKyIaN8VjleW/H2LyHDmc3LO6gq4OnqCCEEiUcbZPZ5khe7qV3dZ7aRH9ti
 K8wNgQ9J7IWSPlhdbPZkns+kFYgRhEZ7Cwj2epJyVOCVasDMPkT1ZauAWMcDFECG/k
 W1Cx7rMuePgllw4M3mh7Hl4juUGWw0bCvZ/5VgxbFbyY0gdoEmNjcuvyrOFwpvjPW2
 53h1Qe569gcZtpEfmFbS6OBsgQIw21KVJDh0gyd9y6qiUKyW0/+Uca54kpHtp+sioD
 yQxQmzbn0vsjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=q1G0Qcq/
Subject: [Buildroot] [PATCH/next 07/31] package/python-apispec: bump version
 to 6.9.0
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

https://github.com/marshmallow-code/apispec/blob/6.9.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index ecf9b56954..45571f4c53 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  aaec05af7368f2e19f562a63f00e2e74  apispec-6.8.1.tar.gz
-sha256  f4916cbb7be156963b18f5929a0e42bd2349135834b680a81b12432bcfaa9a39  apispec-6.8.1.tar.gz
+md5  ccd10389ca94fe9acc7ff542b9bf1fa2  apispec-6.9.0.tar.gz
+sha256  7a38ce7c3eedc7771e6e33295afdd8c4b0acdd9865b483f8cf6cc369c93e8d1e  apispec-6.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index 3b87ccdced..2cc8bc2304 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.8.1
+PYTHON_APISPEC_VERSION = 6.9.0
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/74/38/62499ad75cf085f5268458c09ae97007082ed85aec1a9cd9e38f7685fbb0
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/02/ad/30cd449f3a0cf213dd13d9af7ba869214d8c66d517939964d3f490307e46
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
