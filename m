From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 08:56:17 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/gupnp: disable
 documentation
Message-ID: <20200721200719.8538988015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe1232e5332d14092efe1516a3f47539ec868cdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

gupnp always builds man page since version 1.2.3 and
https://gitlab.gnome.org/GNOME/gupnp/-/commit/23f54c2a1e8718e836224d68dafded091604a677

This will raise the following build failure on some of our autobuilders:

FAILED: doc/gupnp-binding-tool-1.2.1
/usr/bin/xsltproc --nonet --xinclude --path /home/naourr/work/instance-0/output-1/build/gupnp-1.2.3/doc:/home/naourr/work/instance-0/output-1/build/gupnp-1.2.3/build/doc --stringparam man.output.quietly 1 --stringparam funcsynopsis.style ansi --stringparam man.th.extra1.suppress 1 --stringparam man.authors.section.enabled 1 --stringparam man.copyright.section.enabled 1 -o doc/gupnp-binding-tool-1.2.1 http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl ../doc/gupnp-binding-tool.xml
I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
cannot parse http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

This issue has been reported upstream, until we got more feedback, just
revert the commit

Fixes:
 - http://autobuild.buildroot.org/results/7bf388e81dff3875e396a228b2d48d345377b0da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ba9139334dea630db7c76a7424b1037873226206)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...d-Always-build-gupnp-binding-tool-manpage.patch | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/gupnp/0001-Revert-build-Always-build-gupnp-binding-tool-manpage.patch b/package/gupnp/0001-Revert-build-Always-build-gupnp-binding-tool-manpage.patch
new file mode 100644
index 0000000000..05b07b49c5
--- /dev/null
+++ b/package/gupnp/0001-Revert-build-Always-build-gupnp-binding-tool-manpage.patch
@@ -0,0 +1,60 @@
+From 9225b076d107538209fbd5b8bbc21a68d1b2c016 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 Jul 2020 22:42:44 +0200
+Subject: [PATCH] Revert "build: Always build gupnp-binding-tool manpage"
+
+This reverts commit 23f54c2a1e8718e836224d68dafded091604a677 until
+upstream decides what to do between adding a new option or renaming
+gtk_doc into documentation:
+https://gitlab.gnome.org/GNOME/gupnp/-/issues/17
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ doc/meson.build | 2 --
+ meson.build     | 5 ++++-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/doc/meson.build b/doc/meson.build
+index b71b657..478650b 100644
+--- a/doc/meson.build
++++ b/doc/meson.build
+@@ -4,7 +4,6 @@ version_xml = configure_file(input: 'version.xml.in',
+                output: 'version.xml', configuration:
+                entities)
+ 
+-if get_option('gtk_doc')
+ gnome.gtkdoc('gupnp',
+              main_xml : 'gupnp-docs.xml',
+              src_dir : [join_paths(meson.source_root(), 'libgupnp'),
+@@ -27,7 +26,6 @@ gnome.gtkdoc('gupnp',
+                  'gupnp-types-private.h'
+              ],
+              install : true)
+-endif
+ 
+ xsltproc = find_program('xsltproc', required: false)
+ if xsltproc.found()
+diff --git a/meson.build b/meson.build
+index 28c40b2..dea0a49 100644
+--- a/meson.build
++++ b/meson.build
+@@ -31,12 +31,15 @@ dependencies = [
+ subdir('libgupnp')
+ subdir('tests')
+ subdir('tools')
+-subdir('doc')
+ 
+ if get_option('vapi') and get_option('introspection')
+     subdir('vala')
+ endif
+ 
++if get_option('gtk_doc')
++    subdir('doc')
++endif
++
+ if get_option('examples')
+     subdir('examples')
+ endif
+-- 
+2.27.0
+
