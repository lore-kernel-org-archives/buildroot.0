Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732A6D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 436EB845CE;
	Mon, 12 Jan 2026 08:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swGCyPKDgrQl; Mon, 12 Jan 2026 08:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D54B884538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207184;
	bh=X4fF0qeceTMZuzD8kI/tpHq2ILXKsJR+WHy5g1WV5oc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FFnAP7zkS6zno+JklIiCZh1BknyMs8/NxkNnKLpO8+aA78LAYTvGF4SD/i/LiO65q
	 ECaPSYh51LJTBiFZsfNyt4kVKZhFF1b+T0rL5aHD+mrD1DTf1KgB6I5m/EwkPDNG/q
	 h/197eQkLSFLsGzmrhbF9ZM/9RY1SFHZFPOIfJ+5C4tthANoqGkYdCqULYP0gHiL4O
	 Pfk9SriWtYX0NdbFO7dLy0MLJj+tx/Mn8CmVtf9rxqHbe68p1sRaOWEqE2KimSz9sk
	 NnOT8YzDQ4xHuKUYQS93m+2LBhUELQYHpKNetRrv76MPCtB/sY27ZU4g708d+lTXCi
	 FtXt8ubYtIcnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54B884538;
	Mon, 12 Jan 2026 08:39:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6892C18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B0E261570
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOKUsoqTkmdz for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:39:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 420BE61565
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 420BE61565
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 420BE61565
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:39:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74151A4C3DB9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:38 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJH-000000007z0-2E3B
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:48 +0100
Message-ID: <20260112082950.2528445-100-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206638;
 bh=Vjaibw6nvNb+E4QqClj8ZIyTpca8sPnAwbmtmIhrV4I=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=P2RH3eKzmR5hU7gkWWCV7ITqVi2a7uTvbSYU+7FbmzBkuFdpkNc24PicLG2ndyIVm
 kNjCGUQSnKDyky43dn0qIyYxD+iA3YTmlBRJnK7LyD5TN26pSlHpgSNkol9I/LTPJi
 eMDwWPUwM/IewLcFmOF3LpBvQLkD/gB55dWI6BP2Np5osaelHo3Fdc2luKZZt5S9BW
 2SqK8K/OZRpcVbwthgvUsgBHul6lVrfOexY4VSAES5cPaqhkfcqoS30Rgq2k1WG9sC
 lWzbIFdNbjAI41h1L2OFfF5UHMCdMGs/TC3xBOsvwNuv7+HxxIymROMPCrewOgVaSA
 vTAyfNmH7aSjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=P2RH3eKz
Subject: [Buildroot] [PATCH 100/102] package/x11r7/xlib_libXvMC: bump
 version to 1.0.14
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

https://lists.x.org/archives/xorg-announce/2024-February/003456.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.hash | 6 +++---
 package/x11r7/xlib_libXvMC/xlib_libXvMC.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
index 15221969e3..12099ffaae 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-March/003132.html
-sha256  0a9ebe6dea7888a747e5aca1b891d53cd7d3a5f141a9645f77d9b6a12cee657c  libXvMC-1.0.13.tar.xz
-sha512  c9d0f73884a586efb9ea4f77fc8555f60d940077d7dff8eaa765b86345c8b4e3d80b860f68191d2830c272b9e464c08450fbb51bb64819753a6f4228c71861ac  libXvMC-1.0.13.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003456.html
+sha256  e4be9eb6b6bafdbbf81f47f7163047215376e45e2dc786d0ea6181c930725ed9  libXvMC-1.0.14.tar.xz
+sha512  fc76c6d591780f3481f5032d1f956f2043f3dc7655a4b776dfda4bae55d4424a36d1a3c63dafe2a851908f33159297c0b038a41329d7a137ca7ea73d3db3eedf  libXvMC-1.0.14.tar.xz
 # Locally computed
 sha256  b7c709df281675a07eb60a71c5fa2599d1ef538eb79ae7ad6e774b10e4a804c4  COPYING
diff --git a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
index c1fe31277e..1accda1254 100644
--- a/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
+++ b/package/x11r7/xlib_libXvMC/xlib_libXvMC.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXVMC_VERSION = 1.0.13
+XLIB_LIBXVMC_VERSION = 1.0.14
 XLIB_LIBXVMC_SOURCE = libXvMC-$(XLIB_LIBXVMC_VERSION).tar.xz
-XLIB_LIBXVMC_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXVMC_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXVMC_LICENSE = MIT
 XLIB_LIBXVMC_LICENSE_FILES = COPYING
 XLIB_LIBXVMC_CPE_ID_VENDOR = x.org
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
