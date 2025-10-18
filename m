Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFAFCCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 18:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCF5860DDD;
	Sat, 18 Oct 2025 18:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIY5VqLpkWJc; Sat, 18 Oct 2025 18:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFF1D60DE1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFF1D60DE1;
	Sat, 18 Oct 2025 18:51:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07E7543F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDBC783478
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ksagoj7s0uWM for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 18:51:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C9B68238C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9B68238C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C9B68238C
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:51:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0DCCA4C09E4;
 Sat, 18 Oct 2025 20:51:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36398)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAC1W-0000000062G-0AWc;
 Sat, 18 Oct 2025 18:51:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Oct 2025 20:51:25 +0200
Message-ID: <20251018185125.2418791-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760813485;
 bh=iICCm5Zd4m7OPbf3ehwUmBLgNBOGk21aUELcFNTKrxQ=;
 h=From:To:Cc:Subject:Date:From;
 b=kuHX1ohLbLTijtssBDOiUhJCyBogYw9w/tREBA0jSsxNJ4VUOGLOcj2eqvFD8a51g
 cdnyU9u+bmXZEVMWU49vFWDLUCnvb4mnx05ihbGkchE3Otxxyk0aaRWNIqDQt5OGLZ
 91st0Uoxw+Zl51imghU5TnitcQOxJx7cPgO/7uivrxSGqEQaI0xpshGAqjSHwH5emO
 PZHjpog+231Ip0IrOedAqa+NecngDWrzyUlZxju8BadyL2/FXTZpMl4Od5URZB471J
 SN2hJJEIjK1SXt6VZ9bTKaA8H7yFDpCFdZV3qHDHr/NgA9dvNlRgY0tgsU2B2+m5iY
 pY312y1ARDrgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=kuHX1ohL
Subject: [Buildroot] [PATCH 1/1] package/libgee: bump version to 0.20.8
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
https://download.gnome.org/sources/libgee/0.20/libgee-0.20.7.news
https://download.gnome.org/sources/libgee/0.20/libgee-0.20.8.news

Fixes:
https://autobuild.buildroot.net/results/447/44778d849d6627159df7fabfc3af92dc9b008a4d/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libgee/libgee.hash | 4 ++--
 package/libgee/libgee.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index f733bf34a8..1ece69d4af 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libgee/0.20/libgee-0.20.6.sha256sum
-sha256  1bf834f5e10d60cc6124d74ed3c1dd38da646787fbf7872220b8b4068e476d4d  libgee-0.20.6.tar.xz
+# From https://download.gnome.org/sources/libgee/0.20/libgee-0.20.8.sha256sum
+sha256  189815ac143d89867193b0c52b7dc31f3aa108a15f04d6b5dca2b6adfad0b0ee  libgee-0.20.8.tar.xz
 
 # Hash for license file:
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 36eddef171..aad829ea06 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGEE_VERSION_MAJOR = 0.20
-LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).6
+LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).8
 LIBGEE_SITE = https://download.gnome.org/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
