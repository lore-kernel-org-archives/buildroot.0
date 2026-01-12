Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7F0D2504A
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01E2580F7A;
	Mon, 12 Jan 2026 08:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqSUtPRcQ6-Z; Mon, 12 Jan 2026 08:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ABA580F59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206107;
	bh=BkJO0FDJtIQW+rl1tVQXOR/EpuR+axC5jyUoiiVYKKM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CGsrpFbyzvKF3ICBj0knwlBmaYNCHWslEKa3Xe4O8r+B9jn1MqiLdye5kkqgtUcc6
	 +cpXrP1HzjnCz4cEHovxK9HDoGFQ+5H8c5Mb/jcL1PYToNJiSVSvy0xz8hdHoyhU8Q
	 dV6QIA0j/eIes4y2TAWqhOWUNlalG53SdM+OMrmXWOtJCArxf6ss9JJmQPIUESDo3Q
	 jdnxeFX9K/h6MafAeFOn39EkMdPMyv4p2DAuXJnC4eSrRF78x8QW62U2H4ABRVTZNf
	 a/x0DN71wwoOw1+gCCrWNWcJ5SEYjDtb9goXumWnHOCwr9Gq8g1Q3bTQGYa5hpiKiJ
	 V+F+d+001tdiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ABA580F59;
	Mon, 12 Jan 2026 08:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 605FE18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 528EC81000
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbL2o_EeSPOb for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:21:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 414BE80F7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 414BE80F7A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 414BE80F7A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:21:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6508A4C4221
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-063a
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:11 +0100
Message-ID: <20260112080419.2516889-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205146;
 bh=tBcvu1HUXZuqC754bbzOgrx6bD0p9VeAqFO+de1cxZM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=T6NV3Pl5WbHzgZYd1mwpkahOkjBICTjhC5j0S41Da7IOIB7wSPI12QQWtdfnS8p/6
 dbGlCw1UeXry8vJsUcl99kX865iAMC1YVVtIfo+8xNrZgl4jMjl6/3ZcLQR9PYNaqj
 TL32R8HuL/4OO0IX2AnRq+ljGlQKHKIzAU/MeoSlY37z2oYtq8ET84gz1K1gfHGQfW
 gnNimsP2joFM8HYePmJmdhyqwUzc9Dq1mpaxxsyD6nKJygYoZ8gdS4r0ROej1fHWYM
 A/4KKJnGTrO/sayvaQAs2nhbtSzNkYnMpky0LN+28aYnx5+herQ8RYZdftsFTEM9Qi
 KqIicI+tRE0QQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=T6NV3Pl5
Subject: [Buildroot] [PATCH 036/104] package/x11r7/xlib_libXv: bump version
 to 1.0.13
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

https://lists.x.org/archives/xorg-announce/2024-December/003573.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXv/xlib_libXv.hash | 6 +++---
 package/x11r7/xlib_libXv/xlib_libXv.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.hash b/package/x11r7/xlib_libXv/xlib_libXv.hash
index 0852f27f8b..dee8059f1a 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.hash
+++ b/package/x11r7/xlib_libXv/xlib_libXv.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003280.html
-sha256  aaf7fa09f689f7a2000fe493c0d64d1487a1210db154053e9e2336b860c63848  libXv-1.0.12.tar.xz
-sha512  bdd00de1ce6a8911056181ab4de32f9e319a68567389162d4bc2e3c9946d5f3c60f87eb6c53f74c9b6a342255e591d5fef4a445a4ac8ca3c1b6fe87d42c51c1e  libXv-1.0.12.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003573.html
+sha256  7d34910958e1c1f8d193d828fea1b7da192297280a35437af0692f003ba03755  libXv-1.0.13.tar.xz
+sha512  80d7a11e6415fbe0fc50c3c2a1abf8f0f2ec38446c9c8d88ff48875cd94b8949cb1028f2ab37476c4b25cbd7eac34dde9132dd998c4e04ea576b95ae411ba946  libXv-1.0.13.tar.xz
 # Locally calculated
 sha256  4fac4d581d00f11c459d68b7cb970f3d4e5a5bbfb53784d85f59a90076280301  COPYING
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 808b1e6e7b..e150edf03a 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXV_VERSION = 1.0.12
+XLIB_LIBXV_VERSION = 1.0.13
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.xz
-XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXV_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXV_LICENSE = ISC-like
 XLIB_LIBXV_LICENSE_FILES = COPYING
 XLIB_LIBXV_CPE_ID_VENDOR = x.org
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
