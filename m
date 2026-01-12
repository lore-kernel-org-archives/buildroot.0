Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B99D25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3370843EB;
	Mon, 12 Jan 2026 08:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8rkvuMXpvFe; Mon, 12 Jan 2026 08:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AFD780AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205238;
	bh=3k5BbRyg7L7Rcs3jTYBY9zHn7/I0HY0XiBwC0m5qGnk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQj2xjBdM9uZrl6imzGeNwDG7xkAyP4YyIk0TjiZzd0iy1PDbxtjRO4DWCgEGY3gb
	 o86S3Dv7KWJd1pb2OE5gd9+AyVCKm+/cv3nHH12aHNPlYG6WfOqWTY+LqcT9wBpAaL
	 W8Uhw6UCEA7Vn0KvWrNISuIu2oyuwPBUuxsVfvh9cD/tAOTgFtHzFncsEOUNpZ/JZY
	 TqsZ4BUXEFGkJghxN2ALwVADk3wQtt8HaXN2oAujBarxthbkBNb0QmuEqwWYWcTDzR
	 ovEo5LKORQmJAcqz2HebAVEVQhF9zVLJg4xwhLNNZUtlk3UlfWglN97VhZWQ+H6ciJ
	 hohykf3fBfhuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AFD780AD1;
	Mon, 12 Jan 2026 08:07:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2759A12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1973B415C9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZLmtaPd04hp for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:07:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 120C0415C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 120C0415C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 120C0415C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C556A4C4297
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-3rFw
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:38 +0100
Message-ID: <20260112080419.2516889-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205093;
 bh=4+d4FBzazQB7/Kw2h+7mjKhnaParMDQX1QRdBrjuTTk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=rcO80QqmvPTqA6Q5O3o/OZQymTVlr1TRXiC/6Jg5IyNbBxA518Ckxj1deJnTLyhkL
 fQOR/NRpx+vuy/dNhHr8iNlnpDu84+ssWiOWWXM1jp1MXm10e3syy2uzIVaTjzOd+D
 MwCpWKbygprvIIDGwnhHqV+GtzlLKsBQMZycKZ+KVs6f8qHP/j1nCee1WZfhvrcnfs
 4gmlyJrzLw+cQNMUKzOhlQeizxifH6Ljs0xYb/g9UfjquugVXCY9YnaVqPFWUq1zwm
 ln3v+/6KRSCfxn3B4wMjtt7urZOQNF4tqtjN6I+iSFRFzhlcIIV3gs/1+xGWdjuUKn
 WELJtNpeJfDCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rcO80Qqm
Subject: [Buildroot] [PATCH 063/104] package/x11r7/xlib_libXtst: bump
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
