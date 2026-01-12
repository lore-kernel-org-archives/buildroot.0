Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66ECD25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A096984461;
	Mon, 12 Jan 2026 08:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdLEDZ3R2cb8; Mon, 12 Jan 2026 08:15:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB742844A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205733;
	bh=crBW5qHNClYuPSC6Gvsjgkc/2M5spyHvcvwCDVdKaeA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OvNNxvFZIUyouQ3KtgHUBjqtAY/akZdQ/oPhRdrR4fJvgWGNcQD5q4D010FZSSjWH
	 VgIKJZuyhbfAqEyM0Q3KRTxZfdaNVxSkhzXYDALBMxlQSG2OcfIB+xBmBnTB+pebjd
	 CmJFgfKQ5gwwHpTKZAJ4H93yXwow6MLGIL7lTGKAJhKbmMBhEMVTMEReUZKOyry5Yj
	 r4w8VFzuPmcs5sYyVN7B8IgcA3l9Dq5+rSAxoXtbJG4LcgXJ9KOyWad/P9CoP0MBKo
	 GM869xIEoh76ERoOX6nmJnqTShB9+SslVf6XD4K7jEYLC2a1pyqwfisjPt2aH95IZG
	 8HaHQm8B/jKWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB742844A1;
	Mon, 12 Jan 2026 08:15:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E417B18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1CCD4031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsV3h-wD5J6X for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:15:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D918C4013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D918C4013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D918C4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 385B6A4C3CC9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuR-000000003M6-3XlS
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:42 +0100
Message-ID: <20260112080419.2516889-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205135;
 bh=dQcP/6te4PZf3YA09I1kuf+hymglemWd8If/3/1Qnlk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=OQFiOu1ShTMxi4boDmLrf6JvTBNivMtdowDPxrfFyoyPfrFwj5rdYBsRuDd80xEh0
 uprp7NM+H9J6H/e0vvulPAuDD66jTT0HwPx65xp/k26yeMpCoO8SDzR8MZsplBxnmO
 nLTRSwwirdaLJoTVAupEAj8UiE/fbxhTveIB4dJ6q1Wdb4hotakf906YRDua8ZZJzC
 RE+OVkvQH6Gn/ZCm7lXLx9hS1U8VZU+oHnxLkNIuZGQQDMDNRu7evh//AhGrImAeJE
 UF2M/qUC4fKyDh8VpaNhhHbAqAlmkkSVSjkzKp1+yFfJ8wDvcx0Uk4QmGqtQpEMAL8
 GrpK2Jh8JNPgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=OQFiOu1S
Subject: [Buildroot] [PATCH 007/104] package/x11r7/xapp_xkbcomp: security
 bump version to 1.5.0
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

https://lists.x.org/archives/xorg-announce/2025-December/003645.html
https://lists.x.org/archives/xorg-announce/2024-February/003450.html

Fixes CVE-2018-15863, CVE-2018-15861, CVE-2018-15859 & CVE-2018-15853:
https://lists.x.org/archives/xorg-announce/2025-December/003644.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 6 +++---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index b626e50236..dfebd08e07 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003283.html
-sha256  fa50d611ef41e034487af7bd8d8c718df53dd18002f591cca16b0384afc58e98  xkbcomp-1.4.6.tar.xz
-sha512  90e69dd1c78c28f77a5acc7821b43afec1b9ac4895bc6f3462b4902baaadc26f3869da69e3bd023b4bc74adb5f1be0c43ca24b3dab37ac9a479c5622684baa81  xkbcomp-1.4.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003645.html
+sha256  2ac31f26600776db6d9cd79b3fcd272263faebac7eb85fb2f33c7141b8486060  xkbcomp-1.5.0.tar.xz
+sha512  d8ef4906261251e2600b3650660fbe88ed99a44694f1e59b433e0811f1ab5234c4f2f0b3647fa5372fb0f46b56eac60c0219a762bf1af0ab06226b63e4a6b081  xkbcomp-1.5.0.tar.xz
 # Locally computed
 sha256  6b833fdc05906ce57f016dc791db86830d49ee4da2861ce45806c50b3f4dda9e  COPYING
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 61922c7cc9..97e131f353 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.4.6
+XAPP_XKBCOMP_VERSION = 1.5.0
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.xz
-XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XKBCOMP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
 XAPP_XKBCOMP_LICENSE_FILES = COPYING
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
