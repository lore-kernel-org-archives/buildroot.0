Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A35510F2862
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 17:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 676C241165;
	Fri, 27 Mar 2026 17:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GBbVQJiZoUf; Fri, 27 Mar 2026 17:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F03284115C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774634268;
	bh=0wTKcmkpGll/+Xb+iYNKgycCiLznhPZLyp2N1iabsFU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HjT2ROMbl7YKyoT+C2bvPjcnUOrCt/xS+YmrrY0IXXm0HSpzpOv/qghcoSz1rw2Zw
	 /aSwrYIoCMQd7YNovQrjzG+NGK4VV+rRMxHdkxMGVDzhbPHHeJNlk5Nn5ivsy68y9+
	 S42KsFHeJUbwnhmaav8MyXrsf3ne1xu6ruu50VW51iPty8lBxAQclOBJBRNtwIbRh4
	 RTbA1r9Bo3ud52qfhc0oujM/i50wuxzzxU7/9ddX9Ha09TtFxQ5jcLzjWMOLbRoGZG
	 BMJqx+SeqhdZlW3jPa2apixovwNYAfo1uqdP/1mVutkK1/uXwnt8gLJIoFpSXoYj/a
	 kt7WimT81U4PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F03284115C;
	Fri, 27 Mar 2026 17:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 486CD2AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 17:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39EE060F9F
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 17:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V73AOE-j0-bW for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 17:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 466C060F9E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 466C060F9E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 466C060F9E
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 17:57:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ba3.dip0.t-ipconnect.de [91.58.11.163])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C43BA4C00AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:57:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54926)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w6BRH-000000001UI-0Jy1
 for buildroot@buildroot.org; Fri, 27 Mar 2026 17:57:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 18:57:43 +0100
Message-ID: <20260327175743.1982788-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1774634263;
 bh=2NgSX+Z73bFEveYb/fdix/s3jFBFS3XPW1ex7AoZvJw=;
 h=From:To:Subject:Date:From;
 b=fGB8kATNCbFAfLeXaK6h1D2nwSglSJNAn+n0yb/s83d8FtbJM+0i7YTThacx3pmml
 yhLaYejWb/XoIRZ09lZyXlaZDvZYP0Oc9MEucW8uqaHAsLxdvbANKnDtjD0Xj34nBb
 4l3FcC21hDG+fPR01IKub889zpMwSoxLnC0mwV8SxXNJsSyvU9/wq2TxowKAQBrhNU
 4Ux7c/Zzatf0zUkBugOA3nTuGzB76VlUHBu6MJcVfw1B8bEUbK0UnjUH8z1NCrVkxo
 8fWDJGNleADDvMYjrb5x6Gdv2dViVOEkS/q8pSm5042OOEdM6Y5QbgeR3i+DOE/kcu
 /BaNvLhnrd+AQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=fGB8kATN
Subject: [Buildroot] [PATCH 1/1] package/libpng: security bump to version
 1.6.56
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

Fixes the following security vulnerabilities:

CVE-2026-33416 (high):
Use-after-free via pointer aliasing in `png_set_tRNS` and `png_set_PLTE`.

CVE-2026-33636 (high):
Out-of-bounds read/write in the palette expansion on ARM Neon.

For more details, see the advisories:
https://github.com/pnggroup/libpng/security/advisories/GHSA-m4pc-p4q3-4c7j
https://github.com/pnggroup/libpng/security/advisories/GHSA-wjr5-c57x-95m2

Release notes:
https://github.com/pnggroup/libpng/blob/v1.6.56/ANNOUNCE

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 7901f82c3a..ae28eee087 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.55/
-sha1  13f7bedf27009e59961f823cc779a5f9f5341a91  libpng-1.6.55.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.56/
+sha1  71eb3636e60b6ea66f2f670cdf1f7160b7a1fa8b  libpng-1.6.56.tar.xz
 # Locally computed:
-sha256  d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d  libpng-1.6.55.tar.xz
+sha256  f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18  libpng-1.6.56.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 01c1cbbec7..7c5bc35a77 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.55
+LIBPNG_VERSION = 1.6.56
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
