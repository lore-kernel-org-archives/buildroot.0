Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D80C54ED0
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 10:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2BE14056F;
	Fri, 23 May 2025 10:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aquNu_EauILL; Fri, 23 May 2025 10:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15821405DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15821405DB;
	Fri, 23 May 2025 10:47:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 47267119
 for <buildroot@buildroot.org>; Fri, 23 May 2025 10:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38B9D60AAF
 for <buildroot@buildroot.org>; Fri, 23 May 2025 10:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wJK8ZJ9v3bY for <buildroot@buildroot.org>;
 Fri, 23 May 2025 10:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12C876065C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12C876065C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12C876065C
 for <buildroot@buildroot.org>; Fri, 23 May 2025 10:47:46 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id AD89B2C846AD;
 Fri, 23 May 2025 12:47:44 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 23 May 2025 12:47:40 +0200
Message-ID: <20250523104742.328850-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523104742.328850-1-buildroot@bubu1.eu>
References: <20250523104742.328850-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747997264; bh=Ql4kH8zvieOuf9r0xRzZBXMw78TjKoPBr8Z5hlJ/OZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Vsx0gWon5cfpEYoGkvkxAlqEfUsw9ZJf9bSXuDSvxaci6Tlersd5ObqRGiyns5CCV
 RYnvBk+i7iO9gT2NNKiCCmPXkNa1EWNBdVcK0IXg7mBhqBrfjFHgab4SZ8x9noJ7Eo
 yjBNCh3YOulDT3BSKZ37p6dd1s69bu6GLLfvevkHnpP+T9xSCVS7DxxWa7duN2LHHG
 c8o5bJHgYWE66hwxGi1Ya2ZajmAdd+h/0pQEQZGtHXn00pH0s3gTe5VEKAgr7fAL3P
 JI9KmXN8Cc42MkA7kQjRi1IMPS4KSFOcPGrPWmwMiUFX6x1JKhWhG3ToOtw0KtdAy4
 NwVLJa5ozbcLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Vsx0gWon
Subject: [Buildroot] [PATCH 2/2] package/python-pydantic: bump to version
 2.11.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release for 2.11:
https://docs.pydantic.dev/latest/changelog/#v2115-2025-05-22

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index d639fc0da7..a4be70b503 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  13bdd5856e805abdce75516cdb98935f  pydantic-2.11.4.tar.gz
-sha256  32738d19d63a226a52eed76645a98ee07c1f410ee41d93b4afbfa85ed8111c2d  pydantic-2.11.4.tar.gz
+md5  85a84b0930556794ba1e95aa6313c071  pydantic-2.11.5.tar.gz
+sha256  7f853db3d0ce78ce8bbb148c401c2cdd6431b3473c0cdff2755c7690952a7b7a  pydantic-2.11.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index f82cdd3c16..8b653daaa1 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.11.4
+PYTHON_PYDANTIC_VERSION = 2.11.5
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/77/ab/5250d56ad03884ab5efd07f734203943c8a8ab40d551e208af81d0257bf2
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/f0/86/8ce9040065e8f924d642c58e4a344e33163a07f6b57f836d0d734e0ad3fb
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
