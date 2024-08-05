Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F48C3DA4A
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 19:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1528400E4;
	Mon,  5 Aug 2024 19:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e9JFwDeSrWVH; Mon,  5 Aug 2024 19:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7353F405BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7353F405BA;
	Mon,  5 Aug 2024 19:09:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7ED9C1BF34A
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BDF9400E4
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qeD5N4ZnxATc for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 19:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C670405BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C670405BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C670405BA
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 19:09:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bad7.dip0.t-ipconnect.de [84.161.186.215])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2FA63A4C0161;
 Mon,  5 Aug 2024 21:09:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54166)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sb34w-000000000Ko-2EI2;
 Mon, 05 Aug 2024 19:09:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 21:09:10 +0200
Message-Id: <20240805190910.3411004-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722884951;
 bh=lTkcKnyo8jcIntLzRwu5fsWMxrrY0E20eLrWoA/IOm8=;
 h=From:To:Cc:Subject:Date:From;
 b=FtUXfFDXvSpOHWW963Y0uV5Dk93d7dhUyP14HRK6VlpLoit+P2UeryTUQLPzRFonO
 /X9bwm+gp+pGnUPuYwTn+3gHyRGk98jiPGkFOjzY7tMSZD/Hz1GUz0Reb+b652SgOZ
 rtqQpC+jOEtL0vP9O3pktMRZvmFcYDcG3ObKrKrEc17VCZB7GIFTpR7l1wp08arJv9
 bo8Zs55dbTECgKRnsbpXkmSaVj/Wl4ZD8nCYysvBtFgSYZ0KW1CLQIpI9XvhsaYn1n
 4VH5VXW0reVO8h+qlXfFxF0zxYjlsY93O/BPzh3AUcJ63ZIa7jhqiIn7CbncjDJnJi
 19u+oKiawIwGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=FtUXfFDX
Subject: [Buildroot] [PATCH 1/1] package/libxml2: bump version to 2.13.3
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add configure option --with-http to enable HTTP support which is now
disabled by default to preserve previous behaviour.

Release notes:
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.0.news
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.1.news
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.2.news
https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.3.news

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libxml2/libxml2.hash | 6 +++---
 package/libxml2/libxml2.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index 73fd0ecedf..7b9ffc5d47 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libxml2/2.12/libxml2-2.12.9.sha256sum
-sha256  59912db536ab56a3996489ea0299768c7bcffe57169f0235e7f962a91f483590  libxml2-2.12.9.tar.xz
+# From https://download.gnome.org/sources/libxml2/2.13/libxml2-2.13.3.sha256sum
+sha256  0805d7c180cf09caad71666c7a458a74f041561a532902454da5047d83948138  libxml2-2.13.3.tar.xz
 # License files, locally calculated
-sha256  7fb0a66f3989f9bd5c7e5438a3de02cd4a7a47dde0aea2f7ea2ba2ff454ee6a4  Copyright
+sha256  c99aae1afe013e50b8b3701e089222b351258043c3025b64053a233fd25b4be7  Copyright
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index b69722b21d..068ce157d5 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBXML2_VERSION_MAJOR = 2.12
-LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).9
+LIBXML2_VERSION_MAJOR = 2.13
+LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).3
 LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
 LIBXML2_SITE = \
 	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
@@ -20,7 +20,7 @@ ifeq ($(BR2_m68k_cf),y)
 LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
 endif
 
-LIBXML2_CONF_OPTS = --with-gnu-ld --without-debug
+LIBXML2_CONF_OPTS = --with-http --with-gnu-ld --without-debug
 
 HOST_LIBXML2_DEPENDENCIES = host-pkgconf
 LIBXML2_DEPENDENCIES = host-pkgconf
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
