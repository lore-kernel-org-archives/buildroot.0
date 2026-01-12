Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF973D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC0DF61504;
	Mon, 12 Jan 2026 08:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id seYE04o7xFj8; Mon, 12 Jan 2026 08:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4325661451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206980;
	bh=ccI73TOO8lll4yqiOY9mSN6phou5sba+9zvpZwpgwSE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCDpDqG/95GhLLFl6YPpyXztkKj6g3tRESSAECW0OrOiLcYPzMxoPsgWDBTwWV3VY
	 7vY9oJO/bJ95Cmr8pmmQtor2fv7e4MmopnoHPPJMwTwwob0AhRLZLXu97AjG7P6dqt
	 MtRfK2G4Px7P3nQFyK6uJgQwT0M4MAmo/74wzIQQbgdk/Xguj27LTIgRdYnL0/Q4kl
	 YuNXuSxRvcspf+dbOBgAhlQgANXOrOMsu9VxlXeeoH3GLoVIPe/H+LtY3sAA50w64b
	 MKbqlaD95XDHIMJGTZd4FuFyJto+KT/jLnjSvGtVeZcOUaqN+5nYTRYU9Ir6AEWsZW
	 jMiksMJrnNmCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4325661451;
	Mon, 12 Jan 2026 08:36:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47DFE1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33EAB4013F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBdpRsVLJEYS for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:36:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12BAC40052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12BAC40052
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12BAC40052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D7900A4C3C30
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-0Z4a
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:28 +0100
Message-ID: <20260112082950.2528445-80-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206622;
 bh=y4U+67LbSLFX4oQnjFrlxU+uXOEcWBAqnk4UpO7ktjQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=HiCkUDNi4lXRwaVCY99IlMwVAWLlG1eqCSewuPcesq9pmYRHR98OCjLdjPkmBSxCh
 ARnGxhbQokpkkmBvibTd7FJbYK7JqCkbjnS+bwlnlmXccXwiDkRgJYEdAAagR5lyzb
 N0hrH8XrqCXGOWEoPR3XWb8BTUdDYueJbKf4I7EY35ihyVKFCdx/OojrZYsaseMRUC
 1K6zJ9Zz6JTre4YLEeTSAKPNLmf5WeelVLV4Gj0ayniCx/0ktp2Q08ouuyMb6INDhB
 3VD3x0xmLYQLEF4MjFOGVtBumG4VcVc6ULa+6wG7xW0+hrq8LhCPdP+Hh4pgDirmSd
 +PliOAJV+oA8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HiCkUDNi
Subject: [Buildroot] [PATCH 080/102] package/x11r7/xapp_xfontsel: bump
 version to 1.1.1
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

https://lists.x.org/archives/xorg-announce/2024-March/003474.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xfontsel/-/commit/f286ef347dc9e87c6d5b5b8bce22afdeb82af4ed

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xfontsel/xapp_xfontsel.hash | 8 ++++----
 package/x11r7/xapp_xfontsel/xapp_xfontsel.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
index 8d7e546bba..098f5dc2b8 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003174.html
-sha256  17052c3357bbfe44b8468675ae3d099c2427ba9fcac10540aef524ae4d77d1b4  xfontsel-1.1.0.tar.xz
-sha512  be67d223668431c9b5dd2ef74032d2f087be5f8f0ccc427bc7ee43e7ce42214edddb07d8c3d6d6de93ea35314392d384f1ab1ae5c48b2cfbce418610e3945a52  xfontsel-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003474.html
+sha256  7a4b86658a7701253ed0fe8a66471e54e4cacbba66d7278f1759d3b3a33a02c9  xfontsel-1.1.1.tar.xz
+sha512  fdb1f20dc86e2e74da77ef5e62d9465ea24d1af965f1ff3a6334ffefb239130fcf28f7cde9b4e7d7e6c9cf12fcb637784e7af209cffcee3dbe304025d33abcdd  xfontsel-1.1.1.tar.xz
 # Locally computed
-sha256  a27097bcc5cdf4fa5d761dd4e5cea1f41911c51b0a7d9da6e3a48f69d9fd0c09  COPYING
+sha256  2c49229e7e4770a8265ef7e7705d92173e983015d3c7aeccee8155a97109c0b7  COPYING
diff --git a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
index ac12f9c509..d9d8c7c3aa 100644
--- a/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
+++ b/package/x11r7/xapp_xfontsel/xapp_xfontsel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFONTSEL_VERSION = 1.1.0
+XAPP_XFONTSEL_VERSION = 1.1.1
 XAPP_XFONTSEL_SOURCE = xfontsel-$(XAPP_XFONTSEL_VERSION).tar.xz
-XAPP_XFONTSEL_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XFONTSEL_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFONTSEL_LICENSE = MIT
 XAPP_XFONTSEL_LICENSE_FILES = COPYING
 XAPP_XFONTSEL_DEPENDENCIES = xlib_libXaw
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
