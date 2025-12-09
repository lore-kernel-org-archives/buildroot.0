Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87B0D3B98A
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7199A409E4;
	Tue,  9 Dec 2025 19:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LgTl-5PUL_LY; Tue,  9 Dec 2025 19:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F64409E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309220;
	bh=hlAksiIXWjXCCT/PkQ+m/VP4EcK2Nk+eWkz4R69F9yY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZKS1wgg861jez/mXxVK8SIXamngWYOpDRHGcwAaR/sbx0cK1yWjmQvgGwr2KDYLxW
	 YW7/67mqlkRiYCKXzxHldyMdmheCFG4SEkhmOyLi3wytiPA/UFmDi7rHuK6AnlfVTt
	 tfvs7KTIRfjdm9AXhqJ1MX4EuMh2GnU3iyaihnRRWMcGKEEE1OC5w6gE3Ov0Cg5SZX
	 Z6FZ+dXA7JBopvMIt+VlH5C0HVg3zTCaHBihSFCFfjomjw8qv+S5cI1Ote+vkIqzA4
	 JpEjp1uXPeNhU/5aNOEEjPLKivijlkHhOP8DlQrQKnjOou4f3pUa8ZXVIGf46LuqX+
	 g8iSVvGTcuHbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F64409E5;
	Tue,  9 Dec 2025 19:40:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6F2D2C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D7F2409BB
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASofdCysktk5 for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:40:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7ABC740967
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ABC740967
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7ABC740967
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:40:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55D8DA4C2C0B;
 Tue,  9 Dec 2025 20:39:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-0tfM;
 Tue, 09 Dec 2025 19:39:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:23 +0100
Message-ID: <20251209193951.1000100-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309192;
 bh=I1WoadZt8np4Cy3Dn0n0bo5XCLf8e1Ww1XvNTQub2lc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZPHsgjJ6zIgZ2e5bCC9dHmGW9nT6BxKnWMHK18pDxDUAUXRgrE6LgydvIQyN8pYe3
 ALCSFV59JbbM2LKJn/ktcFtyfxHdl4Hf9phcay183w7aUHho0UVP0UA5SggN7ZtRYf
 aPYS3fNfk4S1zQnAEso3NMpdjAc4YMi2tGxw1C7XZJbWat/EjjQUZ2nf1dXme9sAt2
 VJ5NEIKNKA6QQWyxn9oM+v6v9Ldhcv/InmPu8jmkW/M6ZBTrcS4bXLLAVW0PWHtAlx
 OxdtipzZUJ0x7WDET4l6SHmIP9I5g/Ehre99WnpxjNbSY2oFIAsCKjT6ys6V0CRVRy
 BHZV17SVCleVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZPHsgjJ6
Subject: [Buildroot] [PATCH/next 03/31] package/python-aiodns: bump version
 to 3.6.0
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

https://github.com/aio-libs/aiodns/releases/tag/v3.6.0

Updated URL in help text.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-aiodns/Config.in          | 2 +-
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiodns/Config.in b/package/python-aiodns/Config.in
index 63c2429390..dd6ec84640 100644
--- a/package/python-aiodns/Config.in
+++ b/package/python-aiodns/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_AIODNS
 	help
 	  Simple DNS resolver for asyncio.
 
-	  http://github.com/saghul/aiodns
+	  https://github.com/saghul/aiodns
diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index e0c73c2039..8e3e66d0f1 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5  30623b233a06bd318478e39828a771d2  aiodns-3.5.0.tar.gz
-sha256  11264edbab51896ecf546c18eb0dd56dff0428c6aa6d2cd87e643e07300eb310  aiodns-3.5.0.tar.gz
+md5  dd1c76c0b2897589ae9787530cc0e468  aiodns-3.6.0.tar.gz
+sha256  9b0ef54339e6687cdbd39a7d73d7de2467cb5c115281da28f2598f058633dac8  aiodns-3.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e91cfa76821ab70d22998136d674d20ae888463a7e8a7f377166cfe1ee64feb  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 87aa8830aa..d0a1ed6e1e 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 3.5.0
+PYTHON_AIODNS_VERSION = 3.6.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/17/0a/163e5260cecc12de6abc259d158d9da3b8ec062ab863107dcdb1166cdcef
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/e6/11/238e97cbf5c1c0f725d590a092e0618dcdc50f44dbd1e2a926fae27e6f06
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
