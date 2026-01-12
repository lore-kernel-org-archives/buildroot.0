Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A572DD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D069845B9;
	Mon, 12 Jan 2026 08:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08TLhIFCL4o8; Mon, 12 Jan 2026 08:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88FEC845BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207148;
	bh=3uYBwO6olVKnuCEibxP26lFzwJahTr+YfafNQh4IHRg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sBnwnpnWASqA+FtAjFazZrwigyqHUpwuPwPn7eWfeaCGFmM0mxVpsuTH7Bo02iohp
	 ERcjktnhJq3GNfNKynDRkg2kjVRBfhtuGBJL83D/joWy0Pw9k2HOoyL4xdy0g2dJmv
	 wsVsI5bV6w2Zks4amkVdheMv/2bC0T3MB89BuLAEen1skuWfHiCLZqO1NP+fPLA77S
	 Cgf9OPVN0b/PDuvXO6nc0URneHjvJ2u5BgwiBzw9n7v4wJONc75Nk4mjCYw2PVmoCb
	 3FdX+39mnWpynFiJPGmgwsJ3aGf7i9CtPtwA+9LWLWjxeijJ/0NoEMCxUZ3BhB4kpp
	 XWAi/4AAN41HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88FEC845BA;
	Mon, 12 Jan 2026 08:39:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 190281CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2E9B6152D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xN7nREAp29nz for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:39:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC07C61501
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC07C61501
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC07C61501
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 115A4A4C3CCA
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJH-000000007z0-10MP
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:44 +0100
Message-ID: <20260112082950.2528445-96-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206636;
 bh=1/ZFy6waWBhY5vB7S1JDUk4rTFSYT1iMi+inkK8VaW4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=AmUoiyv4L59nv+QSGIQc1X1ZVKB7d+tsi11UpggPat4IIfVDPH3V0q3E7jTRdVrKI
 VLRNhZ+1O1HQyQnyxY2NmbORXyIzVONFC/KD1wPzAHBw7JwOxhdubxQ7uaBvFuTmry
 Dstz1UBe8B6mY7jQWxgJRiQNWcSwy8Rt1MKQHyS7MiyBSxhfJ4JWI2OqsmBEtgds9m
 pjN667nXR3HHhn0HDFu6cRUaOpfqTSb3qWVVshWG/032mhvoOIARI8eFF1Dr+5piSH
 +4CcQOYW3eNq9pMf4Zv+r7L40ni6y/CjqaqIoYEZGoJxjtCFPw5ovigUlJ9vPbmmb4
 DXxkxclEk969g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=AmUoiyv4
Subject: [Buildroot] [PATCH 096/102] package/x11r7/xfont_font-util: bump
 version to 1.4.1
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

https://lists.x.org/archives/xorg-announce/2023-September/003418.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/font/util/-/commit/c28d8ca618f24855e735313c2b8f6effa7b7f1e4
https://gitlab.freedesktop.org/xorg/font/util/-/commit/5a9e7c7d3c3da68e5b421e7d038bc0a7a5f66b22
https://gitlab.freedesktop.org/xorg/font/util/-/commit/ecbf1fa15e14a9ccf339b86198b03f31db838382

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xfont_font-util/xfont_font-util.hash | 8 ++++----
 package/x11r7/xfont_font-util/xfont_font-util.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.hash b/package/x11r7/xfont_font-util/xfont_font-util.hash
index cf52a2348f..13263ea5e1 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.hash
+++ b/package/x11r7/xfont_font-util/xfont_font-util.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003331.html
-sha256  9f724bf940128c7e39f7252bd961cd38cfac2359de2100a8bed696bf40d40f7d  font-util-1.4.0.tar.xz
-sha512  05fff613019718a4bd8537ff7eb270bd85345ffb006c16f81b739d6e8cdbfaa9d6503aef9bc48d6c7f70330bf90ff1a46bacdff3c99e8017191d935c85f73d60  font-util-1.4.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-September/003418.html
+sha256  5c9f64123c194b150fee89049991687386e6ff36ef2af7b80ba53efaf368cc95  font-util-1.4.1.tar.xz
+sha512  cec7fc38ba64ca9c81c59a8395da94d71c75e14f19faf6457da0a1a8c3c1cf51bcaab227834f6f5a6d274ba2557555e542dbe2bd88e527c45ea196318bbc38d0  font-util-1.4.1.tar.xz
 # Locally calculated
-sha256  ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c  COPYING
+sha256  5d959e54276964bd0056941fa6f2ecd818a1b081b27f5debcacb54c0be87ece8  COPYING
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 8a97c85d68..fa4d983109 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_UTIL_VERSION = 1.4.0
+XFONT_FONT_UTIL_VERSION = 1.4.1
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.xz
 XFONT_FONT_UTIL_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_UTIL_LICENSE = MIT/BSD-2-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
