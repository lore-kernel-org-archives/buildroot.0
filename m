Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370FDD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B38F615CF;
	Mon, 12 Jan 2026 08:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqE9TIQ26wdl; Mon, 12 Jan 2026 08:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E0A56125D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207280;
	bh=945rT1rN6x+PNjBrCYcAimYL9XuyNOJTieZvOHLsrfo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FEyjx8qFW58Yulgsf/tJTBBnyGL0aCHtHemLoB1j7XAasPKbv81vp2zG+88yRIJBw
	 jyor364SahdhdicCW0F9tHvM92EsznJy9I3I+MLNzbAy4fQ/uiwcyqMxzyHuJu3Iqy
	 CNktIG6OF932b68XkfGTcTwd5JmLlr/FbcRcR69K1GrkrfohrlBdnorNI6/NqUcpbl
	 SgvpNcAupggaPllU0/wIB/IkXvyH9vNGAmtTKkUHnxwiT01/XimX3BvO/+FWbQzaet
	 uGGis+9csymaXmZYLHXI0gv4NvqVXwupG6jQbRsXeyRQUiV823T3iSUa3MJsPnoIV6
	 z2PW6bT9saKwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E0A56125D;
	Mon, 12 Jan 2026 08:41:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3BB618D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A643E4061B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fp98TW4tG-CT for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DC7D40581
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DC7D40581
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DC7D40581
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A306AA4C3EE8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJ9-000000007z0-1p7k
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:17 +0100
Message-ID: <20260112082950.2528445-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206644;
 bh=fbys+1eJmgUFGqdDeNAa7pRpYKyDNWygj6EHC0tlc1w=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=pbey6a0xshHksee3Bp2aFCsfx3MoJepaT+K1iGdpvof5ezd8EwevJ6QeA/3lBUmcq
 47iMc1T8ehWTq4BMyLjxvQ9lJv51yv5lFBiEBrWuvpKFTSIVZHrmqOphDAJBV+2Wxb
 +ovrt5FHItq0DqE/LQdX6/4xaxIMpjGtOjP8bPBsYJT0Kvz1DoJtkurfLEgk5ijVma
 JV2QY1kdbcjXlQqJ9jPi3GB5eYQX7h67ta52Bgdw+UoAxmanN8bRrOwfkKyg0F0uBE
 cRN9CEZn9l3koEWzqeluvbb0iy45lWJkpbroNxOV3sIlB1vKVqDzsBgZwEJsaNshlu
 XxGgo5RbOR5qQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pbey6a0x
Subject: [Buildroot] [PATCH 009/102] package/x11r7/xlib_libXScrnSaver: bump
 version to 1.2.5
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

https://lists.x.org/archives/xorg-announce/2025-September/003629.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash | 6 +++---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
index a32997e1fe..2a318d6690 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003279.html
-sha256  75cd2859f38e207a090cac980d76bc71e9da99d48d09703584e00585abc920fe  libXScrnSaver-1.2.4.tar.xz
-sha512  e4395af85f8496618afb23ffdaca1a75f5e3d213478d8dc73249cbc9840d7b993ba7513dbf6015cb38b48fe3f2223496365158a148dd5e1ac7475c5ee569e28c  libXScrnSaver-1.2.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003629.html
+sha256  5057365f847253e0e275871441e10ff7846c8322a5d88e1e187d326de1cd8d00  libXScrnSaver-1.2.5.tar.xz
+sha512  1c0be0d15c5e7b50a3eb4a239e2c833c44b693b111c7f64c409f9abf8051356572acadebc8b295555683ff6bd4895acdbe32b15a538c971f15d8aa4e6b7fd51b  libXScrnSaver-1.2.5.tar.xz
 # Locally computed
 sha256  5cf3e16f5dd753a4c0853e8227134ab65f5562d9ef89b1a2d7681f5c8ac9feb5  COPYING
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 55ae7a6801..3c6774a59b 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSCRNSAVER_VERSION = 1.2.4
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.5
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.xz
 XLIB_LIBXSCRNSAVER_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXSCRNSAVER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
