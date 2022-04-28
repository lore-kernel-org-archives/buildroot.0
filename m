Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC3FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 06:11:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16A89826B4;
	Thu, 28 Apr 2022 06:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AEHkmKuTDdA0; Thu, 28 Apr 2022 06:11:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09DE0824F4;
	Thu, 28 Apr 2022 06:11:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 352611BF379
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 06:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 321F2813E5
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 06:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wt_TL8yCW3e7 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 06:11:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00E2B812CD
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 06:11:36 +0000 (UTC)
Received: from iago.. (unknown [151.43.181.239])
 by serv15.avernis.de (Postfix) with ESMTPSA id 8BAA1CB4428D;
 Thu, 28 Apr 2022 08:10:51 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 08:10:31 +0200
Message-Id: <20220428061031.3443-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <fa4889f5-77f6-2406-5495-df83fb9fee48@mind.be>
References: <fa4889f5-77f6-2406-5495-df83fb9fee48@mind.be>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v2 1/1] package/mpd: fix iconv detection w/
 libiconv installed
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

Fix build failures caused by meson failing to properly detect iconv() when 
libiconv is installed and a missing link dependency. 

Upstream pull request:
https://github.com/MusicPlayerDaemon/MPD/pull/1515

Fixes the following build failures:
http://autobuild.buildroot.net/results/7a0/7a0fe4e9248ed96a5c4934361de16e0b59a51d50/

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
changes v1->v2:
  extract patch from git w/o numbering, fix typo, add signed-off-by

 ...iconv-detection-when-libiconv-is-ins.patch | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch

diff --git a/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch b/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch
new file mode 100644
index 0000000000..63742c0cbe
--- /dev/null
+++ b/package/mpd/0002-src-lib-icu-fix-iconv-detection-when-libiconv-is-ins.patch
@@ -0,0 +1,55 @@
+From 3882a5a263caa681778a21b1f5f13a1b64536796 Mon Sep 17 00:00:00 2001
+From: aeolio <git@aeolio.de>
+Date: Wed, 20 Apr 2022 16:10:39 +0200
+Subject: [PATCH] src/lib/icu: fix iconv() detection when libiconv is installed
+
+Signed-off-by: aeolio <git@aeolio.de>
+
+Fix typo in comment
+
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
