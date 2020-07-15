From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 22:50:37 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/granite: bump to
 version 5.4.0
Message-ID: <20200715204751.70A1B86FB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=108edcc12a60f87dc4a87940595bccd5b9461b19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

granite fails to build since bump to vala 0.46.6 in commit
2723ff3333f4f31a06628692bb644552681f8226:

make[3]: Leaving directory '/tmp/instance-0/output-1/build/granite-0.4.1'
[  1%] Generating style-classes.c;Application.c;Drawing/Color.c;Drawing/BufferSurface.c;Drawing/Utilities.c;GtkPatch/AboutDialog.c;Services/Settings.c;Services/Logger.c;Services/Paths.c;Services/System.c;Services/Contractor.c;Services/ContractorProxy.c;Services/IconFactory.c;Services/SimpleCommand.c;Widgets/AlertView.c;Widgets/Avatar.c;Widgets/Utils.c;Widgets/WrapLabel.c;Widgets/AboutDialog.c;Widgets/ModeButton.c;Widgets/DatePicker.c;Widgets/Entries.c;Widgets/TimePicker.c;Widgets/CollapsiblePaned.c;Widgets/StaticNotebook.c;Widgets/DynamicNotebook.c;Widgets/CompositedWindow.c;Widgets/AppMenu.c;Widgets/Welcome.c;Widgets/WelcomeButton.c;Widgets/Toast.c;Widgets/ToolButtonWithMenu.c;Widgets/PopOver.c;Widgets/ContractorView.c;Widgets/ContractorMenu.c;Widgets/DecoratedWindow.c;Widgets/LightWindow.c;Widgets/StatusBar.c;Widgets/SidebarPaned.c;Widgets/StorageBar.c;Widgets/SourceList.c;Widgets/CellRendererExpander.c;Widgets/CellRendererBadge.c;Widgets/ThinPaned.c;Widgets/OverlayBar.c;gr
 anite.vapi;granite.h
make[3]: Entering directory '/tmp/instance-0/output-1/build/granite-0.4.1'
/tmp/instance-0/output-1/build/granite-0.4.1/lib/Application.vala:145.9-145.26: error: Creation method of abstract class cannot be public.
        public Application () {
        ^^^^^^^^^^^^^^^^^^

So bump granite to latest version to include the following commit (that
does not apply cleanly on current version):
https://github.com/elementary/granite/commit/fd26013c84afdeb6300ae2f4a574856753fc2b58

Moreover:
- Switch site to github to get latest release
- Switch to meson-package
- Add gobject-introspection optional dependency

Fixes:
 - http://autobuild.buildroot.org/results/3e2cc89b9bd42824731d0c7b39dd5b5c98e527ee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2e8a777373c4453ea174cfc7967c596cf2c4d557)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-meson-add-introspection-option.patch      | 73 ++++++++++++++++++++++
 package/granite/Config.in                          |  2 +-
 package/granite/granite.hash                       |  5 +-
 package/granite/granite.mk                         | 15 +++--
 4 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/package/granite/0001-meson-add-introspection-option.patch b/package/granite/0001-meson-add-introspection-option.patch
new file mode 100644
index 0000000000..4b32fb13c3
--- /dev/null
+++ b/package/granite/0001-meson-add-introspection-option.patch
@@ -0,0 +1,73 @@
+From 4d5ddcdb9c03d4e829fe7080e497a00f0b379eff Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Jun 2020 17:33:31 +0200
+Subject: [PATCH] meson: add introspection option
+
+This will allow the user to build granite without gobject-introspection
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/elementary/granite/pull/410]
+---
+ lib/meson.build   | 38 ++++++++++++++++++++------------------
+ meson_options.txt |  1 +
+ 2 files changed, 21 insertions(+), 18 deletions(-)
+
+diff --git a/lib/meson.build b/lib/meson.build
+index a9fc4ed4..770feeb5 100644
+--- a/lib/meson.build
++++ b/lib/meson.build
+@@ -98,24 +98,26 @@ install_data(
+     install_dir: include_dir
+ )
+ 
+-# typelib generation isn't automated yet
+-g_ir_compiler = find_program('g-ir-compiler')
+-custom_target(
+-    granite_typelib,
+-    command: [
+-        g_ir_compiler,
+-        '--shared-library',
+-        '@PLAINNAME@',
+-        '--output',
+-        '@OUTPUT@',
+-        join_paths(meson.current_build_dir(), granite_gir),
+-    ],
+-    input: libgranite,
+-    output: granite_typelib,
+-    depends: libgranite,
+-    install: true,
+-    install_dir: join_paths(get_option('libdir'), 'girepository-1.0'),
+-)
++if get_option('introspection')
++    # typelib generation isn't automated yet
++    g_ir_compiler = find_program('g-ir-compiler')
++    custom_target(
++        granite_typelib,
++        command: [
++            g_ir_compiler,
++            '--shared-library',
++            '@PLAINNAME@',
++            '--output',
++            '@OUTPUT@',
++            join_paths(meson.current_build_dir(), granite_gir),
++        ],
++        input: libgranite,
++        output: granite_typelib,
++        depends: libgranite,
++        install: true,
++        install_dir: join_paths(get_option('libdir'), 'girepository-1.0'),
++    )
++endif
+ 
+ libgranite_dep = declare_dependency(
+     link_with: libgranite,
+diff --git a/meson_options.txt b/meson_options.txt
+index 9d9f62e9..bd1a1d6f 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1 +1,2 @@
+ option('documentation', type: 'boolean', value: false, description: 'generate documentation with gtk-doc and valadoc')
++option('introspection', type: 'boolean', value: true, description: 'Whether to build introspection files')
+-- 
+2.26.2
+
diff --git a/package/granite/Config.in b/package/granite/Config.in
index fef5e27add..726bde1b2d 100644
--- a/package/granite/Config.in
+++ b/package/granite/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_GRANITE
 	  An extension to GTK+ that provides several useful widgets and
 	  classes to ease application development.
 
-	  https://launchpad.net/granite
+	  https://github.com/elementary/granite
 
 comment "granite needs libgtk3 and a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/granite/granite.hash b/package/granite/granite.hash
index 48f62604fa..5378b30cba 100644
--- a/package/granite/granite.hash
+++ b/package/granite/granite.hash
@@ -1,6 +1,3 @@
-# From https://launchpad.net/granite/0.4/0.4.1/+download/granite-0.4.1.tar.xz/+md5
-md5 b1002c0488bb9ade0ef89730c4f84393 granite-0.4.1.tar.xz
-# Calculated based on the hash above
-sha256  8bb411523e6cd5685c928dbfe08893892189cedf9fad5f537aa76182032cf09c  granite-0.4.1.tar.xz
 # Locally computed
+sha256  8194031cac3b87d84a3fab9c30270485ce73f8b8ec23f26c9152b6859c8a18fd  granite-5.4.0.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/granite/granite.mk b/package/granite/granite.mk
index f824ba7fda..d5dd1fa1ff 100644
--- a/package/granite/granite.mk
+++ b/package/granite/granite.mk
@@ -4,13 +4,18 @@
 #
 ################################################################################
 
-GRANITE_VERSION_MAJOR = 0.4
-GRANITE_VERSION = $(GRANITE_VERSION_MAJOR).1
-GRANITE_SITE = https://launchpad.net/granite/$(GRANITE_VERSION_MAJOR)/$(GRANITE_VERSION)/+download
-GRANITE_SOURCE = granite-$(GRANITE_VERSION).tar.xz
+GRANITE_VERSION = 5.4.0
+GRANITE_SITE = $(call github,elementary,granite,$(GRANITE_VERSION))
 GRANITE_DEPENDENCIES = host-pkgconf host-vala libgee libglib2 libgtk3
 GRANITE_INSTALL_STAGING = YES
 GRANITE_LICENSE = LGPL-3.0+
 GRANITE_LICENSE_FILES = COPYING
 
-$(eval $(cmake-package))
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GRANITE_CONF_OPTS += -Dintrospection=true
+GRANITE_DEPENDENCIES += gobject-introspection
+else
+GRANITE_CONF_OPTS += -Dintrospection=false
+endif
+
+$(eval $(meson-package))
