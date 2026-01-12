Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB02D25047
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0D3F84419;
	Mon, 12 Jan 2026 08:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMeecpm0v3eM; Mon, 12 Jan 2026 08:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDDA084457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205601;
	bh=ZG62jd19jJn99VwHC9VmA57KiNS3gmd5lNGsfeumcaY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IpQZRtgiQwPEGUE2Qk+Z3IWUhV4/VCd+eZ3BfFli1KrWwEXzKlWYUPHbgFWUIyDgz
	 htuPtZ4DgICEnoUD3TWUnER4aIDHgxzYd/xsOXvDQmS+GIUBhCW2m2LZXTh2zJ+Yed
	 VG6rPS01AsdAPyXYMqsltASAQpuFYeFMy4dy0BuQwjfe4svye6egl3BsgbXTtI/Xvh
	 Taub8ezzTl6eRNm8f5PAJ30OiWPm6sULXJ7yuAGvgp/6UcVSiOlZ0Vhi03/CWhVBVU
	 VT/S72nLYsWBI5amIVe2gcp8hLKksHoP6XvAicFjpJzJChTQP8H56r/RgJm6w/oeUu
	 ibPvtlFFfX8bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDDA084457;
	Mon, 12 Jan 2026 08:13:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F06412E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CD1884444
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4xF8-kNWjPJy for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:13:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0887880DBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0887880DBB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0887880DBB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D2AE4A4C3C4B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-0MlK
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:08 +0100
Message-ID: <20260112080419.2516889-93-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205128;
 bh=np1RdNL6BM4WorVVxrQYX76s6jbd40HgVWyVCzA56QM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=rxz0lXoxzkL5uCPee1+jQIAQpGOZSewWnbBi0qInqG5+oxvW7MAHPxZzBH1bTggsU
 vpdNjC9qIZvKiLQUbTd4kLzW2CBd4juG/EEpKQijXlhF6RDJXOZqHg1SW1IdJmgNvD
 3pGj2hewdNObz50QzYhh2LY3LEKgehjSyd31fBftrqdzsSGiVuxFzVbKB+X1/OlLzY
 eoKpWmLWNN0CKd2qCAzHP+p40Z2wrwfYQV7djTAlQuNCG+hz6jxxAE8734snU6xHjk
 TX8Yaikxy0KHIPJCWPq2foRussgRok1IA3wgHq4hypBZXvDzxCjAB8NFfhn5cKktBy
 q1kpdio8YTnEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rxz0lXox
Subject: [Buildroot] [PATCH 093/104] package/x11r7/xapp_bitmap: bump version
 to 1.1.1
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

https://lists.x.org/archives/xorg-announce/2024-February/003447.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_bitmap/xapp_bitmap.hash | 6 +++---
 package/x11r7/xapp_bitmap/xapp_bitmap.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.hash b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
index 8953bfc5f7..8cfb8e6049 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.hash
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003162.html
-sha256  8e86879c2feeece3f10e189330479cf51da0dd268355d1e3ee8a8497ab833690  bitmap-1.1.0.tar.xz
-sha512  3d6c94675f10772daeb71598c3e0ddcb51569b1bfc4771159e9df89599bfeb8bf49f464c24fef54d30a8f737af32136f859f844be03e088d24ed962f88381193  bitmap-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003447.html
+sha256  63d42eb63fe48198b39344af49949e5e424cc62ce8d722781fdad4a4fa3426e6  bitmap-1.1.1.tar.xz
+sha512  69096a73739019545f2eb44b823e659b84377cf7c497243c89cbf3f26c9623c31fecfa36628022d241a581a5930e9e2394ec116e5c6d9df94097b45661261307  bitmap-1.1.1.tar.xz
 # Locally computed
 sha256  03be44611edac06827bd13c0815a67ecd37ffe8fb1b9e210d6545d79bec89a3a  COPYING
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index ccc438560d..6dbccab23e 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_BITMAP_VERSION = 1.1.0
+XAPP_BITMAP_VERSION = 1.1.1
 XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.xz
-XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BITMAP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_BITMAP_LICENSE = MIT
 XAPP_BITMAP_LICENSE_FILES = COPYING
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
