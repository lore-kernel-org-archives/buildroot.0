Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DAAC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68DCF83ED1;
	Sun, 14 Aug 2022 19:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68DCF83ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIch2pxkr8jG; Sun, 14 Aug 2022 19:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A9183689;
	Sun, 14 Aug 2022 19:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A9183689
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C51EC1BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A053D83689
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A053D83689
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6Z41yj5xpQX for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:48:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEF3B82BF4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEF3B82BF4
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 43FCA8758E; Sun, 14 Aug 2022 19:33:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:47:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69cbdbe8877f5ee1e51d05cfe71b636635df9c3c
X-Git-Newrev: 70db731a792f992f4ea8304a95a167c0c9203783
X-Patchwork-Hint: ignore
Message-Id: <20220814193342.43FCA8758E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jose: disable man pages
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

commit: https://git.buildroot.net/buildroot/commit/?id=70db731a792f992f4ea8304a95a167c0c9203783
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable man pages to avoid the following build failure if a non-working
a2x is found on the system raised since bump to version 11 in commit
b72b849ad597810823ecf9efe471a40e2427c8e8:

/usr/bin/a2x -f manpage -D /nvmedata/autobuild/instance-23/output-1/build/jose-11/build /nvmedata/autobuild/instance-23/output-1/build/jose-11/doc/man/jose.1.adoc
/nvmedata/autobuild/instance-23/output-1/host/bin/python3: Error while finding module specification for 'asciidoc.a2x' (ModuleNotFoundError: No module named 'asciidoc')

Fixes:
 - http://autobuild.buildroot.org/results/ae69f7fd1258d99a5b08eeb8c67904be53eabf15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...man-add-option-to-skip-building-man-pages.patch | 64 ++++++++++++++++++++++
 package/jose/jose.mk                               |  1 +
 2 files changed, 65 insertions(+)

diff --git a/package/jose/0002-man-add-option-to-skip-building-man-pages.patch b/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
new file mode 100644
index 0000000000..3a5ad1eadc
--- /dev/null
+++ b/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
@@ -0,0 +1,64 @@
+From 506132d3edc8d062f65fdacf007a15613d27e5c5 Mon Sep 17 00:00:00 2001
+From: Eneas U de Queiroz <cotequeiroz@gmail.com>
+Date: Wed, 6 Apr 2022 09:49:48 -0300
+Subject: [PATCH] man: add option to skip building man pages
+
+Add a 'skip_manpages' option to meson, so that man pages do not get
+built.
+
+Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
+[Retrieved from: https://github.com/latchset/jose/pull/115]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build       | 24 +++++++++++++-----------
+ meson_options.txt |  1 +
+ 2 files changed, 14 insertions(+), 11 deletions(-)
+ create mode 100644 meson_options.txt
+
+diff --git a/meson.build b/meson.build
+index 1edfbe7..9b40efb 100644
+--- a/meson.build
++++ b/meson.build
+@@ -37,7 +37,6 @@ zlib = dependency('zlib')
+ threads = dependency('threads')
+ jansson = dependency('jansson', version: '>=2.10')
+ libcrypto = dependency('libcrypto', version: '>=1.0.2')
+-a2x = find_program('a2x', required: false)
+ 
+ mans = []
+ 
+@@ -63,14 +62,17 @@ pkg.generate(
+   requires: 'jansson',
+ )
+ 
+-if a2x.found()
+-  foreach m : mans
+-    custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
+-      command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
+-      install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
+-      install: true
+-    )
+-  endforeach
+-else
+-  warning('Will not build man pages due to missing dependencies!')
++if not get_option('skip_manpages')
++  a2x = find_program('a2x', required: false)
++  if a2x.found()
++    foreach m : mans
++      custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
++        command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
++        install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
++        install: true
++      )
++    endforeach
++  else
++    warning('Will not build man pages due to missing dependencies!')
++  endif
+ endif
+diff --git a/meson_options.txt b/meson_options.txt
+new file mode 100644
+index 0000000..0885515
+--- /dev/null
++++ b/meson_options.txt
+@@ -0,0 +1 @@
++option('skip_manpages', type: 'boolean', value: false, description: 'Do not build manpages')
diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 8a60e20cc6..723ebe8bb9 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -11,5 +11,6 @@ JOSE_LICENSE = Apache-2.0
 JOSE_LICENSE_FILES = COPYING
 JOSE_INSTALL_STAGING = YES
 JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
+JOSE_CONF_OPTS = -Dskip_manpages=true
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
