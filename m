Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF6BD637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54DB61082;
	Tue, 16 Dec 2025 19:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PMjxz92qCPeR; Tue, 16 Dec 2025 19:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAE6661032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914147;
	bh=uRxb1YnZVABPDRqp+VV0rXwIF9nUF2xTtoCCN479yF8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W5uhCKo7gsjbVqjOOJDXJDfHPI/EJ0nGZOxzLBzyR/cYi6TAtNAowKHaxSovABqg3
	 zl83LF3pOu6kij8jwt1Od6Uqeq1yjwffk6NXZQ8RDzBMDUgpaQzMz0IG1za8z+jrE5
	 nLoEF6aX+QJ6X7FHer/fYz697gna8Bdv0xEgZzb8+yksrCkPNjj3o9v3RMvYmw5ejH
	 ydlme1LIurD9MCT3uv/nPIpSlSm00CgDlQlmDbvMgym1PHa+p6dEJF9OPgV/G06m2O
	 v50bqVPTJB6FdKDDtg6z/V+xfpSR89ucMG8KJemlLR/AKBhbJPJDDO2K+s8kHP5ZRR
	 R5Z7PAICpyVsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAE6661032;
	Tue, 16 Dec 2025 19:42:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AECED364
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D2484049E
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgVXJbnzrw0q for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:42:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E65F404A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E65F404A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E65F404A5
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:42:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D5B8A4C459E;
 Tue, 16 Dec 2025 20:41:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-1jBF;
 Tue, 16 Dec 2025 19:41:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:00 +0100
Message-ID: <20251216194119.3020421-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914089;
 bh=FG5KhkVzgqIKB1fylIn3KkdNsJ21vDKhKcYLIrq3/5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HKrcWZKYDwNEtQCDBAW6g67vUakp895jYX+xQaGjXFV7fnHF8N2CkbJk/+LtnQ4S8
 jfBNvEyJ6pd+xwwpogreaGhUliupLfWqeAz5ERxFQMheGA9Wx5WQsMdLDe1Yt00Bdn
 ovyNbwg1IYkPfL44K3md6efLAUJG6G4RIqtGm3yYC39+Tie7EaMCRm9fbEqFqh6KPC
 O6MDO2jgnbq8ebmrv13sq6aSEh12Y26hFAb3/so4OsI9inhaCySHV87raZdRh3/t0u
 O4X7zGS0IUPYw0lN4SHHZ/XzU71is+P42qc4LU/0otxF4Ird57JSG9o6i9XBeU4lTU
 Fi7KzgXAHBhOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HKrcWZKY
Subject: [Buildroot] [PATCH 07/26] package/python-tomli: bump version to
 2.3.0
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

https://github.com/hukkin/tomli/blob/2.3.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index ec30f06db2..560c4cc3f7 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  1e0e2fb2e29f3d77f0507bee71fb4ab4  tomli-2.2.1.tar.gz
-sha256  cd45e1dc79c835ce60f7404ec8119f2eb06d38b1deba146f07ced3bbc44505ff  tomli-2.2.1.tar.gz
+md5  30b640d2f852e26c189cb0edd275f1e4  tomli-2.3.0.tar.gz
+sha256  64be704a875d2a59753d80ee8a533c3fe183e3f06807ff7dc2232938ccb01549  tomli-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index c23ae94758..e4d4a7a62d 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 2.2.1
+PYTHON_TOMLI_VERSION = 2.3.0
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/18/87/302344fed471e44a87289cf4967697d07e532f2421fdaf868a303cbae4ff
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/52/ed/3f73f72945444548f33eba9a87fc7a6e969915e7b1acc8260b30e1f76a2f
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
 PYTHON_TOMLI_SETUP_TYPE = flit
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
