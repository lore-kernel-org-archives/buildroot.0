Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187EED116FE
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DD9B41225;
	Tue,  2 Dec 2025 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhqXhCPXIa7Q; Tue,  2 Dec 2025 20:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90C634113E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764706729;
	bh=lo3CuPZ8S1r+KgT9nr9WzFRm9xik6eoxx1NppgEKyVg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=quHSCEmRpxpi1vXZrqLqFs6aGeWOhQ8rsX0ZJj5FpRu69R9YmUQ9ZrhNnRaxLwTgt
	 7aH3ybTKF/HJxtYO+9s/M7qwUkI4bbi0hYRrHJT3pPbotdHyejopKrv0afDShMsNlc
	 DXY8dA0NrV6tSWrnNdZcEPWyHL4anSvK++Z86wgQRuUTNZZlBQQaTZ7O5GaWrqY20o
	 jqEfFLG1Xc2fxNOZ9Ds1PXbsdzUns9UF0rTWD814CPsysYvvNY/FbtZ67HQFf7KM4N
	 yEVVxl2516WCXHH2F9jDwTtq3A5C5uVsvPsiW2Oug94800ZWX7b7jGQ+gJejA4WtXz
	 0M+V0l1u1fACw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C634113E;
	Tue,  2 Dec 2025 20:18:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8059E4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE32040514
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfHcOPfa5I-E for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 20:18:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 59AC5400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59AC5400E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59AC5400E0
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 20:18:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F287A4C0EC2
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:18:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41620)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQWpg-000000002Ls-3moa
 for buildroot@buildroot.org; Tue, 02 Dec 2025 20:18:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Dec 2025 21:18:45 +0100
Message-ID: <20251202201845.1762922-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764706725;
 bh=o1B/GGxSzRviKXw8bIPZILLc13WfMQLPqE+Tkpzf/Qo=;
 h=From:To:Subject:Date:From;
 b=HmKebjM8ygEt1vuitrWUO1gSwIpD1gOe/S/0oSbO/qJ+nVnGyzJG5+WK08CnyiByC
 y6TNoMjLtvR14JXwM2cG5IEfFwzHsFoTZ3tvjrSZYTucdzruIVvzwojH3aTE3tQR6W
 sTZ3C9WiwhVynMQUe3nnJPpdaP4/a8EliuQcroKPfX5BM3OatkXwa6LZUyxrAS1JZm
 9fmP1V0wmizZ3H9UQ78sOZ2bEr3dE8AZW+qTNep03iF0yIudY+mCeXhzFImZoNLy9t
 Qi1SZC3YJDk6lKnwtOL5XO3chZR3XV0egsgq+YeuR1wV2MKFMXKDQjKPeCoM77jQIz
 zKPHSh6Yv7nBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=HmKebjM8
Subject: [Buildroot] [PATCH/next v2 1/1] package/snappy: bump version to
 1.2.2
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

Release notes: https://github.com/google/snappy/releases/tag/1.2.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: sent for -next

 package/snappy/snappy.hash | 2 +-
 package/snappy/snappy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snappy/snappy.hash b/package/snappy/snappy.hash
index 0439ca8a7e..a86b36b349 100644
--- a/package/snappy/snappy.hash
+++ b/package/snappy/snappy.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  736aeb64d86566d2236ddffa2865ee5d7a82d26c9016b36218fcc27ea4f09f86  snappy-1.2.1.tar.gz
+sha256  90f74bc1fbf78a6c56b3c4a082a05103b3a56bb17bca1a27e052ea11723292dc  snappy-1.2.2.tar.gz
 sha256  55172044f7e241207117448a4d9d6ba1d0925c8ad66b5d4c08c70adfa9cc3de6  COPYING
diff --git a/package/snappy/snappy.mk b/package/snappy/snappy.mk
index 21c76cd50d..57c688b673 100644
--- a/package/snappy/snappy.mk
+++ b/package/snappy/snappy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAPPY_VERSION = 1.2.1
+SNAPPY_VERSION = 1.2.2
 SNAPPY_SITE = $(call github,google,snappy,$(SNAPPY_VERSION))
 SNAPPY_LICENSE = BSD-3-Clause
 SNAPPY_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
