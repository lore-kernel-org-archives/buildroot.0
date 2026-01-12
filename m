Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF99D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A469E61556;
	Mon, 12 Jan 2026 08:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cX_coBpG5StD; Mon, 12 Jan 2026 08:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C60CE615C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207305;
	bh=uWEBLwCfzxORGBkntdQrB4lb/90zL3ICcPL0qpdG2os=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fuxLOpKTqFBxRXvG7uYfhk2G9TKj0DIFYdbxhINcuHWjc2QTIib54X6RBIO0hj2rF
	 6Mq2IRqU5Y+MBQAjswOPmMHZ3gPNDvoz/2J0Ewjl7Z/mC2mqxIjqHJyQDmTDHUQzKW
	 xRZjqJlN1P5Ugefp8jJJnoPoA9nnT1q8NMwRqqSwGI700ck7SzOtJvQbhY6+SGZk/1
	 0h+6xCyt/FHwAdtwrEKj8SvXYs5Niv3oIAHAIve3168XU1jfwcFs0mcfeaouMnYl5f
	 EXOvezzrh/7HcbCBC/XABrTbPkWYjJEGfvHKZSrX7zHek2e697uVtjszMJkhC3b4PN
	 74TyE5eIven0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C60CE615C8;
	Mon, 12 Jan 2026 08:41:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 751D718D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67FF54004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArH7j1bn-tzH for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5CF4740052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CF4740052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CF4740052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:41:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF280A4C3F9C;
 Mon, 12 Jan 2026 09:30:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJB-000000007z0-1q8Y;
 Mon, 12 Jan 2026 08:29:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Jan 2026 09:28:19 +0100
Message-ID: <20260112082950.2528445-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206649;
 bh=1IrdgYDT3JrTIoYizIJurcYfT0DLOdwUBQcKCO/UUlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tBzKYCao7dB4cheVKKWzxfGxS8BqT1QXOHVYXnU4nOwXCgxOw7+4UGZAZiCg322yM
 Y2rJ86MgNQGNcqz5fmoiriYb31HYTOhyk2GO34jKxim9Sz1Q6pg6q+RcLyLys/eppH
 /osyYjC7wzTVZT+nRmqg6R0PpSBDLn0WuSDXG923iD0Za6qUxWBDl9bsnwS9Floc1n
 2mvLF2kzEU4WSMMPS56CacKhZ7qWo+n+v/VZKmnPHsBnMJLRKDALxxPT0DRDqmX3kO
 hqVQcpuBAArzB/jhMM9AesIJlUeo0lwrzuxfBoEBFcJKXpJrxegfoqmt6QnZ0Hvs6Z
 3zZhnSqKS2SIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tBzKYCao
Subject: [Buildroot] [PATCH 011/102] package/x11r7/xlib_libXpresent: bump
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
