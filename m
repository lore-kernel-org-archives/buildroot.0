Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40E4D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C1961565;
	Mon, 12 Jan 2026 08:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjnMbkZtF2wH; Mon, 12 Jan 2026 08:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BA9461509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207137;
	bh=anTH/SWytsy6/GXB2MkOPfxVWr05KLaOXh8XAWQx5YQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ameRJDvw/vcdHK3xqWmtnb0WM5ywkGRI0sdOVmIU1lYpMtwJMyvjdiVuMsVATVpyz
	 +rsiKpKqAjJOFzkmMv8AWDwBalMBH15AoRiGeFlzhcmqvXwxEJiw2cvM7qyZohqaHc
	 On6c2XJhhYzHpPhanZ2pPAbB1CYBd5UumDs89FmMLjh/itIeeDYDIrn4MbH4OErHdj
	 9TcxOLU6jVQxtj5ibakvMhdzDyf0IFmzwV6Xtw7iSUYCKyKkzFU2+sVdA7rRck/qGG
	 rRm3faeZjVxIcbpaSsdoboXqxoLb1oWrJRZHDvFqV1vLOeVlB0j6nliWmkZnZ9JIVX
	 2IvOpFvd4C6wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BA9461509;
	Mon, 12 Jan 2026 08:38:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B581D1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CB3E84594
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fBkvefjdoNe for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:38:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9381D814DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9381D814DB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9381D814DB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 19DE5A4C3CC9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJH-000000007z0-0hV3
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:43 +0100
Message-ID: <20260112082950.2528445-95-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206635;
 bh=QMKc3dXK+ggr3YIpAyfE50oEyacHW9ArwWn/S/vqrUM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=g1+TJE5t+a5fjyfA23qbzzd+3Y4hkxweIIJKRPvuQY8J1AY8XPQCneNQwB0FhIyMS
 SEoYjAAm+Cb37G/x2pNuvV/dtvBt4LeCAaG6Hbo+SamEQQkO779iWZizxgt9HsGMzy
 bQ+AtMGOiDaHdmRwyQvZf2si7rR6eYeHZmopH8TwVX4V0v4T0qr19jQDvXZLy9q/Cn
 3VL/6wannpHKCajBvvTbUqyIaeL/OuS8BeZiGEymMk34Kqn3GlE4Zie9J7UQgjcI9r
 9rsFNfQIdlQmQ9N6xXyqTwFwQUW14c9kXQ9fkY1XXsoKxap+ll0kLcy/o+5dgPt3OE
 dNypQ3zdxEnYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=g1+TJE5t
Subject: [Buildroot] [PATCH 095/102]
 package/x11r7/xdriver_xf86-video-siliconmotion: bump version to 1.7.10
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

https://lists.x.org/archives/xorg-announce/2023-September/003421.html

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-siliconmotion.hash                   | 5 +++--
 .../xdriver_xf86-video-siliconmotion.mk                     | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
index eeff39fed1..bc664d85d6 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002763.html
-sha256  d0f3c691e71108d27a061beb62bf78b36ec35bd755905692734dd68cfb3359bc  xf86-video-siliconmotion-1.7.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-September/003421.html
+sha256  16059c7833a288da43b1d179f5edd2b633e3b102bc5113488c5d41dd71158fc0  xf86-video-siliconmotion-1.7.10.tar.xz
+sha512  d8bb90e636598ed20a32bdc049fe42420d9e6093429f09c3a886a7e78d3813c8533abf67c4fed084be97dd7553a1934c49aa9f94d1083dfa64ab36867ae55fca  xf86-video-siliconmotion-1.7.10.tar.xz
 # Locally calculated
 sha256  e1e3ce7ce1f63fff96444206e09c8490ad7a4af7457c81ea6cdee4f1fee1f960  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index 65fd846535..e84173d120 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.9
-XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.10
+XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SILICONMOTION_DEPENDENCIES = xserver_xorg-server xorgproto
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
