Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA77CD4F3E
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 08:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2596E60AFE;
	Sun, 16 Nov 2025 08:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYy-h902EGlx; Sun, 16 Nov 2025 08:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45A4360AB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45A4360AB4;
	Sun, 16 Nov 2025 08:56:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AF08158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 08:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28D3C40A9D
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 08:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flFKK0rRElc6 for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 08:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83DFC40A88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83DFC40A88
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83DFC40A88
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 08:56:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6886FA4C6C4A;
 Sun, 16 Nov 2025 09:56:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44434)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKYYP-00000000559-0GCR;
 Sun, 16 Nov 2025 08:56:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 16 Nov 2025 09:56:11 +0100
Message-ID: <20251116085612.5120-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251116085612.5120-1-bernd@kuhls.net>
References: <20251116085612.5120-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763283373;
 bh=RvxlFToUWn/koAvN/XO8h8o1mZY6GRibRaYRt4di2No=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qysgkG6zo0onfygjikiw6qT7wbGHojHyCIp/NwPZ48b4z+S6VsCO/G8Wi9au9dg1K
 VoD3t+ut/WUsbpu1YrK4pUGm+xAjZMenSXZU2YL+3zhJhizReoFC12QiEWcq5nNyqx
 JhWIIYFOQFJpwMVjxM5YALrj5HW9YuWxxgf2M9olKTBFOMXVF5DSQK07r6zZshL4F/
 5Fpzn8rCV8UyWv+39ZyypKBgd7Gi6w0V8JYiNITicr7X2txc3s/lmU+7rDr1QPSXWj
 cyknGdRaxX74CbGA8Q5j09Yx33Dy/qgmqkLqfV10hTTdyjgS/nQeVoXJWWFwzeKM9V
 sZobOxErmpY2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=qysgkG6z
Subject: [Buildroot] [PATCH 3/3] package/libdvdnav: bump version to 7.0.0
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

Changelog:
https://code.videolan.org/videolan/libdvdnav/-/blob/7.0.0/ChangeLog

Updated _SITE, switched tarball to xz and build system to meson.
Removed unneeded _CONF_ENV.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libdvdnav/libdvdnav.hash | 8 ++++----
 package/libdvdnav/libdvdnav.mk   | 9 ++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/libdvdnav/libdvdnav.hash b/package/libdvdnav/libdvdnav.hash
index 61d64b8ee3..6bb3eaa0bc 100644
--- a/package/libdvdnav/libdvdnav.hash
+++ b/package/libdvdnav/libdvdnav.hash
@@ -1,7 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.1/libdvdnav-6.1.1.tar.bz2.sha1
-sha1  7ac76aa95d046db715763da23b7053b65cbc7540  libdvdnav-6.1.1.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdnav/6.1.1/libdvdnav-6.1.1.tar.bz2.sha256
-sha256  c191a7475947d323ff7680cf92c0fb1be8237701885f37656c64d04e98d18d48  libdvdnav-6.1.1.tar.bz2
+# From https://download.videolan.org/pub/videolan/libdvdnav/7.0.0/libdvdnav-7.0.0.tar.xz.sha1
+sha1  186c7846d31f474bfecc213bc483f0064d0d7cdf  libdvdnav-7.0.0.tar.xz
+# From https://download.videolan.org/pub/videolan/libdvdnav/7.0.0/libdvdnav-7.0.0.tar.xz.sha256
+sha256  a2a18f5ad36d133c74bf9106b6445806fa253b09141a46392550394b647b221e libdvdnav-7.0.0.tar.xz
 
 # Hash for license file:
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
index e34c0710bc..c4325c4711 100644
--- a/package/libdvdnav/libdvdnav.mk
+++ b/package/libdvdnav/libdvdnav.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LIBDVDNAV_VERSION = 6.1.1
-LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.bz2
-LIBDVDNAV_SITE = http://www.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
+LIBDVDNAV_VERSION = 7.0.0
+LIBDVDNAV_SOURCE = libdvdnav-$(LIBDVDNAV_VERSION).tar.xz
+LIBDVDNAV_SITE = https://download.videolan.org/pub/videolan/libdvdnav/$(LIBDVDNAV_VERSION)
 LIBDVDNAV_INSTALL_STAGING = YES
-LIBDVDNAV_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 LIBDVDNAV_DEPENDENCIES = libdvdread host-pkgconf
 LIBDVDNAV_LICENSE = GPL-2.0+
 LIBDVDNAV_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
