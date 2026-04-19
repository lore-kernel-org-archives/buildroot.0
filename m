Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18677EA7190
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 14:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C018240AB0;
	Sun, 19 Apr 2026 14:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5C0hNDPrNgA2; Sun, 19 Apr 2026 14:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE9D6405FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776608124;
	bh=hLQBo2DSO3UMj1IE4zaNJSX/TBQfn9dEFu10SXRHmvg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RQJzEhSF2WEI1QHE5Sdgl7ZkXgGtlUT06fP4Kl/Hm7HG+SuwFz2nSaSzSC6upYyuE
	 8TrQODgLvAy7YxHr/Lm14Nbl2+rtaDigmI6N9tVODqFacB0OXcgI6eYIqhB23//e73
	 /5vaPP4d2XT1OAvZJ+4mm1c9N3wSNPGQx7xICyYvqLcnC6uMps6KB6srGnSfaOJAGw
	 Saa+hzx6EEax9fnhJEaN6m2BEZQ5K7YntN8LzqWoYAkuS6s7y96GPv9kwDGOjXT+0b
	 d4mIxH9nswNe8ZkUe9J30USEaNMmLi5Tyv0DDQBZ1NW4YyMH+N1jpNZolcpZuLlgR/
	 yxnZLulfh00FA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE9D6405FA;
	Sun, 19 Apr 2026 14:15:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BD4824D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 776A16076D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kJSYxxNU2_3 for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 14:15:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60D17606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60D17606A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60D17606A5
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 14:15:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E1CEA4C38AE
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 16:15:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58178)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wESvg-000000003Ds-0jxQ
 for buildroot@buildroot.org; Sun, 19 Apr 2026 14:15:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 16:15:19 +0200
Message-ID: <20260419141519.564625-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776608120;
 bh=VDN5bIuU4zqhd64u9ltVHeCZkDJYeO7kmdlfyToMA6A=;
 h=From:To:Subject:Date:From;
 b=ucVj+BAT8q/Xw9vawWhmvlTru+iAU3biDIcio/SNaWC37wlERUgpHuWVUUjy5iEzw
 FtSpGSKRwtPI/WqUAGANjqI8PA/9kdcCidl0PYMJMzeBFDbtUsJx7okjZ6t7kcMdpI
 /vvLiEpUU3cDIc3j2GPUoU1adPaYjo/EP1JAPHIwyPHzjClqHwdxpgUnm3E3xZpJ1t
 PZYtHEpbxsIgZgaEyuvtBYVhkB5aTq2BhdMe33W9X8U9fAIDOGzNUglySeiwk8HzC1
 gQ5gBTHSdH9yKdku7wbrBf7N8YMxUq8O5i0wXZGERI4leCi/hexHZ2Pho2gFCIb+1l
 4E0ePoL4x4O+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ucVj+BAT
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: bump version to 1.12.2
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

https://github.com/gpg/libgcrypt/blob/libgcrypt-1.12.2/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgcrypt/libgcrypt.hash | 4 ++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 60050b856e..7be6554d56 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  02f80e9bc9967609b7041ef874eae4e542f240a5  libgcrypt-1.12.0.tar.bz2
-sha256  0311454e678189bad62a7e9402a9dd793025efff6e7449898616e2fc75e0f4f5  libgcrypt-1.12.0.tar.bz2
+sha1  7b8ff21966a0b6e7a735466b9b9b55d9dac9fa87  libgcrypt-1.12.2.tar.bz2
+sha256  7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e  libgcrypt-1.12.2.tar.bz2
 # Locally calculated
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 4dffbdc3bf..0bc281da42 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.12.0
+LIBGCRYPT_VERSION = 1.12.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
