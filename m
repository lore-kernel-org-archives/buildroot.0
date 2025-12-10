Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80042D3B9A9
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 10:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E27C40421;
	Wed, 10 Dec 2025 10:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLf8Ar_eh_Vu; Wed, 10 Dec 2025 10:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53A654042F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765363638;
	bh=ZduVWL4CUcNmr1yszp1NB7W7K31tThouEkwEDLVqvbs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ibiAQoq4Hf/8eRluRbGLMLan9DR1aaSEXh+okkZBSJg2ObPIW8Ag0+hn1QGoNp/y1
	 AvPGOTCogCpP2A5fKIrqTsf8tof8IEg3Qomh8ynxwT04aKDap2wHRNV9vrCRw0N6kO
	 KMj36yUYAgFXTagiFC+ujmuLelNdgMQfLJf6Bj2LjZ4cQi8Ly7JGG8YirzAB2GnRpP
	 qpJFNxvDdZSiRhfX0rExn83niN2Zqe+sgA1k3qtKnQIGI2Bkzu14698AdMoXoGQyfQ
	 SDbQcfqQ6ULTza1hmJZFvD+N2utlQMkfxQN2vnspYrBDZGaa/9fP4MPAlL9IqdGvF6
	 OqYQ33OseZl/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A654042F;
	Wed, 10 Dec 2025 10:47:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B7F77E7
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 10:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E74B40315
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 10:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSudY3xTOtJK for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 10:47:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74CAB401BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74CAB401BB
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74CAB401BB
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 10:47:12 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id THiwvqRJQwf0DTHiwvbroV; Wed, 10 Dec 2025 11:47:10 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 10 Dec 2025 11:47:09 +0100
Message-ID: <20251210104709.2144823-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN/pgIzGXDZxzJr6VKEhlH3iZ+Gn047r2eDOQtFt6/KxIcX2izH5j7tzJNrBjFpNzll4Z9eXzc4zqA0gFzI2JwoQJ3AGpRpKXE107pGKZDq8miMfROgA
 olYsgi6eMcY8eU8dECR2E/Dgi4lQIu3Nq5TZL2QRsdqBfrE+00aDsorMBH1SbRRqDKAweNtHf+1RsWbVEGkjfoi+JxnFnvB9QUAzho9kbbbiecdd9ruQsrMO
 szgkNjgUlJ5A1J2oQ2ioevKB5ABJO48cB+aEYz4soFUiR6k4w8ayocu4UgCsOe5YGzEIWYcJ/vrkIVZQwWryJA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1765363630; bh=RRFz79lHaFv2csuojGmiFlSiM2cPzKeMaffWjy5bV9c=;
 h=From:To:Subject:Date:MIME-Version;
 b=T2o1cjlXTDY/nyr0P+rdc3XDI/4xMf93REA1JE8+GTTcqghWlksr6irTI5PYEW1vR
 l3bYyxp3Qk0HbmU1+TyYJPGjfRve83Wv8fDD4l432C+ZDGVEQwD1U0ywdnDFEFToJZ
 oe6rGodRAlGE+HQxhj4f/2k5OCXrGXPRmRuE4suUWwY2ZLcSqTa5IrnFWkh/nNBNq/
 bFPxHd9D2Acz2q42W3HaDgn5hAmIT709gyE9DIwFaCKWhERhJ4WOf8tn9lEBuFS/Zx
 G/8fNSdHYUFapLSYu5FEme1KaREczNSe4zJuzZV4/fEwE7o5opkng7JIBh4cpkjKa8
 A243p9c/64opw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=T2o1cjlX
Subject: [Buildroot] [PATCH] package/rtl8188eu: fix build failure due to
 sha256_init() conflict
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to version 2025-12-10 on branch v5.2.2.4 to fix build failure due
to sha256_init() conflict.

Fixes:
https://autobuild.buildroot.org/results/12d0a01d3d3ea17bc99ee9aca5b50d20be83a5f4/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index a32f9344cc..74f12fef29 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a19791716fecbbc353632c5fd1a84bf0565f7af1ae327f0afca7328227e06df  rtl8188eu-967dbaa7dc0641042b0f103e7679cd83f9bab131.tar.gz
+sha256  bed53ce2ce2b947795f795538d823a8ecdf3845f2f7571d54ba351ddf4ddb243  rtl8188eu-2ef2819d2d3ef7701a739c66525bca4731c6abbf.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 4f767a9a02..5efa5aefec 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 967dbaa7dc0641042b0f103e7679cd83f9bab131
+RTL8188EU_VERSION = 2ef2819d2d3ef7701a739c66525bca4731c6abbf
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
