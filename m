Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFDFF459E9
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 14:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89527410D5;
	Fri, 10 Apr 2026 14:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvySZCuOSuO4; Fri, 10 Apr 2026 14:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D4DD41105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775833145;
	bh=Op4VUqcTrqiZ8LVDa1rO0/n6k0BSeUHgjuLGOoyNwww=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=ksRajZQ9hTmzuTdNo1uocaFjE74GjTulB4jhAb95y8WvUXTNhZduszifOawGjOOfN
	 u6ZToEUW2ucLAOR/sDumUItnBWDYKw4I6s5tLTIB/5+YvKCl/DgKULXFLukp5RS2tE
	 UOCzyfxcKpg1pUBD2uVHGEa+CRo1CoMNzUDD4NEU7Yw2c+ESOzaQJ6XDFnPwxlMWWE
	 lot2CzzT1bsopjiJGgkz/l8jnsZy2I5yB+9Ly86Rg/uwvgdXG2fIvhO+hSzE/qehNf
	 VLfpSB7qgGbb8DystsBz9Dc/4xt5wjVn2Mwa6lx4bVFgbu3dlahFa9hOxJvG4bayYS
	 nWlBz7Png1ehw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D4DD41105;
	Fri, 10 Apr 2026 14:59:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F8CC237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 14:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7115061028
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 14:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H__XtkY3NSV8 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 14:59:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F9EF61022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F9EF61022
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F9EF61022
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 14:59:03 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 293112C88D08;
 Fri, 10 Apr 2026 16:59:00 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 16:57:06 +0200
Message-ID: <20260410145709.271512-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410145709.271512-1-buildroot@bubu1.eu>
References: <20260410145709.271512-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1775833141; bh=8jui2Js/3WIP5Q7OOBbMKvFKWfLfozHfCIJ1nm2KboQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QDJ9vB/x4giZvLxe/W3s2RNfCtWb5b85alU+IOWYk+DgI7yJcmFVDN2yfQ5TxDMMX
 A1rYPmItq+U98DWFU5+Rje0182ASpz1sfcxUSRrEQRfJhISEP5jq3udG1r6mTfG8bo
 cu8kqFigbBrOsgwPfDU7a93WatYsd6woRiD5TFn+TntiOz1g5d/r5+pO8zSj4PUnJd
 NiEkBLTwed1SboU2PdVHuxuQGNvDqH893Rnj2ucZ8R+WpoYqaExCI3ux2ZUBwF7QAZ
 Ay1BpuAr4VmSA4DJ+stE7RxKed3PJlTVSrGqDfhK3ru/wEQWLc2UhLJsRlhp1OKeUk
 OmsCOJhSNHOfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=QDJ9vB/x
Subject: [Buildroot] [PATCH 2/2] package/python-gpiod: security bump to 2.4.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update for libgpiod v2.2.4.
Contains the following security fix:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=c3655b5f641b87656c11da3ac708608d2c0e05ee

The package now contains a proper LICENSE file in the sdist since:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=51ee19fe1ec8a94b5ecfdc7627b0c574c7874a1b

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-gpiod/python-gpiod.hash | 6 +++---
 package/python-gpiod/python-gpiod.mk   | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
index dfaafd4d4c..d3277c5a20 100644
--- a/package/python-gpiod/python-gpiod.hash
+++ b/package/python-gpiod/python-gpiod.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiod/json
-md5  62cf044aa3214d0ebee6aef78db2aa52  gpiod-2.4.0.tar.gz
-sha256  9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1  gpiod-2.4.0.tar.gz
+md5  c9c2fb67d78204896d85a7945314356f  gpiod-2.4.2.tar.gz
+sha256  602aae17ff365bb8e2a30ce65c6bbf2d8e7a7e64bf016e82e4fd4c730ef69ab7  gpiod-2.4.2.tar.gz
 # Locally computed sha256 checksums
-sha256  a2b24e2158144b22a77a6a404fc5a05911612c5b99d7ab6d0e2addcaeb7514a3  pyproject.toml
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
index 8ab901972e..6881f0df43 100644
--- a/package/python-gpiod/python-gpiod.mk
+++ b/package/python-gpiod/python-gpiod.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_GPIOD_VERSION = 2.4.0
+PYTHON_GPIOD_VERSION = 2.4.2
 PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
-PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/0c/dc/5a6bd309345bd9cfa7e098174ab7e65367e408539b6c1998e4f267c673cd
+PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/13/ca/b3bd043091b4462d6c5561f86581f553df102d8990c37938ddbff2823016
 PYTHON_GPIOD_SETUP_TYPE = setuptools
 PYTHON_GPIOD_LICENSE = LGPL-2.1+
-# The package license follows libgpiod's license but doesn't include the LICENSE text in the pypi distrobuted package again
-PYTHON_GPIOD_LICENSE_FILES = pyproject.toml
+PYTHON_GPIOD_LICENSE_FILES = LICENSE
 PYTHON_GPIOD_DEPENDENCIES = libgpiod2
 PYTHON_GPIOD_ENV = LINK_SYSTEM_LIBGPIOD=1
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
