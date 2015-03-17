From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 23:22:44 +0100
Subject: [Buildroot] [git commit] package/mesa3d: bump version to 10.5.1
Message-ID: <20150317222423.566C18182C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=039c686dc9fc1b09629778fba6fdde7cca9a7401
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dropped several dependencies because the "distribution tarball has been renamed
and now contains all the generated sources."
http://lists.freedesktop.org/archives/mesa-announce/2015-March/000145.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-Fix-runtime-error-with-uClibc.patch       |   58 ++++++++++++++++++++
 package/mesa3d/mesa3d.hash                         |    4 +-
 package/mesa3d/mesa3d.mk                           |   12 ++---
 3 files changed, 65 insertions(+), 9 deletions(-)

diff --git a/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch b/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
new file mode 100644
index 0000000..6fca65f
--- /dev/null
+++ b/package/mesa3d/0002-Fix-runtime-error-with-uClibc.patch
@@ -0,0 +1,58 @@
+Fix runtime error with uClibc
+
+Patch sent upstream:
+http://lists.freedesktop.org/archives/mesa-dev/2015-March/079431.html
+
+
+From b1dae3cae9df36d9c4f64c342cfe7c106e34ec72 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 15 Mar 2015 12:23:26 +0100
+Subject: [PATCH 1/1] Fix runtime error with uClibc
+
+Patch inspired by
+https://www.winehq.org/pipermail/wine-bugs/2011-September/288987.html
+http://git.alpinelinux.org/cgit/aports/tree/main/wine/uclibc-fmaxf-fminf.patch?id=c9b491b6099eec02a835ffd05539b5c783c6c43a
+
+Starting an app using mesa3d 10.5.x, Kodi for example, fails:
+
+/usr/lib/kodi/kodi.bin: symbol 'fminf': can't resolve symbol in lib '/usr/lib/dri/i965_dri.so'.
+libGL error: unable to load driver: i965_dri.so
+libGL error: driver pointer missing
+libGL error: failed to load driver: i965
+libGL error: unable to load driver: swrast_dri.so
+libGL error: failed to load driver: swrast
+
+Here is some background information about the fminf/fmaxf situation in uClibc:
+http://thread.gmane.org/gmane.comp.lib.uclibc.general/24189
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/glsl/nir/nir_constant_expressions.py |   12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/glsl/nir/nir_constant_expressions.py b/src/glsl/nir/nir_constant_expressions.py
+index 22bc4f0..139c25a 100644
+--- a/src/glsl/nir/nir_constant_expressions.py
++++ b/src/glsl/nir/nir_constant_expressions.py
+@@ -50,6 +50,18 @@ static double copysign(double x, double y)
+ }
+ #endif
+ 
++#ifdef __UCLIBC__
++float fmaxf(float a, float b)
++{
++	return (a > b) ? a : b;
++}
++
++float fminf(float a, float b)
++{
++	return (a < b) ? a : b;
++}
++#endif
++
+ /**
+  * Evaluate one component of packSnorm4x8.
+  */
+-- 
+1.7.10.4
+
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9d193dc..f562469 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/mesa-announce/2015-March/000144.html
-sha256	d8baedd20e79ccd98a5a7b05e23d59a30892e68de1fcc057ca6873dafca02735	MesaLib-10.4.6.tar.bz2
+# From http://lists.freedesktop.org/archives/mesa-announce/2015-March/000146.html
+sha256	ffc51943d15c6812ee7611d053d8980a683fbd6a4986cff567b12cc66637d679	mesa-10.5.1.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d0d397c..fc82227 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 10.4.6
-MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
+MESA3D_VERSION = 10.5.1
+MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
@@ -18,11 +18,8 @@ MESA3D_PROVIDES =
 
 MESA3D_DEPENDENCIES = \
 	expat \
-	host-bison \
-	host-flex \
 	host-gettext \
-	host-python \
-	host-xutil_makedepend \
+	host-python-mako \
 	libdrm
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -35,7 +32,7 @@ MESA3D_DEPENDENCIES += \
 	xlib_libXdamage \
 	xlib_libXfixes \
 	libxcb
-MESA3D_CONF_OPTS += --enable-glx
+MESA3D_CONF_OPTS += --enable-glx --disable-mangling
 # quote from mesa3d configure "Building xa requires@least one non swrast gallium driver."
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
 MESA3D_CONF_OPTS += --enable-xa
@@ -92,6 +89,7 @@ MESA3D_PROVIDES += libgl
 MESA3D_CONF_OPTS += \
 	--enable-dri \
 	--enable-shared-glapi \
+	--enable-driglx-direct \
 	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
 endif
 
