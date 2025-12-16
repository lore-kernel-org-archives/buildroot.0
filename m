Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D111D637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160CE40439;
	Tue, 16 Dec 2025 19:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRnHY2EsOvCJ; Tue, 16 Dec 2025 19:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 379B540420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914350;
	bh=J/Z6i8B+OoxnX982822NhZpF81aHsrcfRrc2356P8Bs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YzQmcO64SQandkOj5XSTlGk+z5kRvUeA4v3+8txHHuEBmp+6Iq5DEcy67LHPFXp1n
	 ZDSgS2/WghzW7hCuVGLv1AKAUTTiPrby2SbgmSBLVYWX6OWHfz5oflOdTEy0ytkJ4j
	 tz5iMj/nqGgxvroi4AlCvcjwTJSHWhuMqahNphIPDnAEQIWiCyf6XUJfs2fbvMbPaG
	 Yl/FrWWxEZHJWqnCzaTky0FAViXzWt+kI5u1NOK6XgxAxjZqXU+zqdJVY6oCfHUZn2
	 n3cmGwF4AZ6R2DtyYxh3lwlqxeaTvGdU2ezqTsAY/eR6QysvLFMnJnbHgrAStRSXci
	 BXrZ8dkI642CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 379B540420;
	Tue, 16 Dec 2025 19:45:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8E58364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAE6560681
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzGk6Gc0PdaN for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:45:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B981460621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B981460621
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B981460621
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33858A4C45F4;
 Tue, 16 Dec 2025 20:41:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-2VAq;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:16 +0100
Message-ID: <20251216194119.3020421-23-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914092;
 bh=UNxB742Y7A+lR05/aXw3AbmkAEEoeq9vzD5eMMpcFLQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UoyKqNgEPsatqCDvgJiiXWxnoflcyI/CqTJRtNLpiinVowB2EXGSqGsnF/UuTW8SQ
 BhGCYb0nfja2TREw7GmtjfupahBxjQlot2qx7XSD4MsCc/zJ9OzfSaKKjzNm3eFSWs
 MNa70U/d0no28uIBibX5c4iz6PlNOdP6NuMu+4mrr+mweUgDNBd+l8jnPuToEu2PWZ
 M7DK//HqNcP6GJjw2fyU9zEvDCRKCYs3161oOxQJUuR+/LWrq9WF0XUUKpniW2b+/O
 ewVXc/SAGNj7B/5+MxK5pT5fnJoeRViVnZJYMXd8qrxA32JKda+NsjhG3WjP7py6HI
 KGH9Cs5ue9gdQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UoyKqNgE
Subject: [Buildroot] [PATCH 23/26] package/python-yarl: bump version to
 1.22.0
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

https://github.com/aio-libs/yarl/blob/v1.22.0/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 43ba31f81f..62b78010f1 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  23352fbc2b165825d4a33682c91788bc  yarl-1.20.1.tar.gz
-sha256  d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac  yarl-1.20.1.tar.gz
+md5  21bde2ca6df9bfc66b1810461e0ded05  yarl-1.22.0.tar.gz
+sha256  bebf8557577d4401ba8bd9ff33906f1376c877aa78d1fe216ad01b4d6745af71  yarl-1.22.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 4f25394c8b..dea4e34739 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.20.1
+PYTHON_YARL_VERSION = 1.22.0
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/3c/fb/efaa23fa4e45537b827620f04cf8f3cd658b76642205162e072703a5b963
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/57/63/0c6ebca57330cd313f6102b16dd57ffaf3ec4c83403dcb45dbd15c6f3ea1
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
