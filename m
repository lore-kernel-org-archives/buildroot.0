Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D89D3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0944F40319;
	Tue,  9 Dec 2025 19:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S73WR0J4OrTM; Tue,  9 Dec 2025 19:46:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D47264059E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309561;
	bh=oV4/5+POt9pF7gNAxHF0s5eoN0cobHS4d4QIEhSjKwI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BuwWlK1o/BsCMkrGCiFWSGCmuH9fgnc//apmVRhJKlIs9+COU++UmgsLRWEv+pS6p
	 BMVR4rZ/dFHeNej8SRxWLhFJ8hqgZ8CqZqudP5ab8aDkTNRQx6tZQywlyAL9TVQsFP
	 8TABuwSryEDYhe8InXq0ZZKEKLNMQnplHdpW/Jz9Lj5UqzhKhjS5pw6uKd761MPbom
	 k8TqnkvhuKNTs3hse2sqHEk7wrSKDh6/QPiMh/AxkOBZSD0YlXGW++T2i2Yx8N/zkL
	 UXvGGaVVvun2m/JZ7cgFTmBeakPAe2oVPktZPCVKVfv4YpNAnQ7r6QAA0AXzn/5q2N
	 rFZtoumo2GrCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D47264059E;
	Tue,  9 Dec 2025 19:46:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 042E92C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA65384759
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJxOT-Gjg8T9 for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF1A6845B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1A6845B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF1A6845B6
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:45:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2EC63A4C2D46;
 Tue,  9 Dec 2025 20:40:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yw-000000006DN-0f2Z;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:51 +0100
Message-ID: <20251209193951.1000100-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309219;
 bh=oCa2CfCwNUJ2+Tw3kSXltfEolGr8J+rLUZrfoF1LUlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bcRo0KehbrbZ8ATR4MwvJtHDuEFtpa+g3MhqbXoz5f9RMVdF/KynEKqNUozaLymK/
 vSEs/w5cyGS1kJdIR+FBqn3TdopLOvEmfq5bVRBNmEOsTEmEFQLMKlQXLQHxHJsiXT
 CILByctiZWij5HzgmHbqiAd+d7X5MO611dOsqUenxlSqYMcpuzreNZ9B1YM6r+RnC/
 0y8zVagwhSeZLR/ZwMn/ASPxAuy9tLX0W537lHqTdY3VZVHcXlEWm0NJ2o1tmbZN0Z
 zMo+2BKp6HvFjgIu7Nxa9m2LF3PBy9lRgu9ijDkBiY9E9Sszy8VBFnXxwdY79zM3cg
 qTsQbwwRnmBlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bcRo0Keh
Subject: [Buildroot] [PATCH/next 31/31] package/python-rpds-py: bump version
 to 0.30.0
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

Release notes: https://github.com/crate-py/rpds/releases

Fixes build with python 3.14.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-rpds-py/python-rpds-py.hash | 2 +-
 package/python-rpds-py/python-rpds-py.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
index 6e1d0860a4..9c72c1e7ab 100644
--- a/package/python-rpds-py/python-rpds-py.hash
+++ b/package/python-rpds-py/python-rpds-py.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  08c2362d2d127e27a7c0a501c917b6d404edac93fdd4b6ccf46ea9448b04fe5e  python-rpds-py-0.22.3-cargo4.tar.gz
+sha256  9f8d17fa01176f0f0f5b20675d4c1759f9f8b02d667ae085bd70236b3681ae4f  python-rpds-py-0.30.0-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index b539453d37..12ff7e1fb9 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RPDS_PY_VERSION = 0.22.3
+PYTHON_RPDS_PY_VERSION = 0.30.0
 PYTHON_RPDS_PY_SOURCE_PYPI = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
-PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/01/80/cce854d0921ff2f0a9fa831ba3ad3c65cee3a46711addf39a2af52df2cfd
+PYTHON_RPDS_PY_SITE_PYPI = https://files.pythonhosted.org/packages/20/af/3f2f423103f1113b36230496629986e0ef7e199d2aa8392452b484b38ced
 PYTHON_RPDS_PY_SITE = $(PYTHON_RPDS_PY_SITE_PYPI)/$(PYTHON_RPDS_PY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_RPDS_PY_SETUP_TYPE = maturin
 PYTHON_RPDS_PY_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
