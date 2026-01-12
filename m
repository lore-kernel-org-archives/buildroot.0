Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB21D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D878480EA9;
	Mon, 12 Jan 2026 08:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkvYo_XhwHpv; Mon, 12 Jan 2026 08:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D466842E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205829;
	bh=rjgSXb8jeXRZa/AD6hiHRlQYrvyMHTbFbhiDauKV0+k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbSmx+qWX6QEzhAPUrB4qooYB5aXO+wXE0x6D/Whq0ogot+KT1eIhOu9BztJmECEA
	 EcdRjOuH8SOnU3YXcJPRRono7EPiBmNGqRw4kJv/FZ/XBE2IV4n/PciPwXn1GdBpHk
	 vHnn/gcNxQpa4ERn5RzsGSzyHtso8B+uyQ2KSCYYAXHTwcmqYh9p6Kyf81qc3Gdm8C
	 WASFyDPw9MJlq7igcF5zrh/J8QIEr7ty8TK3yCoz0CRfT7NjuOIROjlQ6dS7GLTJQG
	 ViQhJ5Gn76PJYOQ78cvpAXT237Ta2XJR4tqWEqhTLb4sOb+byUSfGBQ+wBjp0jPBhR
	 tva1n1IVfNT8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D466842E6;
	Mon, 12 Jan 2026 08:17:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ABE318D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21B20842E6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9MKqo8cwJGU for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:17:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14371842E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14371842E5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14371842E5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 591F4A4C366B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuT-000000003M6-3RkG
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:48 +0100
Message-ID: <20260112080419.2516889-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205139;
 bh=FrF4ud/7ifQkNCkyKN5zE16Z5MiOoJpKvmmbEplfebA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=urLVzditl2DRtF1WSIr+PoWVwYvvywQ2BghecwVPL4Ng9qzZfrr6CJTA2dMOOuLgf
 Ih30ZybanTgTPZNHQkASOWRj0rwH4w4HhO3AfBs0xe7vjk6GfCWRsf4LIG7dYTfu9Q
 n7peU8Yfng1VmN7XheYTF1BfEplUrEEE7f3N3+hssgkXdkHW6Q6ExC4ZdKJiJz1yap
 3hBtO6DthP6HvPmt4Uz10Ub3Iunu/w88+X2UJcKGeGRicjicpgWTX5BjMhIPD5DdXm
 xohEKqAQkyNrKd0T0MVGSIhrINwICam/gU55hY1QyexgVqouzNxH/WHaQCECCMp4x5
 yipV3EpZzA1ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=urLVzdit
Subject: [Buildroot] [PATCH 013/104] package/x11r7/xlib_libXfixes: bump
 version to 6.0.2
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

https://lists.x.org/archives/xorg-announce/2025-September/003626.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash | 6 +++---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
index 03de906245..03f5838546 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-April/003382.html
-sha256  b695f93cd2499421ab02d22744458e650ccc88c1d4c8130d60200213abc02d58  libXfixes-6.0.1.tar.xz
-sha512  b46deffb30cd73ec8a127390d99f2ba2f3ab78f334fdba227f1f461441644a0c169b0d13ffa47576fa458780e7a6db664ff8b93e9195fb217262efd8128f1ffe  libXfixes-6.0.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003626.html
+sha256  39f115d72d9c5f8111e4684164d3d68cc1fd21f9b27ff2401b08fddfc0f409ba  libXfixes-6.0.2.tar.xz
+sha512  87542927ba9839fdd83282b0fba1bd2afae853ffe4e0f5f548915de22432bbc34a064578ba8527ba6041a993ee27390ba6ee2f1a957cb961717d45026e40ec75  libXfixes-6.0.2.tar.xz
 # Locally calculated
 sha256  a07d8a5a6972638a745a03983207a1052881c24eea29021fdca7794bea8d7774  COPYING
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index 3f535fc1d4..514cf97d75 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFIXES_VERSION = 6.0.1
+XLIB_LIBXFIXES_VERSION = 6.0.2
 XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.xz
 XLIB_LIBXFIXES_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
