Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC5DD2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F00660610;
	Mon, 12 Jan 2026 08:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTJD6pcrBwVG; Mon, 12 Jan 2026 08:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A623760762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205152;
	bh=+hGB14t7ojGlYyP3SSUfCG7W9Rs2yoYeh6ygeGqP0F8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PJBFUmShmlGpgzf+orDApuOIEP5uEP+cuOACOtl/15fnFfTxYvsbLgCsptdaqOyGL
	 Vh5tJ8qhGg9P9dJHh1Z6wYzAjV+edSWSEswGVNgEJWp4lz5ORsPxx3FPFBK8Uy8Ux6
	 fE0KrMa7NAa4kQHemfdb5Q4PRe1DesmxHaHXMzF+X4Ev6quRc2uc7R1ooYgfdQ0LUn
	 Qdh/CtntuwLBukW7yvYSLcgQ6roHyD67QMq5yb98FfALST7W4RFozNDj8yi8gsRHHd
	 y9/BYVU3A5gUrnKuDhuNo66eiwIvZb/7m4V0SUSfvoKuJVyQlpCiqFdnisBh3gSTdc
	 gZ4vn1uP1tQ8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A623760762;
	Mon, 12 Jan 2026 08:05:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE24912E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4DF360610
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1XVLNGrUzrA for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:05:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC2EE60762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC2EE60762
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC2EE60762
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:05:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0779A4C41A3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-1q1q
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:31 +0100
Message-ID: <20260112080419.2516889-56-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205081;
 bh=7pCL587MKOgxUmgXeoQdNZsVx3r4o3ClqVPnjeWGjZ8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=SXrN0GaEMmwxxFKpJ0bmo1XaWaqfGVX/Ysudz0WGTbEUBuvHmxFKEFmCrdcKcSfQ3
 39RvHqME051p+Cmk8LBZVgptG+adDJREDdH6ZpO/ZYRM4PhF0xTAT9Mzf7nk8bNu6B
 aJDdjZ2egLiU7sB6AICSE85ihCprihpAygk05DxeOkMvWrG3MD+GGxFO2brEcLTs/Y
 ArOBVZi2bo4xoqVEeQBLkbgAYsE88hAn+22DDVXVAysTk/IXlenuvB5+dCZNF2LCpx
 ZNlgx3+I4TL7HA/jsTh3zuMcXN9oaJWSotWiWGYLP+DaHiO7z/dZYI5vlC20C2+bTE
 AVFnVsxF6SuIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SXrN0GaE
Subject: [Buildroot] [PATCH 056/104] package/x11r7/xapp_xwud: bump version
 to 1.0.7
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

https://lists.x.org/archives/xorg-announce/2024-October/003537.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xwud/xapp_xwud.hash | 6 +++---
 package/x11r7/xapp_xwud/xapp_xwud.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xwud/xapp_xwud.hash b/package/x11r7/xapp_xwud/xapp_xwud.hash
index c47d6d881e..45bfe2710e 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.hash
+++ b/package/x11r7/xapp_xwud/xapp_xwud.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003179.html
-sha256  64048cd15eba3cd9a3d2e3280650391259ebf6b529f2101d1a20f441038c1afe  xwud-1.0.6.tar.xz
-sha512  a7b964d9ef13e4726b2ef84dcc1040cdf510c8031c3e6e1dc1c711e65d9e56f1fc5921a7af3dbbd898b861c79e9da6242da23c2e73816e39152ae719052293e9  xwud-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003537.html
+sha256  e55cbedab36d7a5f671abf8e594888afc48caa116d51d429ea53ea317ec0c61e  xwud-1.0.7.tar.xz
+sha512  3c910fc170f6f6373d426aa5532bd3ede6d83efab06a77c3a43a92aa9cfae9a5324d5a6ca1dfcc8941be6895b6769b3a7beee8081815000b57f93aa1b4e7c420  xwud-1.0.7.tar.xz
 # Locally computed
 sha256  be3db9aa060c462490a8c1ed44a4d059b32bba359f4688b1ecf3f794d363539e  COPYING
diff --git a/package/x11r7/xapp_xwud/xapp_xwud.mk b/package/x11r7/xapp_xwud/xapp_xwud.mk
index 0ad001d970..8926576acf 100644
--- a/package/x11r7/xapp_xwud/xapp_xwud.mk
+++ b/package/x11r7/xapp_xwud/xapp_xwud.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XWUD_VERSION = 1.0.6
+XAPP_XWUD_VERSION = 1.0.7
 XAPP_XWUD_SOURCE = xwud-$(XAPP_XWUD_VERSION).tar.xz
-XAPP_XWUD_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XWUD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XWUD_LICENSE = MIT
 XAPP_XWUD_LICENSE_FILES = COPYING
 XAPP_XWUD_DEPENDENCIES = xlib_libX11
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
