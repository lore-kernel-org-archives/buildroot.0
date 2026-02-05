Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1C5ECD996
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 19:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A1A841255;
	Thu,  5 Feb 2026 19:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 004Ie-vF1Uyg; Thu,  5 Feb 2026 19:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74CCB41248
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770319389;
	bh=1x/JXGgm1LMD74IPZ3cl87ueIcMEvRqaY000P9VbEjk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kbA0qMBvL70qokcBmXkzG6fLgVBvgmk7gofmXXy91NXiiyw3uucNmaK2lYyUSPbHf
	 VgYoJtEW9Ba5IIs53/DN0W7D17UfrPGtWVkTye55ELrMpKM5NpWQawoXDt5gwQLp3y
	 MnlLLI0wWUq9qp6bu33gPXJj28sU3IodWSGX0Qye95J11vrkRuCrevUtro4ex7mORV
	 6alLwM5s8FWzcYFbDcLGW0H6dTCSEWl/o4H1VBX0Q7ZAKVAw7tdSTLLBDeIq4dx8Tn
	 0AVyEbwDcnEki82jjFhfFezITCxDKlQCfOzTfBckDAMMVJgmpiSowuoGaYk3l7/nED
	 4dzA0HdrF8avQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74CCB41248;
	Thu,  5 Feb 2026 19:23:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 965EB17A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7813641248
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYw5qsfVRJWX for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 19:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11BF941244
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11BF941244
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11BF941244
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 19:23:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15437A4C56B7
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 20:23:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39716)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vo4wS-0000000018i-41Kq
 for buildroot@buildroot.org; Thu, 05 Feb 2026 19:23:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Feb 2026 20:23:04 +0100
Message-ID: <20260205192304.1728256-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770319385;
 bh=0Lo7NjdlsqTdltk83dtLGw6m/ZNJJsWF72wduFQHCFU=;
 h=From:To:Subject:Date:From;
 b=RnR0xD2hY69UJjxSsK0nftZxMFuenWgV/NGhGqq6MmD9FexGdMdKg9wR6NtxUGi6U
 1jh+0aSlG8HDpz1FsMkGhvhypkAj/To2Feg1oDrIcyPJKSMW2XXlX2fDqvZpJMBmIk
 6E85JQC/UzMZ8Vs6pPcId5kpPcEkkiDR5xR58XpazxHt877xT0KG20zu3v5eInzezf
 SnB6yPCXZukwl+8USojGhNliRDcoqD30KxOeffc6hyMkJVoK5O54aCXqI6sezTxkD6
 QfvmcPxliuJXcF5aTrbAYiWYJoIZfw6Pb028VUZhCbm6/u4oqArYxJkocs17tx5kdG
 ATt58v1tcyfgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=RnR0xD2h
Subject: [Buildroot] [PATCH 1/1] package/libzip: bump version to 1.11.4
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

https://libzip.org/news/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libzip/libzip.hash | 2 +-
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index 93dcb49042..9deeb7237c 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318  libzip-1.10.1.tar.xz
+sha256  8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b  libzip-1.11.4.tar.xz
 sha256  01c022eca6d566e2e8792fd0f091a28653b2a608319922bcd4de91c49d1438e1  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index cf85bfa8ce..6753c45c14 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.10.1
+LIBZIP_VERSION = 1.11.4
 LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
