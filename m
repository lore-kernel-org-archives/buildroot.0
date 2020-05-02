From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 18:16:57 +0200
Subject: [Buildroot] [git commit] package/wlroots: drop pkgconfig workaround
Message-ID: <20200502161509.A961D90C0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05bbb1d2e3bf56c4efc2e4b794b2f2802c825e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This workaround is not needed as of commit
5cff3a8bdfba92e9f61d0984df08f1ecd205c072 which properly sets the
PKG_CONFIG_LIBDIR for native: true dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...pkg-config-to-find-wayland-scanner-when-c.patch | 45 ----------------------
 1 file changed, 45 deletions(-)

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
