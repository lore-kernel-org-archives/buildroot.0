Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CD6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 09:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EEDC6F4C3;
	Sat, 28 May 2022 09:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAEYemsf7sgk; Sat, 28 May 2022 09:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 731F26109C;
	Sat, 28 May 2022 09:20:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54AD51BF5DA
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9B7D419AF
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 09:17:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZuJUAdAhB3Wo for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69F2A419B2
 for <buildroot@buildroot.org>; Sat, 28 May 2022 09:17:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D34584245; Sat, 28 May 2022 09:05:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 11:15:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4b364f26e6cbb9e370567b5d71e47f4001501d96
X-Git-Newrev: e2fb74103e3b5dac0a76de59152583ca9473c0cf
X-Patchwork-Hint: ignore
Message-Id: <20220528090538.3D34584245@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mpd: update to
 version 0.23.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2fb74103e3b5dac0a76de59152583ca9473c0cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Minor bug fixes, including upstream fix for meson iconv handling, which makes
0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch redundant.

Introduces version dependencies for libshout and libupnp, which are met since
01/2021 (commit 118648d161).

Full change log:
  https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.7/NEWS

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4c22b1650dcb1f4f946acc619ffcd3fd5921717c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-iconv-detection-when-libiconv-is-ins.patch | 53 ----------------------
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 55 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
