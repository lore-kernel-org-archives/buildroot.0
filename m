Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35161C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 05:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE46A6107B;
	Wed, 11 May 2022 05:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P0QTNyUc4oWd; Wed, 11 May 2022 05:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C00EA6106F;
	Wed, 11 May 2022 05:20:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DAC71BF37A
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 05:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C466415B6
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 05:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUcnPn3Rkn8X for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 05:20:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61321415B7
 for <buildroot@buildroot.org>; Wed, 11 May 2022 05:20:14 +0000 (UTC)
Received: from iago.. (unknown [151.37.22.168])
 by serv15.avernis.de (Postfix) with ESMTPSA id 3A3F9C9081A1;
 Wed, 11 May 2022 07:20:11 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 07:19:53 +0200
Message-Id: <20220511051953.34515-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.23.7
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
Cc: Andreas Ziegler <br015@umbiko.net>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Minor bug fixes, including upstream fix for meson iconv handling, which makes 
0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch redundant. 

Introduces version dependencies for libshout and libupnp, which are met since 
01/2021 (commit 118648d161). 

Full change log:
  https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.7/NEWS

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 ...iconv-detection-when-libiconv-is-ins.patch | 53 -------------------
 package/mpd/mpd.hash                          |  2 +-
 package/mpd/mpd.mk                            |  2 +-
 3 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch

diff --git a/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch b/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch
deleted file mode 100644
index 162999dc5f..0000000000
--- a/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 3882a5a263caa681778a21b1f5f13a1b64536796 Mon Sep 17 00:00:00 2001
-From: aeolio <git@aeolio.de>
-Date: Wed, 20 Apr 2022 16:10:39 +0200
-Subject: [PATCH] src/lib/icu: fix iconv() detection when libiconv is installed
-
-Signed-off-by: aeolio <git@aeolio.de>
-Upstream: https://github.com/MusicPlayerDaemon/MPD/pull/1515
-Signed-off-by: Andreas Ziegler <br015@umbiko.net>
----
- src/lib/icu/meson.build | 11 +++++++++--
- 1 file changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/icu/meson.build b/src/lib/icu/meson.build
-index 59215e704..972c1fda3 100644
---- a/src/lib/icu/meson.build
-+++ b/src/lib/icu/meson.build
-@@ -12,17 +12,23 @@ if is_windows
-   icu_sources += 'Win32.cxx'
- endif
- 
-+iconv_dep = []
- if icu_dep.found()
-   icu_sources += [
-     'Util.cxx',
-     'Init.cxx',
-   ]
- elif not get_option('iconv').disabled()
--  have_iconv = compiler.has_function('iconv', prefix : '#include <iconv.h>')
--  conf.set('HAVE_ICONV', have_iconv)
-+  # an installed iconv library will make the builtin iconv() unavailable,
-+  # so search for the library first and pass it as (possible) dependency
-+  iconv_dep = compiler.find_library('libiconv', required: false)
-+  have_iconv = compiler.has_function('iconv', 
-+    dependencies: iconv_dep, 
-+    prefix : '#include <iconv.h>')
-   if not have_iconv and get_option('iconv').enabled()
-     error('iconv() not available')
-   endif
-+  conf.set('HAVE_ICONV', have_iconv)
- endif
- 
- icu = static_library(
-@@ -31,6 +37,7 @@ icu = static_library(
-   include_directories: inc,
-   dependencies: [
-     icu_dep,
-+    iconv_dep,
-     fmt_dep,
-   ],
- )
--- 
-2.34.1
-
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index b09140abf5..353df25b39 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  cbc5928ee3ee1ef7ff6a58f6ba4afaee16c07e9eb42d0107bcc098010f4f26ed  mpd-0.23.6.tar.xz
+sha256  960dcbac717c388f5dcc4fd945e3af19a476f2b15f367e9653d4c7a948768211  mpd-0.23.7.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 12da36098f..20c8f77fa8 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).6
+MPD_VERSION = $(MPD_VERSION_MAJOR).7
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
