Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03172D5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD24C40AF4;
	Mon, 15 Dec 2025 19:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PgE5HcjpJMS; Mon, 15 Dec 2025 19:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 018D840B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826383;
	bh=RMLXHnYscAxYyutHYqdkY4JxX0wyrHrLtwmDTD78PpE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mOcKazMS1zwQQmLVdSne2eW9JvJvVp4NVbUuGnK9l8p5OuUqOA/8hm8cxSsF41w24
	 gykq2oQSrfrnOYO3dtdsmLVkf105LL/B4gdugkwrJq2DByIKzrVaRjUr1/92Nn5Gfh
	 jHl6GwwIArHXEgQZiApZf4RNdkeViUzzs6L18dpsgrfGRVZYJTFDFsuwFPT1ewA080
	 hN2OUUaP9+1DnhhV5jSoDdfkUlSEdTEv8UZNtBJZzPRTCyTWYUfG9+ZbIkVZIVM1+f
	 RiONTBp86mrMjlGXfUT2nSOuv20swShyQoyFlRiKyIBC2vrVZMzeNneuCBErN6Q51p
	 ZGVMaeSirteAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018D840B00;
	Mon, 15 Dec 2025 19:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2F62255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C944680870
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UoefMYqbtsP for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:19:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C310B8082A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C310B8082A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C310B8082A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B94FCA4C4375;
 Mon, 15 Dec 2025 20:14:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1S-000000005ED-1d2m;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:16 +0100
Message-ID: <20251215191416.421755-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826071;
 bh=EQH+4RRYoPSvvAR46ys3Z/QutkAnwypWhNPVT9g2YDs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NrjOAcGSxtex6/A/rOpb4pkuBx0LBqXb4KGFxrJ0/sDxXHN+P51/68UVDJOPCLDHV
 Gg6KxJacqIuhwqukSzfIv7++Hk5UItLTh7sZ0e2LgerOIiorR7ERBVZ5qDbELNiBOJ
 ysm4W3YB+VMUST0LVGjIyR12bnAkRiBTuyFxiFN668zY80XsZtUlBi3cVNb/1p28ZA
 70DZsi2MOuWiovdBX9kKEngJCONPeGxNN6l1fJBt//765SY0k/icOo7MDt4mfxi+LD
 I2vXxx1vE4GTOzNgyu5+agYjK59PR0Az5GZb4Qo7iRRbaWLdO9O8DluJxfCi0W1kW1
 c/g3dcFcKvG1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NrjOAcGS
Subject: [Buildroot] [PATCH 27/27] package/python-sentry-sdk: bump version
 to 2.47.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/getsentry/sentry-python/blob/2.47.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index a9aedca54e..3d049e8153 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  1bb1e892b8d7e675cd26c36fd85e105f  sentry_sdk-2.41.0.tar.gz
-sha256  e7af3f4d7f8bac4c56fbaf95adb0d111f061cce58d5df91cfcd4e69782759b10  sentry_sdk-2.41.0.tar.gz
+md5  682375882fdb40251c22250d48036468  sentry_sdk-2.47.0.tar.gz
+sha256  8218891d5e41b4ea8d61d2aed62ed10c80e39d9f2959d6f939efbf056857e050  sentry_sdk-2.47.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2a140d660f462812fa290bc740d04633126c5ec45d84b79b569e127b0eeddd0b  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 3c10723bb2..6714cac6b8 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.41.0
+PYTHON_SENTRY_SDK_VERSION = 2.47.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/68/47/aea50a61d85bc07a34e6e7145aad7bd96c5671a86a32618059bad0cbc73b
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/4a/2a/d225cbf87b6c8ecce5664db7bcecb82c317e448e3b24a2dcdaacb18ca9a7
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
