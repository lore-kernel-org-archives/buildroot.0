Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0CFCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3713E40E01;
	Fri,  3 Oct 2025 20:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ig9jUIquUWGT; Fri,  3 Oct 2025 20:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C4AD40F9D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C4AD40F9D;
	Fri,  3 Oct 2025 20:11:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 433B2118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 403FD8343E
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KvZeHd52YmVt for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6FD38343B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6FD38343B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6FD38343B
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:11:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F354A4C5BC6
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 22:11:46 +0200 (CEST)
Received: from [192.168.1.144] (port=54760 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4m81-00000000791-48iW
 for buildroot@buildroot.org; Fri, 03 Oct 2025 20:11:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Oct 2025 22:11:45 +0200
Message-ID: <20251003201145.2430150-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522306;
 bh=XO6pDUesTersFXa6/olTunYBJJ0gjPVn9h1hiY/rRtY=;
 h=From:To:Subject:Date:From;
 b=XKXdh9SqfKzCGDHs3UYUSmlxQLXYX0+UZGW5Kah7N7SNxcIXm5fVXdrUUY3mAH21P
 7pmnVyRasu87apnr6Ivp9AklL5gBCEYsaxEQbekqv5g/mM18bDiyyf0UsIhqSsjKUh
 RwDD1lGAtk5Ezd9H0ao2wE87XtfzE1CQrWuCUG7feo3vh0n3m5gZ2r2bHaTZCXfs+a
 g4su41si81iTdTrRWXVufArbmnDBbRMvcmbwkS4EFA6zFHxrYDEkisBOpCqYPOTfLP
 DQmWA7a/Upbku6bsPHQWcEKltm+i/0kOTxnL+pQVE0xRKhDQ2L8uiYfXIHPKt+vrj1
 nTFkpW2sXr1qA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=XKXdh9Sq
Subject: [Buildroot] [PATCH 1/1] package/freetype: bump version to 2.14.1
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

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.14.1/

Updated license hashes due to upstream commits:
https://gitlab.freedesktop.org/freetype/freetype/-/commit/8d18acba8c476267bbb7ab9f24c977d233d2f831
https://gitlab.freedesktop.org/freetype/freetype/-/commit/2adb53616a1fa5369e55f9b17ed19f8812c16c83

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freetype/freetype.hash | 10 +++++-----
 package/freetype/freetype.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index fcd99319cd..2c6ab20e19 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.13.3/
-sha1  2437819d11c1205e81141735dcb0a36c0d541e96  freetype-2.13.3.tar.xz
-sha256  0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289  freetype-2.13.3.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.1/
+sha1  20f7a9a3e2996aab82b0648e82d49a78e8813bab  freetype-2.14.1.tar.xz
+sha256  32427e8c471ac095853212a37aef816c60b42052d4d9e48230bab3bdf2936ccc  freetype-2.14.1.tar.xz
 
 # Locally calculated
-sha256  2e3bbb7d7c5c396368dd0853a790ec29ce5b8647163dde42a0493fb0d6556b2b  LICENSE.TXT
-sha256  08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1  docs/FTL.TXT
+sha256  bd36c8b474855fa294c2ec5c184544478ef3720aad37d65a6296a4f264fd2d3b  LICENSE.TXT
+sha256  5a5ee54c5001bbad1cdc1a57cc3dd4c42199b2da09d39c7ee41fab002d02967f  docs/FTL.TXT
 sha256  c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18  docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index ad8cd00ec8..00743fe358 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.13.3
+FREETYPE_VERSION = 2.14.1
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
-FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
+FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = FTL or GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
