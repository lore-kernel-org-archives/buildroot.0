From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:38:59 +0200
Subject: [Buildroot] [git commit] package/libwpe: switch over to Meson
Message-ID: <20200917203110.E210882639@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=edb505b78fa65756b55f4d5f4aceb110a6996603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CMake based build system will be eventually removed by upstream
so it seems like a good idea to switch over to Meson already before
that happens.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-partial-dependency-to-pass-EGL-module-fl.patch | 45 ++++++++++++++++++++++
 package/libwpe/libwpe.mk                           | 10 +++--
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/package/libwpe/0001-meson-Use-a-partial-dependency-to-pass-EGL-module-fl.patch b/package/libwpe/0001-meson-Use-a-partial-dependency-to-pass-EGL-module-fl.patch
new file mode 100644
index 0000000000..e74ebe125e
--- /dev/null
+++ b/package/libwpe/0001-meson-Use-a-partial-dependency-to-pass-EGL-module-fl.patch
@@ -0,0 +1,45 @@
+From 81bfedfa02fd864f3e4b295091d49c3eb20bb372 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 16 Sep 2020 00:01:37 +0300
+Subject: [PATCH] meson: Use a partial dependency to pass EGL module flags
+
+Make Meson try to always find an "egl" dependency, if found extract
+the include directories and compiler flags from ir using a partial
+dependency, otherwise check that at least EGL/eglplatform.h is
+available when the pkg-config module is not found.
+
+Fixes #70
+
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+[Upstrem status: https://github.com/WebPlatformForEmbedded/libwpe/pull/71]
+
+---
+ meson.build | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 5c88aed..a05f4ab 100644
+--- a/meson.build
++++ b/meson.build
+@@ -57,8 +57,16 @@ dependencies = [
+ ]
+ 
+ cc = meson.get_compiler('c')
+-if not cc.has_header('EGL/eglplatform.h')
+-	dependencies += dependency('egl')
++egl_dep = dependency('egl', required: false)
++if egl_dep.found()
++	dependencies += egl_dep.partial_dependency(
++		compile_args: true,
++		includes: true,
++	)
++else
++	assert(cc.has_header('EGL/eglplatform.h'),
++		'Required heaer <EGL/eglplatform.h> not found'
++	)
+ endif
+ 
+ if not cc.has_function('dlopen')
+-- 
+2.28.0
+
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 6c3a1d354a..5843e84d39 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -12,11 +12,13 @@ LIBWPE_LICENSE = BSD-2-Clause
 LIBWPE_LICENSE_FILES = COPYING
 LIBWPE_DEPENDENCIES = libegl libxkbcommon
 
+LIBWPE_CFLAGS = $(TARGET_CFLAGS)
+LIBWPE_CXXFLAGS = $(TARGET_CXXFLAGS)
+
 # Workaround for https://github.com/raspberrypi/userland/issues/316
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBWPE_CONF_OPTS += \
-	-DCMAKE_C_FLAGS='$(TARGET_CFLAGS) -D_GNU_SOURCE' \
-	-DCMAKE_CXX_FLAGS='$(TARGET_CFLAGS) -D_GNU_SOURCE'
+LIBWPE_CFLAGS += -D_GNU_SOURCE
+LIBWPE_CXXFLAGS += -D_GNU_SOURCE
 endif
 
-$(eval $(cmake-package))
+$(eval $(meson-package))
