Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CDFD2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD71361640;
	Mon, 12 Jan 2026 08:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4jmGbRh0K85; Mon, 12 Jan 2026 08:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B479861563
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207692;
	bh=xNnSdfz78R/WcZZUhm6bLGREXMGMrfbaOIPS0FePQV8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INtSqQQIVwPLfNNU8h83cnbyyiiQ2VXlIEHuIF7vJcWOJ8AtytuN89EiV+qWBTBXa
	 fLpOjDiDtYghw/kkV26jVFi9pKY84z0oWrRKR5RXoHeHOBE6SbPwz321rwWjQIjlKM
	 jCN/mnRR7h1rBN5lovx7tXunA3+4bGrbrQUgTd9aTstAD2GiBeTAjuKe0lnLOsDHJb
	 q7i/Tjeayybept3l9iQoUAl0R8TvkP9dJ0gKiONpFw1x2u0l1pbxfaGSwu59AT/rDm
	 Z3Br6bKRf2yAqUPzSqD7766XuI6b00OybCWNcq1Yj1Sl5xojjOjh2s0HWOZrMuH2Aa
	 NFwBHsnrd3hWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B479861563;
	Mon, 12 Jan 2026 08:48:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FA9118D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D7BC80D33
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGdFobNkheWB for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:48:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67D6080C65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D6080C65
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67D6080C65
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C1FFA4C4223
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:08 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-1e3f
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:47 +0100
Message-ID: <20260112082950.2528445-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206668;
 bh=JkYpl63zxY51ycRP6bcKr2sPZ7YHfd8LRsDkGUEP44o=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hcz6g0mH99XcVffifvF0U5zZWqjR4vILHgzxkh0NSkzgAiekLnbt2fyJk4jCT8rse
 4hohkRESrgIst2sEbl/CZrFvr/lLtqxGl42VHtgADqfBnnCjz0uBgPRuapngsikyHC
 /z554YotAFNRenTcm5PabIzs/N4Y57My9O+Uldqeq5OLfR789en52e4oWHjbPe6Q6f
 qqLjIFUan/QI5DYAHY0B0UNvzzG9OSoAngjn1S7lLdrPj8hLkI4ZDobliUCjfNRn2o
 WSNFud4GGxb8g8uNYqkBKbZwQJUA5+f2TWH5Nz+JZvXijVf4ynuY01Z8tlbgq5KjBq
 WMd5pxaRBwy4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hcz6g0mH
Subject: [Buildroot] [PATCH 039/102] package/x11r7/xlib_libXrender: bump
 version to 0.9.12
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

https://lists.x.org/archives/xorg-announce/2024-December/003567.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.hash | 6 +++---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.hash b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
index 015fa0af21..c30dc4a2f3 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.hash
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003239.html
-sha256  bc53759a3a83d1ff702fb59641b3d2f7c56e05051fa0cfa93501166fa782dc24  libXrender-0.9.11.tar.xz
-sha512  2327cc1b530382d81df29b8d579f801f1f990202107cc84506986bcf5d15010d414e9418987b200e3f222d188afce46f0d7754febcdca62a5fc1e541b3bb82de  libXrender-0.9.11.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003567.html
+sha256  b832128da48b39c8d608224481743403ad1691bf4e554e4be9c174df171d1b97  libXrender-0.9.12.tar.xz
+sha512  3d24a6877b500608e3e2a393532a99d4fd54fc343375d8fb51dfbb1b50cedf002c7722f771cf7776f93cb6e0421ca5966ce45435cb402d5f12a398f9ea743474  libXrender-0.9.12.tar.xz
 # Locally calculated
 sha256  bbe1db89c48816c48248796adac91defd8fbde1141b145f01511781ab87f29a1  COPYING
diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index fd97c83cf6..5365d03d5f 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRENDER_VERSION = 0.9.11
+XLIB_LIBXRENDER_VERSION = 0.9.12
 XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.xz
 XLIB_LIBXRENDER_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRENDER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
