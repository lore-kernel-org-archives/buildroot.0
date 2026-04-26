Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A0BFF885C
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 09:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 336DB843BF;
	Sun, 26 Apr 2026 09:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLUrV_jwJVDz; Sun, 26 Apr 2026 09:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37F758438C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777195605;
	bh=EWsYqSAgDpi3i8fy1EcMfuedxLYvKwTiufGhi9S2fBc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n3jqXjkMRzXezoZE69gkU9eZSXXEbK8OHYCtfeyCzSFYw0b4LYQZoh7BFutQ/oqBM
	 x5OIk85+5exXAu4Boj9In4eg9VgO3Cc4o0EKfLdoiIMYQtMeWt2+5+NgLfx7xU56/D
	 2HAnnEtzN+270L1Y70G2YPTs4wIrp01hr/gtzwFZ+dcVR/1+xTYMMcxG8OIE7aqEWJ
	 soWRBaZPqJXk0LVZwXzz1ct5BdyPbd9SK5TUHumELmSI5i7SHtAG6MgVuGyEyWFeAt
	 4GblQgAXzCCkEzxyv+KqQECSkBy7oa3Wl3zTuZvzyULk2d1yIt9Su2Aw1FHGuc0E5R
	 iOTYABt0ywD+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37F758438C;
	Sun, 26 Apr 2026 09:26:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D081369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DF6A6177C
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66QQfEyiu-Pj for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 09:26:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A917161704
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A917161704
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A917161704
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:26:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ECDB3A4C0883;
 Sun, 26 Apr 2026 11:26:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43570)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGvl8-000000002lk-0kP7;
 Sun, 26 Apr 2026 09:26:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 26 Apr 2026 11:26:35 +0200
Message-ID: <20260426092637.2320150-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260426092637.2320150-1-bernd@kuhls.net>
References: <20260426092637.2320150-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777195599;
 bh=vz5mYGUMqdrrMskK0PPrmpX7m5qzIAZCJ11bV8I9P5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RE1Uv3Iz5IeJ7QAxDIs+HaKmIFFfcvakf1E+rdaUBB7r5GHvavTPlqD56qqMu1RD0
 zfhrKzb1frypuXgW3ub7N0pgkWUsbyyG/U+6w181zbG8IyrrpMnzaKHEFGKoPbKvrp
 +fU13TpwSzzNicWU8lLXhEGREyOMwBdDd5y3rUF8X6B/IG6RCnZw7E1+6u+VRYr7+x
 gJFnWyCS/cpvly5FmB1hfhFit7zjuqFltJla/j941TdXzI2Bf3onUVn++BXv06cxNj
 XM90Wk/XYcjO5ecnk70Jo8ZBVoZ3Oq/Tj0J6jMreG6NLK5p4i3+ChsHJLV32T4b7kX
 V5/IDr4b/1eIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=RE1Uv3Iz
Subject: [Buildroot] [PATCH 2/4] package/libgpg-error: bump version to 1.60
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

https://dev.gnupg.org/T8112

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index ede1a2113e..1e52e78d22 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  a9876a9e4cb54298960bd4202baf891642060428  libgpg-error-1.58.tar.bz2
-sha256  f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27  libgpg-error-1.58.tar.bz2
+sha1  851a1619aee8f7723ed50f09cb6a186c483c280c  libgpg-error-1.60.tar.bz2
+sha256  11b2a738e212f3eab0fe8637bc341d3181ca964e97bb2654de91aab7dae4ce09  libgpg-error-1.60.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 5207d926df..808339b935 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.58
+LIBGPG_ERROR_VERSION = 1.60
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
