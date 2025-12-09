Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4756DD3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E6784754;
	Tue,  9 Dec 2025 19:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUa33SpJUzaQ; Tue,  9 Dec 2025 19:43:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69B89843F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309390;
	bh=t+nh2Ur8+miCoHV/NlzDn4erPn8XMVFDs8CNA2fBVPA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hAHPHL5CA5h0nSsryIWidBkgPH+myapPKAw33iEy6636Xx6wza5yWNIa71EEV7JwU
	 oHp8GLai7Ed/vB2K5qH9skKIzLNnNs+pPEOtU0ty2LTf4zohRB2iAeYSJjJ2schzh5
	 sJ6xwGc/Mv2W+wByQ4JmFbcIPWQgv6WxbLv+yLvqYEDGGenhJc6AalWuY4c1fF6WxN
	 qIazam//bUNQFPyaFLDYgTVG4TyTLZIQoz0Fr36//znodTWyme3gmG/mKns5bDHF8S
	 a2c02nU5qTW6yvVb5YCBtmNkx7+Y7w3rFKvwf+jNz9eNFrfjMiUNJxVIE/lpQCw14c
	 ChrsHXeo92rcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69B89843F5;
	Tue,  9 Dec 2025 19:43:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 483AEE7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A257608D0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuqrsI2M1IxZ for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6B54605A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6B54605A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6B54605A9
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:43:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5B47A4C2CAC;
 Tue,  9 Dec 2025 20:40:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-0tin;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:37 +0100
Message-ID: <20251209193951.1000100-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309215;
 bh=/uB8SnTv2zkpLlvKnwcV3K8aFgocFz2z6aP7kV1G7eQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gL7vCL9bv++fGIKAT4KmFHOAWQBTYLmy+UgxCTtEeltW8DKtW3XQCYInAQ4qGermF
 USlAoDH4+vZCLYwwYnjJXieWxgSs+k7PsivP4XCHAYdiWLh/5Y4dxcz1oSNRxAhh5R
 drqGrviJ0L2wES3Bb+yK7DzxW0YzxnoRjrXmZyUOvGA5E1Nq/u1Uky+8JeoGigG4sD
 QWyd8gFX8QeVve3Pf9Y7X6Qv/BRXxWVMTU88o/yfmBvzgN9AQnoSmkxQBjK0dcArD3
 ZNHkgJNr3hBFnFCAbuwDcKbi99NbfpvfLWBn4pdo31XGT3esnBwZT+K7kA5+HbXQGN
 RhUMHntz3z0Zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gL7vCL9b
Subject: [Buildroot] [PATCH/next 17/31] package/python-bcrypt: bump version
 to 5.0.0
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

Changelog: https://github.com/pyca/bcrypt/blob/5.0.0/README.rst

Fixes build with python 3.14.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-bcrypt/python-bcrypt.hash | 2 +-
 package/python-bcrypt/python-bcrypt.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-bcrypt/python-bcrypt.hash b/package/python-bcrypt/python-bcrypt.hash
index 029baab0ea..a30e716df0 100644
--- a/package/python-bcrypt/python-bcrypt.hash
+++ b/package/python-bcrypt/python-bcrypt.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  f33b38de3883c173e1eb9426c99aca1379708ef5feac46bf749f4d36ecf9ed98  python-bcrypt-4.2.1-cargo4.tar.gz
+sha256  c209e01bb77628213eecb2152cf143c95e4147e3ef54aada6cf69803fafdc67d  python-bcrypt-5.0.0-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  8173d5c29b4f956d532781d2b86e4e30f83e6b7878dce18c919451d6ba707c90  LICENSE
diff --git a/package/python-bcrypt/python-bcrypt.mk b/package/python-bcrypt/python-bcrypt.mk
index cbbc7bcecf..436312d0ad 100644
--- a/package/python-bcrypt/python-bcrypt.mk
+++ b/package/python-bcrypt/python-bcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BCRYPT_VERSION = 4.2.1
+PYTHON_BCRYPT_VERSION = 5.0.0
 PYTHON_BCRYPT_SOURCE_PYPI = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
-PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/56/8c/dd696962612e4cd83c40a9e6b3db77bfe65a830f4b9af44098708584686c
+PYTHON_BCRYPT_SITE_PYPI = https://files.pythonhosted.org/packages/d4/36/3329e2518d70ad8e2e5817d5a4cac6bba05a47767ec416c7d020a965f408
 PYTHON_BCRYPT_SITE = $(PYTHON_BCRYPT_SITE_PYPI)/$(PYTHON_BCRYPT_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
 PYTHON_BCRYPT_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
