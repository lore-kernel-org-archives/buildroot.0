Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988CFC00A94
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67E29612B5;
	Thu, 11 Apr 2024 21:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2j4aBnotyDLT; Thu, 11 Apr 2024 21:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68AE9612FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68AE9612FC;
	Thu, 11 Apr 2024 21:02:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E557B1BF983
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2A45612FC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJ-XKcxp8AZP for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3146612B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3146612B5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3146612B5
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:02:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 34F33A4C246B
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 23:02:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51274)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1Z3-000000001PT-1GoQ
 for buildroot@buildroot.org; Thu, 11 Apr 2024 21:02:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:02:33 +0200
Message-Id: <20240411210233.2128012-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869354;
 bh=DFO4p+VhmwnW1e8u6QkwtTUYRCuhpp5WUBC+SMV3o2I=;
 h=From:To:Subject:Date:From;
 b=xq4V/raRdjDqW6Teyhqjnn7sEfeRZfJGWpsK/BISWZMCwcVGJNBTKIibb0NFsUqxd
 2Lob8uakeEWQxA4GcOmg5yLBA8piWgcUucajXkhaLuUxGJ5bgY/1XYyxTI0FkkEUgq
 QxKuz+SplpHdqt4lNBBhguXyAYrC25AB0rK5qIor/8aqcCsbTfWyFaLilyIzfIOAhA
 M41FDpogz8ZYcdTMKpIrrjm8xiiZwKbcZXhw1sFs6GGjOoR8WvTtq2pvk8qubitP2e
 8xzPq+NkbKeOR5mogeRapTg+wY6NtvvZjMOOhWeCyo1D7Tac9Uoi6jhy7+ChLcDj3g
 gs20AcBs+NqVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=xq4V/raR
Subject: [Buildroot] [PATCH] package/libplist: bump version to 2.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Release notes:
https://github.com/libimobiledevice/libplist/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libplist/libplist.hash | 2 +-
 package/libplist/libplist.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
index 460f63516a..9bc79bf3f0 100644
--- a/package/libplist/libplist.hash
+++ b/package/libplist/libplist.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4e8580d3f39d3dfa13cefab1a13f39ea85c4b0202e9305c5c8f63818182cac61  libplist-2.3.0.tar.bz2
+sha256  3f5868ae15b117320c1ff5e71be53d29469d4696c4085f89db1975705781a7cd  libplist-2.4.0.tar.bz2
 sha256  7619c753cac95d4740220223bde48a032606fcaccde5e546f9bc444c81ab356d  COPYING
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 8f094c133d..0b8a69455b 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLIST_VERSION = 2.3.0
+LIBPLIST_VERSION = 2.4.0
 LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
 LIBPLIST_SITE = https://github.com/libimobiledevice/libplist/releases/download/$(LIBPLIST_VERSION)
 LIBPLIST_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
