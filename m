Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43451CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118ED423BE;
	Sat, 30 May 2026 09:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gqm_YztWAEst; Sat, 30 May 2026 09:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8D82428C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780132225;
	bh=1JafygY89ZFjOogsnVJnyovBErZ6kNECwJ/MMy574pQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KGdBhR4SYmBitHGOHGkHwonIkfAupqXyU0hBUtauPGeZyDubl85UkLt6n+G4P4xR0
	 sarqYsaiUD3NkJGiEeMuXczJbI2hv6jtVBzI7dvplOx7g+nEgbyx6KNttHW90LnSu5
	 CN9+DY3KE2HMYQV/C1umHCgshF+Zc7GXNY0lQMBif/3KHv/uAcXUrj989IxNlt8rqP
	 OFDU2EhsiGSzLoGLF2FqCtvKpKk6deA8HETVkJ2bIas3uFySbz//JmQ79XWKPmwOWO
	 /CfbUNQS6DhjOm2feNm9kWT5y4efEDF6HP6f2F+HVY21N7QcL8x0XmukRw78Tjd9pY
	 vezJTnw82Nzdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D82428C7;
	Sat, 30 May 2026 09:10:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40AD8D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 213328523E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDtajNtmkziN for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:10:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38388851EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38388851EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38388851EA
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:10:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8FBBA4C0A1E;
 Sat, 30 May 2026 11:10:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47094)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTFhy-000000006PQ-3P5A;
 Sat, 30 May 2026 09:10:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 30 May 2026 11:10:17 +0200
Message-ID: <20260530091018.589175-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780132218;
 bh=DCAWDX+v+3/vgum6gwa7qIsq/Iuz08UpSDmHkop9E8o=;
 h=From:To:Cc:Subject:Date:From;
 b=aH37+eQtHGINFxrZ2iHti1g4Vs6FkW1VKg/zefEZc4NbNbkycymruYR/IOFPHIbKm
 F0YaHMKNnBLj/1NlupUfKg5bxC+HhpqeQsvNAjCGg16YBeKHeMqOEokaD1RjTGL20I
 XBOifFeqfX1ge8Qfvg1Sdnft+ziEWZxRBe2PTg127+crlYwtpFP/ZJyOkmYGRgNdEd
 tmKuTVHHBeWizpSqzpXSP//Wqx6dQGBOJyvtFFE/zeKR8YsrvjaTl4pLE8aph7AUuI
 PncRN7MvLBkeJtVfV6zOGMTVw83BU+ppdQrXLstblVugFh4LesWNUtZFmYjbSsvqIB
 2zNZQIrHDTWVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=aH37+eQt
Subject: [Buildroot] [PATCH v2 1/2] package/libdill: autoreconf needs
 host-pkgconf
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

Buildroot commit 106e2b448c5249aa905aeaa0a5a1d1f87cf8f694 bumped libdill
to include an upstream commit:
https://github.com/sustrik/libdill/commit/b3b81d2c7bf4daf8a57925ddd40f5b6f13484187
which added PKG_CHECK_MODULES to configure.ac causing an error during
autoreconf when openssl, with host-pkgconf added as optional dependency,
is not selected:

configure.ac:119: error: possibly undefined macro: AC_CHECK_LIB
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
configure.ac:127: error: possibly undefined macro: AC_MSG_ERROR

Fixes:
https://autobuild.buildroot.net/results/05c/05c6a3f5a9290f1e5e4f62fea13a0f4cb1278c04/

The first build error of this kind occured on 2022-08-21:
https://autobuild.buildroot.net/results/a29/a294492db81b6fd105dac88d8f5c8bc1a222bb8e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Series passes Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2563402770

with the exception of bootlin-x86-i686-musl for which I could not find
a fix: https://gitlab.com/bkuhls/buildroot/-/jobs/14613121682

This build error was masked by the other bugs which are fixed by this
series. It can be reproduced with this gcc-14.x-based defconfig on the
master branch with the autoconf-fix added:

BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_PACKAGE_LIBDILL=y

 package/libdill/libdill.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
index 9dda81d085..bea9aaeecb 100644
--- a/package/libdill/libdill.mk
+++ b/package/libdill/libdill.mk
@@ -10,6 +10,7 @@ LIBDILL_LICENSE = MIT
 LIBDILL_LICENSE_FILES = COPYING
 LIBDILL_INSTALL_STAGING = YES
 # Fetched from Github, with no configure script
+LIBDILL_DEPENDENCIES = host-pkgconf
 LIBDILL_AUTORECONF = YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
@@ -19,7 +20,7 @@ LIBDILL_CONF_OPTS += --disable-threads
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-LIBDILL_DEPENDENCIES += host-pkgconf openssl
+LIBDILL_DEPENDENCIES += openssl
 LIBDILL_CONF_OPTS += --enable-tls
 else
 LIBDILL_CONF_OPTS += --disable-tls
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
