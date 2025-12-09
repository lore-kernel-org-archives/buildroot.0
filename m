Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBE4D3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49FBC80AFE;
	Tue,  9 Dec 2025 19:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVsiDr7TceiV; Tue,  9 Dec 2025 19:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A3C280AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309465;
	bh=j/x2Pf6y5FMLW0ZRiQLVlMNSIhj3JqtjSEH9YZ2BFBA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jDP1EN5aiUJ+P1V4NHNNowKZJPzpjNRqh/LkFKnKUDhYz9ex8ubpBX41KYlnSNUEZ
	 AyKE6v4etcVVsRqbFw5+OmxagbKKEINTig+L6yAP1Ju0L+0QGFHWEIlZLt8Dif/I0y
	 LTWZtYsOHZylyjk132c5/tx/SSktzSZCXPEYwVVeaodt5ISK9a2VT3gJqSFUkjuora
	 8ho1MzS9nsLmLbzrU3pTcCsdyq4JlChSdJE8Fc2IO/nq0pFzQCCDH7eMDZRpGmWcwy
	 QTxSexhrRBlOzqH5Ep81ZMrK4pqZP1ZGszdKJZj1R+Jr3z7EJVOkbAywJLAZTc/6Nn
	 2CxIvD59OxFOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A3C280AD5;
	Tue,  9 Dec 2025 19:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1262C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90E1E40A8F
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wYstoAonbF0 for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:44:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88F514053A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88F514053A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88F514053A
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4DAA8A4C2CF3;
 Tue,  9 Dec 2025 20:40:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-2akY;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:43 +0100
Message-ID: <20251209193951.1000100-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309217;
 bh=d9JB/JapWnBoQRLRUWv3c6qGuZU1/Q+gb/3f3pMbeiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DlsMcEOS6lOaicGNpQK8ZnIrdfi28BqSkFr8wnZS/IVdznF1L26aD5B4rbhmlPo7P
 EpjD0Y7LV0wt8UtuKxxe/Jl1IVGlv+UfMcaEeECswDThhbUDcgy/FDKtrxTs7AqLyy
 g0Oiort3/nTT5Z4EF6tzI5NySvdhEVV7HVtTlhm5FoH5y4Vu4tOZk2uVf9GO8ruGL8
 1PF3eHFP9nMgpop8GDhZq+p4mb+8skZCmyCCJeJhc2n74jaNZq5Y4UniugqYL1SJNZ
 XoRdT3husfFHg+XQxkkA1Mvmmj/lBRTTS6XcxvvrT9+iy8UL9YSfAKywg1C+LYGvuu
 OW268v5Goy/KQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DlsMcEOS
Subject: [Buildroot] [PATCH/next 23/31] package/python-botocore: bump
 version to 1.42.5
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

https://github.com/boto/botocore/blob/1.42.5/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 2a4b75c67a..8f2792c829 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  26ac199c10a225d078ad4faf97398812  botocore-1.40.50.tar.gz
-sha256  1d3d5b5759c9cb30202cd5ad231ec8afb1abe5be0c088a1707195c2cbae0e742  botocore-1.40.50.tar.gz
+md5  ed7c48a9f7b0b422b71e6507ab14f957  botocore-1.42.5.tar.gz
+sha256  37bfc487f14286d9795920807fcb8318b940835b18fff6bec5253449f377136f  botocore-1.42.5.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index b81bca5ad8..c3770b4833 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.40.50
+PYTHON_BOTOCORE_VERSION = 1.42.5
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/5b/66/21d9ac0d37e5c4e55171466351cfc77404d8d664ccc17d4add6dba1dee99
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/8c/46/5b40b1deb780869ca9f0c1de47062a78a0494b53d6f9d6bad10fc38eef9d
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
