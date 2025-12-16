Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED23BD637A3
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5949240B73;
	Tue, 16 Dec 2025 19:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tr765ZrSixYg; Tue, 16 Dec 2025 19:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52260404A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914194;
	bh=Tghp7czrlUS7GP0IKHhwJjYUV49iSyADelQaUpdDVV0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZTwLJHUypXdRo2dlMx2U8nnmSYbq8hdTJaDcMi0dib6YRoafvxAY8dFknCDyKkA8m
	 foIYP5TLVtkolwUX468Rg8/oqDk5byziUpHW1z4CRn6rk/ZJV0WWzFGgwVO9WJqucP
	 gVqlWkeKgKcl9KSbu6QJNomjLTyqNB+DuUbDT+DOJM4SI9bCEGd9D3hYbCw4XZzGAl
	 pu93S/G/SXG9d6ilH4bgm9OrweTDS88KdlOU9ST8eK9EjumMkDFpVFiMdMHFjDud1R
	 CI0KOJOMXgSbdU0U8HF0Zd/g9Qzk8UkWW7WiCC6I4XnmWK0TUAFOwvW/hEtU2CTQxn
	 FvcpagrnkYahA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52260404A6;
	Tue, 16 Dec 2025 19:43:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BE11372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1217B61018
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3tev5Bxs-tP7 for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EFDEE6103C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFDEE6103C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFDEE6103C
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8058A4C45A8;
 Tue, 16 Dec 2025 20:41:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-2e1a;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:03 +0100
Message-ID: <20251216194119.3020421-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914089;
 bh=mAMXZzhJJ9A0YMd+Zx8OlQtUZXXUQIfItA3LZxvdo7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fbTAYi1HEAWQM3alTFmDLcXzmOVY+kDbsa5mascd61Axh6cc+VfVnicCBKPeINO8R
 In8IfLSaR4w7tjpbyhTt9UynkLcO65JXh6ITypOwQCOyt5Uj00sZ+lBCMTsoL9pgtD
 AUidC1BVcTS1RU9P+gV/pAxwG4BjPFSUNxDUJ1WxyxnN9wzpAUj5oMmofQ4ij3HsnS
 LE0whgIG8Im55VSC2FjIoqSHXa5NSkBHXffTX1LiJS2IjoCFRkJkP2GcOUFvbf3Mva
 dLZVUJRw4yuo1956fMQMgOB0v2RYMdmPDGjR3LJTJD5umVwmaX0qdUYY/Kq6aBi82N
 sSmBGVhll24Zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fbTAYi1H
Subject: [Buildroot] [PATCH 10/26] package/python-trio: bump version to
 0.32.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/python-trio/trio/blob/v0.32.0/docs/source/history.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index 35f582311a..bd722a2367 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  26bb7f0669385e47347e4d8177552653  trio-0.31.0.tar.gz
-sha256  f71d551ccaa79d0cb73017a33ef3264fde8335728eb4c6391451fe5d253a9d5b  trio-0.31.0.tar.gz
+md5  8bc9dbdc265c291c93006f5e0f1d3918  trio-0.32.0.tar.gz
+sha256  150f29ec923bcd51231e1d4c71c7006e65247d68759dd1c19af4ea815a25806b  trio-0.32.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 8d8720be36..73c1ecb461 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.31.0
+PYTHON_TRIO_VERSION = 0.32.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/76/8f/c6e36dd11201e2a565977d8b13f0b027ba4593c1a80bed5185489178e257
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/d8/ce/0041ddd9160aac0031bcf5ab786c7640d795c797e67c438e15cfedf815c8
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
