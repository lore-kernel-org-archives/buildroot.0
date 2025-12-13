Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D805BD5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABAE540B9B;
	Sat, 13 Dec 2025 11:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42RxRJqhOf_r; Sat, 13 Dec 2025 11:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3156140740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765627053;
	bh=rcPAUVhDiixveO/OaceEIGS7bOVbog6UMbn7C6WjSRg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TNx1uKSj7dysandx/3Q2L2RnXKTWamTMpF9ukK4adduaDPcIEZ9ySNClyR0vpnNhZ
	 MuA3M2LZKvwAtdvJa1KQV+GXPZhR1AKKhaDVSjvnMYfZAryzs0efQuWF3RkpWrC25J
	 di3C4fN713plIhvwr3yYjesZ6rRZ2DeBP35DzX1xVcUWybdecLwZktOT9Bcuyx0g6T
	 mSKDiVjHyNG0Sfpp4kjhMpspmqw0HsLkpSI5OYMVlaYMoVslmFxmo+s2SdHldCOu6x
	 H2iK6MQ+8SA/VXLtmlM2iGfjtVFwyfIaLIC+Z2LgZB5a58/pl8hzLLL0wUOrQxVI0a
	 goUYuNFkddPZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3156140740;
	Sat, 13 Dec 2025 11:57:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4D9A13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7594812DE
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LihQwFGxGvXL for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:57:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A25308122B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A25308122B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A25308122B
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:57:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2A1FA4C341C;
 Sat, 13 Dec 2025 12:57:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41020)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOFc-000000006zG-1u6J;
 Sat, 13 Dec 2025 11:57:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sat, 13 Dec 2025 12:57:28 +0100
Message-ID: <20251213115728.1277185-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765627048;
 bh=cxys13mLz5/RODJa26OBphx9bxoFuhyG/OPyTXgymzM=;
 h=From:To:Cc:Subject:Date:From;
 b=chNR9WMLluSdTcZjT0b9zxqtzVoUAwA17XcQ75vRc6P8A+drx8ynVtOkT95GrO0I0
 OWtYfR8+1yYT3Mcsgi7sBpJiVmoNvf5vvRMxIUz3eCZUuI8LhOhBuiKo9uZi5iucJD
 0+aB1llM/qjuYd6HIbxMdHe0jWvK9swof0jZAXgHtf8lZ5XUqUaKvMBVM3ipAyj1rm
 1zcyEObbNrHlaCyavczefQxMjjmSA1Sk61EllembuXGYxHyQWidXu+l2QumnA73KC4
 Hpwu97MGevMMrj0GBt+NUnL3c5x1mTuQf8I3RohepeOXovPziNOcQ7lHBxlU9XPVLV
 zww32/GheSHKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=chNR9WML
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump version
 to 3.8.4
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

https://github.com/libarchive/libarchive/releases/tag/v3.8.3
"Libarchive 3.8.3 is a bugfix and security release."
https://github.com/libarchive/libarchive/releases/tag/v3.8.4

Switch to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libarchive/libarchive.hash | 5 ++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index f31b693c67..21fe7eaa25 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,5 +1,4 @@
-# Locally computed after verifying the signature from
-# https://www.libarchive.de/downloads/libarchive-3.8.2.tar.xz.asc
-sha256  db0dee91561cbd957689036a3a71281efefd131d35d1d98ebbc32720e4da58e2  libarchive-3.8.2.tar.xz
+From https://github.com/libarchive/libarchive/releases/tag/v3.8.4
+sha256  c7b847b57feacf5e182f4d14dd6cae545ac6843d55cb725f58e107cdf1c9ad73  libarchive-3.8.4.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 8568847493..083e913033 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.2
+LIBARCHIVE_VERSION = 3.8.4
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
