Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CFF46C66
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 18:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D69938104B;
	Mon,  6 Apr 2026 18:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDnQguiPLGlP; Mon,  6 Apr 2026 18:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2707981028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775499754;
	bh=sJurT1sp+mgXOh5R06HaSxim/QxIrXd2E+DH7SogP6U=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TvEseQlomdxXmfB/WpGhgr8PTpKM5x/9F5k+oNmJxOiTCVNVFdjgF2oW9RVYDkn9O
	 SfFSY49P4dzb9TA3CmjHrS2QX9k/tLE2pLtEFFTt/u/EeJa8zL54emT3FI5p00VZx1
	 clZJG538+AlWRJDjbQkrhDXSbVFj80JzaWoYqJVf62js0gS8xi2pMW9pOUjYtej5T0
	 g03MUy2ZQi9srjWDM5Q2Wl9w4Wm1bBb/c0GohotaCSOFEYyrx82jWe10SH37jnUTEH
	 3wNIMLTZ0deYNG6aNmxC47uttOtfnuL0pn755XK72PWmrfFTX63ewW/57Fp/mh4Mq1
	 1vgkQwbHZ26Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2707981028;
	Mon,  6 Apr 2026 18:22:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DED21EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E5E681028
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0ohIEPGM4x8 for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 18:22:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1D7981013
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D7981013
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1D7981013
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 18:22:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7EBD4A4C362E;
 Mon,  6 Apr 2026 20:22:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40236)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9oaX-000000001kA-0UJL;
 Mon, 06 Apr 2026 18:22:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Cans <laurent.cans@gmail.com>, Maxim Kochetkov <fido_max@inbox.ru>,
 Phil Eichinger <phil.eichinger@gmail.com>
Date: Mon,  6 Apr 2026 20:22:05 +0200
Message-ID: <20260406182217.1853895-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775499737;
 bh=iDgkban0eaib51CQhcLR24K10aJCTXKqo+1nfjyZbM8=;
 h=From:To:Cc:Subject:Date:From;
 b=NljkU8f9Iko20bJRuj98hDQ4PIBG4dG0Ga+3Pgq+gGeCrYhDr0tQcDjlckXbmw4MU
 tc+72PITjLqF8aItmYBN8/2NhALmDyPcnPW05bgmPezx2vgPplvDMP2Lkb31C1OyXg
 QCeti5sTp5M5/+8YB9fy7MR8N/pOcV409ETpGQAKkB2cgOwvs+xCVo5C5FU4uHaO1z
 pnIKknGjenRFHkJ7XGClbVb5U+sKvark09cMwj7DGYMMat/H6o8wSKn2B6SRRggaWr
 eLufo5Nh32QwYIqAZImCk47VPdKbc/OaQgRCqA6ifsILrKBYdSWo+EF3GmyRMiZorx
 63r9BKlZfSrZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=NljkU8f9
Subject: [Buildroot] [PATCH 01/11] package/wget: remove optional support for
 pcre, keep pcre2
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wget/wget.mk | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index e3143647d7..de03ec9cef 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -12,6 +12,8 @@ WGET_LICENSE = GPL-3.0+
 WGET_LICENSE_FILES = COPYING
 WGET_CPE_ID_VENDOR = gnu
 
+WGET_CONF_OPTS += --disable-pcre
+
 ifeq ($(BR2_PACKAGE_LIBPSL),y)
 WGET_CONF_OPTS += --with-libpsl
 WGET_DEPENDENCIES += libpsl
@@ -63,13 +65,10 @@ WGET_CONF_OPTS += --without-cares
 endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
-WGET_CONF_OPTS += --disable-pcre --enable-pcre2
+WGET_CONF_OPTS += --enable-pcre2
 WGET_DEPENDENCIES += pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-WGET_CONF_OPTS += --enable-pcre --disable-pcre2
-WGET_DEPENDENCIES += pcre
 else
-WGET_CONF_OPTS += --disable-pcre --disable-pcre2
+WGET_CONF_OPTS +=  --disable-pcre2
 endif
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
