Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492E5D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20A0C842E5;
	Mon, 12 Jan 2026 08:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6PfsY8DuwPSt; Mon, 12 Jan 2026 08:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B35A842E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205817;
	bh=uWEBLwCfzxORGBkntdQrB4lb/90zL3ICcPL0qpdG2os=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qlKyO12l19niZ1Z3GgkUid9UEH7w0qojgqU3pxK2hVm5kpontP/wYyydjS/4FARid
	 5mVLYvXMTjXbNitIO/tIU6VYusXQBFtkYKd8r9S9KEd4z0ibJhRI/9bhMWy3pflHcp
	 /Q0aZqt2Q69b+6F4GxFvun4vC0eS/5oe9ejVXHMEAV9YASI/q4erl7+2RG5521cbhO
	 TyQeDLFLeEBViy9FaAt+xjPIRT0QG7JYfXBmSQ5A7ZUnvM7T1eTSvN5d+5aww8sTQP
	 po8z30RTHccGqKzaBMMiE+gL/oZqlkg2Z21FFy/EvNVlMO0LETsBePmAhnsQ1uokVh
	 t2QttRDwZae8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B35A842E6;
	Mon, 12 Jan 2026 08:16:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1699C12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14903842E6
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgJcRHXVHzJ4 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:16:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0119A842E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0119A842E5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0119A842E5
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15D5CA4C3DFD;
 Mon, 12 Jan 2026 09:05:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuT-000000003M6-37sV;
 Mon, 12 Jan 2026 08:04:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Jan 2026 09:02:47 +0100
Message-ID: <20260112080419.2516889-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205138;
 bh=1IrdgYDT3JrTIoYizIJurcYfT0DLOdwUBQcKCO/UUlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=etBUpqF8EMI9rTAHCf9pCCGnxg83RItTRQKojOqbVcI7jLyn7PGxp0CUZFmXPyGnG
 DQMMINnGENEnfxn3nKJy2iJB6D7YMbaSQlz6gh0PlDNLUpR52WrKM8jt0y0Df+LZSQ
 /1H2VwQGWRIuIc78ZLs2nZfaB40P5u9pbR1aLIsKNYs85TfmbjckqpbE3god60NAoZ
 j96/L6MgsXX9fxl3IRO9+x1jUlgy52FE6ftvYlI+RD3djes8hjrLSUfxiLL7ZGLJFK
 Fkrp1sBYiGTesZyxuDx5on4cspginvkTDJgkrD+P+mXBRB2sMtcEqj5N29c2WqnFc5
 sFULYWla7UDQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=etBUpqF8
Subject: [Buildroot] [PATCH 012/104] package/x11r7/xlib_libXpresent: bump
 version to 1.0.2
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

https://lists.x.org/archives/xorg-announce/2025-September/003627.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/x11r7/xlib_libXpresent/xlib_libXpresent.hash | 6 +++---
 package/x11r7/xlib_libXpresent/xlib_libXpresent.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
index e7f6ac9e5a..ae0dc6916d 100644
--- a/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003225.html
-sha256  b964df9e5a066daa5e08d2dc82692c57ca27d00b8cc257e8e960c9f1cf26231b  libXpresent-1.0.1.tar.xz
-sha512  a4551f49a68f4487eb70dc5b50b7f745fbc8b6842cfa60422afe3834af41c504a37bcfddb4e7e9ee084b250df256034290776c8eb7d8838e392eb626fff55d25  libXpresent-1.0.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003627.html
+sha256  4e5b21b4812206a4b223013606ae31170502c1043038777a1ef8f70c09d37602  libXpresent-1.0.2.tar.xz
+sha512  7e12c386e5d1404db359f8004a141223b4c08a138a5589d087537ca667e9dd5cdc190f170a5fa991c1f8dd022896bb07bff540e262a0d30d542a3faea06d8c93  libXpresent-1.0.2.tar.xz
 
 # Locally calculated
 sha256  d64e671ffeb483d4543f98c842788ab34c77427e27d83d6b082065a4438d4885  COPYING
diff --git a/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
index 4cb4fd193a..4caa0f544d 100644
--- a/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
+++ b/package/x11r7/xlib_libXpresent/xlib_libXpresent.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXPRESENT_VERSION = 1.0.1
+XLIB_LIBXPRESENT_VERSION = 1.0.2
 XLIB_LIBXPRESENT_SOURCE = libXpresent-$(XLIB_LIBXPRESENT_VERSION).tar.xz
-XLIB_LIBXPRESENT_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXPRESENT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXPRESENT_LICENSE = MIT
 XLIB_LIBXPRESENT_LICENSE_FILES = COPYING
 XLIB_LIBXPRESENT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
