From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 18:19:51 +0200
Subject: [Buildroot] [git commit] package/mesa3d: drop pkgconfig workaround
Message-ID: <20200502161509.B45B190B5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72fb9b2fb80633880049c9a2c2ff9486c027a33a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This workaround is not needed as of commit
5cff3a8bdfba92e9f61d0984df08f1ecd205c072 which properly sets the
PKG_CONFIG_LIBDIR for native: true dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ayland-scanner-provided-by-wayland-scanne.patch | 52 ----------------------
 package/mesa3d/mesa3d.mk                           |  1 -
 2 files changed, 53 deletions(-)

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
index e1fc2511a2..531dcf5b81 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -192,7 +192,6 @@ endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
-MESA3D_CONF_OPTS += -Dwayland-scanner-path=$(HOST_DIR)/bin/wayland-scanner
 endif
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_X11),y)
 MESA3D_DEPENDENCIES += \
