Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E034D25053
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4307B61530;
	Mon, 12 Jan 2026 08:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qkmN44bk1C-T; Mon, 12 Jan 2026 08:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F9A561518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206776;
	bh=3k5BbRyg7L7Rcs3jTYBY9zHn7/I0HY0XiBwC0m5qGnk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e9ZmyIV9wvabI1Q9Gst/TpNa4Zl0StyhPm9+dw5tcnOXBv8L4A0D9sAeydY/wfrnb
	 TEuGwyo6nFGSLuDBI4TFP7n7Hi97b+f/qgx/8VXcw/WuR8xHy9W7PcxpNh2qA6ZArj
	 KWVPVVByCGF0HjSY45b+Q5tMmXmZOUxATmKQ4bqL4WvCJOSW26FMHkL4FGlp5REuxW
	 +vwneOwh6KKYCpe5s4K43eZi7RwfFj0kJwM8Cly2C07Y6pqRAB9U1foBNewNik7BAt
	 TomIesRPwHUbBGcsBQx1l78IAjbojJtovcdApdqXIcIfrwu5N/AetSvkYaLW0IDgY6
	 N0zPrmDdBr3VQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F9A561518;
	Mon, 12 Jan 2026 08:32:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A698318D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D89584459
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhR5Ylmvm61y for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 797438452A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 797438452A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 797438452A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:32:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1221A4C3B69
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-40RU
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:10 +0100
Message-ID: <20260112082950.2528445-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206610;
 bh=4+d4FBzazQB7/Kw2h+7mjKhnaParMDQX1QRdBrjuTTk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=VXOcAwjrIVjLErJ8Zl4SG3LY4qCKfo1D1cX9DY5iTMdvs1kTLJB/X97/5WHHvx3el
 kTsAvbFlFjKhZ7pgnt8dtG74jaAcF05HVqGcnRpofHkZ5G0faH7D++Q00u+I7f1Xea
 YEzwrzg4M8QxO/FWhcdSocau4VtP43UpeC6gAgAbghWg5oEklRTw/eaK6K4GvJIQBd
 fJpNKEt+azVuSElRr3E9swWQs1UvFD7ynxC/6m6vL0Y/jM95Az/GkQZgraNIEMrSP1
 ZsvvgtkFcHM1SNz/bcnwS/xDkf+ndLgZ01cOP6djlEUXIVZ1UjBnNoRT4MzTWneQbX
 wVpIn1gM8MxYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VXOcAwjr
Subject: [Buildroot] [PATCH 062/102] package/x11r7/xlib_libXtst: bump
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

https://lists.x.org/archives/xorg-announce/2024-August/003525.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.hash | 6 +++---
 package/x11r7/xlib_libXtst/xlib_libXtst.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.hash b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
index 7bdcdb9c17..5d4b60b31d 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.hash
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-September/003214.html
-sha256  84f5f30b9254b4ffee14b5b0940e2622153b0d3aed8286a3c5b7eeb340ca33c8  libXtst-1.2.4.tar.xz
-sha512  f2f4e01239b892b8e26284cede90feb4fe7738beb243bca0f6adb349029f8bf87b5a482911edcd2401733c92ef78eec07fcd455b92e5b8c4828374769e60098d  libXtst-1.2.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003525.html
+sha256  b50d4c25b97009a744706c1039c598f4d8e64910c9fde381994e1cae235d9242  libXtst-1.2.5.tar.xz
+sha512  848fa580d7abccd48c9ca3440f92e299839ada0912ed60d38d4d4f5bf37431cd02d7059265ab4e524c3e2cb9c368b9b90b863d1ed97d74979ef8811fc5e635a9  libXtst-1.2.5.tar.xz
 # Locally computed
 sha256  940190489c7a0e5ae3d83fc4fcbd79e0cd1b765bf1a4efd408293c1ee0332ceb  COPYING
diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index 47103377aa..4e019f75dd 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXTST_VERSION = 1.2.4
+XLIB_LIBXTST_VERSION = 1.2.5
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.xz
 XLIB_LIBXTST_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXTST_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
