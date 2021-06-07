From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:38 -0000
Subject: [Buildroot] [git commit] package/libwpe: bump to version 1.10.0
Message-ID: <20210607144653.A7BD382B86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=782d5632831c0af4b796f01e9e83ce2ea1b01629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:

  https://wpewebkit.org/release/libwpe-1.10.0.html

The patch is removed, as it has been included upstream.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-partial-dependency-to-pass-EGL-module-fl.patch | 45 ----------------------
 package/libwpe/libwpe.hash                         |  8 ++--
 package/libwpe/libwpe.mk                           |  2 +-
 3 files changed, 5 insertions(+), 50 deletions(-)

diff --git a/package/libwpe/0001-meson-Use-a-partial-dependency-to-pass-EGL-module-fl.patch b/package/libwpe/0001-meson-Use-a-partial-dependency-to-pass-EGL-module-fl.patch
deleted file mode 100644
index e74ebe125e..0000000000
--- a/package/libwpe/0001-meson-Use-a-partial-dependency-to-pass-EGL-module-fl.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 81bfedfa02fd864f3e4b295091d49c3eb20bb372 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Wed, 16 Sep 2020 00:01:37 +0300
-Subject: [PATCH] meson: Use a partial dependency to pass EGL module flags
-
-Make Meson try to always find an "egl" dependency, if found extract
-the include directories and compiler flags from ir using a partial
-dependency, otherwise check that at least EGL/eglplatform.h is
-available when the pkg-config module is not found.
-
-Fixes #70
-
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[Upstrem status: https://github.com/WebPlatformForEmbedded/libwpe/pull/71]
-
----
- meson.build | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 5c88aed..a05f4ab 100644
---- a/meson.build
-+++ b/meson.build
-@@ -57,8 +57,16 @@ dependencies = [
- ]
- 
- cc = meson.get_compiler('c')
--if not cc.has_header('EGL/eglplatform.h')
--	dependencies += dependency('egl')
-+egl_dep = dependency('egl', required: false)
-+if egl_dep.found()
-+	dependencies += egl_dep.partial_dependency(
-+		compile_args: true,
-+		includes: true,
-+	)
-+else
-+	assert(cc.has_header('EGL/eglplatform.h'),
-+		'Required heaer <EGL/eglplatform.h> not found'
-+	)
- endif
- 
- if not cc.has_function('dlopen')
--- 
-2.28.0
-
diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 36cdf56664..66fd168dc3 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.8.0.tar.xz.sums
-md5  328ea59dd8dee9107a49353536d00844  libwpe-1.8.0.tar.xz
-sha1  3c893b1e8118a06f082d98373e279a8f8e33750d  libwpe-1.8.0.tar.xz
-sha256  a6f00a7d091cbd4db57fe7ee3b4c12c6350921d654ed79812800a26c888481d2  libwpe-1.8.0.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.10.0.tar.xz.sums
+md5  269ecb60d4ef80a0877d25a5828c8b82  libwpe-1.10.0.tar.xz
+sha1  b3f48a48b0401da19deb60cb8f15f193dff799c1  libwpe-1.10.0.tar.xz
+sha256  2415e270d45e3595ed4052bc105f733744dc2d3677e12ff4a831e5029841084d  libwpe-1.10.0.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 5843e84d39..43dc201f54 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWPE_VERSION = 1.8.0
+LIBWPE_VERSION = 1.10.0
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
