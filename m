From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 19 Jul 2020 00:29:11 +0200
Subject: [Buildroot] [PATCH v1] package/libevdev: bump version to 1.9.1
Message-ID: <20200718222911.6684-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

- drop 0001-meson.build-use-local-include-path-for-tools.patch
  (upstream [2])
- drop 0003-meson.build-enable-static-library-build.patch
  (upstream [3])

[1] https://lists.freedesktop.org/archives/input-tools/2020-July/001541.html
[2] https://gitlab.freedesktop.org/libevdev/libevdev/-/commit/fe8238a71ae3ad8a776ee35a88fc292f1f006ec7
[3] https://gitlab.freedesktop.org/libevdev/libevdev/-/commit/a9d324f82bd5e822ea57224000fea43cb64aa214

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ild-use-local-include-path-for-tools.patch | 54 -------------------
 ...on.build-enable-static-library-build.patch | 30 -----------
 package/libevdev/libevdev.hash                | 10 ++--
 package/libevdev/libevdev.mk                  |  2 +-
 4 files changed, 6 insertions(+), 90 deletions(-)
 delete mode 100644 package/libevdev/0001-meson.build-use-local-include-path-for-tools.patch
 delete mode 100644 package/libevdev/0003-meson.build-enable-static-library-build.patch

diff --git a/package/libevdev/0001-meson.build-use-local-include-path-for-tools.patch b/package/libevdev/0001-meson.build-use-local-include-path-for-tools.patch
deleted file mode 100644
index aa0af75055..0000000000
--- a/package/libevdev/0001-meson.build-use-local-include-path-for-tools.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 83eb5bbac775d46b74e7f99fbd243d53f0118b37 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 2 Mar 2020 15:43:14 +0100
-Subject: [PATCH] meson.build: use local include path for tools
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes the following compile failure with old toolchains and meson
-build (autotools build not affected):
-
-  ../tools/mouse-dpi-tool.c: In function ?handle_event?:
-  ../tools/mouse-dpi-tool.c:115:13: error: ?const struct input_event? has no member named ?input_event_sec?
-     m->us = ev->input_event_sec * 1000000 + ev->input_event_usec;
-               ^
-  ../tools/mouse-dpi-tool.c:115:45: error: ?const struct input_event? has no member named ?input_event_usec?
-     m->us = ev->input_event_sec * 1000000 + ev->input_event_usec;
-                                               ^
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- meson.build | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 4831f8e..5500a83 100644
---- a/meson.build
-+++ b/meson.build
-@@ -102,18 +102,22 @@ install_man(manpage)
- # tools
- executable('libevdev-events',
- 	   sources: ['tools/libevdev-events.c'],
-+	   include_directories: [includes_include],
- 	   dependencies: dep_libevdev,
- 	   install: false)
- executable('touchpad-edge-detector',
- 	   sources: ['tools/touchpad-edge-detector.c'],
-+	   include_directories: [includes_include],
- 	   dependencies: [dep_libevdev, dep_lm],
-            install: true)
- executable('mouse-dpi-tool',
- 	   sources: ['tools/mouse-dpi-tool.c'],
-+	   include_directories: [includes_include],
- 	   dependencies: dep_libevdev,
-            install: true)
- executable('libevdev-tweak-device',
- 	   sources: ['tools/libevdev-tweak-device.c'],
-+	   include_directories: [includes_include],
- 	   dependencies: dep_libevdev,
- 	   install: true)
- 
--- 
-2.25.1
-
diff --git a/package/libevdev/0003-meson.build-enable-static-library-build.patch b/package/libevdev/0003-meson.build-enable-static-library-build.patch
deleted file mode 100644
index d9a336ef8c..0000000000
--- a/package/libevdev/0003-meson.build-enable-static-library-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 0d39ee4958869e9dd7657d6d0528bc4e2461e912 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 10 Mar 2020 09:35:52 +0100
-Subject: [PATCH] meson.build: enable static library build
-
-Use meson library() instead of shared_library() to enable
-static build.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-Upstream: https://gitlab.freedesktop.org/libevdev/libevdev/-/commit/a9d324f82bd5e822ea57224000fea43cb64aa214
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index a623a90..94224cb 100644
---- a/meson.build
-+++ b/meson.build
-@@ -70,7 +70,7 @@ src_libevdev = [
- 
- mapfile = join_paths(dir_src, 'libevdev.sym')
- version_flag = '-Wl,--version-script, at 0@'.format(mapfile)
--lib_libevdev = shared_library('evdev',
-+lib_libevdev = library('evdev',
- 	src_libevdev,
- 	include_directories: [includes_include],
- 	dependencies: [],
--- 
-2.25.1
-
diff --git a/package/libevdev/libevdev.hash b/package/libevdev/libevdev.hash
index 5a28275319..c4ce252ef1 100644
--- a/package/libevdev/libevdev.hash
+++ b/package/libevdev/libevdev.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/input-tools/2020-March/001530.html
-md5  13c3f0911f9326d4b9fa103365f84421  libevdev-1.9.0.tar.xz
-sha1  ab5040ee88dd4cb49a75da72e8fded91b282c108  libevdev-1.9.0.tar.xz
-sha256  e7e18a64264f2dea19b6c50a481f8c062529d42919ccda0bc861495bce28eb9e  libevdev-1.9.0.tar.xz
-sha512  6e7589b5776437ac23fbf65b3194fb1dd3a68a294696145060cdd97bcdeb9b04f355f2be028dc1a5efe98ef2cafca15e4f61115edf5d62591e3a8944dc95942a  libevdev-1.9.0.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2020-July/001541.html
+md5  58286a834ae14536caf9cab8633419cf  libevdev-1.9.1.tar.xz
+sha1  b61c6a09446d717edc4971f7bc3ce9ffa2f05306  libevdev-1.9.1.tar.xz
+sha256  f5603c48c5afd76b14df7a5124e0a94a102f8da0d45826192325069d1bbc7acb  libevdev-1.9.1.tar.xz
+sha512  7d845ce2279d2e2ef12437f6218550265ea0c85e5b6c0d116aff09787b73626b338fe3084baff060085d393688b5ae3d33772689e0581684eff257af01c4c645  libevdev-1.9.1.tar.xz
 
 # Hash for license files:
 sha256  f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137  COPYING
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
index 78e3146b9a..8505346b33 100644
--- a/package/libevdev/libevdev.mk
+++ b/package/libevdev/libevdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVDEV_VERSION = 1.9.0
+LIBEVDEV_VERSION = 1.9.1
 LIBEVDEV_SITE = http://www.freedesktop.org/software/libevdev
 LIBEVDEV_SOURCE = libevdev-$(LIBEVDEV_VERSION).tar.xz
 LIBEVDEV_LICENSE = X11
-- 
2.27.0
