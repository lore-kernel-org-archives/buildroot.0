Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F22F9D0DA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E7E84D5E;
	Tue, 14 Apr 2026 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOZcjDst2qwm; Tue, 14 Apr 2026 16:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF25B84D60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776184470;
	bh=8cb8o3mHokQ5GtJlF5LCMTm3HtmyLVyJHIsRocBhoOY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YYG28jVnqfmz9rUBB1YhJAoI2L+Y46du7QibgklnASAdywr3rJtPeCF6g26yRzE7J
	 4+iZrZr2viAUWvCH0u9UrWSqKxsnWPaXHmySQVZejvO3nygZ18UapDRXrqX9ZuAt4A
	 WdH7h4Lbm+Or7ZGv6Pem/jM6E9fuduFiyoLq1hfOMmfOmoVVgJA/B/H+h4b0KhyWYG
	 6mR/YUfznuuYq6TBPD4WD68Y+C9asFfJKnd4oEw6scnRcvFrXZYmZ/ppSMpcPv8y2f
	 5jhuzY851ZIy+HBSq6jKXJ05vxNKMBTMBe5zdz5wyVPclPzcOaXj5rxYpc6sJiS0QB
	 bbXkrorw6581g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF25B84D60;
	Tue, 14 Apr 2026 16:34:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7B20375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4FD36F49F
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4ts94eDbzWG for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 16:34:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71DBC6F49E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71DBC6F49E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71DBC6F49E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 16:34:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be9a.dip0.t-ipconnect.de [84.161.190.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75329A4C0C96;
 Tue, 14 Apr 2026 18:34:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53522)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCgiV-000000008Pi-3Pgy;
 Tue, 14 Apr 2026 16:34:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Tue, 14 Apr 2026 18:34:23 +0200
Message-ID: <20260414163424.2355464-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776184464;
 bh=MybPtSKqEzW0t5pbd+E6julazkKFrHHhLhowe7149p8=;
 h=From:To:Cc:Subject:Date:From;
 b=TkE5a2dmKecUzJ1c/I0p9g2Ijr84lm6rynDv6QCu2LtzWxabUoWzIfFXXHpsjFDFD
 cel7oZxM/Zff4n+tyRLtBcXyz5tYTqM7Frdzl1DCtgfEoOwiWB6Y8GvYyEii4Irv94
 MgirhC8EsSYD0nFWqmvZ/REdl1LwTC9FFrA0iPAlum49pK1akBZQgJQ6/6ZwMoHI8x
 yMRgUy1EdILmgaz4F9BoXZxIWCe0d5XJPMDWK6cetNvbPA9mVZIf1L2AA6MXbUhAPa
 dAoUtU9M7+wwkRUxUUKhUwH+hn20g0xlSzPZVv5zqv2xKqpt0wzPM3jKVkFHt6KvfH
 cG6ut2z8vrQJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TkE5a2dm
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: security
 bump version to 21.1.22
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

https://lists.x.org/archives/xorg-announce/2026-April/003678.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/3069f64d691db5396706c1ec1182bd8db52ffb22
https://gitlab.freedesktop.org/xorg/xserver/-/commit/dd924b160c9b434ff7687d1e1d2a9058cdefb6b8

Fixes the following CVEs:

* CVE-2026-33999: XKB Integer Underflow in XkbSetCompatMap()
* CVE-2026-34000: XKB Out-of-bounds Read in CheckSetGeom()
* CVE-2026-34001: XSYNC Use-after-free in miSyncTriggerFence()
* CVE-2026-34002: XKB Out-of-bounds read in CheckModifierMap()
* CVE-2026-34003: XKB Buffer overflow in CheckKeyTypes()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../x11r7/xserver_xorg-server/xserver_xorg-server.hash    | 8 ++++----
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index ceca9c215b..b7adf1559d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2025-November/003643.html
-sha256  c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519  xorg-server-21.1.21.tar.xz
-sha512  bb2eb4e6756eb9e38b61bd47c017da44bcf5f45f2b7a906b4bb3a56b3d791cec64abb9bf37b224efe1e4fab9cc296f3672c9b2f8e00e1cdfc54337bef63cd16c  xorg-server-21.1.21.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-April/003678.html
+sha256  1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3  xorg-server-21.1.22.tar.xz
+sha512  6cb37ff971e10eb4a7dfcb3e8071afd769c7632d50e4ad8bc948b810dc4847e152b8a05ec135f55e0695b35908abd07e7728ef85dd3135456fd532e919f440f4  xorg-server-21.1.22.tar.xz
 # Locally calculated
-sha256  abbb7969df55e399e91104ded4d0a20a1b67de7c01138e63d61b7ed4f81fec0d  COPYING
+sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0dc3a4a5c6..d1e7267c27 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.21
+XSERVER_XORG_SERVER_VERSION = 21.1.22
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
