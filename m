Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D12E6529E
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 18:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78F6A4075C;
	Sun,  1 Feb 2026 18:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5qYicNyujpo; Sun,  1 Feb 2026 18:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB9740766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769971331;
	bh=PE0NlCtmh4ZDC6EFr0ilGWNGAWvYQwi0sfC320QsTMk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AUYh7d4po1033riQGlJdo3oltGeHQ9UbkBuXSVmpEhX8vNdf54dVq9jQF9p6p3awb
	 bvp/irlPuxsvt2shviyebJNrUCfdb0p8te0WiduRoVCH8ACRYoe7O8NII45+TdjTUZ
	 zaG97JC0itbsqGW3QojiyZPxtb7+eENzt7FQW07xWQbthLD3oTZKL/z9XsrcRKhEF1
	 lArqBFlbiHnA4D3W6bCuIoU6ZAUvX1vGBWI2m0Q0faAxCkecba4Z/ILBb4jbMtXbC+
	 A3dxlrFzganegKiK7b28mF/CxbjYdDR9W6WjzYO0I/LNvG+WzONGJZ+Q2iNxbPlbTb
	 PVHW+nIInIjsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB9740766;
	Sun,  1 Feb 2026 18:42:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 071181E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1DB360E6B
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33rcu4t6upXC for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 18:42:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B736760B00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B736760B00
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B736760B00
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 18:42:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1FB8A4C547A
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 19:42:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45020)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vmcOY-000000007tz-3It7
 for buildroot@buildroot.org; Sun, 01 Feb 2026 18:42:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Feb 2026 19:42:02 +0100
Message-ID: <20260201184202.3605253-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769971322;
 bh=fRRyt5G/ZkaH2i8klVCTb9cHJse4pJ1GZUag9hcUI+0=;
 h=From:To:Subject:Date:From;
 b=r5Z9Xfi8LSDwg88xqLTv8TNgxGhFTIuHVeq8CaKLXByBBPg8CbR4ONJ/kFcY1cuHD
 vujTlchegV+ybpLwg2Qdx/bzJGt79nNEKUhIwTJE7QeCW2SCl1QRqMoTFHTVaKMsh5
 KYzFrMT1YKDXNg8L39YdGxQX5P+04sI71hnntJNZzHEVIwxbcIG2ricvSM6x7faU+Q
 YqZaAJdX+G+GJk2sg4SR/4yZFm/G+ME9DKKzUTJdH6tIlBqsMrLekVgEgBM8SanSuC
 vtJ4ADkoii1RlZWwcalAnUs9wzdt3qOOVjVxa13QBaATaUHoFrYhungaLgoqyCGlUL
 ICRUI3tA6+n0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=r5Z9Xfi8
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: bump version to 1.12.0
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

https://dev.gnupg.org/source/libgcrypt/browse/master/NEWS;libgcrypt-1.12.0
https://dev.gnupg.org/T7643

Updated license hash due to upstream commit
https://dev.gnupg.org/rC67b8da4ef62734927e061327efa9a6f48616d114

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgcrypt/libgcrypt.hash | 6 +++---
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index a170a1c827..60050b856e 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  b0d3d966894a5ee3b629e55350464f69e1c7859e  libgcrypt-1.11.2.tar.bz2
-sha256  6ba59dd192270e8c1d22ddb41a07d95dcdbc1f0fb02d03c4b54b235814330aac  libgcrypt-1.11.2.tar.bz2
+sha1  02f80e9bc9967609b7041ef874eae4e542f240a5  libgcrypt-1.12.0.tar.bz2
+sha256  0311454e678189bad62a7e9402a9dd793025efff6e7449898616e2fc75e0f4f5  libgcrypt-1.12.0.tar.bz2
 # Locally calculated
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 5c38e0e2db..4dffbdc3bf 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.11.2
+LIBGCRYPT_VERSION = 1.12.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
