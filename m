Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99042C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 10:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A1A7428E2;
	Wed, 12 Jan 2022 10:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkcteZtcWk1P; Wed, 12 Jan 2022 10:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC22428E3;
	Wed, 12 Jan 2022 10:37:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C12881BF831
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADAB26FB89
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMhVWbvncZ8I for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 10:37:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 720FF6FB8A
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 10:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 59AD77FC20; Wed, 12 Jan 2022 10:30:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 11:36:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4317b1f9f21eda6d01c10da1ed15a2d87cfc666c
X-Git-Newrev: 8c97b8925ed01bfa18d66da9ab01863191c591f2
X-Patchwork-Hint: ignore
Message-Id: <20220112103044.59AD77FC20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: bump to
 version 1.70.0
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
Content-Type: multipart/mixed; boundary="===============2252367412837768219=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2252367412837768219==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8c97b8925ed01bfa18d66da9ab01863191c591f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase patches.

Backport a patch to fix a build error on latest meson.

giscanner/scannerlexer.l license hash change due to add float types:
https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/60b0cf2fc2fdc74d13832d1fdde21cfdc813b84e

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../gobject-introspection/0001-disable-tests.patch |  10 +-
 .../0002-Add-rpath-links-to-ccompiler.patch        |   6 +-
 ...nore-error-return-codes-from-ldd-wrapper.patch} |   7 +-
 .../0004-build-Avoid-the-doctemplates-hack.patch   | 221 +++++++++++++++++++++
 .../gobject-introspection.hash                     |   6 +-
 .../gobject-introspection/gobject-introspection.mk |   2 +-
 6 files changed, 238 insertions(+), 14 deletions(-)

diff --git a/package/gobject-introspection/0001-disable-tests.patch b/package/gobject-introspection/0001-disable-tests.patch
index 01b11998bd..ed2d9d6fc0 100644
--- a/package/gobject-introspection/0001-disable-tests.patch
+++ b/package/gobject-introspection/0001-disable-tests.patch
@@ -1,4 +1,4 @@
-From 473b4288d8f4e891d0d21f7b60ef8053c5cd7af9 Mon Sep 17 00:00:00 2001
+From c87faf380ddf44da9d624dabd28178c9065f0f76 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Mon, 3 Feb 2020 10:07:15 -0800
 Subject: [PATCH] disable tests
@@ -13,22 +13,22 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index eed4d6b..5058664 100644
+index c2cb577f..65ce7adf 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -222,12 +222,6 @@ if get_option('build_introspection_data') == true
+@@ -225,12 +225,6 @@ else
  endif
  subdir('docs')
  
 -# The tests will also run, which is not possible if they
 -# were built for a different architecture.
 -if not meson.is_cross_build()
--    subdir('tests')
+-  subdir('tests')
 -endif
 -
  install_data('Makefile.introspection', install_dir: join_paths(get_option('datadir'), 'gobject-introspection-1.0'))
  install_data('m4/introspection.m4', install_dir: join_paths(get_option('datadir'), 'aclocal'))
  
 -- 
-2.24.1
+2.25.1
 
diff --git a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch b/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
index 9b9ae99779..e21da42ce7 100644
--- a/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
+++ b/package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch
@@ -1,4 +1,4 @@
-From 72a427bc50daee8f1ded0e9221e53dbbf2a80f08 Mon Sep 17 00:00:00 2001
+From 952e2e2bb6a22ec8824223b03b65cb28361c6e34 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Wed, 14 Mar 2018 12:07:10 -0400
 Subject: [PATCH] Add rpath links to ccompiler
@@ -12,7 +12,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
-index a8bd5b1..51bb9bc 100644
+index cb97e76f..d29b28c8 100644
 --- a/giscanner/ccompiler.py
 +++ b/giscanner/ccompiler.py
 @@ -231,6 +231,8 @@ class CCompiler(object):
@@ -25,5 +25,5 @@ index a8bd5b1..51bb9bc 100644
                      os.pathsep.join(runtime_paths + [os.environ[envvar]])
              else:
 -- 
-2.14.3
+2.25.1
 
diff --git a/package/gobject-introspection/0003-ignore-error-return-codes-from-ldd-wrapper.patch b/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
similarity index 90%
rename from package/gobject-introspection/0003-ignore-error-return-codes-from-ldd-wrapper.patch
rename to package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
index d43dc1393e..f1ea518954 100644
--- a/package/gobject-introspection/0003-ignore-error-return-codes-from-ldd-wrapper.patch
+++ b/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
@@ -1,4 +1,4 @@
-From f742da8b3913f4818d3f419117076afe62f4dbf4 Mon Sep 17 00:00:00 2001
+From e0fc4a2a5161a36483ddc518be9bb14390f11b19 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 5 Sep 2018 16:46:52 +0200
 Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
@@ -14,7 +14,7 @@ Signed-off-by: Adam Duskett <aduskett@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
-index d67df95..80352a6 100644
+index 9f8ab5df..7a1a72fe 100644
 --- a/giscanner/shlibs.py
 +++ b/giscanner/shlibs.py
 @@ -103,7 +103,7 @@ def _resolve_non_libtool(options, binary, libraries):
@@ -26,3 +26,6 @@ index d67df95..80352a6 100644
          if isinstance(output, bytes):
              output = output.decode("utf-8", "replace")
  
+-- 
+2.25.1
+
diff --git a/package/gobject-introspection/0004-build-Avoid-the-doctemplates-hack.patch b/package/gobject-introspection/0004-build-Avoid-the-doctemplates-hack.patch
new file mode 100644
index 0000000000..0b70b5c4c0
--- /dev/null
+++ b/package/gobject-introspection/0004-build-Avoid-the-doctemplates-hack.patch
@@ -0,0 +1,221 @@
+From 0504b26ec2adb13dfdff51679d84ad2f69af5918 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Tue, 11 Jan 2022 15:51:10 +0000
+Subject: [PATCH] build: Avoid the doctemplates hack
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The hack that copies the doctemplates directory into the build
+directory has stopped working with newer versions of Meson; while it's
+possible to copy files, custom_target() cannot depend on a directory.
+Additionally, the dependency has always been broken.
+
+Instead, we enumerate the template files—after all, it's not like they
+change a lot—and then we list them as dependencies for the test targets.
+
+Fixes: #414
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+effb1e09dee263cdac4ec593e8caf316e6f01fe2]
+---
+ giscanner/doctemplates/devdocs/meson.build | 19 +++++++
+ giscanner/doctemplates/mallard/meson.build | 63 ++++++++++++++++++++++
+ giscanner/meson.build                      | 14 ++---
+ tests/scanner/meson.build                  | 24 +++++----
+ 4 files changed, 98 insertions(+), 22 deletions(-)
+ create mode 100644 giscanner/doctemplates/devdocs/meson.build
+ create mode 100644 giscanner/doctemplates/mallard/meson.build
+
+diff --git a/giscanner/doctemplates/devdocs/meson.build b/giscanner/doctemplates/devdocs/meson.build
+new file mode 100644
+index 00000000..2037182a
+--- /dev/null
++++ b/giscanner/doctemplates/devdocs/meson.build
+@@ -0,0 +1,19 @@
++doc_templates += files([
++  'Gjs/_doc.tmpl',
++  'Gjs/_index.tmpl',
++  'Gjs/_method.tmpl',
++  'Gjs/_methods.tmpl',
++  'Gjs/_properties.tmpl',
++  'Gjs/_signals.tmpl',
++  'Gjs/_staticmethods.tmpl',
++  'Gjs/_vfuncs.tmpl',
++  'Gjs/base.tmpl',
++  'Gjs/callback.tmpl',
++  'Gjs/class.tmpl',
++  'Gjs/default.tmpl',
++  'Gjs/enum.tmpl',
++  'Gjs/function.tmpl',
++  'Gjs/interface.tmpl',
++  'Gjs/method.tmpl',
++  'Gjs/namespace.tmpl',
++])
+diff --git a/giscanner/doctemplates/mallard/meson.build b/giscanner/doctemplates/mallard/meson.build
+new file mode 100644
+index 00000000..5fe4e2af
+--- /dev/null
++++ b/giscanner/doctemplates/mallard/meson.build
+@@ -0,0 +1,63 @@
++base_templates = files([
++  'base.tmpl',
++  'class.tmpl',
++  'namespace.tmpl',
++])
++
++c_templates = files([
++  'C/callback.tmpl',
++  'C/class.tmpl',
++  'C/constructor.tmpl',
++  'C/default.tmpl',
++  'C/enum.tmpl',
++  'C/field.tmpl',
++  'C/function.tmpl',
++  'C/interface.tmpl',
++  'C/method.tmpl',
++  'C/namespace.tmpl',
++  'C/property.tmpl',
++  'C/record.tmpl',
++  'C/signal.tmpl',
++  'C/vfunc.tmpl',
++])
++
++gjs_templates = files([
++  'Gjs/callback.tmpl',
++  'Gjs/class.tmpl',
++  'Gjs/constructor.tmpl',
++  'Gjs/default.tmpl',
++  'Gjs/enum.tmpl',
++  'Gjs/field.tmpl',
++  'Gjs/function.tmpl',
++  'Gjs/interface.tmpl',
++  'Gjs/method.tmpl',
++  'Gjs/namespace.tmpl',
++  'Gjs/property.tmpl',
++  'Gjs/record.tmpl',
++  'Gjs/signal.tmpl',
++  'Gjs/vfunc.tmpl',
++])
++
++py_templates = files([
++  'Python/callback.tmpl',
++  'Python/class.tmpl',
++  'Python/constructor.tmpl',
++  'Python/default.tmpl',
++  'Python/enum.tmpl',
++  'Python/field.tmpl',
++  'Python/function.tmpl',
++  'Python/interface.tmpl',
++  'Python/method.tmpl',
++  'Python/namespace.tmpl',
++  'Python/property.tmpl',
++  'Python/record.tmpl',
++  'Python/signal.tmpl',
++  'Python/vfunc.tmpl',
++])
++
++doc_templates += [
++  base_templates,
++  c_templates,
++  gjs_templates,
++  py_templates,
++]
+diff --git a/giscanner/meson.build b/giscanner/meson.build
+index 41edcd44..3d7dc678 100644
+--- a/giscanner/meson.build
++++ b/giscanner/meson.build
+@@ -53,17 +53,9 @@ configure_file(input : '../girepository/gdump.c',
+ 
+ install_subdir('doctemplates', install_dir: giscannerdir)
+ 
+-# XXX: this doesn't track the input, but there is nothing to copy many files
+-# in meson.
+-doc_templates = custom_target('copy-templates',
+-  input : 'doctemplates',
+-  output : 'doctemplates',
+-  command : [
+-    python, '-c',
+-      'import sys, shutil;' +
+-      'shutil.rmtree(sys.argv[2], ignore_errors=True);' +
+-      'shutil.copytree(sys.argv[1], sys.argv[2])',
+-    '@INPUT@', '@OUTPUT@'])
++doc_templates = []
++subdir('doctemplates/devdocs')
++subdir('doctemplates/mallard')
+ 
+ flex = find_program('flex', 'win_flex')
+ bison = find_program('bison', 'win_bison')
+diff --git a/tests/scanner/meson.build b/tests/scanner/meson.build
+index 5176b957..b81b3fd5 100644
+--- a/tests/scanner/meson.build
++++ b/tests/scanner/meson.build
+@@ -525,19 +525,26 @@ foreach gir : test_girs
+ endforeach
+ 
+ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
++  doctool_env = environment()
++  doctool_env.set('srcdir', meson.current_source_dir())
++  doctool_env.set('builddir', meson.current_build_dir())
++
+   foreach language : ['C', 'Python', 'Gjs']
+     regress_docs = custom_target(
+       'generate-docs-' + language,
+       input: regress_gir,
+-      depends: [doc_templates],
++      depend_files: doc_templates,
+       build_by_default: not cairo_deps_found,
++      env: doctool_env,
+       output: 'Regress-1.0-' + language,
+       command: [
+         python, girdoctool,
+         '--add-include-path=' + join_paths(build_root, 'gir'),
+         '--add-include-path=' + meson.current_build_dir(),
+         '--language', language,
+-        '@INPUT@', '-o', '@OUTPUT@'],
++        '--templates-dir=' + join_paths(meson.current_source_dir(), '../../giscanner/doctemplates'),
++        '@INPUT@', '-o', '@OUTPUT@',
++      ],
+     )
+ 
+     if cairo_deps_found
+@@ -546,10 +553,7 @@ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
+         python,
+         args: [gi_tester, 'Regress-1.0-' + language],
+         depends: [regress_docs],
+-        env: [
+-          'srcdir=' + meson.current_source_dir(),
+-          'builddir=' + meson.current_build_dir(),
+-        ],
++        env: doctool_env,
+       )
+     endif
+   endforeach
+@@ -557,9 +561,10 @@ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
+   regress_sections = custom_target(
+     'generate-docs-sections',
+     input: regress_gir,
+-    depends: [doc_templates],
++    depend_files: [doc_templates],
+     build_by_default: not cairo_deps_found,
+     output: 'Regress-1.0-sections.txt',
++    env: doctool_env,
+     command: [
+       python, girdoctool,
+       '--add-include-path=' + join_paths(build_root, 'gir'),
+@@ -574,10 +579,7 @@ if has_girdoctool and glib_dep.type_name() == 'pkgconfig'
+       python,
+       args: [gi_tester, 'Regress-1.0-sections.txt'],
+       depends: [regress_sections],
+-      env: [
+-        'srcdir=' + meson.current_source_dir(),
+-        'builddir=' + meson.current_build_dir(),
+-      ],
++      env: doctool_env,
+     )
+   endif
+ endif
+-- 
+2.25.1
+
diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
index e859ba1d3b..5b76df6b40 100644
--- a/package/gobject-introspection/gobject-introspection.hash
+++ b/package/gobject-introspection/gobject-introspection.hash
@@ -1,5 +1,5 @@
-#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.68/gobject-introspection-1.68.0.sha256sum
-sha256  d229242481a201b84a0c66716de1752bca41db4133672cfcfb37c93eb6e54a27  gobject-introspection-1.68.0.tar.xz
+#From http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/1.70/gobject-introspection-1.70.0.sha256sum
+sha256  902b4906e3102d17aa2fcb6dad1c19971c70f2a82a159ddc4a94df73a3cafc4a  gobject-introspection-1.70.0.tar.xz
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING.LGPL
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
-sha256  ad35e98ae9342a3539c36f2171e84d175394ddcff625887290c751302cb02983  giscanner/scannerlexer.l
+sha256  23f82cbc9808cdd8e902df38271434040ce0562ca382ac2a96f5e3bf807b6d31  giscanner/scannerlexer.l
diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index 6a3d321cc7..41d64171a7 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.68
+GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.70
 GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
 GOBJECT_INTROSPECTION_SITE = http://ftp.gnome.org/pub/GNOME/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
 GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz

--===============2252367412837768219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2252367412837768219==--
