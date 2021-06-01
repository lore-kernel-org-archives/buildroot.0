From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 Jun 2021 23:12:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp: security bump to version
 1.2.6
Message-ID: <20210601211221.144905-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2021-33516: An issue was discovered in GUPnP before 1.0.7 and
1.1.x and 1.2.x before 1.2.5. It allows DNS rebinding. A remote web
server can exploit this vulnerability to trick a victim's browser into
triggering actions against local UPnP services implemented using this
library. Depending on the affected service, this could be used for data
exfiltration, data tempering, etc.

Replace patch by upstream commit as current patch doesn't apply cleanly

https://discourse.gnome.org/t/security-relevant-releases-for-gupnp-issue-cve-2021-33516/6536
https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.2.6/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ays-build-gupnp-binding-tool-manpage.patch | 60 ---------------
 ...or-stylesheet-existence-on-doc-build.patch | 73 +++++++++++++++++++
 package/gupnp/gupnp.hash                      |  4 +-
 package/gupnp/gupnp.mk                        |  2 +-
 4 files changed, 76 insertions(+), 63 deletions(-)
 delete mode 100644 package/gupnp/0001-Revert-build-Always-build-gupnp-binding-tool-manpage.patch
 create mode 100644 package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch

diff --git a/package/gupnp/0001-Revert-build-Always-build-gupnp-binding-tool-manpage.patch b/package/gupnp/0001-Revert-build-Always-build-gupnp-binding-tool-manpage.patch
deleted file mode 100644
index 05b07b49c5..0000000000
--- a/package/gupnp/0001-Revert-build-Always-build-gupnp-binding-tool-manpage.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 9225b076d107538209fbd5b8bbc21a68d1b2c016 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 Jul 2020 22:42:44 +0200
-Subject: [PATCH] Revert "build: Always build gupnp-binding-tool manpage"
-
-This reverts commit 23f54c2a1e8718e836224d68dafded091604a677 until
-upstream decides what to do between adding a new option or renaming
-gtk_doc into documentation:
-https://gitlab.gnome.org/GNOME/gupnp/-/issues/17
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- doc/meson.build | 2 --
- meson.build     | 5 ++++-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/doc/meson.build b/doc/meson.build
-index b71b657..478650b 100644
---- a/doc/meson.build
-+++ b/doc/meson.build
-@@ -4,7 +4,6 @@ version_xml = configure_file(input: 'version.xml.in',
-                output: 'version.xml', configuration:
-                entities)
- 
--if get_option('gtk_doc')
- gnome.gtkdoc('gupnp',
-              main_xml : 'gupnp-docs.xml',
-              src_dir : [join_paths(meson.source_root(), 'libgupnp'),
-@@ -27,7 +26,6 @@ gnome.gtkdoc('gupnp',
-                  'gupnp-types-private.h'
-              ],
-              install : true)
--endif
- 
- xsltproc = find_program('xsltproc', required: false)
- if xsltproc.found()
-diff --git a/meson.build b/meson.build
-index 28c40b2..dea0a49 100644
---- a/meson.build
-+++ b/meson.build
-@@ -31,12 +31,15 @@ dependencies = [
- subdir('libgupnp')
- subdir('tests')
- subdir('tools')
--subdir('doc')
- 
- if get_option('vapi') and get_option('introspection')
-     subdir('vala')
- endif
- 
-+if get_option('gtk_doc')
-+    subdir('doc')
-+endif
-+
- if get_option('examples')
-     subdir('examples')
- endif
--- 
-2.27.0
-
diff --git a/package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch b/package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch
new file mode 100644
index 0000000000..448996da04
--- /dev/null
+++ b/package/gupnp/0001-doc-Check-for-stylesheet-existence-on-doc-build.patch
@@ -0,0 +1,73 @@
+From 7ce37c94596029358a67d732a82e4313f7b89135 Mon Sep 17 00:00:00 2001
+From: Jens Georg <mail@jensge.org>
+Date: Sun, 30 May 2021 13:13:00 +0200
+Subject: [PATCH] doc: Check for stylesheet existence on doc build
+
+Checking for xsltproc is not enough
+
+Fixes #17
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/gupnp/-/commit/7ce37c94596029358a67d732a82e4313f7b89135]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ doc/meson.build | 34 +++++++++++++++++++++++++---------
+ 1 file changed, 25 insertions(+), 9 deletions(-)
+
+diff --git a/doc/meson.build b/doc/meson.build
+index 26c32c9..eb69d07 100644
+--- a/doc/meson.build
++++ b/doc/meson.build
+@@ -30,6 +30,8 @@ endif
+ 
+ xsltproc = find_program('xsltproc', required: false)
+ if xsltproc.found()
++    stylesheet = 'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl'
++
+     xlstproc_flags = [
+         '--nonet',
+         '--xinclude',
+@@ -45,17 +47,31 @@ if xsltproc.found()
+         xsltproc,
+         xlstproc_flags,
+         '-o', '@OUTPUT@',
+-        'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl',
++        stylesheet,
+         '@INPUT@'
+     ]
+ 
+-    custom_target(
+-        'man 1 pages',
+-        input: 'gupnp-binding-tool.xml',
+-        output: 'gupnp-binding-tool-1.2.1',
+-        command: xsltproc_args,
+-        depend_files : version_xml,
+-        install: true,
+-        install_dir: join_paths(get_option('mandir'), 'man1')
++    stylesheet_check = run_command(
++        [
++            xsltproc,
++            xlstproc_flags,
++            '--noout',
++            stylesheet,
++            'gupnp-binding-tool.xml'
++        ]
+     )
++    if (stylesheet_check.returncode() == 0)
++        message('Stylesheet ' + stylesheet + ' available')
++        custom_target(
++            'man 1 pages',
++            input: 'gupnp-binding-tool.xml',
++            output: 'gupnp-binding-tool-1.2.1',
++            command: xsltproc_args,
++            depend_files : version_xml,
++            install: true,
++            install_dir: join_paths(get_option('mandir'), 'man1')
++        )
++    else
++        message('Stylesheet ' + stylesheet + ' not found, not building man page')
++    endif
+ endif
+-- 
+GitLab
+
diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 60339ec9ca..7064c9f6b8 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.2/gupnp-1.2.4.sha256sum:
-sha256  f7a0307ea51f5e44d1b832f493dd9045444a3a4e211ef85dfd9aa5dd6eaea7d1  gupnp-1.2.4.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.2/gupnp-1.2.6.sha256sum:
+sha256  00b20f1e478a72deac92c34723693a2ac55789ed1e4bb4eed99eb4d62092aafd  gupnp-1.2.6.tar.xz
 
 # Hash for license file:
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index e90787eb84..7ec0e6388c 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.2
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).4
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).6
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.0+
-- 
2.30.2
