Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77412C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 08:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AFBC80F31;
	Sat,  8 Aug 2026 08:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EewMwS_crhb9; Sat,  8 Aug 2026 08:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C56680F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786177560;
	bh=fHR9MKUnCkZRX+5/Rp69aZKeWplBIa78zpiut9m4GuQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hy35KAW2kc3EJIUa8T6WUfOY8hHUPWo89HgWoWGic2Ja6gbrlVQQzvSdPNywJp424
	 comnpvrJwRuDDYIXOPWQilExhl4M1jFxm8+hynBvtP0wARXIxY0fkhXhTmGlOGisDI
	 stXq1oxVOpnnirxM6wvQ2DmSp5wQwnDhC3tL8ESUdDLPV6711BgJWsI3iNFxB/7XXc
	 fV3YpI/VCpdBxqcDGjeL6hgV0YSjgJ9Oz+r3mODXon2B2G9Mjoowq5/Y07gz35b2X4
	 LWD0+7mwUc/4XPDdyxqtLXzp0uL+IsnJktLdJ2S1QwVqZYXVEQiE7xsNF0TIk+/6ls
	 yeRlMvItIfZSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C56680F3B;
	Sat,  8 Aug 2026 08:26:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E00D93A9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 08:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0BBA407C3
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 08:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOLDqBKGe_PL for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 08:25:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67530407C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67530407C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67530407C2
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 08:25:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c06f.dip0.t-ipconnect.de [79.214.192.111])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 888B7A4C4690;
 Sat,  8 Aug 2026 10:25:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57336)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wscNN-000000005b1-3tF2;
 Sat, 08 Aug 2026 08:25:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2026 10:25:51 +0200
Message-ID: <20260808082554.69837-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786177554;
 bh=FtJOrauE8INjEI3OecAUcg4hVAhESOAfq0TT1byhp4I=;
 h=From:To:Cc:Subject:Date:From;
 b=QHVgQqrdU8aqIfJgAnDJxiNJVT0S/dwWKF62bOHqOgn0GH/bk0DBpzPt9SBnqsx1Y
 vQx1+/4CSyw0SFfS3ODBPrtLq42yU94RtbZxThRyGsYuotWbbuuEN4XEjuHCQVjKiM
 Lb5fvhN0FIb5ROMyM4SRkEy+3IwTu+hqEr/kN70FkMXo7BoXk2HGlcwCvgmvrNjXT9
 gevvie9UZ1rfESeuUUeqs8Ymv5hp66fRj/kSqIx1DL8z0HNMDHAkQgCXO73RnGEkVx
 UoQfOCbFfQdji9qg4GznqYT5+mLo4a5RDWtgcGrvUZyvwVsWnLGbevR9Ma3LkRDEjT
 jyattrAMLArAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QHVgQqrd
Subject: [Buildroot] [PATCH 1/2] package/{glibc,
 localedef}: move to Github mirror repo
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

Downloading from sourceware.org/git/glibc.git causes many 429 errors
these days so we switch to a maintained Github mirror repo.

Fixes:
https://autobuild.buildroot.net/results/09e/09e760063607b1cbf4ef687bf9bbe17b12d648b2/
https://autobuild.buildroot.net/results/22a/22afc952e0c05648d538d13ea593e5ad8c4c03c7/
https://autobuild.buildroot.net/results/281/28159f29e38b0475ae33fe73a9cab04ea3a8835f/
https://autobuild.buildroot.net/results/961/9616d46c46bd2a10a6e719d76ed6e1d8e3b3d0d2/
https://autobuild.buildroot.net/results/fd4/fd48fb96639871889fb2238dba360d1740d7962c/
https://autobuild.buildroot.net/results/91a/91a0b7ccad116911f84281b4cbcb080309ad952e/
https://autobuild.buildroot.net/results/17f/17ff61f0eac946b3c027a540147b2573e224dcdb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a89ad86dd067bd62e16865d0e11e10dddab95d8b

 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5aa2ef5f99..e16dc426ed 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -8,7 +8,7 @@
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
 GLIBC_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
-GLIBC_SITE = https://sourceware.org/git/glibc.git
+GLIBC_SITE = https://github.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 732ed6d4ad..1924c5d00f 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -9,7 +9,7 @@
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
-LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
+LOCALEDEF_SITE = https://github.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
