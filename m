Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725A0CFD313
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 22:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D09382EF0;
	Sat, 22 Nov 2025 22:24:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0P8llIPsJ9Tz; Sat, 22 Nov 2025 22:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 124FB82E1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 124FB82E1A;
	Sat, 22 Nov 2025 22:24:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2889F158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A7A36084C
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKQIUcaJ9PKZ for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 22:24:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08B426083D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B426083D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08B426083D
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 22:24:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72036A4C75F1;
 Sat, 22 Nov 2025 23:23:28 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51218)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMw0t-0000000041D-3r3X;
 Sat, 22 Nov 2025 22:23:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Nov 2025 23:23:27 +0100
Message-ID: <20251122222327.1913289-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251122222327.1913289-1-bernd@kuhls.net>
References: <20251122222327.1913289-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763850208;
 bh=OdpPEpBkYWEsDaWcmfJ406fEHp+9YPYJS1zl/twhcVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=FRut7dosIEljnJ86hJ3WrFM8aa4y7WOpkHosA4vm2qDklKC94DZRPWFiBB5/suAnw
 YQ1+sDemwYzcryiyRTYwkhIHE6sQNtejeQaHfnf6HHlKAq8icy9e0vHFy/iB9Z1iOV
 G3vfnOjPpx3/AIBct2edAAJ20Kvou6G1hsogRNnLmB49EQ741dCQ6irJMnPJkhxEQV
 rQhOC2sGrzXcbXM8ikBLCsUum1K2qfxJurZ31wZczy7iw6X9yiX1Ef5TQ/1BM5D4LG
 X6zf4WPcruTyFDvEgAOcyKxzhiI+dzwZ/PICeG9R5V9hJNFU92e1rTC7WIJuhW43Bb
 1BTzApiESeHCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=FRut7dos
Subject: [Buildroot] [PATCH 3/3] package/upmpdcli: bump version to 1.9.7
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
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html
"You need to update to at least 1.9.5 if you build with gcc 15 and
later+."

Switched _SITE to https.

Switched build system to meson after autotools were removed in version
1.8.10:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html#_2024_04_03_switching_the_build_tools_from_gnu_autotools_to_meson

Remove spotify-related configure option after upstream removed spotify
support:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html#UPMPDCLI-1.7.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/upmpdcli/upmpdcli.hash |  4 ++--
 package/upmpdcli/upmpdcli.mk   | 11 +++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index f585a73d7f..58899e0dd3 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,5 +1,5 @@
-# From http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.5.12.tar.gz.sha256:
-sha256  1d7b6ab360c2549a7e3eff4f261471761dd837e18327a3ca29de1981c090ff3b  upmpdcli-1.5.12.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.9.7.tar.gz.sha256
+sha256  7b10cc35cae9377c542aba3983dfd39e34b4dd5fff64512f54feb87e64cf8609  upmpdcli-1.9.7.tar.gz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 2f001c51ee..d2d91114f3 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,17 +4,12 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 1.5.12
-UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+UPMPDCLI_VERSION = 1.9.7
+UPMPDCLI_SITE = https://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = LGPL-2.1+
 UPMPDCLI_LICENSE_FILES = COPYING
 UPMPDCLI_DEPENDENCIES = host-pkgconf libmpdclient libupnpp libmicrohttpd jsoncpp
 
-# Disable spotify plugin which requires dlfcn.h
-ifeq ($(BR2_STATIC_LIBS),y)
-UPMPDCLI_CONF_OPTS += --disable-spotify
-endif
-
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
 	upmpdcli -1 upmpdcli -1 * - - audio Upmpdcli MPD UPnP Renderer Front-End
@@ -35,4 +30,4 @@ endef
 
 UPMPDCLI_POST_INSTALL_TARGET_HOOKS += UPMPDCLI_INSTALL_CONF_FILE
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
