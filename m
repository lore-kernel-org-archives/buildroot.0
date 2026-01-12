Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C87D25046
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85CED614EC;
	Mon, 12 Jan 2026 08:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1X2xmWN1PIdW; Mon, 12 Jan 2026 08:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0735761445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205625;
	bh=EySRzzlRShCPySZG44a2nowZJvfGRH9g3Lx4RgsC6Co=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DvM4KjbnUwOQyQnGNSHKNV1w9gAqqPaK6QdwFLpNQV7AYzahtjFS5R2//Ov7CcpCX
	 1X7rJHVAND0CJORJyG+Md1oUsBQUx9YX1dWyBcNWtOsYo48FaVtT1tgjfyb7hmwLVO
	 XDwPdKDsShXlafJhh6yRieJJNSl5sAlOdAMKtw90/63CM75QKXnVW+ka5MD6XJwyUg
	 GBS+Bg3/8Pu7nAxjiPOix7j4cHJ8X0I93lVhE/NY9N0mWyggwWIeO2feQx+6m4Oo3i
	 wPHCFpMLND5Dxkp1Wi/youvcxDbO4OYc1zp8Vg7JOElE/R3WP8mct61ZSE4D+10qKz
	 uBNm79uqeFLbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0735761445;
	Mon, 12 Jan 2026 08:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38F3718D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B6464031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gV7B-rAQ6dhp for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FB694013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB694013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FB694013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:13:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8C43A4C3C5A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-0xzg
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:10 +0100
Message-ID: <20260112080419.2516889-95-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205130;
 bh=FbTdvVBNVebCYdkKT0YcQjUJtcWwHBs5Bj+1uFVkGrk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=syt9Q1hsTUczGhGTw3y/dCrGsbU0wy8n+LK+MmrWjhDpXZRB69MhXD37mVhri0eFo
 gJBVBko34ELY4f799z0lvDO54poV1S/gIfDHy8oSX3a5VFSJuTIl0DKD7d4Ul+KAzM
 UHRfCGQ85SX0BzW6T3DJSmv5Yy0xMWBwoyaopL2lfc6yfpzOP/uAofiNUpO1vZTCFf
 rjoJtIGn5bUVPfIURVv2lxh653+F0x7YgS1Oedx96jptlsqPu3FCJhEVUkzbnF6iH5
 pKWLco05+QUtPtiDHP/FtaxoKmE6hHILQmZJG/qzdO+KWNEV6ObZ6qHIiCsxqml9Kj
 tEBoXOZcr+GPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=syt9Q1hs
Subject: [Buildroot] [PATCH 095/104] package/x11r7/xlib_libXrandr: bump
 version to 1.5.4
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

https://lists.x.org/archives/xorg-announce/2023-October/003427.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.hash | 6 +++---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
index 3d3bb640ed..e2914eabd7 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003262.html
-sha256  897639014a78e1497704d669c5dd5682d721931a4452c89a7ba62676064eb428  libXrandr-1.5.3.tar.xz
-sha512  0c385fc304a872048ffca5cfb8789dfe3132e3126894d54b2fe642dff19d286e7ade1d2f6da894e03788df9c5cf31427c674e987143037b7d385b19285590edb  libXrandr-1.5.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003427.html
+sha256  1ad5b065375f4a85915aa60611cc6407c060492a214d7f9daf214be752c3b4d3  libXrandr-1.5.4.tar.xz
+sha512  f7c0b083943e11b4cc3c97e10e2cbbc3920fe0c9c5031ef86fca2eb5df413d767caf53dca266abf65395eb10e55354c8fe59ed6b3265402ffccb919a813bc781  libXrandr-1.5.4.tar.xz
 # Locally computed
 sha256  73777e5be1cef2827d843e4b186803f050c66db472cf8076d88e2b5f71696e67  COPYING
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 5e88173ed7..20b6805b51 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRANDR_VERSION = 1.5.3
+XLIB_LIBXRANDR_VERSION = 1.5.4
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.xz
 XLIB_LIBXRANDR_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRANDR_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
