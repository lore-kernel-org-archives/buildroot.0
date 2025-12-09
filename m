Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B722FD3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F21B8446A;
	Tue,  9 Dec 2025 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 45gBZEUo-XPe; Tue,  9 Dec 2025 19:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B55AC844C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309548;
	bh=nPch/zKoA3mJIgC8zOuFe0LfOL83oygwic9fU1LnrMc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Bn6cEyaGZu9PeifAHhuE/VhbeMDWVtpZdU9FNHUsvdKV8RKsUNmo777e7FmJ+qP5b
	 8xFTgvT7hG2vDmF4Q/c7swSvqxQCxk57Dm2VCwnzFULFEIDaMX6vwBeWZzueiNC9Cz
	 1yJtxZ4ifjyIiok/xaojDpM4UA+cuNmRUf4oN2M0TLhcg1ZP1p699oeHJFCj4qMzyY
	 9XNcz7uOW46cBH8PtGqaKN7JF/5wDp0SxpeKRG5k7g88uoGWVUtJYpx2i/6wW2AMW/
	 vWvcfGiaDOY7qAv6rbr7Jadty9xvgfdALjR8xWmVIk3Jo8oy8uSfFR5O7eVod6rjlk
	 NilKav0Ovke9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B55AC844C1;
	Tue,  9 Dec 2025 19:45:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3680E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 955C261386
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7FkjOzq1Qgy for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85C3960A35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85C3960A35
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85C3960A35
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DDEA0A4C2D44;
 Tue,  9 Dec 2025 20:40:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yw-000000006DN-0Nly;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:50 +0100
Message-ID: <20251209193951.1000100-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309218;
 bh=P7HdPz1a5wOHMKqgp4QCr7gQ9wTiKtuqtHuUTE55uPY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CXDCmEhjr0Q5V9DskZFL/ssdzn9NdVgFqRTrBs2iXDHqryiG7EGIePGiLYsMXSx0O
 T1w/GcXvVw0DApfLx/ESwSui67YVBSAuN9uEzZISFVom4gZU3stggryVgeNdUm11/c
 CcYiZRfwrez/67ByXd/8SbZvl6sCuhNhZ0m0Y5sdd4FhXGGyyEJXuwzak0y/whXh7+
 sYj1hZ9BrhBYBwYFroEGrQuhSwJ5AoZc6tvSofvy6JYuO2NOGHci5FfIMZjroWxCTu
 QLz6P/aIRGD38M1NqgdmwZFuYApZL9F+dQiAsxXnkg97tmJnOIq/n4mb/QKGOCfscC
 xkOg4hebdjYwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CXDCmEhj
Subject: [Buildroot] [PATCH/next 30/31] package/python-orjson: bump version
 to 3.11.5
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

Changelog: https://github.com/ijl/orjson/blob/3.11.5/CHANGELOG.md

Fixes build with python 3.14.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 54594749fe..f55aab62ef 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  b4a77b2489f8ffe81f9b1037f1c17fd6bf89291b82888f176dbeac00e9cdc0f9  python-orjson-3.10.15-cargo4.tar.gz
+sha256  ab71a5f3d6efb4a3dd0cacad24e62d774907be42ba2e01be8a3ddeecf46d078b  python-orjson-3.11.5-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 29325e2f67..9b5016c9e4 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.10.15
+PYTHON_ORJSON_VERSION = 3.11.5
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/ae/f9/5dea21763eeff8c1590076918a446ea3d6140743e0e36f58f369928ed0f4
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/04/b8/333fdb27840f3bf04022d21b654a35f58e15407183aeb16f3b41aa053446
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
