Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6B7C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F350440986;
	Mon,  4 Apr 2022 19:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewo0RbnJIFsB; Mon,  4 Apr 2022 19:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C208740984;
	Mon,  4 Apr 2022 19:47:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 635DE1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51C8B60BEF
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iX9JNKncnXa8 for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:46:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C5BD60B1C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:46:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C99F282965; Mon,  4 Apr 2022 19:37:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:32:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5197ce5ff30d1a23b811ddddca8030f13658d7da
X-Git-Newrev: 3239fb5b179d043ecfc854dd2f4962444d8b36a6
X-Patchwork-Hint: ignore
Message-Id: <20220404193732.C99F282965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpsl: fix build with libiconv
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

commit: https://git.buildroot.net/buildroot/commit/?id=3239fb5b179d043ecfc854dd2f4962444d8b36a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 47acda3a95bd4310f884e741f20785d374af7b22:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/libpsl.so.5.3.2.p/psl.c.o: in function `psl_str_to_utf8lower':
psl.c:(.text+0x1584): undefined reference to `libiconv_open'

Fixes:
 - http://autobuild.buildroot.org/results/8f012331acd3edb96a69d374436884679add8860

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...001-Add-libiconv-dep-to-meson-build-again.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch b/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
new file mode 100644
index 0000000000..72f50aa593
--- /dev/null
+++ b/package/libpsl/0001-Add-libiconv-dep-to-meson-build-again.patch
@@ -0,0 +1,60 @@
+From 5b63816e82287808e81b8603a528af3cc6fab354 Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <zhilizhao@tencent.com>
+Date: Thu, 7 Jan 2021 20:59:17 +0800
+Subject: [PATCH] Add libiconv dep to meson build again
+
+Build success on macOS and ubuntu.
+
+[Retrieved from:
+https://github.com/rockdaboot/libpsl/commit/5b63816e82287808e81b8603a528af3cc6fab354]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build     | 14 ++++++++++++++
+ src/meson.build |  2 +-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index f248171..fb2de31 100644
+--- a/meson.build
++++ b/meson.build
+@@ -20,6 +20,7 @@ libicu_dep = notfound
+ libidn_dep = notfound
+ libunistring = notfound
+ networking_deps = notfound
++libiconv_dep = notfound
+ 
+ # FIXME: Cleanup this when Meson gets 'feature-combo':
+ # https://github.com/mesonbuild/meson/issues/4566
+@@ -86,6 +87,19 @@ endif
+ if libidn2_dep.found() or libidn_dep.found()
+   # Check for libunistring, we need it for psl_str_to_utf8lower()
+   libunistring = cc.find_library('unistring')
++  found_iconv = false
++  if cc.has_function('iconv_open')
++    libiconv_dep = []
++    found_iconv = true
++  endif
++  if not found_iconv and cc.has_header_symbol('iconv.h', 'iconv_open')
++    libiconv_dep = [cc.find_library('iconv')]
++    found_iconv = true
++  endif
++
++  if not found_iconv
++    error('iconv implementation not found')
++  endif
+ endif
+ 
+ if host_machine.system() == 'windows'
+diff --git a/src/meson.build b/src/meson.build
+index 0d1dcdf..746bf44 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -19,7 +19,7 @@ cargs = [
+ libpsl = library('psl', sources, suffixes_dafsa_h,
+   include_directories : [configinc, includedir],
+   c_args : cargs,
+-  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps],
++  dependencies : [libidn2_dep, libidn_dep, libicu_dep, libunistring, networking_deps, libiconv_dep],
+   version: lt_version,
+   install: true,
+ )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
