Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D00DCD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 13:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B52640FE3;
	Tue, 26 May 2026 13:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJMkI4EKL_xo; Tue, 26 May 2026 13:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41ACD40FEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779802120;
	bh=FFN2dtTUcvZNt3Ou/gnXzRnzPKcSwR2iXjNHnOsFiH8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Oq7j/DutgR73P9Wbr3haSE3KOK6AJd2rhCXar9bDDlb3O0+jl6Z0kqadRzhI1aK0e
	 WyQAiAev8UlfFtNKHbsQ+qAF2ylRbVbpHlexlBM3DTnyYaax99q3Sl54azG2h3fEZJ
	 /qN//3f4hWpA7HSsAKMMXb+gVlmE+RhTWbBk2Pu2GooXbfxArtxoji+1/cZSs+p81e
	 8sNyIuzPQW6CtLev2/VYyh59r3zlR1kLlvjInB5xlDOOm85rFK/oBGfIvM0p+P6U1x
	 L3OrjmDwIbsNNBrGQ5Sz2vWhqYXup1YA6gtJEkB7ITsEw1GMPfXloTkGWnm4hgtKrp
	 WeCt/uQqkcDnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41ACD40FEB;
	Tue, 26 May 2026 13:28:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 728DF265
 for <buildroot@buildroot.org>; Tue, 26 May 2026 13:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57F4960BB7
 for <buildroot@buildroot.org>; Tue, 26 May 2026 13:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFeBcjoJR4tv for <buildroot@buildroot.org>;
 Tue, 26 May 2026 13:28:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E91E60BB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E91E60BB4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E91E60BB4
 for <buildroot@buildroot.org>; Tue, 26 May 2026 13:28:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1926116416; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 26 May 2026 13:28:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wRrpf-00000000uKt-2iY9;
 Tue, 26 May 2026 15:28:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 15:28:26 +0200
Message-ID: <20260526132827.216542-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Nzhv2QbSdvi7G/MQzhOrjvM1+ZF2wJmDMz1eeKfyOZV15PJvbwqI7TNPOP2bQU2AOdFmMLIAV7PSfZz23r8rLeyMF4kYkacqwY+ZdW7pZWTER3Bq2yfrdRX5w5ILv3JlGnKt/EU55T2Mc3Bm8/38Piy5Og4zCv4IE0pIdv1pJJwgGqthS1xEprySWj+FuALYZ1WwJe+hsjDZ0bZSbbDQxU8+QJVdonvkTF3b+Vo4e6T1mFQcSDAOtL3OWYVgdV/eCso97Wx+lHPAu8wzv+BuaDFhHXKxP3KsI31Dmg8QvpANh4FgBpaOD8HoO1OPtHtyNkofdQhS2+Ny6bUoz3SHzA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=fPik91eWQSMgQTd0njtY7gb6vo1G4c0w2DIxNHNnsrY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Nzhv2QbS
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/python-urllib3: security bump to
 version 2.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

CVE-2026-44431: Sensitive headers forwarded across origins in proxied
low-level redirects

https://github.com/urllib3/urllib3/security/advisories/GHSA-qccp-gfcp-xxvc

CVE-2026-44432: Decompression-bomb safeguards bypassed in parts of the
streaming API

https://github.com/urllib3/urllib3/security/advisories/GHSA-mf9v-mfxr-j63j

For more details, see the release notes:
https://urllib3.readthedocs.io/en/stable/changelog.html#id1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 858b8ca3a3..92425d125b 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  2c381874816fe551f50a2551abae62b3  urllib3-2.6.3.tar.gz
-sha256  1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed  urllib3-2.6.3.tar.gz
+md5  e79707b798a66c8165c9c441440f4e80  urllib3-2.7.0.tar.gz
+sha256  231e0ec3b63ceb14667c67be60f2f2c40a518cb38b03af60abc813da26505f4c  urllib3-2.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 7f7f0b03d2..8e598818a1 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.6.3
+PYTHON_URLLIB3_VERSION = 2.7.0
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/53/0c/06f8b233b8fd13b9e5ee11424ef85419ba0d8ba0b3138bf360be2ff56953
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
