Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D81FF885C
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 07:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32EBF4276F;
	Sun, 26 Apr 2026 07:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaNIo5EYY4cq; Sun, 26 Apr 2026 07:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F36442775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777187981;
	bh=kZkOUbucJSSEI4fEdEQH8AC+0AInU9ehzQ5nedSHQ+w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bZhYn8K1jLJNPZRW95xDlnQcP78tNCaM92jSL2M22njysEKbjxha98TIPx3QvLJFB
	 Xh+45yEYlQeqqPdMkZOGwGi8LOoe3+B5GWuUV6nJedHDtlhkUfshhce7QOcU1G3qEn
	 idjO11wTKeuTDI0rrJJEz61TX+y/Zi+BZJptLZpRcNy/6CgdyQALbG+a6T6bPwf4oI
	 yx7cTXbOUNPDxicYYC5cfHItMpEC1IqKTdnkgp75opU/AQZfFxH1cbkflZAcmgO3No
	 VFwa38lKBNgFBif28h6yAXFSVvAyYVBxltAdYxv3USIztHzXPre7UeVu8xJAUTExlb
	 6+UVv3R7V5lFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F36442775;
	Sun, 26 Apr 2026 07:19:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D58B369
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A93A4216B
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkgEhpFZfAwF for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 07:19:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDA9D4052F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDA9D4052F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDA9D4052F
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 07:19:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B3EDEA4C0CF4;
 Sun, 26 Apr 2026 09:19:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55650)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGtmB-000000004BN-42uy;
 Sun, 26 Apr 2026 07:19:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sun, 26 Apr 2026 09:19:36 +0200
Message-ID: <20260426071936.391076-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777187976;
 bh=oGlEwx/4yhJKG+qTNsgUJCDirYBB3ffxYflsVv88LmE=;
 h=From:To:Cc:Subject:Date:From;
 b=Lc/RA24MXNrPVY5umyZ5n6d/Nx8QPpg47vOt481IZRQHer8vhzflj1rKxbqYieAG6
 Jh6N0geNKGBb/Jcp/XJE9ZW/Y8TbJ80wdTq7zmC7qYKa3OQ1DgicA9azDt0DuPnhYk
 +I4TGqUpI2wGRqFTSYDh3jr7JbZvE/UGz4CQFHoVwcNpPQ80YoZKRrD94ArGbpvmAa
 +XFmTT23YN7rDNk88tVakeojbKZi+g163uadXHIR/rTI2qX90Xq1A4mgIGrJE15ceL
 q6auLf9aZYyQRfL9S2t48tO6EE7YwXk7rfo/meAwM8XCU4i0/rrg9G3pwMaF/TQPhl
 MHTnZZLarp+mQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Lc/RA24M
Subject: [Buildroot] [PATCH 1/1] package/libxml2: security bump version to
 2.15.3
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

https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.news

- parser: Pass userData to SAX text callbacks in xmlParseReference (type-confusion)
- entities: copy children in xmlCopyEntity
- c14n: Fix Type confusion in xmlC14NProcessAttrsAxis
- python: Do not decref string after adding to the list (double-free / use-after-free)
- c14n: Reuse tmp_str, xmlStrcat reallocates *cur (double-free)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxml2/libxml2.hash | 4 ++--
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 35c8810ed9..849d70cbb5 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.sha256sum
-sha256  c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d  libxml2-2.15.2.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.3.sha256sum
+sha256  78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07  libxml2-2.15.3.tar.xz
 # License files, locally calculated
 sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 0a365fa689..c1b5c4033c 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.15
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).2
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
