Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4A1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 21:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92C58418FA;
	Fri, 27 May 2022 21:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_Yh1p0OMqfB; Fri, 27 May 2022 21:20:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D8E40AA2;
	Fri, 27 May 2022 21:20:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01F731BF2C9
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2FC460E99
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 21:20:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gn7Lg_vcyq_l for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 21:20:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16EF260E79
 for <buildroot@buildroot.org>; Fri, 27 May 2022 21:20:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ECFCF866C5; Fri, 27 May 2022 21:09:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 21:35:38 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0c1b40a3acbb8d5dabb99f6e6c89cde613ef2aa4
X-Git-Newrev: e4b7bc8a47a21718737767940dd346673b17085f
X-Patchwork-Hint: ignore
Message-Id: <20220527210908.ECFCF866C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mpd: fix iconv
 detection w/ libiconv installed
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4b7bc8a47a21718737767940dd346673b17085f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix build failures caused by meson failing to properly detect iconv() when
libiconv is installed and a missing link dependency.

Upstream pull request:
https://github.com/MusicPlayerDaemon/MPD/pull/1515

Fixes the following build failures:
http://autobuild.buildroot.net/results/7a0/7a0fe4e9248ed96a5c4934361de16e0b59a51d50/

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9b715b549c5b156704b2f413cf97f39c500fc73d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-iconv-detection-when-libiconv-is-ins.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch b/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch
new file mode 100644
index 0000000000..162999dc5f
--- /dev/null
+++ b/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch
@@ -0,0 +1,53 @@
+From 3882a5a263caa681778a21b1f5f13a1b64536796 Mon Sep 17 00:00:00 2001
+From: aeolio <git@aeolio.de>
+Date: Wed, 20 Apr 2022 16:10:39 +0200
+Subject: [PATCH] src/lib/icu: fix iconv() detection when libiconv is installed
+
+Signed-off-by: aeolio <git@aeolio.de>
+Upstream: https://github.com/MusicPlayerDaemon/MPD/pull/1515
+Signed-off-by: Andreas Ziegler <br015@umbiko.net>
+---
+ src/lib/icu/meson.build | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/icu/meson.build b/src/lib/icu/meson.build
+index 59215e704..972c1fda3 100644
+--- a/src/lib/icu/meson.build
++++ b/src/lib/icu/meson.build
+@@ -12,17 +12,23 @@ if is_windows
+   icu_sources += 'Win32.cxx'
+ endif
+ 
++iconv_dep = []
+ if icu_dep.found()
+   icu_sources += [
+     'Util.cxx',
+     'Init.cxx',
+   ]
+ elif not get_option('iconv').disabled()
+-  have_iconv = compiler.has_function('iconv', prefix : '#include <iconv.h>')
+-  conf.set('HAVE_ICONV', have_iconv)
++  # an installed iconv library will make the builtin iconv() unavailable,
++  # so search for the library first and pass it as (possible) dependency
++  iconv_dep = compiler.find_library('libiconv', required: false)
++  have_iconv = compiler.has_function('iconv', 
++    dependencies: iconv_dep, 
++    prefix : '#include <iconv.h>')
+   if not have_iconv and get_option('iconv').enabled()
+     error('iconv() not available')
+   endif
++  conf.set('HAVE_ICONV', have_iconv)
+ endif
+ 
+ icu = static_library(
+@@ -31,6 +37,7 @@ icu = static_library(
+   include_directories: inc,
+   dependencies: [
+     icu_dep,
++    iconv_dep,
+     fmt_dep,
+   ],
+ )
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
