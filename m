From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 22:15:39 +0100
Subject: [Buildroot] [git commit] package/libvdpau: bump to version 1.3
Message-ID: <20191221210922.A483180FBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffc208144775c2bd022d14a3278ef91a3bd1ba1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to meson-package
- Drop second patch (not needed anymore)
- Drop third patch (after feedback from upstream:
  https://gitlab.freedesktop.org/vdpau/libvdpau/merge_requests/5)
- Disable documentation

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libvdpau/0002-link-with-libx11.patch       | 33 ---------------
 .../libvdpau/0003-vdpau-module-searchpath.patch    | 48 ----------------------
 package/libvdpau/libvdpau.hash                     |  6 +--
 package/libvdpau/libvdpau.mk                       | 18 ++++----
 4 files changed, 12 insertions(+), 93 deletions(-)

diff --git a/package/libvdpau/0002-link-with-libx11.patch b/package/libvdpau/0002-link-with-libx11.patch
deleted file mode 100644
index cfb39731c7..0000000000
--- a/package/libvdpau/0002-link-with-libx11.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Subject: Link libvdpao with libX11 since it uses symbols from it
-Author: Russ Allbery <rra@debian.org>
-Forwarded: no
-
-libvdpau uses the symbols:
-
-    _XEatData
-    _XReply
-    _XFlush
-    _XReadPad
-    XFree
-
-which are provided by libX11, but wasn't linking with it directly, resulting
-in warnings during the package build (and possibly errors later with better
-linkers).
-
-[Patch taken from
-https://anonscm.debian.org/cgit/pkg-nvidia/libvdpau.git/tree/debian/patches/link-with-libx11.patch.]
-
-Signed-off-by: Damien Lanson <damien@kal-host.com>
-
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -22,7 +22,8 @@ endif
- libvdpau_la_LIBADD = \
-     $(DLOPEN_LIBS) \
-     $(PTHREAD_LIBS) \
--    $(XEXT_LIBS)
-+    $(XEXT_LIBS) \
-+    $(X11_LIBS)
- 
- libvdpau_la_LDFLAGS = -version-info 1:0:0 -no-undefined
- 
diff --git a/package/libvdpau/0003-vdpau-module-searchpath.patch b/package/libvdpau/0003-vdpau-module-searchpath.patch
deleted file mode 100644
index bd835153d0..0000000000
--- a/package/libvdpau/0003-vdpau-module-searchpath.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From: Andreas Beckmann <debian@abeckmann.de>
-Subject: search the vdpau module in multiple directories
- start searching the vdpau module in ${ORIGIN}/vdpau, then the MODULEDIR and
- finally fall back to /usr/lib/vdpau
-
-[Patch taken from
-https://anonscm.debian.org/cgit/pkg-nvidia/libvdpau.git/tree/debian/patches/vdpau-module-searchpath.patch.]
-
-Signed-off-by: Damien Lanson <damien@kal-host.com>
-
---- a/src/vdpau_wrapper.c
-+++ b/src/vdpau_wrapper.c
-@@ -103,6 +103,13 @@ static char * _vdp_get_driver_name_from_
-     return driver_name;
- }
- 
-+static char const * _vdpau_module_search_paths[] = {
-+    "${ORIGIN}/vdpau",
-+    VDPAU_MODULEDIR,
-+    "/usr/lib/vdpau",
-+    NULL
-+};
-+
- static VdpStatus _vdp_open_driver(
-     Display *             display,
-     int                   screen)
-@@ -117,6 +127,7 @@ static VdpStatus _vdp_open_driver(
-     char         vdpau_driver_lib[PATH_MAX];
-     char const * vdpau_trace;
-     char const * func_name;
-+    char const ** module_path;
- 
-     vdpau_driver = secure_getenv("VDPAU_DRIVER");
-     if (vdpau_driver) {
-@@ -138,9 +146,11 @@ static VdpStatus _vdp_open_driver(
- 
-     /* Fallback to VDPAU_MODULEDIR when VDPAU_DRIVER_PATH is not set,
-      * or if we fail to create the driver path/dlopen the library. */
--    if (!_vdp_driver_dll) {
-+    for (module_path = _vdpau_module_search_paths;
-+         !_vdp_driver_dll && *module_path;
-+         ++module_path) {
-         if (snprintf(vdpau_driver_lib, sizeof(vdpau_driver_lib),
--                     DRIVER_LIB_FORMAT, VDPAU_MODULEDIR, vdpau_driver) >=
-+                     DRIVER_LIB_FORMAT, *module_path, vdpau_driver) >=
-                 sizeof(vdpau_driver_lib)) {
-             fprintf(stderr, "Failed to construct driver path: path too long\n");
-         }
diff --git a/package/libvdpau/libvdpau.hash b/package/libvdpau/libvdpau.hash
index 7cdc08553c..0833d41bf4 100644
--- a/package/libvdpau/libvdpau.hash
+++ b/package/libvdpau/libvdpau.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002958.html
-sha256 6a499b186f524e1c16b4f5b57a6a2de70dfceb25c4ee546515f26073cd33fa06  libvdpau-1.2.tar.bz2
-sha512 86aa3f2a39cb73a597bf417da2eeef73ff01160ed9f54dff3725785ff5a289f47040496de44e2f5292d59657d4746e369b3fa307c4f83a32f7cc28e4cd8bce6f  libvdpau-1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-August/003021.html
+sha256 b5a52eeac9417edbc396f26c40591ba5df0cd18285f68d84614ef8f06196e50e  libvdpau-1.3.tar.bz2
+sha512 c06c23062816e8b207d38d9d53df43a1b193bb9836b48bd6d79a63d76522e87d383c446285b9877fe9c99faa0d290da8a49ccbb58eefa138cc38d0929a8e1330  libvdpau-1.3.tar.bz2
 # Locally computed
 sha256 ce4af7294872ff07f6e82ae5f1f5eba926215b1e2fb6d55d64759de082458d61  COPYING
diff --git a/package/libvdpau/libvdpau.mk b/package/libvdpau/libvdpau.mk
index 8a0e34cfff..63aecaf744 100644
--- a/package/libvdpau/libvdpau.mk
+++ b/package/libvdpau/libvdpau.mk
@@ -4,25 +4,25 @@
 #
 ################################################################################
 
-LIBVDPAU_VERSION = 1.2
+LIBVDPAU_VERSION = 1.3
 LIBVDPAU_SOURCE = libvdpau-$(LIBVDPAU_VERSION).tar.bz2
-LIBVDPAU_SITE = http://people.freedesktop.org/~aplattner/vdpau
+LIBVDPAU_SITE = \
+	https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/$(LIBVDPAU_VERSION)
 LIBVDPAU_LICENSE = MIT
 LIBVDPAU_LICENSE_FILES = COPYING
 LIBVDPAU_INSTALL_STAGING = YES
 
-# autoreconf for patch 0002-link-with-libx11.patch
-LIBVDPAU_AUTORECONF = YES
-
 LIBVDPAU_DEPENDENCIES = host-pkgconf xlib_libX11 xlib_libXext
 
-LIBVDPAU_CONF_OPTS = --with-module-dir=/usr/lib/vdpau
+LIBVDPAU_CONF_OPTS = \
+	-Ddocumentation=false \
+	-Dmoduledir=/usr/lib/vdpau
 
 ifeq ($(BR2_PACKAGE_XORGPROTO),y)
 LIBVDPAU_DEPENDENCIES += xorgproto
-LIBVDPAU_CONF_OPTS += --enable-dri2
+LIBVDPAU_CONF_OPTS += -Ddri2=true
 else
-LIBVDPAU_CONF_OPTS += --disable-dri2
+LIBVDPAU_CONF_OPTS += -Ddri2=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
