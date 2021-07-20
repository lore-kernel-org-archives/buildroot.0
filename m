From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:35:33 +0200
Subject: [Buildroot] [git commit] package/granite: bump to version 6.0.0
Message-ID: <20210720200131.AFA67885CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=ee2b62859c11a109b2db97c6239b296267ec6910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/elementary/granite/releases/tag/6.0.0
https://github.com/elementary/granite/releases/tag/5.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-meson-add-introspection-option.patch      | 73 ----------------------
 package/granite/granite.hash                       |  2 +-
 package/granite/granite.mk                         |  2 +-
 3 files changed, 2 insertions(+), 75 deletions(-)

diff --git a/package/granite/0001-meson-add-introspection-option.patch b/package/granite/0001-meson-add-introspection-option.patch
deleted file mode 100644
index 4b32fb13c3..0000000000
--- a/package/granite/0001-meson-add-introspection-option.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 4d5ddcdb9c03d4e829fe7080e497a00f0b379eff Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Jun 2020 17:33:31 +0200
-Subject: [PATCH] meson: add introspection option
-
-This will allow the user to build granite without gobject-introspection
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/elementary/granite/pull/410]
----
- lib/meson.build   | 38 ++++++++++++++++++++------------------
- meson_options.txt |  1 +
- 2 files changed, 21 insertions(+), 18 deletions(-)
-
-diff --git a/lib/meson.build b/lib/meson.build
-index a9fc4ed4..770feeb5 100644
---- a/lib/meson.build
-+++ b/lib/meson.build
-@@ -98,24 +98,26 @@ install_data(
-     install_dir: include_dir
- )
- 
--# typelib generation isn't automated yet
--g_ir_compiler = find_program('g-ir-compiler')
--custom_target(
--    granite_typelib,
--    command: [
--        g_ir_compiler,
--        '--shared-library',
--        '@PLAINNAME@',
--        '--output',
--        '@OUTPUT@',
--        join_paths(meson.current_build_dir(), granite_gir),
--    ],
--    input: libgranite,
--    output: granite_typelib,
--    depends: libgranite,
--    install: true,
--    install_dir: join_paths(get_option('libdir'), 'girepository-1.0'),
--)
-+if get_option('introspection')
-+    # typelib generation isn't automated yet
-+    g_ir_compiler = find_program('g-ir-compiler')
-+    custom_target(
-+        granite_typelib,
-+        command: [
-+            g_ir_compiler,
-+            '--shared-library',
-+            '@PLAINNAME@',
-+            '--output',
-+            '@OUTPUT@',
-+            join_paths(meson.current_build_dir(), granite_gir),
-+        ],
-+        input: libgranite,
-+        output: granite_typelib,
-+        depends: libgranite,
-+        install: true,
-+        install_dir: join_paths(get_option('libdir'), 'girepository-1.0'),
-+    )
-+endif
- 
- libgranite_dep = declare_dependency(
-     link_with: libgranite,
-diff --git a/meson_options.txt b/meson_options.txt
-index 9d9f62e9..bd1a1d6f 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1 +1,2 @@
- option('documentation', type: 'boolean', value: false, description: 'generate documentation with gtk-doc and valadoc')
-+option('introspection', type: 'boolean', value: true, description: 'Whether to build introspection files')
--- 
-2.26.2
-
diff --git a/package/granite/granite.hash b/package/granite/granite.hash
index 5378b30cba..a91f468b49 100644
--- a/package/granite/granite.hash
+++ b/package/granite/granite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8194031cac3b87d84a3fab9c30270485ce73f8b8ec23f26c9152b6859c8a18fd  granite-5.4.0.tar.gz
+sha256  c62d8d29e8bb59a5fa2d9006a9c13196aea9159410a7c86e3d51fa10d0f9dcc0  granite-6.0.0.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/granite/granite.mk b/package/granite/granite.mk
index 037113f715..71dfbf4c03 100644
--- a/package/granite/granite.mk
+++ b/package/granite/granite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRANITE_VERSION = 5.4.0
+GRANITE_VERSION = 6.0.0
 GRANITE_SITE = $(call github,elementary,granite,$(GRANITE_VERSION))
 GRANITE_DEPENDENCIES = \
 	host-pkgconf \
