Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B48D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D976075D;
	Mon, 12 Jan 2026 08:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXp5DvcgI3vQ; Mon, 12 Jan 2026 08:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4332607B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205769;
	bh=945rT1rN6x+PNjBrCYcAimYL9XuyNOJTieZvOHLsrfo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M4j6sBMEe5pj65jUuchtfJw7VW4MzqeUO3O9lQDlU3WDCPoNO/b3E0h1sNL8w0JnM
	 1UjkkavECTVtQgFABwMFnHNe2rTVKlG2C6m++a4ft1BuLjAi5q5yPyj7Q3HdF6w/ng
	 K2207WFN1nUnlwdKsYCUh1xPQcddAiKnq+UdkR8gConB7BWnHI19rfxBLK/gTQWQzX
	 3/LULa3Ff5fESiXiCsnxb+YYBUkEqXGHN6v9EtBcCIvjNbMYcSCsKyX3WYJL8T3nkg
	 8JgIgYR4cb+XvRO98C7jZ10qcSKSgl5aE6Ib0g1htGARSd1IMnBDJ6zDcTUyHU09rO
	 TPNA75eW33fHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4332607B9;
	Mon, 12 Jan 2026 08:16:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0B9218D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E20E2607B9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ci3i0B0jMVr for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBD676075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBD676075D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBD676075D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A839DA4C3D30
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuS-000000003M6-0JCW
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:45 +0100
Message-ID: <20260112080419.2516889-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205136;
 bh=fbys+1eJmgUFGqdDeNAa7pRpYKyDNWygj6EHC0tlc1w=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=P4oYDUlzB8Rekl9KHy29vXOQEToiEpBuKAOilK72isOLe7WFIS2XgcksRMcKTpso0
 ZPRS3666bme7burJPPZqCwrJeqK3UYHe2/cgJ1llj68/et/oYQ23JQMudvWuHyPTXl
 ztt56v/vza3PIEjKHcH9wLHOwbm4lCcvwLdF0rCuom+gBQCwD3y1EVYTI8IoMZ9T1z
 9OWytRE2MU2BaskQwD3OZDd0C/1no9twouXcggAu7glnJiyVCNLA80S11v6kzsPDSH
 MpeJo2nB50jTdoLQZiYPSK85H+NfhjRPWo40mqJfyXh6agcnLuHxrgM+5D/67j0PBa
 ULWWjx18+/0Ig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=P4oYDUlz
Subject: [Buildroot] [PATCH 010/104] package/x11r7/xlib_libXScrnSaver: bump
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

https://lists.x.org/archives/xorg-announce/2025-September/003629.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash | 6 +++---
 package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
index a32997e1fe..2a318d6690 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003279.html
-sha256  75cd2859f38e207a090cac980d76bc71e9da99d48d09703584e00585abc920fe  libXScrnSaver-1.2.4.tar.xz
-sha512  e4395af85f8496618afb23ffdaca1a75f5e3d213478d8dc73249cbc9840d7b993ba7513dbf6015cb38b48fe3f2223496365158a148dd5e1ac7475c5ee569e28c  libXScrnSaver-1.2.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003629.html
+sha256  5057365f847253e0e275871441e10ff7846c8322a5d88e1e187d326de1cd8d00  libXScrnSaver-1.2.5.tar.xz
+sha512  1c0be0d15c5e7b50a3eb4a239e2c833c44b693b111c7f64c409f9abf8051356572acadebc8b295555683ff6bd4895acdbe32b15a538c971f15d8aa4e6b7fd51b  libXScrnSaver-1.2.5.tar.xz
 # Locally computed
 sha256  5cf3e16f5dd753a4c0853e8227134ab65f5562d9ef89b1a2d7681f5c8ac9feb5  COPYING
diff --git a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
index 55ae7a6801..3c6774a59b 100644
--- a/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
+++ b/package/x11r7/xlib_libXScrnSaver/xlib_libXScrnSaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSCRNSAVER_VERSION = 1.2.4
+XLIB_LIBXSCRNSAVER_VERSION = 1.2.5
 XLIB_LIBXSCRNSAVER_SOURCE = libXScrnSaver-$(XLIB_LIBXSCRNSAVER_VERSION).tar.xz
 XLIB_LIBXSCRNSAVER_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXSCRNSAVER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
