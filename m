From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Apr 2020 22:06:38 -0600
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: set correct pkgconfig
 for native dependencies
Message-ID: <20200428040638.122494-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This sets the correct build.pkg_config_path for all meson packages so
that dependencies with native: true will properly use the the host
pkgconfig instead of the target pkgconfig.

With this change we can now remove package specific workarounds.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...d-scanner-provided-by-wayland-scanne.patch | 52 -------------------
 package/mesa3d/mesa3d.mk                      |  1 -
 package/pkg-meson.mk                          |  1 +
 package/weston/weston.mk                      |  1 -
 ...onfig-to-find-wayland-scanner-when-c.patch | 45 ----------------
 5 files changed, 1 insertion(+), 99 deletions(-)
 delete mode 100644 package/mesa3d/0002-meson-use-wayland-scanner-provided-by-wayland-scanne.patch
 delete mode 100644 package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch

diff --git a/package/mesa3d/0002-meson-use-wayland-scanner-provided-by-wayland-scanne.patch b/package/mesa3d/0002-meson-use-wayland-scanner-provided-by-wayland-scanne.patch
deleted file mode 100644
index 784b27c4a2..0000000000
--- a/package/mesa3d/0002-meson-use-wayland-scanner-provided-by-wayland-scanne.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 0e107f7bac8d84d8fb2bb5b83bfb4474348a82c1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Wed, 17 Apr 2019 22:47:05 +0200
-Subject: [PATCH] meson: use wayland-scanner provided by wayland-scanner-path
-
-When cross-compiling the .pc file might point to the wrong
-wayland-scanner binary (target rather than host) resulting in a
-non-executable and wrong scanner.
-First try by using the path provided by wayland-scanner-path,
-and if that fails fall back into pkg-config.
-
-Based on the patch for autotools provided by Gustavo Zacarias.
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- meson.build       | 5 ++++-
- meson_options.txt | 6 ++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 6c4f1508855..ef0532b2cfb 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1319,7 +1319,10 @@ endif
- 
- if with_platform_wayland
-   dep_wl_scanner = dependency('wayland-scanner', native: true)
--  prog_wl_scanner = find_program(dep_wl_scanner.get_pkgconfig_variable('wayland_scanner'))
-+  prog_wl_scanner = get_option('wayland-scanner-path')
-+  if prog_wl_scanner == ''
-+    prog_wl_scanner = find_program(dep_wl_scanner.get_pkgconfig_variable('wayland_scanner'))
-+  endif
-   if dep_wl_scanner.version().version_compare('>= 1.15')
-     wl_scanner_arg = 'private-code'
-   else
-diff --git a/meson_options.txt b/meson_options.txt
-index ccf70659ff7..59ff8df8337 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -324,3 +324,9 @@ option(
-   value : true,
-   description : 'Enable direct rendering in GLX and EGL for DRI',
- )
-+option(
-+  'wayland-scanner-path',
-+  type : 'string',
-+  value : '',
-+  description : 'Locations to wayland-scanner binary. Default: use path from pkg-config'
-+)
--- 
-2.20.1
-
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 22eff24c56..e06cfc4023 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -193,7 +193,6 @@ endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
-MESA3D_CONF_OPTS += -Dwayland-scanner-path=$(HOST_DIR)/bin/wayland-scanner
 endif
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_X11),y)
 MESA3D_DEPENDENCIES += \
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 2ba10f30ed..0a4ab2194c 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -87,6 +87,7 @@ define $(2)_CONFIGURE_CMDS
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
 		--buildtype=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
+		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
 endef
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index b22e685948..541c6ba024 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -14,7 +14,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 	libxkbcommon pixman libpng jpeg udev cairo libinput libdrm
 
 WESTON_CONF_OPTS = \
-	-Dbuild.pkg_config_path=$(HOST_DIR)/lib/pkgconfig \
 	-Dbackend-headless=false \
 	-Dcolor-management-colord=false \
 	-Dremoting=false
diff --git a/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch b/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
deleted file mode 100644
index 898506a0dc..0000000000
--- a/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 72138a67c8e6b0154aadc1b5fcb3d661033fbcd3 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Thu, 13 Jun 2019 02:13:47 +0300
-Subject: [PATCH] Do not use pkg-config to find wayland-scanner when cross
- building
-
-When cross-compiling it is still needed to run a native wayland-scanner,
-but many tools for the task will still have pkg-config return the
-location of wayland-scanner for the target in some location which may
-be the same as for some native installation of wayland-scanner; but
-which is not the copy of the program that the compilation system wants
-packages to use (which are typically in a "host tools" directory
-elsewhere).
-
-This disables usage of pkg-config to find wayland-scanner when
-cross-compiling because most tools for the job will set $PATH in a way
-that the correct installation of the tool will be found first.
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstream status: https://github.com/swaywm/wlroots/pull/1722]
-
----
- protocol/meson.build | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/protocol/meson.build b/protocol/meson.build
-index 7cc10320..73c06b24 100644
---- a/protocol/meson.build
-+++ b/protocol/meson.build
-@@ -1,6 +1,11 @@
- wl_protocol_dir = wayland_protos.get_pkgconfig_variable('pkgdatadir')
- 
--wayland_scanner_dep = dependency('wayland-scanner', required: false, native: true)
-+if meson.is_cross_build()
-+	wayland_scanner_dep = disabler()
-+else
-+	wayland_scanner_dep = dependency('wayland-scanner', required: false, native: true)
-+endif
-+
- if wayland_scanner_dep.found()
- 	wayland_scanner = find_program(
- 		wayland_scanner_dep.get_pkgconfig_variable('wayland_scanner'),
--- 
-2.22.0
-
-- 
2.20.1
