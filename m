Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C612EED626
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 18:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D65EA407D4;
	Thu,  1 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkx70EMTzy8K; Thu,  1 Jan 2026 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94E6840757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767290476;
	bh=ibvYIMJ/aGPmtymQNT3zIHEr9HW7iP2XCa4eqZCTwB8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiCyxzcNLs5aA6PlRfzdD9eo9dSI0YkjI7LeCd5KDVgAlPBMHPFaozgrc5Jto11r8
	 XV/5fxj8PH4W7IQfqBiJPeWVrIvySRJqV9SCJ5UNf0JS99x7LxKOXkLC9Oeb7PIaGB
	 WNNQwI37qUtHisPVso5CItVqM7DFGo4Nt8PD1VlpWN/Q4+01e73ecE14EdRpMjj7B7
	 RJsZot7N/tJXvoNt19gaFQuXsChae5Cm6XKpVn1HkhnaEhrw7QuC4kFSGrPM8/KxbP
	 UNoA4uaUVXTjJq4ulc3RnaHKUT/Ca5ww7EZfPQFpIaoT/ohEXx3aN4rhO+tMIoe/1h
	 i+tIdHs9wAtnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E6840757;
	Thu,  1 Jan 2026 18:01:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54049206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B09840757
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dx9dZ5Zljubs for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 18:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 31626402EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31626402EF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31626402EF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 18:01:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5866AA4C3115;
 Thu,  1 Jan 2026 19:00:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33758)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbMyb-000000005MC-3BwU;
 Thu, 01 Jan 2026 18:00:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  1 Jan 2026 19:00:45 +0100
Message-ID: <20260101180045.247057-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260101180045.247057-1-bernd@kuhls.net>
References: <20260101180045.247057-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767290446;
 bh=zDP75q7gsWwOmyviJj4a43Fq9UWSNKPpeDLhFdFwRoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hlWh7ZagNlniSb19/rvFoCODe9DrmH0T4B9VMjRPQjK9Zf2hKwTrjYePLynAcZ+o5
 CXh8meGunGJuhpgF/5b2OzTDMkTwplrn8z6ZowuhdRUBJrRkyf/sHn4NOVu17uMUH0
 4oUfhWLicH+17D881XZZXysB3VQgiVUVh+1nQEEBTz28sbiy65dlc8hO0L3VngJF/n
 CcD8wbkD0wl3Y8lv3YejOpgQcKLR0RDhaGblo1Hwf5odi9YNObCN8hqTvzOBlFlZb/
 0wqYccYwavB6hbaikVQYGoQr+Qw70+yGGjnbeqa5IyC55U3xOPL7kq5a9qPm57r8eV
 ZDRwqdRJpw0Yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hlWh7Zag
Subject: [Buildroot] [PATCH 3/3] package/libdill: fix build with gcc-15.x
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

Adding -std=gnu17 was recommended in upstream PR:
https://github.com/sustrik/libdill/issues/229#issuecomment-2865524080

Fixes:
https://autobuild.buildroot.net/results/1a5/1a5e9d7df6c83a921cae39b4dc4b601be4d18e36/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdill/libdill.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index bea9aaeecb..453031a471 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -13,6 +13,13 @@ LIBDILL_INSTALL_STAGING = YES
 LIBDILL_DEPENDENCIES = host-pkgconf
 LIBDILL_AUTORECONF = YES
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+LIBDILL_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBDILL_CONF_OPTS += --enable-threads
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
