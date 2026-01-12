Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87CAD25047
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B017984478;
	Mon, 12 Jan 2026 08:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ne8IYOF2EnEX; Mon, 12 Jan 2026 08:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC4818447B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205672;
	bh=9jk969H5J31ZGQFrbo9qFLK7qb5V4AFfndzeVj0B6Ws=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R8ue85dTm8AfQrXq+kg5z08E4Qu2vnOpm4sufV7m4m/32e3FjbqzH0b2gC57JQR+J
	 q5AmazGOvlOD/gOrkFssVHZvmzF0UiTLAcV/5zSt7HPoQ/zv8e+eFxovWuOTZtzD+C
	 wrT2iOiS8nvmYwLketjgjL6YkFLikA2py21eyhx8efVXLqZemApL8L8xP3juYU8AxX
	 G1dbmdbsCPzKMrQ1hEsWyIrOnUlp6SqpJn2m4KG1hSHApIqFoSATB9FgVY9WqvMgU+
	 gl2WIiIS09/m+FpoBSDJr9XBTt6Q4DD4G6igbMK5tzwUkA80hwkw6kdb7+UBADuStp
	 i8P79P0Pv3vHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC4818447B;
	Mon, 12 Jan 2026 08:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B3C7912E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1893414B2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oavCVdzKGkrq for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EAAE414A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EAAE414A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EAAE414A1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:14:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0F2BA4C3C93
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-2Cbz
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:14 +0100
Message-ID: <20260112080419.2516889-99-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205132;
 bh=ot6rOiI6QB4+l5aDYeBmyeCWVZ7vikrBrYUl5KIzs3g=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=pkyNirLiLa2ydA3zSYi5tAXyE7KXOZcOkrIDEOuc1O+HTLJoyCPG4txhgQA1Qxcg1
 sovtFbMIf88vaG1HDz+/mrdPKTXMmfjU4Za7SfSCy6YMlKGlOlrrYL7/vXYd+bKrkC
 ou8qESNzgdvl3jl6gHc2a6CAbmnICW8eRB+ykkiXO1g/4h1QqwZPrK/IOv2oWRq/zS
 QU5Slg4Saw4Oyr+dhpGrN/qpJbnzeuisi6o5dQHxXOtms4SqR4NDJD4Y9bl56PlKoF
 XfeaA0dpXVfwL4DdbbHzrCx6wyoEPY1Xef40MkRE+7YA2FUQNm5IFzn8ofumpj1o4C
 mOhF+0ZBR2+vQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pkyNirLi
Subject: [Buildroot] [PATCH 099/104]
 package/x11r7/xfont_font-adobe-utopia-75dpi: bump version to 1.0.5
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

https://lists.x.org/archives/xorg-announce/2023-February/003344.html

Used tarball hashes provided by upstream.

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xfont_font-adobe-utopia-75dpi.hash                      | 4 +++-
 .../xfont_font-adobe-utopia-75dpi.mk                        | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
index 0b6e1af638..00bd9131f8 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
@@ -1,3 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2023-February/003344.html
+sha256  a726245932d0724fa0c538c992811d63d597e5f53928f4048e9caf5623797760  font-adobe-utopia-75dpi-1.0.5.tar.xz
+sha512  9608698288fca47bf61cff911b8f081593807eed9f138ea22f05a7b6c26c481ec5144d79665cf509ba889df35ef5406e0de71710362bcf6de6b602c12158e22a  font-adobe-utopia-75dpi-1.0.5.tar.xz
 # locally computed
-sha256  8732719c61f3661c8bad63804ebfd54fc7de21ab848e9a26a19b1778ef8b5c94  font-adobe-utopia-75dpi-1.0.4.tar.bz2
 sha256  234c2a8109afa8034c787dbf69696a9bdd374914aadf937d2a103831d95c1867  COPYING
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index ac3bf2e230..fed78362f7 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.4
-XFONT_FONT_ADOBE_UTOPIA_75DPI_SOURCE = font-adobe-utopia-75dpi-$(XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION).tar.bz2
-XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.5
+XFONT_FONT_ADOBE_UTOPIA_75DPI_SOURCE = font-adobe-utopia-75dpi-$(XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION).tar.xz
+XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE_FILES = COPYING
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
