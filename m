Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5083F10706D7
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 12:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C95CE40B4C;
	Sat, 14 Mar 2026 12:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MALZwVNIfVer; Sat, 14 Mar 2026 12:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6B4740B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773491015;
	bh=Yu206wXMkoGpZDeSotnMznhlQLrysgmmBHhnz6wJOY4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VTfyeXHRTGaYPEYGpkVQUgrih/U8Yasrsky3inzj9qYYTeN8E1KCVVBst/XiZ5Xim
	 yHvk4a4mOkw3Z2+zYKxlYQfyeU5PSbTqsiSa+ogwRQpuWJnrDb9SSq2DnLj5hqXGyu
	 9xRDZTkz9KYoYW0O+jhAitK+i2CCpyB7madcA/uO32c7bowiCy+dNjYefO7yuU0bJK
	 rIHcWhvEWAUpkPxzRalCxPknL739w9fIrstonnC+Bwt8yCgRndFwka8EgI6YF9aF8b
	 wBNdVVtMYxMSnwrqrFTcQuvcsdcJGL7roRB3suNRpDZURfhbk9lMzsa+Cn1ryMd3gH
	 QY7bPVFXJcRQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6B4740B60;
	Sat, 14 Mar 2026 12:23:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3C2B1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 12:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0AFE401BC
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 12:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5S1UvpxyYjdT for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 12:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 068604019B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 068604019B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 068604019B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 12:23:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA066A4C11F9;
 Sat, 14 Mar 2026 13:23:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56432)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1O1f-000000002Aj-04W8;
 Sat, 14 Mar 2026 12:23:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sat, 14 Mar 2026 13:23:26 +0100
Message-ID: <20260314122326.600040-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773491007;
 bh=27UJWaIWcpnlS+ZnEXpMUQuXP86vR8//fNo++N+FuME=;
 h=From:To:Cc:Subject:Date:From;
 b=Bkpa/lhovC2Y9pogN+YesVw9moe+LP6u/psaW2fAfJpbZ33qwUMeql+60DQuEdidT
 VAw11C/VbLLuxzL6zbEUIqQ414MPgZVi19/0IqQBlJorYBZd3r5KENTHEUCluAnmIu
 llJLNMtCKfxW1SRRJpsKSQrbMxfpdD+G67q6tq2ee8UZMgsbjie0R6SfEODY0SHphj
 5/xQOF3bmByTuTQ8VYXlvp1Y13gtsRNif8Om9X4H8ZKWUtzQXkijWsPK1p8rC4hrsH
 a3FCrC/im/+pXuZ6ohvpRydf6b88dbbd8K22bzubvtGImra8Eqa8MOruQZ6MkHuNKv
 zBLwccWlf7KRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Bkpa/lho
Subject: [Buildroot] [PATCH 1/1] package/libxml2: security bump version to
 2.15.2
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
https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.news

- CVE-2026-1757 fix: Memory leak in xmllint Shell - shell.c
- CVE-2026-0990 fix: Prevent infinite recursion in
  xmlCatalogListXMLResolve
- CVE-2026-0992 fix: Exponential behavior when handling
- parser: Fix infinite loop in xmlCtxtParseContent
- CVE-2025-10911 libxslt related: Ignore next/prev of documents when
  traversing XPath
- CVE-2026-0989 fix: Add RelaxNG include limit

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...evert-cmake-Fix-installation-directories-in-libxml2.patch | 5 +++--
 package/libxml2/libxml2.hash                                 | 4 ++--
 package/libxml2/libxml2.mk                                   | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 75232b6f00..70f1d9899c 100644
--- a/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -8,6 +8,7 @@ This reverts commit 75dde50b20215a2a3a445b62f36a67c8ed337cab.
 
 Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2452864
 
+[Bernd: rebased for 2.15.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac            | 11 -----------
@@ -19,7 +20,7 @@ diff --git a/configure.ac b/configure.ac
 index 4eb629bb..150e06eb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1006,17 +1006,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+@@ -1008,17 +1008,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
  AC_SUBST(XML_PRIVATE_CFLAGS)
  AC_SUBST(XML_INCLUDEDIR)
  
@@ -70,7 +71,7 @@ diff --git a/meson.build b/meson.build
 index 31c73b62..8728852c 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -577,9 +577,6 @@ config_cmake = configuration_data()
+@@ -590,9 +590,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 637ba52bb8..35c8810ed9 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.1.sha256sum
-sha256  c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c  libxml2-2.15.1.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.sha256sum
+sha256  c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d  libxml2-2.15.2.tar.xz
 # License files, locally calculated
 sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 35d373e130..0a365fa689 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXML2_VERSION_MAJOR = 2.15
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).1
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).2
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
