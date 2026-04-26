Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBD7FF885E
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88BBF807E5;
	Sun, 26 Apr 2026 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5UUHVe_tpyD; Sun, 26 Apr 2026 18:54:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87DE6807C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777229695;
	bh=4NbnDrEvTokE0hmFRkO4a3nDHuJctEMOpIqkXzLNQKM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ES0ODx4X3iFFIjfafXB4ziLhBZEIbUhQj8obdhuXFy0xON9JW+1TrOqUmb7O55jz8
	 ICNh5sauK654tAh67gq5LMHhon8G7Yi+NV9T8JpW5F7sJhOxnK80KntwEkYbeRc9Uo
	 WjsHbstn8BhY7CDW1yK9Ce2pmPPTEfxky8D4cqg1tzpfWjceLDoc2ERpQu2p8rfStl
	 EUehhxzsUhKxC6bkPe49YEpRphj0+052ftbj93yxDn7X2kYPbM5ilQmvnzCA/sgJmk
	 Dl7eOlYX8E9NqJu/ZPZjDLLbdVSJIOzGHgRHheDHOeXRUWdj5xuM8FbSulzwRz6eU8
	 8t6L6s70VhO1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87DE6807C9;
	Sun, 26 Apr 2026 18:54:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EEE441B8
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0EAE42A6E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oMHdDSlLtSdV for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 18:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A02542A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A02542A6D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A02542A6D
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 18:54:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1362AA4C0D10;
 Sun, 26 Apr 2026 20:54:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44994)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wH4cy-000000002QV-1I1v;
 Sun, 26 Apr 2026 18:54:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sun, 26 Apr 2026 20:54:48 +0200
Message-ID: <20260426185448.1650280-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777229689;
 bh=gI5J/kZragGx/hdH4rKq0r8rhO4P3bver58tPm84By4=;
 h=From:To:Cc:Subject:Date:From;
 b=UfmegpuApuPpAzwk4kqN8y1AVuMG0tgblp8A92WDpbb3dZJKbKHgcn3zgvpep0xpX
 cSue2+oW0K2GWtFZImrWaPyZ1rkJ+3AicU9yKfU3OOQKL9Rz3f/ToYjEeRzyN1B8i9
 tqNTCOPimypRibK+ImbDrMvYMCnL0HivnQPe/nHNUPzwYKc921K5azN5Iodx15zcol
 iyDS+XjUNxaxG1ffX2tNT6rr3BD/bNPlr47M0iCt6I3NtLCcsGv0kmhsJZn0smKygv
 o7SKyKW0FD8XB6PGu2brnNx1NQjEflZbLb9uZpd9BI8T34DfcBGPY49SFC98sCcwoD
 vHqUErARmelgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=UfmegpuA
Subject: [Buildroot] [PATCH 1/1] package/stunnel: Switch URLs to main
 project site
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stunnel/Config.in    | 2 +-
 package/stunnel/stunnel.hash | 2 +-
 package/stunnel/stunnel.mk   | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/stunnel/Config.in b/package/stunnel/Config.in
index a46e2f0316..1bdce7ab28 100644
--- a/package/stunnel/Config.in
+++ b/package/stunnel/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_STUNNEL
 	  Stunnel is a program that wraps any TCP connection with an SSL
 	  connection.
 
-	  http://www.stunnel.org/
+	  https://www.stunnel.org/
diff --git a/package/stunnel/stunnel.hash b/package/stunnel/stunnel.hash
index c06f1c0774..dc61f6d5b9 100644
--- a/package/stunnel/stunnel.hash
+++ b/package/stunnel/stunnel.hash
@@ -1,4 +1,4 @@
-# From http://www.usenix.org.uk/mirrors/stunnel/stunnel-5.78.tar.gz.sha256
+# From https://www.stunnel.org/downloads/stunnel-5.78.tar.gz.sha256
 sha256  8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d  stunnel-5.78.tar.gz
 # Locally calculated
 sha256  716f18b10eac3f1875ea2205418dd1b0084bd210bd17d615df6b180cfc4d65b6  COPYING.md
diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 9c8b4b870e..8bd680af32 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-STUNNEL_VERSION_MAJOR = 5
-STUNNEL_VERSION = $(STUNNEL_VERSION_MAJOR).78
-STUNNEL_SITE = http://www.usenix.org.uk/mirrors/stunnel/archive/$(STUNNEL_VERSION_MAJOR).x
+STUNNEL_VERSION = 5.78
+STUNNEL_SITE = https://www.stunnel.org/downloads
 STUNNEL_DEPENDENCIES = host-pkgconf openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
