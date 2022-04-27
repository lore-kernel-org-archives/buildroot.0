Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF4AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 05:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AB0B40286;
	Wed, 27 Apr 2022 05:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfUOw4Vdva9u; Wed, 27 Apr 2022 05:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F4714023D;
	Wed, 27 Apr 2022 05:27:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF4F51BF4D5
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 05:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC9964023D
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 05:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDb662v3XhDi for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 05:27:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45ADF40017
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 05:27:32 +0000 (UTC)
Received: from iago.. (rm-19-6-95.service.infuturo.it [151.19.6.95])
 by serv15.avernis.de (Postfix) with ESMTPSA id 8E8AACCC788F;
 Wed, 27 Apr 2022 07:27:29 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 07:27:15 +0200
Message-Id: <20220427052715.7642-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH 1/1] package/mpd: fix iconv detection w/
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
 ...detection-when-libiconv-is-installed.patch | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/mpd/0002-fix-iconv-detection-when-libiconv-is-installed.patch

diff --git a/package/mpd/0002-fix-iconv-detection-when-libiconv-is-installed.patch b/package/mpd/0002-fix-iconv-detection-when-libiconv-is-installed.patch
new file mode 100644
index 0000000000..6121bc9740
--- /dev/null
+++ b/package/mpd/0002-fix-iconv-detection-when-libiconv-is-installed.patch
@@ -0,0 +1,71 @@
+From 3882a5a263caa681778a21b1f5f13a1b64536796 Mon Sep 17 00:00:00 2001
+From: aeolio <git@aeolio.de>
+Date: Wed, 20 Apr 2022 16:10:39 +0200
+Subject: [PATCH 1/2] src/lib/icu: fix iconv() detection when libiconv is
+ installed
+
+---
+ src/lib/icu/meson.build | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/icu/meson.build b/src/lib/icu/meson.build
+index 59215e704b..972c1fda3f 100644
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
++  # an installed iconv library will make the builtin iconf() unavailable,
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
+
+From ee39af34199aa875e109f7002a401d6ebbd66c22 Mon Sep 17 00:00:00 2001
+From: aeolio <git@aeolio.de>
+Date: Sun, 24 Apr 2022 04:14:17 +0000
+Subject: [PATCH 2/2] fix typo in comment
+
+---
+ src/lib/icu/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/icu/meson.build b/src/lib/icu/meson.build
+index 972c1fda3f..6e489876b8 100644
+--- a/src/lib/icu/meson.build
++++ b/src/lib/icu/meson.build
+@@ -19,7 +19,7 @@ if icu_dep.found()
+     'Init.cxx',
+   ]
+ elif not get_option('iconv').disabled()
+-  # an installed iconv library will make the builtin iconf() unavailable,
++  # an installed iconv library will make the builtin iconv() unavailable,
+   # so search for the library first and pass it as (possible) dependency
+   iconv_dep = compiler.find_library('libiconv', required: false)
+   have_iconv = compiler.has_function('iconv', 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
