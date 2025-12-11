Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CF1D3E792
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 12:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0DFC40F6D;
	Thu, 11 Dec 2025 12:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21ZfOOCkJjiX; Thu, 11 Dec 2025 12:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2347340F40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765455255;
	bh=3rqv6+TmLBYzKKsF1kF+xvq7vvrocjR6zr0ewQNLOV0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=sM6XBLOESK9MeL0x6ftbrFE1wP51OwXJLRZfPcir1s8LPfIeLPdAYFGwkJexC+nN5
	 c6erVTWcAre0Bk3qOycko//4dsK4uUzCH/vuCebTlSY6n0wal47e5uBbLwpAXC+dOv
	 Lt7h2CevB+MRHWatncREx08p8b4kuX39dciUORTJgrMwWHkmN30/it42u5mBz4EnYW
	 //cxc9p6vrU7/KPjHOMNg4+FtBnG+muCbgXp9hH6TZqe0hMWvkcOzah5WBklDTqpR+
	 6kfh+QQV8z0yJ2Pbwe2ivUWzO9/FW1iXnYDeToLX/JLEX7x1c2gXBj88lVjEP3QDSz
	 GvOWxCsmhNVqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2347340F40;
	Thu, 11 Dec 2025 12:14:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA4E9E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB7F761C73
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVH3blov5V4c for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 12:14:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12B7861C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12B7861C1D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12B7861C1D
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 12:14:11 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 656732C83503;
 Thu, 11 Dec 2025 13:14:09 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 13:14:10 +0100
Message-ID: <20251211121411.210875-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1765455249; bh=UTqPIV05jyTS+TdXFP5+LaD6G7ibaB2G797c+6IFqNo=;
 h=From:To:Cc:Subject:Date;
 b=FK/AGnj01UR7DTSb1rknnS7DyKuJNaJzdJ9XSz8FoqFUpvZ3PtFe3jIYDtHMJ6w21
 isSGYoqOUL3reRJIy7AQygoC9iE/ASruqE+JHB+Jf3kAfx8a8mCYD1ReNd9Giun45C
 oUqyt/XdayXJ9ilsID0Zg9TbDH+Ky4ie/nnstBWES5DJQXAKaIV0S/MoS1iRiBkcNd
 UDqNwepp9BFp79yv07V1BlLYkyOqrTI2dWEm2rCikU88/QsEE+FTUxzcBTSSg946Dq
 X9g4w20LhOnSNuBAUvy6YnyOaaIyf+otfsgHmSvsJhHXx3BjLelwNGJ5DSk4CqkLeE
 i+zTdLwHciy5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=FK/AGnj0
Subject: [Buildroot] [PATCH] package/python-urllib3: security bump to 2.6.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 2.6.0 fixes the following security issues:

* CVE-2025-66471 / GHSA-2xpw-w6gg-jr37 [1]:
  Fixed a security issue where streaming API could improperly handle
  highly compressed HTTP content ("decompression bombs") leading to
  excessive resource consumption even when a small amount of data was
  requested. Reading small chunks of compressed data is safer and much
  more efficient now.

* CVE-2025-66418 / GHSA-gm62-xv2j-4w53 [2]:
  Fixed a security issue where an attacker could compose an HTTP
  response with virtually unlimited links in the Content-Encoding header,
  potentially leading to a denial of service (DoS) attack by exhausting
  system resources during decoding. The number of allowed chained
  encodings is now limited to 5.

2.6.0 also contains the removal of a deprecated but apparently still
widely used API. 2.6.1 reintroduces this API. [3]

Full 2.6.0 Changelog: https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#260-2025-12-05

[1] https://github.com/urllib3/urllib3/security/advisories/GHSA-2xpw-w6gg-jr37
[2] https://github.com/urllib3/urllib3/security/advisories/GHSA-gm62-xv2j-4w53
[3] https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#261-2025-12-08

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index f4162882f7..9376221040 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  2b8a86438e4d35fbc90572dbdb424759  urllib3-2.5.0.tar.gz
-sha256  3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760  urllib3-2.5.0.tar.gz
+md5  52150787074f43057a0e691c7ebe00d8  urllib3-2.6.1.tar.gz
+sha256  5379eb6e1aba4088bae84f8242960017ec8d8e3decf30480b3a1abdaa9671a3f  urllib3-2.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index 9ec6c7f3c0..5b68dea6bc 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.5.0
+PYTHON_URLLIB3_VERSION = 2.6.1
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/5e/1d/0f3a93cca1ac5e8287842ed4eebbd0f7a991315089b1a0b01c7788aa7b63
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
