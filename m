Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF1CEBF8A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 08:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B769183466;
	Sun, 16 Nov 2025 08:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StPu4cy0IJlF; Sun, 16 Nov 2025 08:56:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29246832EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29246832EB;
	Sun, 16 Nov 2025 08:56:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C46A1A9
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 08:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CCA860AB4
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 08:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EW2n9Prh_8b8 for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 08:56:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2E6D60AB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E6D60AB3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2E6D60AB3
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 08:56:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54BB6A4C6B45;
 Sun, 16 Nov 2025 09:56:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44434)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKYYO-00000000559-4560;
 Sun, 16 Nov 2025 08:56:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 16 Nov 2025 09:56:10 +0100
Message-ID: <20251116085612.5120-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251116085612.5120-1-bernd@kuhls.net>
References: <20251116085612.5120-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763283373;
 bh=Hd/DnSdPC2zlVdxldskajNaDM9rSUeUG5CAiKTtiDyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hgCRlL5zIWO71wNo5HQ4NhjSJMmgtX4h+DcH9BHWry9r3EDOP6HYJCSYUj54Fc/cf
 /FXvvb9mHXzmrVDW+nkwiz4+6AMZ7xi8frI9uguvRzZ8LUL4+1jY6xamxVXPAs5+Ue
 NNjwb+yibdHwXO0omUxZw3SxO28/4rKcQtNqV5i1LzBzHhZEYddwy0tqFXCpl21Lih
 FRMsY19fQPe5oH+lPHCxCBrIrNFdLtFr3NZtzOGO3Fo34tJbsyt1i/vuXJxu4VPnoU
 PQgpzdua+MeffgJ2k1nkKGdBtP0fdlSRFMhBsUONi7vX8wJhDrNQ6FhcoYkJc52pKH
 BA1dn7aHM7StA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=hgCRlL5z
Subject: [Buildroot] [PATCH 2/3] package/libdvdread: bump version to 7.0.1
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
https://code.videolan.org/videolan/libdvdread/blob/7.0.1/NEWS

Updated _SITE, switched tarball to xz and build system to meson.
Removed unneeded _CONF_ENV.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdvdread/libdvdread.hash |  8 ++++----
 package/libdvdread/libdvdread.mk   | 11 +++++------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 7fe0210727..5fb51ff47c 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,7 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.3/libdvdread-6.1.3.tar.bz2.sha1
-sha1  5e5721ff6ed01a9af9214be0d6563303e8bf2bed  libdvdread-6.1.3.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdread/6.1.3/libdvdread-6.1.3.tar.bz2.sha256
-sha256  ce35454997a208cbe50e91232f0e73fb1ac3471965813a13b8730a8f18a15369  libdvdread-6.1.3.tar.bz2
+# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha1
+sha1  aaba59e0e04fa12704fab4230344549d8ae4b2e3  libdvdread-7.0.1.tar.xz
+# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha256
+sha256  2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dde986d3943355d407  libdvdread-7.0.1.tar.xz
 
 # Hash for license file:
 sha256  d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572  COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index bc486891ce..cc515606b2 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.1.3
-LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
-LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
+LIBDVDREAD_VERSION = 7.0.1
+LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.xz
+LIBDVDREAD_SITE = https://download.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_LICENSE = GPL-2.0+
 LIBDVDREAD_LICENSE_FILES = COPYING
-LIBDVDREAD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
-LIBDVDREAD_CONF_OPTS = --with-libdvdcss
+LIBDVDREAD_CONF_OPTS = -Dlibdvdcss=enabled
 LIBDVDREAD_DEPENDENCIES = libdvdcss host-pkgconf
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
