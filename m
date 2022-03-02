Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A39EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Mar 2022 18:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B4C860B62;
	Wed,  2 Mar 2022 18:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXR6mys4CtfU; Wed,  2 Mar 2022 18:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB74360F29;
	Wed,  2 Mar 2022 18:37:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0831BF398
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 18:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8807660BDD
 for <buildroot@lists.busybox.net>; Wed,  2 Mar 2022 18:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vvd_Zi359KwO for <buildroot@lists.busybox.net>;
 Wed,  2 Mar 2022 18:37:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20C9360B5E
 for <buildroot@buildroot.org>; Wed,  2 Mar 2022 18:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EDD1D838CD; Wed,  2 Mar 2022 18:28:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Mar 2022 19:35:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41139cb0997af800c7d89213c5d89652b65ec6cb
X-Git-Newrev: 3739f0bf135e1cfe9034dc2797bdef3a2c981ecf
X-Patchwork-Hint: ignore
Message-Id: <20220302182850.EDD1D838CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rygel: disable man pages
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

commit: https://git.buildroot.net/buildroot/commit/?id=3739f0bf135e1cfe9034dc2797bdef3a2c981ecf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.40.2 in
commit 6acdbb81c8d6cdd3ecb476ae24e72fd4547011c3:

FAILED: doc/man/rygel.1
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/bin/xsltproc --nonet --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.authors.section.enabled 1 --stringparam man.copyright.section.enabled 1 -o doc/man/rygel.1 http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl ../doc/man/rygel.xml
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

Fixes:
 - http://autobuild.buildroot.org/results/297859cdb544e980826df28b446a75d32c06d839

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-build-Add-man_pages-build-options.patch   | 150 +++++++++++++++++++++
 package/rygel/rygel.mk                             |   1 +
 2 files changed, 151 insertions(+)

diff --git a/package/rygel/0001-build-Add-man_pages-build-options.patch b/package/rygel/0001-build-Add-man_pages-build-options.patch
new file mode 100644
index 0000000000..cdd7cc7721
--- /dev/null
+++ b/package/rygel/0001-build-Add-man_pages-build-options.patch
@@ -0,0 +1,150 @@
+From 5a54c5bb1c9609b7bffe6b3e05f934030e4e990e Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Sat, 26 Dec 2020 18:40:51 +0100
+Subject: [PATCH] build: Add man_pages build options
+
+Check if xsltproc runs succesfully and fail otherwise
+
+Fixes #192
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/rygel/-/commit/5a54c5bb1c9609b7bffe6b3e05f934030e4e990e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ doc/man/meson.build | 98 +++++++++++++++++++++++++++------------------
+ doc/meson.build     |  5 ++-
+ meson_options.txt   |  1 +
+ 3 files changed, 64 insertions(+), 40 deletions(-)
+
+diff --git a/doc/man/meson.build b/doc/man/meson.build
+index ef3fcfbf5..4c92eab2b 100644
+--- a/doc/man/meson.build
++++ b/doc/man/meson.build
+@@ -1,43 +1,63 @@
+ xsltproc = find_program('xsltproc', required: false)
+ 
+ if xsltproc.found()
+-  xlstproc_flags = [
+-    '--nonet',
+-    '--stringparam', 'man.output.quietly', '1',
+-    '--stringparam', 'funcsynopsis.style', 'ansi',
+-    '--stringparam', 'man.authors.section.enabled', '1',
+-    '--stringparam', 'man.copyright.section.enabled', '1',
+-  ]
+-
+-  xsltproc_args = [
+-    xsltproc,
+-    xlstproc_flags,
+-    '-o', '@OUTPUT@',
+-    'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl',
+-    '@INPUT@',
+-  ]
+-
+-  man_input_files = [
+-    'rygel.xml',
+-    'rygel.conf.xml'
+-  ]
+-
+-  man_output_files = [
+-    'rygel.1',
+-    'rygel.conf.5'
+-  ]
+-
+-  custom_target('man 1 pages',
+-                input: 'rygel.xml',
+-                output: 'rygel.1',
+-                command: xsltproc_args,
+-                install: true,
+-                install_dir: join_paths(get_option('mandir'), 'man1'))
+-
+-  custom_target('man 5 pages',
+-                input: 'rygel.conf.xml',
+-                output: 'rygel.conf.5',
+-                command: xsltproc_args,
+-                install: true,
+-                install_dir: join_paths(get_option('mandir'), 'man5'))
++    stylesheet = 'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl'
++
++    xlstproc_flags = [
++        '--nonet',
++        '--stringparam', 'man.output.quietly', '1',
++        '--stringparam', 'funcsynopsis.style', 'ansi',
++        '--stringparam', 'man.authors.section.enabled', '1',
++        '--stringparam', 'man.copyright.section.enabled', '1',
++    ]
++
++    xsltproc_args = [
++        xsltproc,
++        xlstproc_flags,
++        '-o', '@OUTPUT@',
++        stylesheet,
++        '@INPUT@',
++    ]
++
++    man_input_files = [
++        'rygel.xml',
++        'rygel.conf.xml'
++    ]
++
++    man_output_files = [
++        'rygel.1',
++        'rygel.conf.5'
++    ]
++
++    r = run_command(
++        [
++            xsltproc,
++            xlstproc_flags,
++            '-o', '/dev/null',
++            stylesheet,
++            'rygel.xml'
++        ]
++    )
++
++    if (r.returncode() == 0)
++        custom_target(
++            'man 1 pages',
++            input: 'rygel.xml',
++            output: 'rygel.1',
++            command: xsltproc_args,
++            install: true,
++            install_dir: join_paths(get_option('mandir'), 'man1')
++        )
++
++        custom_target(
++            'man 5 pages',
++            input: 'rygel.conf.xml',
++            output: 'rygel.conf.5',
++            command: xsltproc_args,
++            install: true,
++            install_dir: join_paths(get_option('mandir'), 'man5')
++        )
++    else
++        error('Cannot bulid man pages, failed to run xsltproc')
++    endif
+ endif
+diff --git a/doc/meson.build b/doc/meson.build
+index 41c733e50..91c08fae5 100644
+--- a/doc/meson.build
++++ b/doc/meson.build
+@@ -1,2 +1,5 @@
+-subdir('man')
++if get_option('man_pages')
++    subdir('man')
++endif
++
+ subdir('reference')
+diff --git a/meson_options.txt b/meson_options.txt
+index cb604c4e9..c60ff1a9a 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,5 +1,6 @@
+ option('uninstalled', type: 'boolean', value: 'false', description: 'Run Rygel from build directory only')
+ option('api-docs', type: 'boolean', value: 'false', description: 'Build the API documentation')
++option('man_pages', type: 'boolean', value: 'true', description: 'Build the man pages')
+ option('systemd-user-units-dir', type : 'string', value : 'auto', description : 'Where to install the systemd user unit (use special values "auto" or "none", or pass a path')
+ option('plugins', type : 'array', choices : ['external', 'gst-launch', 'lms', 'media-export', 'mpris', 'playbin', 'ruih', 'tracker', 'tracker3'])
+ option('engines', type : 'array', choices : ['simple', 'gstreamer'])
+-- 
+GitLab
+
diff --git a/package/rygel/rygel.mk b/package/rygel/rygel.mk
index bfcd5df3c6..e05297456d 100644
--- a/package/rygel/rygel.mk
+++ b/package/rygel/rygel.mk
@@ -26,6 +26,7 @@ RYGEL_CONF_OPTS += \
 	-Dapi-docs=false \
 	-Dexamples=false \
 	-Dintrospection=enabled \
+	-Dman_pages=false \
 	-Dtests=false
 RYGEL_PLUGINS = external,lms,mpris,ruih
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
