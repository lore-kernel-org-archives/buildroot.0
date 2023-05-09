Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80305C7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 19:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06BEE41488;
	Tue,  9 May 2023 19:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06BEE41488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ryl4KzurgVMa; Tue,  9 May 2023 19:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68633410C1;
	Tue,  9 May 2023 19:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68633410C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C19991BF337
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 19:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51BA16FFFB
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 19:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51BA16FFFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqRz4MmFmY22 for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 19:43:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71DF061692
 for <buildroot@buildroot.org>; Tue,  9 May 2023 19:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71DF061692
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BDDC86084; Tue,  9 May 2023 19:43:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 9 May 2023 21:38:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd02f96b871c9bed5fec92605806668b2aca2bf4
X-Git-Newrev: f228f98f8a0e30829eb43b7c963efd511c2bc43e
X-Patchwork-Hint: ignore
Message-Id: <20230509194321.5BDDC86084@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/libglib2/0003-disable-building-docs.patch: new patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=f228f98f8a0e30829eb43b7c963efd511c2bc43e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If rst2html5 is installed on a host system, meson will attempt to build
html5 documentation from the docs directory, resulting in the following
error:

/usr/local/bin/rst2html5.py
Traceback (most recent call last):
  File "/usr/local/bin/rst2html5.py", line 27, in <module>
    from docutils.core import publish_cmdline, default_description
ModuleNotFoundError: No module named 'docutils'

Backport an upstream that guards the build of the html documentation
behind the existing ds_doc condition, which we already disable in
Buildroot.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr:
  - as pointed out by James, backport an upstream commit rather than
    carry an non-upstreamable patch
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...html-documentation-generation-with-gtk_do.patch | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch b/package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch
new file mode 100644
index 0000000000..0fa15ad164
--- /dev/null
+++ b/package/libglib2/0003-meson-wrap-html-documentation-generation-with-gtk_do.patch
@@ -0,0 +1,96 @@
+From 0fa17ec3c7152cf0e1cbf965acf1426ac203bb1d Mon Sep 17 00:00:00 2001
+From: James Knight <james.d.knight@live.com>
+Date: Thu, 27 Apr 2023 20:23:30 -0400
+Subject: [PATCH] meson: wrap html documentation generation with gtk_doc option
+
+By default, if a host environment has the `rst2html5` application
+available, builds will automatically perform some HTML documentation
+generation from the documentation's glib reference content (e.g.
+creating `gvariant-specification-1.0.html`). The creation of this
+documentation is not required for all use cases.
+
+This commit tweaks the building of the HTML-based GLIB specification
+document to be guarded by `gtk_doc`.
+
+Signed-off-by: James Knight <james.d.knight@live.com>
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/0fa17ec3c7152cf0e1cbf965acf1426ac203bb1d
+[yann.morin.1998@free.fr: backport from upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ docs/reference/glib/meson.build | 58 +++++++++++++++++----------------
+ 1 file changed, 30 insertions(+), 28 deletions(-)
+
+diff --git a/docs/reference/glib/meson.build b/docs/reference/glib/meson.build
+index 114de49da..3cfff2f0b 100644
+--- a/docs/reference/glib/meson.build
++++ b/docs/reference/glib/meson.build
+@@ -113,35 +113,37 @@ if get_option('man')
+   endforeach
+ endif
+ 
+-# GVariant specification is currently standalone
+-rst2html5 = find_program('rst2html5', 'rst2html5.py', required: false)
++if get_option('gtk_doc')
++  # GVariant specification is currently standalone
++  rst2html5 = find_program('rst2html5', 'rst2html5.py', required: false)
+ 
+-if rst2html5.found()
+-  spec_path = glib_datadir / 'doc' / 'glib-2.0'
++  if rst2html5.found()
++    spec_path = glib_datadir / 'doc' / 'glib-2.0'
+ 
+-  figures = files(
+-    'gvariant-byte-boundaries.svg',
+-    'gvariant-integer-and-string-structure.svg',
+-    'gvariant-integer-array.svg',
+-    'gvariant-string-array.svg',
+-  )
++    figures = files(
++      'gvariant-byte-boundaries.svg',
++      'gvariant-integer-and-string-structure.svg',
++      'gvariant-integer-array.svg',
++      'gvariant-string-array.svg',
++    )
+ 
+-  custom_target('gvariant-specification-1.0',
+-    input: 'gvariant-specification-1.0.rst',
+-    output: 'gvariant-specification-1.0.html',
+-    command: [
+-      rst2html5,
+-      '@INPUT@',
+-    ],
+-    capture: true,
+-    install: true,
+-    install_dir: spec_path,
+-    install_tag: 'doc',
+-    depend_files: figures,
+-  )
++    custom_target('gvariant-specification-1.0',
++      input: 'gvariant-specification-1.0.rst',
++      output: 'gvariant-specification-1.0.html',
++      command: [
++        rst2html5,
++        '@INPUT@',
++      ],
++      capture: true,
++      install: true,
++      install_dir: spec_path,
++      install_tag: 'doc',
++      depend_files: figures,
++    )
+ 
+-  install_data(figures,
+-    install_dir : spec_path,
+-    install_tag : 'doc',
+-  )
+-endif
+\ No newline at end of file
++    install_data(figures,
++      install_dir : spec_path,
++      install_tag : 'doc',
++    )
++  endif
++endif
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
