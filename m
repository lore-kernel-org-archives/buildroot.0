Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B730C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 17:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBA9340055;
	Sat, 14 Jan 2023 17:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA9340055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjEqQB8yyouh; Sat, 14 Jan 2023 17:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF0C040AB9;
	Sat, 14 Jan 2023 17:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF0C040AB9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793B11BF281
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50DA360F24
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50DA360F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHBMiwFVviz6 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 17:56:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E84E960BAC
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E84E960BAC
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 17:56:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q10so4494357wrs.2
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 09:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8nLLy/BlN0FQsqVKLmwVforv4W9wgFWECV8v/7Nt6gQ=;
 b=pgv/pYL5suFpN26o9kntXpOwiOMY32dGDvqdhkbWhpvu4OJTHhqdAg2hhrhrDniUo+
 pIi27kwtOyrfmMV2+P4e2s8P4j17RAVLNcnG4590EhAcKyUFHEvxRC8Cu++saje4Fj8W
 533M5NqlOHbxzmigzIPhYkZuIb1yaq9XeEmDIgp2h8SvXGPpP758g7fpCeoRPuvkv3aV
 HdqajsZ2tj8ldw80mObMY11aVhFPL+jcpVSqX9JVuPJqMsnvZcup9Pr/WFGH4RPOW+W7
 qzc5k9Vxi/I9rahpLV13Tmz5CM0xj2C3/E8HEqdnYcVUePcNYWW3Qv6GQ6JKWS0Y9YtL
 Llng==
X-Gm-Message-State: AFqh2kq1EzqzZWzeNBI+veHHxpvJOoXQqRBwfKA1eWfTLfq++8Uw0QYk
 4Ou0WBkD6NfkUag6lL2qUdgnRWJgFRQ=
X-Google-Smtp-Source: AMrXdXvPDobi2VczEwK/rgTb/0zrAYts+YZn0wbKWamsdj7gmNxAWgYok26Pu2fKSn9NIbY6R5ysCA==
X-Received: by 2002:adf:e7cd:0:b0:2bd:d782:c2b8 with SMTP id
 e13-20020adfe7cd000000b002bdd782c2b8mr6776246wrn.29.1673718967883; 
 Sat, 14 Jan 2023 09:56:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d6b8a000000b002425787c5easm21924234wrx.96.2023.01.14.09.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 09:56:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 18:54:46 +0100
Message-Id: <20230114175446.1352883-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8nLLy/BlN0FQsqVKLmwVforv4W9wgFWECV8v/7Nt6gQ=;
 b=XBi13pQhR4HIBW5qYVp6s8u7cGC49ztMKL27n7+/0jasPSoon2Yg0LruH/22IIdAxg
 pBAc++Nfada0srjdpspNU1rWtwUILk/H9KMM/k0AVR1CwscgZgf0DT4HeaSRCbBpoaFD
 C9kEgkrGgKAZul5GdJaq6IY8SvNuX02adS5SIIVYhCSU35WUoK0dTesSNHd6cYxeW4lz
 lh2WKLp5jyLPWGkfXiKcM9gJ5a4UpoaCXttZtcZO+au5gg0vKkdBslGN+dWAkG9pJfst
 YfHSQjf3qrakhh5T9JELa2hTYvgxGtUUH+RrLfHYqRthKAutGUsVmw9d25nsV8YO25tC
 Vfbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XBi13pQh
Subject: [Buildroot] [PATCH 1/1] package/libpsl: bump to version 0.21.2
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update hash of COPYING (update in year:
  https://github.com/rockdaboot/libpsl/commit/927b202c69bcd9be4c30ba51c74925f2575e1a69)
- builtin is a boolean since
  https://github.com/rockdaboot/libpsl/commit/aa4909766c24c17bd1d9000ca419f6dc6b32c238

https://github.com/rockdaboot/libpsl/releases/tag/0.21.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...dd-libiconv-dep-to-meson-build-again.patch | 60 -------------------
 package/libpsl/libpsl.hash                    |  4 +-
 package/libpsl/libpsl.mk                      |  9 +--
 3 files changed, 7 insertions(+), 66 deletions(-)
 delete mode 100644 package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch

diff --git a/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch b/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
deleted file mode 100644
index 72f50aa593..0000000000
--- a/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5b63816e82287808e81b8603a528af3cc6fab354 Mon Sep 17 00:00:00 2001
-From: Zhao Zhili <zhilizhao@tencent.com>
-Date: Thu, 7 Jan 2021 20:59:17 +0800
-Subject: [PATCH] Add libiconv dep to meson build again
-
-Build success on macOS and ubuntu.
-
-[Retrieved from:
-https://github.com/rockdaboot/libpsl/commit/5b63816e82287808e81b8603a528af3cc6fab354]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- meson.build     | 14 ++++++++++++++
- src/meson.build |  2 +-
- 2 files changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index f248171..fb2de31 100644
---- a/meson.build
-+++ b/meson.build
-@@ -20,6 +20,7 @@ libicu_dep = notfound
- libidn_dep = notfound
- libunistring = notfound
- networking_deps = notfound
-+libiconv_dep = notfound
- 
- # FIXME: Cleanup this when Meson gets 'feature-combo':
- # https://github.com/mesonbuild/meson/issues/4566
-@@ -86,6 +87,19 @@ endif
- if libidn2_dep.found() or libidn_dep.found()
-   # Check for libunistring, we need it for psl_str_to_utf8lower()
-   libunistring = cc.find_library('unistring')
-+  found_iconv = false
-+  if cc.has_function('iconv_open')
-+    libiconv_dep = []
-+    found_iconv = true
-+  endif
-+  if not found_iconv and cc.has_header_symbol('iconv.h', 'iconv_open')
-+    libiconv_dep = [cc.find_library('iconv')]
-+    found_iconv = true
-+  endif
-+
-+  if not found_iconv
-+    error('iconv implementation not found')
-+  endif
- endif
- 
- if host_machine.system() == 'windows'
-diff --git a/src/meson.build b/src/meson.build
-index 0d1dcdf..746bf44 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -19,7 +19,7 @@ cargs = [
- libpsl = library('psl', sources, suffixes_dafsa_h,
-   include_directories : [configinc, includedir],
-   c_args : cargs,
--  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps],
-+  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps, libiconv_dep],
-   version: lt_version,
-   install: true,
- )
diff --git a/package/libpsl/libpsl.hash b/package/libpsl/libpsl.hash
index 552935e9ec..a35a609ff2 100644
--- a/package/libpsl/libpsl.hash
+++ b/package/libpsl/libpsl.hash
@@ -1,6 +1,6 @@
 # Locally generated
-sha256  ac6ce1e1fbd4d0254c4ddb9d37f1fa99dec83619c1253328155206b896210d4c  libpsl-0.21.1.tar.gz
+sha256  e35991b6e17001afa2c0ca3b10c357650602b92596209b7492802f3768a6285f  libpsl-0.21.2.tar.gz
 
 # Hashes for license files:
-sha256  7903413e7aa0bbcb77aa19150a3f1034edc0a760cff174f9a53efe4de6f056a4  COPYING
+sha256  776cd11d54f0ea3e5efdd25ff1a0d952a1744215bb5858ea7aeb91808e70c9f7  COPYING
 sha256  1d7f52747a9169751cdf2641a8299c0098e9ecdf9429296ffd55bdb14c9ed5b3  src/LICENSE.chromium
diff --git a/package/libpsl/libpsl.mk b/package/libpsl/libpsl.mk
index 742117e8ea..ef3c524b4f 100644
--- a/package/libpsl/libpsl.mk
+++ b/package/libpsl/libpsl.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LIBPSL_VERSION = 0.21.1
+LIBPSL_VERSION = 0.21.2
 LIBPSL_SITE = https://github.com/rockdaboot/libpsl/releases/download/$(LIBPSL_VERSION)
 LIBPSL_LICENSE = MIT, BSD-3-Clause
 LIBPSL_LICENSE_FILES = COPYING src/LICENSE.chromium
+LIBPSL_CONF_OPTS = -Dbuiltin=true
 LIBPSL_DEPENDENCIES = host-pkgconf
 LIBPSL_INSTALL_STAGING = YES
 
@@ -17,13 +18,13 @@ endif
 
 # The order of checks is the same as done by libpsl when configured.
 ifeq ($(BR2_PACKAGE_LIBIDN2)$(BR2_PACKAGE_LIBUNISTRING),yy)
-LIBPSL_CONF_OPTS += -Druntime=libidn2 -Dbuiltin=libidn2
+LIBPSL_CONF_OPTS += -Druntime=libidn2
 LIBPSL_DEPENDENCIES += libidn2 libunistring
 else ifeq ($(BR2_PACKAGE_ICU),y)
-LIBPSL_CONF_OPTS += -Druntime=libicu -Dbuiltin=libicu
+LIBPSL_CONF_OPTS += -Druntime=libicu
 LIBPSL_DEPENDENCIES += icu
 else
-LIBPSL_CONF_OPTS += -Druntime=libidn -Dbuiltin=libidn
+LIBPSL_CONF_OPTS += -Druntime=libidn
 LIBPSL_DEPENDENCIES += libidn libunistring
 endif
 
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
