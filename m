Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0938C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C392403E3;
	Mon, 12 May 2025 21:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3g22nz1Pm_E; Mon, 12 May 2025 21:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A029D409FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A029D409FF;
	Mon, 12 May 2025 21:48:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42EE4150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 341008104C
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pl0DHDr8gCwG for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:48:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E054780F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E054780F49
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E054780F49
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07CD3A4C055D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 23:48:30 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50042)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uEb0f-000000000Og-0i4l
 for buildroot@buildroot.org; Mon, 12 May 2025 21:48:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 23:48:29 +0200
Message-Id: <20250512214829.462894-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747086510;
 bh=9JMh97HSJPBN48fAJwOMIHeVkVEHka0YJYUoBGtU92w=;
 h=From:To:Subject:Date:From;
 b=DW69yjC6toVEwu4yUkqdesKr1rGGcBhCIOsUwGU3ik+nsFvlnVy+tLKRuru9qv5CK
 cfsBLL8ea1E69ImVfJyC5BXh4DCVVQZ9nj46unKwjNoErS7gSwIi6KCRNkb+EEEjFE
 IjRQYfQ/vpPJgfUY/hCzFU6JoHjaYl2bOnTLuDnvBpXAdPQdDi6Mm0Ot8IwgtW6ZPM
 lvbI9UAOMkFPlO7YAJ+X+kCc3uC1vRuvL8RStILk62xm+mUYgOR7mwZuo8SZxV5Tef
 jepfkBp+GHpdBhmWMquX++0xhKiAINU1WySGbI4f4ZvN/BNTOZigCuIZ36Z43HCIwJ
 MVX1qjT20ZrAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=DW69yjC6
Subject: [Buildroot] [PATCH] package/dbus-glib: bump version to 0.114
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

Updated license files and hashes due to upstream commits
https://cgit.freedesktop.org/dbus/dbus-glib/commit/LICENSES?id=ad08ba0c6ba2d69783d41254e0cf03b2ae1647db
https://cgit.freedesktop.org/dbus/dbus-glib/commit/COPYING?id=ad08ba0c6ba2d69783d41254e0cf03b2ae1647db

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dbus-glib/dbus-glib.hash | 6 ++++--
 package/dbus-glib/dbus-glib.mk   | 7 +++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
index 072dde3d69..1ce3c6b63d 100644
--- a/package/dbus-glib/dbus-glib.hash
+++ b/package/dbus-glib/dbus-glib.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256  7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a  dbus-glib-0.112.tar.gz
+sha256  c09c5c085b2a0e391b8ee7d783a1d63fe444e96717cc1814d61b5e8fc2827a7c  dbus-glib-0.114.tar.gz
 
 # Locally calculated
-sha256  589bc300214a8b9ecd121f51570fe6342617487fd8fc0fb1f4ec26a13d5b96f8  COPYING
+sha256  095e2affe38031d0ca80db5dbf06881306e5f5125f6ba422297396bdfe02b3d5  COPYING
+sha256  93bb4f7417aa775bab9026cc3d0af28aeb64451fc5a8ec651876785edd8eaf9b  LICENSES/AFL-2.1.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 0d247e1d89..5c13c0b37f 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.112
+DBUS_GLIB_VERSION = 0.114
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
-DBUS_GLIB_LICENSE_FILES = COPYING
+DBUS_GLIB_LICENSE_FILES = \
+	COPYING \
+	LICENSES/AFL-2.1.txt \
+	LICENSES/GPL-2.0-or-later.txt
 DBUS_GLIB_CPE_ID_VENDOR = freedesktop
 
 DBUS_GLIB_CONF_ENV = \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
