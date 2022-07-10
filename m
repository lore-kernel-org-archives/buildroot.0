Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49444C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Jul 2022 21:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CF53408FB;
	Sun, 10 Jul 2022 21:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CF53408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k794dbpzhoz9; Sun, 10 Jul 2022 21:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B0DA4015D;
	Sun, 10 Jul 2022 21:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B0DA4015D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5B61BF3F6
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00BDF416C9
 for <buildroot@lists.busybox.net>; Sun, 10 Jul 2022 21:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BDF416C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJHqbqEmv1pq for <buildroot@lists.busybox.net>;
 Sun, 10 Jul 2022 21:13:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D38415EB
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87D38415EB
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 21:13:51 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a5so4725043wrx.12
 for <buildroot@buildroot.org>; Sun, 10 Jul 2022 14:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ZwtMqK9oFCAogfDMzrAqnSsrmhED2u9Q5PzWigErT8=;
 b=dRRHOlcyfMQpar2Th6PCSiHO1Ay551BvLtZONE679wc7ueplzjdHUMBLF6f1t/rRJ9
 YhIG/Yw5JWi/0Mhz+I3hq8DpjbC0T/x0jBfmgoDkoXoMAcPl1c8You0lzoquzwAnyv0l
 9G2QSdd8bUFRloXfnjqH9XbGe8LT8wDVKKMmy3jPF9IVoIOmXKObolnnsNlQNr7fh8F8
 wdy8Ww7pDh+GqK8blMMlw4m6wjINrVSMxb2HsGEbYRUFqBIAdto9kHN6WN9eSfjbdIMN
 ghOco8eGwTbl5DW4Nqc7z+ogrqLqcj/Lg/LnF4Jnnhjz2PQWy0gDrnXW24WHhUapaG6i
 ztOQ==
X-Gm-Message-State: AJIora8j2oKzgfFTwTxuVA6HU5FAwq01dG1ibP4I9DWH1XiXsIJHmtIY
 uJJGPA+BO5pgYqee1x8Gocgr3rPDz1c=
X-Google-Smtp-Source: AGRyM1vxpRYBP5ds1tslTErsfT9IXWZGICoTYWiHGBTEUUEtLX5H4Ei4J0RlIGJzO/DIYR1NGpIZsQ==
X-Received: by 2002:a5d:48c8:0:b0:21b:826a:6f86 with SMTP id
 p8-20020a5d48c8000000b0021b826a6f86mr13657680wrs.220.1657487629233; 
 Sun, 10 Jul 2022 14:13:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0ac700b003a2d47d3051sm5605397wmr.41.2022.07.10.14.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 14:13:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Jul 2022 23:09:59 +0200
Message-Id: <20220710210959.845640-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6ZwtMqK9oFCAogfDMzrAqnSsrmhED2u9Q5PzWigErT8=;
 b=UUtDI1aIBe1GChFA4qD7g6+FrAKHaIos8CXMKK3v3/GuiILpVbtRyoCaPR9lzB5Gwu
 0D1RpP94KLsyEgYsKjWzZByGSLMTjAaCtFVEFbp6Ws22rPlT1GYyAY4pxTxeQtKHxSa2
 LSxWzTnjepe/j+b8xWYYVTyR7vi6aU84Z2FRaMBVlrATxDn946XX3p59k6SdcryBJmHi
 LZ9jJyYJfcqbot2MjyATe2OEo8Il2yTc6/UZuLy226ScJ/lDzGK7XwEsbH3X2FKH2w/t
 OFz0p+IHyqkEGqG8a0dZO7bPypydtUWn731Kd5JCBUQa2h2ZU1SmcjOCC2wBHopdEAHr
 qZpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UUtDI1aI
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump to version 0.47
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- C++20 is mandatory since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/776e97b7a1f99e01d0d93bcbedbdc1736aad8ae6
- iconv is an optional dependency since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/68c04f925d780d0e5705950310e8233ab6898a29
- Second patch is not needed since
  https://github.com/MusicPlayerDaemon/ncmpc/commit/c264db04dd30af301e7d85c9d145bb1f1ae3fea3

https://github.com/MusicPlayerDaemon/ncmpc/blob/v0.47/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eson.build-link-with-lintl-if-needed.patch | 38 -------------------
 package/ncmpc/Config.in                       |  7 ++--
 package/ncmpc/ncmpc.hash                      |  2 +-
 package/ncmpc/ncmpc.mk                        |  3 +-
 4 files changed, 7 insertions(+), 43 deletions(-)
 delete mode 100644 package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch

diff --git a/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch b/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch
deleted file mode 100644
index 9f599c89e9..0000000000
--- a/package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 21ad6bf2bcb0745c25a28637449a72eee883a8e2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Apr 2019 19:19:10 +0200
-Subject: [PATCH] meson.build: link with lintl if needed
-
-Fixes:
- - http://autobuild.buildroot.org/results/d53978fb30d77cb4d10921bf721eff3d066567ce
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent as upstream already rejected the first patch
-on atomic: https://github.com/MusicPlayerDaemon/ncmpc/pull/45]
----
- meson.build | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 2e6defc..28e9d29 100644
---- a/meson.build
-+++ b/meson.build
-@@ -42,6 +42,7 @@ else
-   error('libintl.h not found')
- endif
- conf.set('ENABLE_NLS', enable_nls)
-+intl_dep = cc.find_library('intl', required: false)
- if enable_nls
-   conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
-   subdir('po')
-@@ -356,6 +357,7 @@ ncmpc = executable('ncmpc',
-     boost_dep,
-     pcre_dep,
-     curses_dep,
-+    intl_dep,
-     lirc_dep,
-     libmpdclient_dep,
-   ],
--- 
-2.20.1
-
diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index eda6e0bbd5..61c186a4ae 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_NCMPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
 	help
@@ -14,7 +14,8 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 7"
+comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 10"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index a5d6698a61..17bc6e3ace 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  177f77cf09dd4ab914e8438be399cdd5d83c9aa992abc8d9abac006bb092934e  ncmpc-0.46.tar.xz
+sha256  61da23b1bc6c7a593fdc28611932cd7a30fcf6803830e01764c29b8abed2249c  ncmpc-0.47.tar.xz
 
 # Hash for license file:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 41fface525..5d4702de78 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,13 +5,14 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).46
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).47
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
 	host-pkgconf \
 	libmpdclient \
 	ncurses \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(TARGET_NLS_DEPENDENCIES)
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
