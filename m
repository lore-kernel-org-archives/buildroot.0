Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0BFD5AE41
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 053BF60DBB;
	Sat, 13 Dec 2025 14:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YCRrVcr1Twq; Sat, 13 Dec 2025 14:07:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 503EC60862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765634868;
	bh=Qe5pMqB3w2oOfO/YtF7mej28+t7mYM96Uzxsdit618g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MzPqnLNx7FMfEclQrRbsv1r/Vkkxrqpd5t/AOiCulQvb3/muLYZ52YlfB5pfohQ6H
	 CLU8yKmQIepw0Yv3SYkXuLulsaom1eFpOE0P8EB98Wwlng+vXbmSFQI4wvURHEmFfM
	 6AKNFjT4gkhhseTAdXLVIkTz04GKEIfPf/EIw7tEhGmdFbVkoYETD9h/4U6vbfG39f
	 KEvdNa+bWh0WNXVmatl7po6V+Ig4HZAdRLqTv5r9NIsp/2lGVC5fXQxJ8vyVn8nFQ9
	 4gls546Rp5CJJp8Wv9yd2bVy1vktT199P+gVMnv9rsrGbF0pH9yM20nPHMRTppLUiy
	 vAj4YYBZ4tP4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 503EC60862;
	Sat, 13 Dec 2025 14:07:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E6A1F2C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8AB581491
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HwLmhsNzpiG for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:07:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0AB5831FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0AB5831FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0AB5831FB
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:07:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DBC47A4C4087;
 Sat, 13 Dec 2025 15:05:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQFP-000000004dt-12lT;
 Sat, 13 Dec 2025 14:05:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:05:22 +0100
Message-ID: <20251213140522.1322763-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765634729;
 bh=sVRxVRZ8YxnbIMxVL7QLqX81L565Nzzw7s8M0nkGnxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=u2VhNrDVXHyR2YRu7XsCIouXpDABDR7LMfOn43Z85cVFReEP79AqyRBwigZHtjxDo
 6iTFy09LhqZv4bTzQENJswc3pv7NPIuWzw97536Fk1kN35eOFe95L42QonvnxJieqo
 4NlWvDKk2v7OFhvG6EEOFyx3FQl/rwj6xyOAaJaTDhbJPjC+xmKP5r228WRA+Azccb
 ObygB/E1ZZG/+wLsU8+8uJOOwXZv02VHEYGIX5GTubLPzhKtsPcvnUNI8XpKpeYw17
 LkHtyHLpEZHPlyoxejNIobruAymsGwkZm4csHu+/PCaGuASFf9/ubyqTtnPO7nYo1D
 e/KIBgKJNMfVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=u2VhNrDV
Subject: [Buildroot] [PATCH 14/14] package/python-pip: bumpp version to 25.3
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
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pypa/pip/blob/25.3/NEWS.rst
"Building pip itself from source now uses flit-core instead of
 setuptools."

Switched build system to flit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index ad70f0da7b..24d731d9e8 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  6d109857fa69274dacfc1d6528471eb5  pip-25.2.tar.gz
-sha256  578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2  pip-25.2.tar.gz
+md5  31f52f428372020b80cd7518862fbbee  pip-25.3.tar.gz
+sha256  8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b9a77f25d95f343  pip-25.3.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 02d7da6fe9..95bdb64963 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 25.2
+PYTHON_PIP_VERSION = 25.3
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/20/16/650289cd3f43d5a2fadfd98c68bd1e1e7f2550a1a5326768cddfbcedb2c5
-PYTHON_PIP_SETUP_TYPE = setuptools
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fe/6e/74a3f0179a4a73a53d66ce57fdb4de0080a8baa1de0063de206d6167acc2
+PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
 PYTHON_PIP_CPE_ID_VENDOR = pypa
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
